#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define EPS 1.0e-7

double *doublevector(i1, i2)
long i1, i2;
{
	double *v;

	v = (double *)malloc((size_t) (i2 - i1 + 1)*sizeof(double));
	return v - i1;
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
	m -= i1;
	for (i = 0, j = i1; i <= nrows - 1; i++, j++) m[j] = v + ncolumns*i - j1;
	return m;
}

double random_(long iSeed) {
    long  Z, k;
	static long jSeed = 536870911;
	static long kSeed =   8388607; /* 2^23-1 */

	k = jSeed / 53668;
    printf("%i\n", k);
	jSeed = 40014 * (jSeed - k*53668) - k * 12211;
    printf("%i\n", jSeed);

	if(jSeed < 0) jSeed += 2147483563;

	k = kSeed / 52774;
	kSeed = 40692 * (kSeed - k*52774) - k * 3791;

	if(kSeed < 0) kSeed += 2147483399;

	Z = jSeed - kSeed;

	if(Z < 1) Z += 2147483562;

	return (4.65661305739177e-10 * (double)Z);
}

void meancurrent(double qflatpulse[], long ksquare1, double qflatpause[],
long ksquare2, double clist[], long k, int initstatenr, double duration,
int n, double u, double tmax, double tstep)
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
				-log(random_((long)0)) / qPulse[state - 1][newState - 1];
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
				-log(random_((long)0)) / qPause[state - 1][newState - 1];
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
}

int main(){
    printf("%f\n", random_(0));
}