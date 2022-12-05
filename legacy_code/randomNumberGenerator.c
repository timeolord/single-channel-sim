#include <stdlib.h>
#include <stdio.h>
#include <math.h>

#define EPS 1.0e-7

double *doublevector(long i1, long i2){
	double *v;

	v = (double *)malloc((size_t) (i2 - i1 + 1)*sizeof(double));
	return v - i1;
}

double **converttomatrix(double *v, long i1, long i2, long j1, long j2){
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
	jSeed = 40014 * (jSeed - k*53668) - k * 12211;

	if(jSeed < 0) jSeed += 2147483563;

	k = kSeed / 52774;
	kSeed = 40692 * (kSeed - k*52774) - k * 3791;

	if(kSeed < 0) kSeed += 2147483399;

	Z = jSeed - kSeed;

	if(Z < 1) Z += 2147483562;

	return (4.65661305739177e-10 * (double)Z);
}

void singletrace(double qflatpulse[], double qflatpause[], double clist[], long k, int initstatenr, double duration, double u,double tmax, double tstep) {
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
				-log(random_((long)0)) / q[state - 1][newState - 1];
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

	q = converttomatrix(qflatpause, (long)0, k - 1, (long)0, k - 1);

	/* relaxation after transmitter pulse */
	while (time < tmax) {

		/* calculate decay times into prospective new states */
		for (newState = 1; newState <= k; newState++)
			if (q[state - 1][newState - 1] > 0.)
				decayTimes[newState - 1] =
				-log(random_((long)0)) / q[state - 1][newState - 1];
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
    for (int i = 0; i < (long)(tmax / tstep + EPS) + (long)1; i++){
        printf("%f ", current[i]);
    }
}


void meancurrent(double qflatpulse[], double qflatpause[], double clist[], long k, int initstatenr, double duration, int n, double u, double tmax, double tstep)
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

int main(){
    double height = 0.001;
    double duration = 1;
    double u = 0.07;
    double tmax = 10;
    double tstep = 0.2;
    double qPulse[] = {-100000.0*height, 100000.0*height, 0.0, 0.0,
    50.0, -64.0, 4.0, 10.0,
    0.0, 0.02, -0.02, 0,
    0.0, 0.5, 0.0, -0.5};
    double qPause[] = {-100000.0*0, 100000.0*0, 0.0, 0.0,
    50.0, -64.0, 4.0, 10.0,
    0.0, 0.02, -0.02, 0,
    0.0, 0.5, 0.0, -0.5};
    double conductivityList[] = {0, 0, 0, 8};
    singletrace(qPulse, qPause,conductivityList, 4, 1, duration, u, tmax, tstep);
    printf("\n");
    singletrace(qPulse, qPause,conductivityList, 4, 1, duration, u, tmax, tstep);
    printf("\n");
    singletrace(qPulse, qPause,conductivityList, 4, 1, duration, u, tmax, tstep);
    printf("\n");
    singletrace(qPulse, qPause,conductivityList, 4, 1, duration, u, tmax, tstep);
}