/* :Title: chmc
	C routines for the Mathematica package ColquhounHawkesMC */

/* :Author: Arnd Roth
	Abteilung Zellphysiologie
	Max-Planck-Institut fuer Medizinische Forschung
	Postfach 10 38 20, D-69028 Heidelberg, Germany
	email: roth@sunny.mpimf-heidelberg.mpg.de */

/* :Summary: Monte Carlo implementation of parts of "Relaxation
	and fluctuations of membrane currents that flow through
	drug-operated channels", by D. Colquhoun & A.G. Hawkes,
        Proc. R. Soc. Lond. B 199, 231 - 262 (1977) */

/* :Package Version: 1.2 */

/* :Copyright: Copyright 1992-94, Max Planck Institute for Medical Research */

/* :Context: ChannelKinetics`ColquhounHawkesMC` */

/* :History: Version 1.0 by Arnd Roth, October - November, 1992.
	Version 1.1 by Arnd Roth, February, 1993.
	Version 1.2 also runs under Windows, Arnd Roth, December, 1994.
	I thank Juergen Kupper (Ecole Normale Superieure, Paris) for his
	help in getting "chmc.tm" to compile and run under Windows. */

/* :Keywords: Q-matrix, single trace generation using a random
	number generator, mean current, current variance,
	third central moment, peak EPSC ampl. distribution */

/* :Source: see above */

/* :Warning: */

/* :Mathematica Version: 2.1 (general), greater than 2.2.3 (Windows) */

/* :Limitation: none */

/* :Discussion: This file contains a collection of C routines that
	are called by Mathematica functions defined in the
	ColquhounHawkesMC package. Argument checking is done by
	these Mathematica functions, not by the C routines. */

/* To compile this source code on Unix systems, type
 *   mcc chmc.tm -o chmc -O
 * at a shell prompt. Compiling on Macintosh or even Windows systems
 * is not so easy; consult the MathLink documentation on how to
 * proceed. In the case of Windows, use the "large memory model";
 * unfortunately you can't use the MathLink Developer's Kit that
 * came with Mathematica 2.2.3 for Windows since it has a bug - you
 * need to use a post-2.2.3 MathLink for Windows Developer's Kit.
 */

/* To launch this program from within Mathematica use:
 *   In[1]:= link = Install["chmc"]
 * (The ColquhounHawkesMC package does that automatically.)
 *
 * Or, launch this program from a shell and establish a
 * peer-to-peer connection.  When given the prompt Listen on:
 * type a port name. ( On Unix platforms, a port name is a
 * number less than 65536.  On Mac or Windows platforms,
 * it's an arbitrary word.)
 * Then, from within Mathematica use:
 *   In[1]:= link = Install["portname", LinkMode -> Connect]
 * or, if chmc runs on a remote computer:
 *   In[1]:= link = Install["portname", LinkMode -> Connect,
                             LinkProtocol -> "TCP", LinkHost -> "your_hostname"]
 */

#define  DEBUG 0 /* debug switch; usually set to zero */
#define  EPS 1.0e-7 /* used in several instances to guard against roundoff */

#if DEBUG
#include <stdio.h>
#endif

#include "mathlink.h"
#include <stdlib.h>
#include <math.h>

/* prototypes */
/* P() is a simple macro defined in mathlink.h that allows function
 * protoypes to be written in the same way for ANSI and K&R C
 */

void signalerror P((char* errormessage));
double *doublevector P((long i1, long i2));
void freedoublevector P((double *v, long i1, long i2));
double **converttomatrix P((double *v, long i1, long i2, long j1, long j2));
void freeconverttomatrix P((double **m, long i1, long i2, long j1, long j2));
double UniForm P((long iSeed));
void seedrandom P((int n));
void singletrace P((double *qflatpulse, long ksquare1, double *qflatpause, long ksquare2, double *clist, long k, int initstatenr, double duration, double u, double tmax, double tstep));
void meancurrent P((double *qflatpulse, long ksquare1, double *qflatpause, long ksquare2, double *clist, long k, int initstatenr, double duration, int n, double u, double tmax, double tstep));
double peakcurrent P((int m, double *qflatpulse, long ksquare1, double *qflatpause, long ksquare2, double *clist, long k, int initstatenr, double duration, double u, double tmax, double tstep, double *filtera, long falength, double tint));

/* global variable */

#if DEBUG
FILE  *debug;
#endif


/* some auxiliary routines for memory allocation and deallocation */

#if DEBUG
void signalerror(errormessage)
char errormessage[];
{
	fprintf(debug, "An error has occurred:\n");
	fprintf(debug, "%s\n", errormessage);
	fprintf(debug, "The program has aborted.\n");
	exit(1);
}
#endif

double *doublevector(i1, i2)
long i1, i2;
{
	double *v;

	v = (double *)malloc((size_t) (i2 - i1 + 1)*sizeof(double));
#if DEBUG
	if (!v) signalerror("could not allocate memory in doublevector()");
#endif
	return v - i1;
}

void freedoublevector(v, i1, i2)
double *v;
long i1, i2;
{
	free((char*) (v + i1));
}

double **converttomatrix(v, i1, i2, j1, j2)
double *v;
long i1, i2, j1, j2;
{
	long i, j, nrows, ncolumns;
	double **m;

	nrows = i2 - i1 + 1;
	ncolumns = j2 - j1 + 1;
	m = (double **)malloc((size_t) (nrows)*sizeof(double*));
#if DEBUG
	if (!m) signalerror("could not allocate memory in converttomatrix()");
#endif
	m -= i1;
	for (i = 0, j = i1; i <= nrows - 1; i++, j++) m[j] = v + ncolumns*i - j1;
	return m;
}

void freeconverttomatrix(m, i1, i2, j1, j2)
double **m;
long i1, i2, j1, j2;
{
	free((char*) (m + i1));
}

#define  Abs(x)    ((x) < 0. ? -(x) : (x))
#define  Sign(x)   ((x) < 0. ?  -1. :  1.)
#define  Theta(x)  ((x) > 0. ?   1. :  0.)
#define  Min(x,y)  ((x) < (y) ? (x) : (y))
#define  Max(x,y)  ((x) > (y) ? (x) : (y))

/**************************************************************/
/*                                                            */
/*      Program : UniForm.c                                   */
/*                                                            */
/*      Purpose : Calculate uniformly distributed random      */
/*                numbers between (0,1).                      */
/*                                                            */
/*      Usage   : double UniForm(                             */
/*                   long  iSeed                              */
/*                   )                                        */
/*                If iSeed != 0, the generator is started     */
/*                with this seed.  The default initial        */
/*                seed is:                                    */
/*                   iSeed = 2^29-1 = 536870911               */
/*                                                            */
/*      Source  : Pierre L'Ecuyer (1988)                      */
/*                "Efficient and Portable Combined Random     */
/*                 Number Generators",                        */
/*                Comm. ACM 31, 742-774                       */
/*                                                            */
/*      Author  : Eberhard von Kitzing                        */
/*                Max-Planck-Institut                         */
/*                fuer Medizinische Forschung                 */
/*                Abteilung Zellphysiologie                   */
/*                Postfach  10 38 20                          */
/*                D-69028 Heidelberg                          */
/*                Germany                                     */
/*                                                            */
/*                Tel.: +49 6221 486 467                      */
/*                FAX : +49 6221 486 459                      */
/*            email : vkitzing@sunny.mpimf-heidelberg.mpg.de  */
/*                                                            */
/*      revision: Mon Mar 15 10:37:39 MET 1993                */
/*      history : fixed '/' instead of '%'          A.R.      */
/*              : Thu Apr 22 18:12:39 MET DST 1993            */
/*              : fixed initialization of kSeed     E.v.K.    */
/*                                                            */
/**************************************************************/

double UniForm(iSeed)

long iSeed;

{	long  Z, k;
	static long jSeed = 536870911;
	static long kSeed =   8388607; /* 2^23-1 */

	if(iSeed != 0) {
		jSeed = Abs(iSeed);
		kSeed = 8388607;
	}

	k = jSeed / 53668;
	jSeed = 40014 * (jSeed - k*53668) - k * 12211;

	if(jSeed < 0) jSeed += 2147483563;

	k = kSeed / 52774;
	kSeed = 40692 * (kSeed - k*52774) - k * 3791;

	if(kSeed < 0) kSeed += 2147483399;

	Z = jSeed - kSeed;

	if(Z < 1) Z += 2147483562;

	return (4.65661305739177e-10 * (double)Z);
}

/* functions to be exported into Mathematica via MathLink */

:Evaluate: BeginPackage["ChannelKinetics`ColquhounHawkesMC`"]

:Evaluate: CSeedRandom::usage = "CSeedRandom[n] resets the pseudorandom
	number generator for the C routines, using the integer n as a seed.
	The sign of n is neglected, and it must not be zero."

:Evaluate: CSingleTrace::usage = "CSingleTrace[qflatpulse, qflatpause,
	clist, initstatenr, duration, u, {tmax, tstep}] is a C routine
	that performs a Monte Carlo simulation of the state transitions
	of a single channel, from 0 to tmax milliseconds, using a
	sampling interval of tstep ms; qflatpulse (ms^-1) is the
	flattened transition rate matrix during the transmitter pulse;
	qflatpause (ms^-1) is the flattened transition rate matrix after
	the pulse; clist is the list of the conductivities (pS) of the
	states of the channel; initstatenr is the number of the initial
	state of the channel; duration (ms) defines the length of the
	transmitter concentration square pulse function; u (V) is the
	voltage across the membrane minus the reversal potential.
	CSingleTrace[] returns a list of real numbers of length
	Floor[tmax / tstep] + 1 that gives the single channel current (pA)
	at ascending integer multiples of tstep."

:Evaluate: CMeanCurrent::usage = "CMeanCurrent[qflatpulse, qflatpause,
	clist, initstatenr, duration, n, u, {tmax, tstep}] is a C routine
	that performs a Monte Carlo simulation of the state transitions
	of n independent single channels, from 0 to tmax milliseconds,
	using a sampling interval of tstep ms; qflatpulse (ms^-1) is the
	flattened transition rate matrix during the transmitter pulse;
	qflatpause (ms^-1) is the flattened transition rate matrix after
	the pulse; clist is the list of the conductivities (pS) of the
	states of the channel; initstatenr is the number of the initial
	state of the channel; duration (ms) defines the length of the
	transmitter concentration square pulse function; u (V) is the
	voltage across the membrane minus the reversal potential.
	CMeanCurrent[] returns a list of real numbers of length
	Floor[tmax / tstep] + 1 that gives the **arithmetic mean** of the
	n independent single channel currents (pA) at ascending integer
	multiples of tstep."

:Evaluate: CPeakCurrent::usage = "CPeakCurrent[m, qflatpulse,
	qflatpause, clist, initstatenr, duration, u, {tmax, tstep, filtera,
	tint}] is a C routine that performs a Monte Carlo simulation of the
	state transitions in a m-membered channel ensemble, from 0 to tmax
	milliseconds, using a sampling interval of tstep ms; qflatpulse
	(ms^-1) is the flattened transition rate matrix during the
	transmitter pulse; qflatpause (ms^-1) is the flattened transition
	rate matrix after the pulse; clist is the list of the conductivities
	(pS) of the states of the channel; initstatenr is the number of
	the initial state of the channel; duration (ms) defines the length
	of the transmitter concentration square pulse function; u (V) is
	the voltage across the membrane minus the reversal potential. The
	simulation result (current as a function of time) is filtered using
	a gaussian filter with coefficients filtera, averaged over an
	interval of tint milliseconds around the peak, and the resulting
	peak current (pA) is returned as a real number."

:Evaluate: Begin["`chmc`"]

:Begin:
:Function: seedrandom
:Pattern: CSeedRandom[n_Integer]
:Arguments: {n}
:ArgumentTypes: {Integer}
:ReturnType: Null
:End:

void seedrandom(n)
	int      n;
{
	UniForm((long)n);
}


:Begin:
:Function: singletrace
:Pattern: CSingleTrace[qflatpulse_List, qflatpause_List, clist_List,
	initstatenr_Integer, duration_Real, u_Real, {tmax_Real, tstep_Real}]
:Arguments: {qflatpulse, qflatpause, clist, initstatenr, duration, u, tmax,
	tstep}
:ArgumentTypes: {RealList, RealList, RealList, Integer, Real, Real, Real,
	Real}
:ReturnType: Manual
:End:

void singletrace(qflatpulse, ksquare1, qflatpause, ksquare2, clist, k, initstatenr, duration, u, tmax, tstep)
	double   qflatpulse[];                /* ms^-1 */
	long     ksquare1;
	double   qflatpause[];                /* ms^-1 */
	long     ksquare2;
	double   clist[];                     /* pS */
	long     k;
	int      initstatenr;
	double   duration;                    /* ms (pulse length) */
	double   u;                           /* V */
	double   tmax;                        /* ms */
	double   tstep;                       /* ms */
{
	double   **q;                         /* ms^-1 */
	double   *decayTimes;                 /* ms */
	double   *current;                    /* pA */
	long     state = (long)initstatenr;   /* current state number: 1 .. k */
	long     newState;                    /* state No. after transition */
	double   minimumTime;                 /* ms */
	long     minimumPosition;             /* state No. */
	double   time = 0.;                   /* ms */
	long     timeIncrement = 0;           /* tstep ms */
	long     timeIncrementSojourn;        /* tstep ms */

	q = converttomatrix(qflatpulse, (long)0, k - 1, (long)0, k - 1);
	decayTimes = doublevector((long)0, k - 1);
	current = doublevector((long)0, (long)(tmax / tstep + EPS)); /* output vector */
	current[timeIncrement] = -u*clist[state - 1]; /* current at t = 0 */

	/* transmitter pulse */
	while (time < duration) {

		/* calculate decay times into prospective new states */
		for (newState = 1; newState <= k; newState++)
			if (q[state - 1][newState - 1] > 0.)
				decayTimes[newState - 1] =
				-log(UniForm((long)0)) / q[state - 1][newState - 1];
			else
				/* no decay in this direction */
				decayTimes[newState - 1] = tmax + 1.;
				/* tmax + 1. is infinity() for this purpose */

		/* find minimum decay time and resp. new state */
		minimumTime = tmax + 2.;
		for (newState = 1; newState <= k; newState++)
			if (decayTimes[newState - 1] < minimumTime) {
				minimumTime = decayTimes[newState - 1];
				minimumPosition = newState;
			}

		/* check if transmitter pulse duration is exceeded */
		if (time + minimumTime < duration) {
			/* write to current[] and update state and time */
			for (timeIncrementSojourn = timeIncrement + 1;
			     timeIncrementSojourn <= (long)((time + minimumTime) / tstep);
			     timeIncrementSojourn++)
				current[timeIncrementSojourn] = -u*clist[state - 1];
			state = minimumPosition; /* new state */
			time = time + minimumTime; /* new time */
			timeIncrement = (long)(time / tstep);
		}
		else {
			/* clip sojourn at the end of the transmitter pulse */
			/* write to current[] and update time */
			for (timeIncrementSojourn = timeIncrement + 1;
			     timeIncrementSojourn <= (long)(duration / tstep + EPS);
			     timeIncrementSojourn++)
				current[timeIncrementSojourn] = -u*clist[state - 1];
			/* keep old state */
			time = duration; /* new time */
			timeIncrement = (long)(time / tstep + EPS);
		}
	} /* while */

	freeconverttomatrix(q, (long)0, k - 1, (long)0, k - 1);
	q = converttomatrix(qflatpause, (long)0, k - 1, (long)0, k - 1);

	/* relaxation after transmitter pulse */
	while (time < tmax) {

		/* calculate decay times into prospective new states */
		for (newState = 1; newState <= k; newState++)
			if (q[state - 1][newState - 1] > 0.)
				decayTimes[newState - 1] =
				-log(UniForm((long)0)) / q[state - 1][newState - 1];
			else
				/* no decay in this direction */
				decayTimes[newState - 1] = tmax + 1.;
				/* tmax + 1. is infinity() for this purpose */

		/* find minimum decay time and resp. new state */
		minimumTime = tmax + 2.;
		for (newState = 1; newState <= k; newState++)
			if (decayTimes[newState - 1] < minimumTime) {
				minimumTime = decayTimes[newState - 1];
				minimumPosition = newState;
			}

		/* check if simulation period is exceeded */
		if (time + minimumTime < tmax) {
			/* write to current[] and update state and time */
			for (timeIncrementSojourn = timeIncrement + 1;
			     timeIncrementSojourn <= (long)((time + minimumTime) / tstep);
			     timeIncrementSojourn++)
				current[timeIncrementSojourn] = -u*clist[state - 1];
			state = minimumPosition; /* new state */
			time = time + minimumTime; /* new time */
			timeIncrement = (long)(time / tstep);
		}
		else {
			/* clip sojourn at the end of the transmitter pulse */
			/* write to current[] and update time */
			for (timeIncrementSojourn = timeIncrement + 1;
			     timeIncrementSojourn <= (long)(tmax / tstep + EPS);
			     timeIncrementSojourn++)
				current[timeIncrementSojourn] = -u*clist[state - 1];
			/* keep old state */
			time = tmax; /* new time */
			timeIncrement = (long)(time / tstep + EPS);
		}
	} /* while */

	MLPutRealList(stdlink, current, (long)(tmax / tstep + EPS) + (long)1);

	freedoublevector(current, (long)0, (long)(tmax / tstep + EPS));
	freedoublevector(decayTimes, (long)0, k - 1);
	freeconverttomatrix(q, (long)0, k - 1, (long)0, k - 1);
}


:Begin:
:Function: meancurrent
:Pattern: CMeanCurrent[qflatpulse_List, qflatpause_List, clist_List,
	initstatenr_Integer, duration_Real, n_Integer, u_Real, {tmax_Real,
	tstep_Real}]
:Arguments: {qflatpulse, qflatpause, clist, initstatenr, duration, n, u,
	tmax, tstep}
:ArgumentTypes: {RealList, RealList, RealList, Integer, Real, Integer, Real,
	Real, Real}
:ReturnType: Manual
:End:

void meancurrent(qflatpulse, ksquare1, qflatpause, ksquare2, clist, k, initstatenr, duration, n, u, tmax, tstep)
	double   qflatpulse[];                /* ms^-1 */
	long     ksquare1;
	double   qflatpause[];                /* ms^-1 */
	long     ksquare2;
	double   clist[];                     /* pS */
	long     k;
	int      initstatenr;
	double   duration;                    /* ms (pulse length) */
	int      n;
	double   u;                           /* V */
	double   tmax;                        /* ms */
	double   tstep;                       /* ms */
{
	double   **qPulse;                    /* ms^-1 */
	double   **qPause;                    /* ms^-1 */
	double   *stateToCurrent;             /* pA */
	double   *decayTimes;                 /* ms */
	double   *currentSum;                 /* pA */
	double   *current;                    /* pA */
	long     singleTrace;                 /* single trace number: 1 .. n */
	long     state;                       /* current state number: 1 .. k */
	long     newState;                    /* state No. after transition */
	double   minimumTime;                 /* ms */
	long     minimumPosition;             /* state No. */
	double   time = 0.;                   /* ms */
	long     timeIncrement = 0;           /* tstep ms */
	long     timeIncrementSojourn;        /* tstep ms */

	/* initialize some variables for all single traces to be generated */
	qPulse = converttomatrix(qflatpulse, (long)0, k - 1, (long)0, k - 1);
	qPause = converttomatrix(qflatpause, (long)0, k - 1, (long)0, k - 1);
	stateToCurrent = doublevector((long)0, k - 1);
	for (state = 1; state <= k; state++) /* current is negative by convention */
		stateToCurrent[state - 1] = -u*clist[state - 1];
	decayTimes = doublevector((long)0, k - 1);
	currentSum = doublevector((long)0, (long)(tmax / tstep + EPS));
	current = doublevector((long)0, (long)(tmax / tstep + EPS));
	/* initialize currentSum[] to zero */
	for (timeIncrementSojourn = 0; /* any index variable would do, */
	     timeIncrementSojourn <= (long)(tmax / tstep + EPS);
	     timeIncrementSojourn++)   /* but we use the same as below */
		currentSum[timeIncrementSojourn] = 0.;

	for (singleTrace = 1; singleTrace <= (long)n; singleTrace++) { /* main loop */

	/* initialize some variables each time a single trace is started */
	state = (long)initstatenr;
	time = 0.;
	timeIncrement = 0;
	current[timeIncrement] = -u*clist[state - 1]; /* current at t = 0 */

	/* transmitter pulse */
	while (time < duration) {

		/* calculate decay times into prospective new states */
		for (newState = 1; newState <= k; newState++)
			if (qPulse[state - 1][newState - 1] > 0.)
				decayTimes[newState - 1] =
				-log(UniForm((long)0)) / qPulse[state - 1][newState - 1];
			else
				/* no decay in this direction */
				decayTimes[newState - 1] = tmax + 1.;
				/* tmax + 1. is infinity() for this purpose */

		/* find minimum decay time and resp. new state */
		minimumTime = tmax + 2.;
		for (newState = 1; newState <= k; newState++)
			if (decayTimes[newState - 1] < minimumTime) {
				minimumTime = decayTimes[newState - 1];
				minimumPosition = newState;
			}

		/* check if transmitter pulse duration is exceeded */
		if (time + minimumTime < duration) {
			/* write to current[] and update state and time */
			for (timeIncrementSojourn = timeIncrement + 1;
			     timeIncrementSojourn <= (long)((time + minimumTime) / tstep);
			     timeIncrementSojourn++)
				current[timeIncrementSojourn] = stateToCurrent[state - 1];
			state = minimumPosition; /* new state */
			time = time + minimumTime; /* new time */
			timeIncrement = (long)(time / tstep);
		}
		else {
			/* clip sojourn at the end of the transmitter pulse */
			/* write to current[] and update time */
			for (timeIncrementSojourn = timeIncrement + 1;
			     timeIncrementSojourn <= (long)(duration / tstep + EPS);
			     timeIncrementSojourn++)
				current[timeIncrementSojourn] = stateToCurrent[state - 1];
			/* keep old state */
			time = duration; /* new time */
			timeIncrement = (long)(time / tstep + EPS);
		}
	} /* while */

	/* relaxation after transmitter pulse */
	while (time < tmax) {

		/* calculate decay times into prospective new states */
		for (newState = 1; newState <= k; newState++)
			if (qPause[state - 1][newState - 1] > 0.)
				decayTimes[newState - 1] =
				-log(UniForm((long)0)) / qPause[state - 1][newState - 1];
			else
				/* no decay in this direction */
				decayTimes[newState - 1] = tmax + 1.;
				/* tmax + 1. is infinity() for this purpose */

		/* find minimum decay time and resp. new state */
		minimumTime = tmax + 2.;
		for (newState = 1; newState <= k; newState++)
			if (decayTimes[newState - 1] < minimumTime) {
				minimumTime = decayTimes[newState - 1];
				minimumPosition = newState;
			}

		/* check if simulation period is exceeded */
		if (time + minimumTime < tmax) {
			/* write to current[] and update state and time */
			for (timeIncrementSojourn = timeIncrement + 1;
			     timeIncrementSojourn <= (long)((time + minimumTime) / tstep);
			     timeIncrementSojourn++)
				current[timeIncrementSojourn] = stateToCurrent[state - 1];
			state = minimumPosition; /* new state */
			time = time + minimumTime; /* new time */
			timeIncrement = (long)(time / tstep);
		}
		else {
			/* clip sojourn at the end of the transmitter pulse */
			/* write to current[] and update time */
			for (timeIncrementSojourn = timeIncrement + 1;
			     timeIncrementSojourn <= (long)(tmax / tstep + EPS);
			     timeIncrementSojourn++)
				current[timeIncrementSojourn] = stateToCurrent[state - 1];
			/* keep old state */
			time = tmax; /* new time */
			timeIncrement = (long)(time / tstep + EPS);
		}
	} /* while */

	/* add current[] to currentSum[] */
	for (timeIncrementSojourn = 0; /* any index variable would do, */
	     timeIncrementSojourn <= (long)(tmax / tstep + EPS);
	     timeIncrementSojourn++)   /* but we use the same as above */
		currentSum[timeIncrementSojourn] += current[timeIncrementSojourn];

	} /* main loop */

	/* divide currentSum[] by n for the arithmetic mean */
	for (timeIncrementSojourn = 0; /* any index variable would do, */
	     timeIncrementSojourn <= (long)(tmax / tstep + EPS);
	     timeIncrementSojourn++)   /* but we use the same as above */
		currentSum[timeIncrementSojourn] /= (double)n;

	MLPutRealList(stdlink, currentSum, (long)(tmax / tstep + EPS) + (long)1);

	freedoublevector(current, (long)0, (long)(tmax / tstep + EPS));
	freedoublevector(currentSum, (long)0, (long)(tmax / tstep + EPS));
	freedoublevector(decayTimes, (long)0, k - 1);
	freedoublevector(stateToCurrent, (long)0, k - 1);
	freeconverttomatrix(qPause, (long)0, k - 1, (long)0, k - 1);
	freeconverttomatrix(qPulse, (long)0, k - 1, (long)0, k - 1);
}


:Begin:
:Function: peakcurrent
:Pattern: CPeakCurrent[m_Integer, qflatpulse_List, qflatpause_List,
	clist_List, initstatenr_Integer, duration_Real, u_Real,
	{tmax_Real, tstep_Real, filtera_List, tint_Real}]
:Arguments: {m, qflatpulse, qflatpause, clist, initstatenr, duration, u,
	tmax, tstep, filtera, tint}
:ArgumentTypes: {Integer, RealList, RealList, RealList, Integer, Real, Real,
	Real, Real, RealList, Real}
:ReturnType: Real
:End:

double peakcurrent(m, qflatpulse, ksquare1, qflatpause, ksquare2, clist, k, initstatenr, duration, u, tmax, tstep, filtera, falength, tint)
	int      m;
	double   qflatpulse[];                /* ms^-1 */
	long     ksquare1;
	double   qflatpause[];                /* ms^-1 */
	long     ksquare2;
	double   clist[];                     /* pS */
	long     k;
	int      initstatenr;
	double   duration;                    /* ms (pulse length) */
	double   u;                           /* V */
	double   tmax;                        /* ms */
	double   tstep;                       /* ms */
	double   filtera[];                   /* sum up to unity */
	long     falength;                    /* odd */
	double   tint;                        /* ms */
{
	double   **qPulse;                    /* ms^-1 */
	double   **qPause;                    /* ms^-1 */
	double   *stateToCurrent;             /* pA */
	double   *decayTimes;                 /* ms */
	double   *currentSum;                 /* pA */
	double   *current;                    /* pA */
	long     singleTrace;                 /* single trace number: 1 .. m */
	long     state;                       /* current state number: 1 .. k */
	long     newState;                    /* state No. after transition */
	double   minimumTime;                 /* ms */
	long     minimumPosition;             /* state No. and index in currentSumFiltered[] */
	double   time = 0.;                   /* ms */
	long     timeIncrement = 0;           /* tstep ms */
	long     timeIncrementSojourn;        /* tstep ms */
	long     filterN;                     /* falength = 2*filterN + 1 */
	double   *currentSumExtended;         /* pA */
	double   *currentSumFiltered;         /* pA */
	double   filterSum;                   /* pA */
	double   peakEPSC;                    /* pA */
	long     integrationLowerBoundary;    /* index in currentSumFiltered[] */
	long     integrationUpperBoundary;    /*               "               */

	/* generate and sum up single traces first */
	/* initialize some variables for all single traces to be generated */
	qPulse = converttomatrix(qflatpulse, (long)0, k - 1, (long)0, k - 1);
	qPause = converttomatrix(qflatpause, (long)0, k - 1, (long)0, k - 1);
	stateToCurrent = doublevector((long)0, k - 1);
	for (state = 1; state <= k; state++) /* current is negative by convention */
		stateToCurrent[state - 1] = -u*clist[state - 1];
	decayTimes = doublevector((long)0, k - 1);
	currentSum = doublevector((long)0, (long)(tmax / tstep + EPS));
	current = doublevector((long)0, (long)(tmax / tstep + EPS));
	/* initialize currentSum[] to zero */
	for (timeIncrementSojourn = 0; /* any index variable would do, */
	     timeIncrementSojourn <= (long)(tmax / tstep + EPS);
	     timeIncrementSojourn++)   /* but we use the same as below */
		currentSum[timeIncrementSojourn] = 0.;

	for (singleTrace = 1; singleTrace <= (long)m; singleTrace++) { /* simulation main loop */
					      /*  !!!  */
	/* initialize some variables each time a single trace is started */
	state = (long)initstatenr;
	time = 0.;
	timeIncrement = 0;
	current[timeIncrement] = -u*clist[state - 1]; /* current at t = 0 */

	/* transmitter pulse */
	while (time < duration) {

		/* calculate decay times into prospective new states */
		for (newState = 1; newState <= k; newState++)
			if (qPulse[state - 1][newState - 1] > 0.)
				decayTimes[newState - 1] =
				-log(UniForm((long)0)) / qPulse[state - 1][newState - 1];
			else
				/* no decay in this direction */
				decayTimes[newState - 1] = tmax + 1.;
				/* tmax + 1. is infinity() for this purpose */

		/* find minimum decay time and resp. new state */
		minimumTime = tmax + 2.;
		for (newState = 1; newState <= k; newState++)
			if (decayTimes[newState - 1] < minimumTime) {
				minimumTime = decayTimes[newState - 1];
				minimumPosition = newState;
			}

		/* check if transmitter pulse duration is exceeded */
		if (time + minimumTime < duration) {
			/* write to current[] and update state and time */
			for (timeIncrementSojourn = timeIncrement + 1;
			     timeIncrementSojourn <= (long)((time + minimumTime) / tstep);
			     timeIncrementSojourn++)
				current[timeIncrementSojourn] = stateToCurrent[state - 1];
			state = minimumPosition; /* new state */
			time = time + minimumTime; /* new time */
			timeIncrement = (long)(time / tstep);
		}
		else {
			/* clip sojourn at the end of the transmitter pulse */
			/* write to current[] and update time */
			for (timeIncrementSojourn = timeIncrement + 1;
			     timeIncrementSojourn <= (long)(duration / tstep + EPS);
			     timeIncrementSojourn++)
				current[timeIncrementSojourn] = stateToCurrent[state - 1];
			/* keep old state */
			time = duration; /* new time */
			timeIncrement = (long)(time / tstep + EPS);
		}
	} /* while */

	/* relaxation after transmitter pulse */
	while (time < tmax) {

		/* calculate decay times into prospective new states */
		for (newState = 1; newState <= k; newState++)
			if (qPause[state - 1][newState - 1] > 0.)
				decayTimes[newState - 1] =
				-log(UniForm((long)0)) / qPause[state - 1][newState - 1];
			else
				/* no decay in this direction */
				decayTimes[newState - 1] = tmax + 1.;
				/* tmax + 1. is infinity() for this purpose */

		/* find minimum decay time and resp. new state */
		minimumTime = tmax + 2.;
		for (newState = 1; newState <= k; newState++)
			if (decayTimes[newState - 1] < minimumTime) {
				minimumTime = decayTimes[newState - 1];
				minimumPosition = newState;
			}

		/* check if simulation period is exceeded */
		if (time + minimumTime < tmax) {
			/* write to current[] and update state and time */
			for (timeIncrementSojourn = timeIncrement + 1;
			     timeIncrementSojourn <= (long)((time + minimumTime) / tstep);
			     timeIncrementSojourn++)
				current[timeIncrementSojourn] = stateToCurrent[state - 1];
			state = minimumPosition; /* new state */
			time = time + minimumTime; /* new time */
			timeIncrement = (long)(time / tstep);
		}
		else {
			/* clip sojourn at the end of the transmitter pulse */
			/* write to current[] and update time */
			for (timeIncrementSojourn = timeIncrement + 1;
			     timeIncrementSojourn <= (long)(tmax / tstep + EPS);
			     timeIncrementSojourn++)
				current[timeIncrementSojourn] = stateToCurrent[state - 1];
			/* keep old state */
			time = tmax; /* new time */
			timeIncrement = (long)(time / tstep + EPS);
		}
	} /* while */

	/* add current[] to currentSum[] */
	for (timeIncrementSojourn = 0; /* any index variable would do, */
	     timeIncrementSojourn <= (long)(tmax / tstep + EPS);
	     timeIncrementSojourn++)   /* but we use the same as above */
		currentSum[timeIncrementSojourn] += current[timeIncrementSojourn];

	} /* simulation main loop */

	/* apply Gaussian filter on currentSum[] */
	filterN = (falength - 1) / 2;
	currentSumExtended = doublevector((long)0, (long)(tmax / tstep + EPS) + 2*filterN);
	currentSumFiltered = doublevector((long)0, (long)(tmax / tstep + EPS));

	/* initialize currentSumExtended[] to zero */
	for (timeIncrementSojourn = 0; /* any index variable would do, */
	     timeIncrementSojourn <= (long)(tmax / tstep + EPS) + 2*filterN;
	     timeIncrementSojourn++)   /* but we use the same as above */
		currentSumExtended[timeIncrementSojourn] = 0.;

	/* copy currentSum[] into currentSumExtended[] so it becomes zero-padded */
	/* with filterN zeros each at its beginning and end */
	for (timeIncrementSojourn = 0; /* any index variable would do, */
	     timeIncrementSojourn <= (long)(tmax / tstep + EPS);
	     timeIncrementSojourn++)   /* but we use the same as above */
		currentSumExtended[timeIncrementSojourn + filterN] =
			currentSum[timeIncrementSojourn];

	/* do the actual filter map */
	for (timeIncrement = 0; /* any index variable would do, */
	     timeIncrement <= (long)(tmax / tstep + EPS);
	     timeIncrement++)   /* but we use the same as above */ {
		filterSum = 0.;
		for (timeIncrementSojourn = 0;
		     timeIncrementSojourn <= 2*filterN;
		     timeIncrementSojourn++)
			filterSum += (
	filtera[timeIncrementSojourn]*currentSumExtended[timeIncrement + timeIncrementSojourn]);
		currentSumFiltered[timeIncrement] = filterSum;
	}
	
	/* now currentSumFiltered[] contains the filtered EPSC. */
	/* we must find the peak position */
	peakEPSC = 0.;
	minimumPosition = 0;
	for (timeIncrement = 0;
	     timeIncrement <= (long)(tmax / tstep + EPS);
	     timeIncrement++)
		if (currentSumFiltered[timeIncrement] < peakEPSC) {
			peakEPSC = currentSumFiltered[timeIncrement];
			minimumPosition = timeIncrement;
		}

	integrationLowerBoundary =
		Max(0, (long)(-0.5*tint / tstep - 0.5) + minimumPosition);
	integrationUpperBoundary =
		Min((long)(tmax / tstep), (long)(0.5*tint / tstep + 0.5) + minimumPosition);

	/* final preparations for the result: do the integration around the peak */
	peakEPSC = 0.;
	for (timeIncrementSojourn = integrationLowerBoundary;
	     timeIncrementSojourn <= integrationUpperBoundary;
	     timeIncrementSojourn++)
		peakEPSC += currentSumFiltered[timeIncrementSojourn];
	/* and do the normalization */
	peakEPSC /= (double)(1 + integrationUpperBoundary - integrationLowerBoundary);

	freedoublevector(currentSumFiltered, (long)0, (long)(tmax / tstep + EPS));
	freedoublevector(currentSumExtended, (long)0, (long)(tmax / tstep + EPS) + 2*filterN);
	freedoublevector(current, (long)0, (long)(tmax / tstep + EPS));
	freedoublevector(currentSum, (long)0, (long)(tmax / tstep + EPS));
	freedoublevector(decayTimes, (long)0, k - 1);
	freedoublevector(stateToCurrent, (long)0, k - 1);
	freeconverttomatrix(qPause, (long)0, k - 1, (long)0, k - 1);
	freeconverttomatrix(qPulse, (long)0, k - 1, (long)0, k - 1);

	return peakEPSC;
}


/* main program to be called via MathLink */

#if !WINDOWS_MATHLINK

int main(argc, argv)
	int argc;
	char* argv[];
{

/* If the debugging switch DEBUG is set, a file is created at run time
   into which the other subroutines may write some debugging information. */

#if DEBUG
	debug = fopen("chmc.bug", "w");
	(void)fprintf(debug, "Debug the \"chmc\" package\n");
#endif

	return MLMain(argc, argv);
}

#else

int PASCAL WinMain( HANDLE hinstCurrent, HANDLE hinstPrevious, LPSTR lpszCmdLine, int nCmdShow)
{
	char  buff[512];
	char FAR * argv[32];
	int argc;

/* If the debugging switch DEBUG is set, a file is created at run time
   into which the other subroutines may write some debugging information. */

#if DEBUG
	debug = fopen("chmc.bug", "w");
	(void)fprintf(debug, "Debug the \"chmc\" package\n");
#endif

	if( !MLInitializeIcon( hinstCurrent, nCmdShow)) return 1;
	argc = MLStringToArgv( lpszCmdLine, buff, argv, 32);
	return MLMain( argc, argv);
}
#endif

:Evaluate: End[]
:Evaluate: EndPackage[]
