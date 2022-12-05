(* :Title: ColquhounHawkesMC *)

(* :Author: Arnd Roth
	Abteilung Zellphysiologie
	Max-Planck-Institut fuer Medizinische Forschung
	Postfach 10 38 20, D-69028 Heidelberg, Germany
	email: roth@sunny.mpimf-heidelberg.mpg.de *)

(* :Summary: Monte Carlo implementation of parts of "Relaxation
	and fluctuations of membrane currents that flow through
	drug-operated channels", by D. Colquhoun & A.G. Hawkes,
	Proc. R. Soc. Lond. B 199, 231 - 262 (1977) *)

(* :Package Version: 1.2 *)

(* :Copyright: Copyright 1993-94, Max Planck Institute for Medical Research *)

(* :Context: ChannelKinetics`ColquhounHawkesMC` *)

(* :History: Version 1.0 by Arnd Roth, October - November, 1992.
	Version 1.1 by Arnd Roth, February, 1993.
	Version 1.2 by Arnd Roth, November, 1994. *)

(* :Keywords: Q-matrix, single trace generation using a random
	number generator, mean current, current variance, third
	central moment, peak EPSC amplitude distribution *)

(* :Source: see above *)

(* :Warning: Calls C routines via MathLink. See Discussion. *)

(* :Mathematica Version: 2.1 (general), 2.2.3 (Windows) *)

(* :Limitation: none *)

(* :Discussion:  1) DiagramToQMatrix[] resides in a separate package
	with the same name that must be loaded each time you want to
	set up a new Q-matrix from a state diagram.
	 2) This version (1.2) of ColquhounHawkesMC calls the following
	C routines after installing the executable "chmc": CSeedRandom[],
	CSingleTrace[], CMeanCurrent[], CPeakCurrent[]. All of them are
	in the ChannelKinetics`ColquhounHawkesMC` context, too. This
	avoids the unpleasant consequences of the context transitivity
	bug in Mathematica 2.2 and less. CPeakCurrent[] is called by
	PeakEPSCAmplitudeDistribution[]; either CSingleTrace[] or
	CMeanCurrent[] is called by any other function in this package.
	CSeedRandom[] is called once directly after the installation;
	further calls must be made by the user as appropriate.
	 If ColquhounHawkesMC cannot find "chmc", it gives a message
	indicating the problem. In this case you must locate and install
	"chmc" yourself using the Install[] function. Alternatively, you
	might want to change the package's Mathematica code portion that
	is responsible for installing the C routines. It is located
	directly below the definition of the error messages for the
	exported functions. *)

(* set up the package context, included any imports *)


BeginPackage["ChannelKinetics`ColquhounHawkesMC`"]

(* usage messages for the exported functions and the context itself *)

ColquhounHawkesMC::usage = "ColquhounHawkesMC.m contains a Monte
	Carlo implementation of parts of \"Relaxation and fluctuations of
	membrane currents that flow through drug-operated channels\",
	by D. Colquhoun & A.G. Hawkes, Proc. R. Soc. Lond. B 199, 231 -
	262 (1977)."

Help::usage = "Help[] lists all functions defined in the
	ColquhounHawkesMC package."

c::usage = "c[t] represents the transmitter concentration (M) as a function
	of time (ms) in concentration-dependent entries of q (ms^-1)."

SingleTrace::usage = "SingleTrace[q, sclist, initstate,
	height, duration, u, {t, tmax, tstep}] calls a C routine that
	performs a Monte Carlo simulation of the state transitions of a
	single channel, from t = 0 to tmax milliseconds, using a sampling
	interval of tstep ms; q (ms^-1) is the transition rate matrix;
	sclist has entries {state, conductivity (pS)}; initstate is the
	initial state of the channel; height (M) and duration (ms) define
	the transmitter concentration square pulse function; u (V) is the
	voltage across the membrane minus the reversal potential.
	SingleTrace[] returns a list of real numbers of length
	Floor[tmax / tstep] + 1 that gives the single channel current (pA)
	at ascending integer multiples of tstep."

TraceTable::usage = "TraceTable[q, sclist, initstate, height,
	duration, n, u, {t, tmax, tstep}] returns a list of n independent
	single channel current functions of t. See ?SingleTrace for
	information on the other arguments."

MeanCurrent::usage = "MeanCurrent[q, sclist, initstate, height,
	duration, n, u, {t, tmax, tstep}] calls a C routine that adds up
	n independent single channel current functions (pA) and divides the
	sum by n. See ?SingleTrace for information on the other arguments."

EnsembleSize::usage = "EnsembleSize -> m is an optional or required first
	argument to various functions defined in this package. It effectively
	sets the number of available channels in a simulated patch to m."

CurrentVariance::usage = "CurrentVariance[option, q, sclist,
	initstate, height, duration, n, u, {t, tmax, tstep}] gives the
	variance function (pA^2) of n independent single channel current
	functions of t. Division by n-1 (rather than n) is used. The option
	EnsembleSize -> m causes m-membered channel ensembles to be
	simulated instead of single channels. See ?SingleTrace for
	information on the other arguments."

CoefficientOfVariation::usage = "CoefficientOfVariation[option, q,
	sclist, initstate, height, duration, n, u, {t, tmax, tstep}] gives the
	\"coefficient of variation\" (i.e. standard deviation / mean) of n
	independent single channel current functions of t in percent. Division
	by n-1 (rather than n) is used. The option EnsembleSize -> m causes
	m-membered channel ensembles to be simulated instead of single
	channels. See ?SingleTrace for information on the other arguments."

CurrentThirdMoment::usage = "CurrentThirdMoment[option, q, sclist,
	initstate, height, duration, n, u, {t, tmax, tstep}] gives the third
	central moment function (pA^3) of n independent single channel current
	functions of t. Division by n is used. The option EnsembleSize -> m
	causes m-membered channel ensembles to be simulated instead of single
	channels. Since the current is negative by convention, the third
	moment undergoes the same sign change. See ?SingleTrace for
	information on the other arguments."

FilterTest::usage = "FilterTest[EnsembleSize -> m, q, sclist,
	initstate, height, duration, u, {t, tmax, samplingfreq, fc}]
	plots the input and output function of a gaussian filter whose
	cutoff frequency is fc kilohertz. The input function is prepared
	by simulating a m-membered channel ensemble from 0 to tmax
	milliseconds, sampling the current at samplingfreq kilohertz. See
	?SingleTrace for information on the other arguments."

PeakEPSCAmplitudeDistribution::usage = "
	PeakEPSCAmplitudeDistribution[EnsembleSize -> m, q, sclist,
	initstate, height, duration, n, u, {t, tmax, samplingfreq, fc,
	tint}] gives the unnormalized distribution of the peak currents of
	n independently simulated m-membered channel ensembles. Each
	simulation extends from 0 to tmax milliseconds. The simulation
	results are sampled at samplingfreq kilohertz, filtered using a
	gaussian filter with cutoff frequency fc kilohertz, and integrated
	in an interval of tint milliseconds around the peak. The bin width
	is u times the maximum single channel conductivity. The
	distribution is returned in a form suitable for DistributionPlot[].
	See ?SingleTrace for information on the other arguments."

DistributionPlot::usage = "DistributionPlot[distr] normalizes
	the distribution distr and plots it, giving the mean, variance
	etc. at the right side of the plot. DistributionPlot[distr1,
	distr2, ...] does the same for a superposition of the distri."

Unprotect[Help, c, SingleTrace, TraceTable, MeanCurrent,
EnsembleSize, CurrentVariance, CoefficientOfVariation,
CurrentThirdMoment, FilterTest, PeakEPSCAmplitudeDistribution,
DistributionPlot]
(* useful if the user reads in this package more than once *)

Begin["`Private`"]

(* definition of auxiliary functions *)
(* state lifetimes in old SingleTrace[] *)

tau[k_?Positive] := -Log[Random[]] / k
tau[k_ /; k == 0] := Infinity

(* error messages for exported objects *)

ColquhounHawkesMC::nochmc = "Could not find the \"chmc\" file that contains some C routines to be included into Mathematica via MathLink. Please locate and install it manually after starting a new Mathematica session and before loading this package again."

ColquhounHawkesMC::nolink = "MathLink is not available on this system."

ColquhounHawkesMC::dlen = "`1` and `2` have different length."

ColquhounHawkesMC::pulselen = "The transmitter pulse length `1` ms is longer than the simulation interval `2` ms."

ColquhounHawkesMC::stepsz = "The time step size `1` ms is too big."

ColquhounHawkesMC::negative = "`1` is negative."

ColquhounHawkesMC::nomem = "`1` is not a member of `2`."

ColquhounHawkesMC::bine = "Bin widths in `1` are not equal."

(* install "chmc" (C routines for ColquhounHawkesMC.m) if not
   yet installed. Use weak heuristics on the setting of $Path on
   various systems. If Install[] fails for some reason, print
   an error message indicating this problem.                 *)
If[$LinkSupported,
   (* MathLink available *)
   If[Not[Or @@ Map[StringMatchQ[ToLowerCase[First[#]], "*chmc*"] &, Links[]]],
      (* "chmc" not yet installed *)
      Which[$OperatingSystem === "Unix",
            link = Install["/usr/local/mathematica/AddOns/Applications/ChannelKinetics/chmc"],
            $OperatingSystem === "MacOSX",
            SetDirectory[$Path[[-4]]]; (* ..:Applications *)
            SetDirectory["ChannelKinetics"];
            link = Install["chmc"];
            ResetDirectory[];
            ResetDirectory[],
            True, (* other operating system *)
            SetDirectory[Last[$Path]]; (* ../Applications (hopefully) *)
            SetDirectory["ChannelKinetics"];
            link = Install["chmc"];
            ResetDirectory[];
            ResetDirectory[]
      ];
      If[link === $Failed || First[LinkError[link]] != 0, (* Error *)
         Message[ColquhounHawkesMC::nochmc],
         (* else *)
         Print["C routine installation successful."]
      ]
   ],
   (* MathLink not available *)
   Message[ColquhounHawkesMC::nolink]
]

(* initialize random number generator for the C routines *)
CSeedRandom[Mod[Round[AbsoluteTime[]], 1000] + 5]

(* definition of the exported functions *)

Help[] := Print["The following functions are available: \n
     CSeedRandom[n] \n
     SingleTrace[q, sclist, initstate, \n
                 height, duration, u, {t, tmax, tstep}] \n
     TraceTable[q, sclist, initstate, \n
                height, duration, n, u, {t, tmax, tstep}] \n
     MeanCurrent[q, sclist, initstate, \n
                 height, duration, n, u, {t, tmax, tstep}] \n
     CurrentVariance[option, q, sclist, initstate, \n
                     height, duration, n, u, {t, tmax, tstep}] \n
     CoefficientOfVariation[option, q, sclist, initstate, \n
                            height, duration, n, u, \n
                            {t, tmax, tstep}] \n
     CurrentThirdMoment[option, q, sclist, initstate, \n
                        height, duration, n, u, {t, tmax, tstep}] \n
     FilterTest[EnsembleSize -> m, q, sclist, initstate, height, \n
                duration, u, {t, tmax, samplingfreq, fc}] \n
     PeakEPSCAmplitudeDistribution[ \n
     EnsembleSize -> m, q, sclist, initstate, height, duration, \n
     n, u, {t, tmax, samplingfreq, fc, tint}] \n
     DistributionPlot[distr] \n
     Help[], \n
\n
where option is an optional argument of the form \n
     EnsembleSize -> m \n
(m = 1 by default). \n
\n
You can get detailed information on each function by typing \n
     ?function \n
followed by SHIFT-RETURN or ENTER. \n
The definition of a function (Mathematica code) is available at \n
     ??function \n
followed by SHIFT-RETURN or ENTER, as usual."]

(* old SingleTrace[] -- it does not call a C routine;
   furthermore, it returns an InterpolatingFunction[] that
   contains a record of _all_ sojourns, not only those longer
   than some sampling interval tstep.                       *)
SingleTrace[q_?MatrixQ, sclist_?MatrixQ, initstate_Symbol,
            height_?NumberQ, duration_?NumberQ,
            u_?NumberQ, {t_Symbol, tmax_?NumberQ}] :=
Module[{},
(* square pulse concentration *)

qSquarePulse = q /. c[t] -> height;

stateList = First[Transpose[sclist]];
conductivityList = Last[Transpose[sclist]];
time = 0;
state = First[Flatten[Position[stateList, initstate]]];

(* output for placement within InterpolatingFunction head *)
(* the zeros must be integers, not approximate reals (0.) *)
output = {{0, 0, {-u conductivityList[[state]], 0}, {0}}};

While[time < Min[duration, tmax],

decayTimes = Map[tau, qSquarePulse[[state]]];
                                  (* calculate decay times *)
decayTimes[[state]] = Infinity;   (* into _other_ states *)
minimumTime = Min[decayTimes];
newState = First[Flatten[Position[decayTimes, minimumTime]]];

AppendTo[output, {time + minimumTime, time, {
                  -u conductivityList[[state]], 0}, {0}}];
time += minimumTime;

(* If time > Min[duration, tmax], chop last transition after
end of square pulse *)
If[time < Min[duration, tmax], state = newState];
];   (* While *)

(* fix end time of square pulse *)
output[[-1, 1]] = Min[duration, tmax];

(* relaxation: c[t] -> 0 *)

qRelaxation = q /. c[t] -> 0;

time = Min[duration, tmax];

While[time < tmax,

decayTimes = Map[tau, qRelaxation[[state]]];
                                  (* calculate decay times *)
decayTimes[[state]] = Infinity;   (* into _other_ states *)
minimumTime = Min[decayTimes];
newState = First[Flatten[Position[decayTimes, minimumTime]]];

AppendTo[output, {time + minimumTime, time, {
                  -u conductivityList[[state]], 0}, {0}}];
time += minimumTime;
state = newState;
];   (* While *)

(* fix end time of trace *)
output[[-1, 1]] = tmax;
InterpolatingFunction[{0, tmax}, output][t]
] /; Length[q] == Length[sclist] ||
Message[ColquhounHawkesMC::dlen, q, sclist]


(* new SingleTrace[] which calls CSingleTrace[] *)
SingleTrace[q_?MatrixQ, sclist_?MatrixQ, initstate_Symbol,
            height_?NumberQ, duration_?NumberQ, u_?NumberQ,
            {t_Symbol, tmax_?NumberQ, tstep_?NumberQ}] :=

Module[{stateList, conductivityList, initStateNr},
If[duration > tmax,
   Message[ColquhounHawkesMC::pulselen, duration, tmax];
   Return[$Failed]
];
If[tstep > duration / 5,
   Message[ColquhounHawkesMC::stepsz, tstep];
   Return[$Failed]
];
If[tstep < 0,
   Message[ColquhounHawkesMC::negative, tstep];
   Return[$Failed]
];
stateList = First[Transpose[sclist]];
conductivityList = Last[Transpose[sclist]];
If[Not[MemberQ[stateList, initstate]],
   Message[ColquhounHawkesMC::nomem, initstate, stateList];
   Return[$Failed]
];
initStateNr = First[Flatten[Position[stateList, initstate]]];
CSingleTrace[Flatten[q /. c[t] -> height],
             Flatten[q /. c[t] -> 0],
             conductivityList, initStateNr, N[duration],
             N[u], {N[tmax], N[tstep]}]
] /; Length[q] == Length[sclist] ||
Message[ColquhounHawkesMC::dlen, q, sclist]


TraceTable[q_?MatrixQ, sclist_?MatrixQ, initstate_Symbol,
           height_?NumberQ, duration_?NumberQ, n_Integer,
           u_?NumberQ, {t_Symbol, tmax_?NumberQ,
           tstep_?NumberQ}] :=

Table[SingleTrace[q, sclist, initstate, height, duration,
                  u, {t, tmax, tstep}], {n}] /; Length[q] ==
                                         Length[sclist] ||
Message[ColquhounHawkesMC::dlen, q, sclist]


MeanCurrent[q_?MatrixQ, sclist_?MatrixQ, initstate_Symbol,
            height_?NumberQ, duration_?NumberQ, n_Integer,
            u_?NumberQ,
            {t_Symbol, tmax_?NumberQ, tstep_?NumberQ}] :=

Module[{stateList, conductivityList, initStateNr},
If[duration > tmax,
   Message[ColquhounHawkesMC::pulselen, duration, tmax];
   Return[$Failed]
];
If[tstep > duration / 5,
   Message[ColquhounHawkesMC::stepsz, tstep];
   Return[$Failed]
];
If[tstep < 0,
   Message[ColquhounHawkesMC::negative, tstep];
   Return[$Failed]
];
stateList = First[Transpose[sclist]];
conductivityList = Last[Transpose[sclist]];
If[Not[MemberQ[stateList, initstate]],
   Message[ColquhounHawkesMC::nomem, initstate, stateList];
   Return[$Failed]
];
initStateNr = First[Flatten[Position[stateList, initstate]]];
CMeanCurrent[Flatten[q /. c[t] -> height],
             Flatten[q /. c[t] -> 0],
             conductivityList, initStateNr, N[duration],
             n, N[u], {N[tmax], N[tstep]}]
] /; Length[q] == Length[sclist] ||
Message[ColquhounHawkesMC::dlen, q, sclist]


CurrentVariance[q_?MatrixQ, sclist_?MatrixQ, initstate_Symbol,
                height_?NumberQ, duration_?NumberQ, n_Integer,
                u_?NumberQ, {t_Symbol, tmax_?NumberQ,
                tstep_?NumberQ}] :=

Module[{stateList, traceTable, meanCurrent, variance},
(* immediately do some argument checking *)
If[duration > tmax,
   Message[ColquhounHawkesMC::pulselen, duration, tmax];
   Return[$Failed]
];
If[tstep > duration / 5,
   Message[ColquhounHawkesMC::stepsz, tstep];
   Return[$Failed]
];
If[tstep < 0,
   Message[ColquhounHawkesMC::negative, tstep];
   Return[$Failed]
];
stateList = First[Transpose[sclist]];
If[Not[MemberQ[stateList, initstate]],
   Message[ColquhounHawkesMC::nomem, initstate, stateList];
   Return[$Failed]
];

traceTable = Table[SingleTrace[q, sclist, initstate, height,
duration, u, {t, tmax, tstep}], {n}];
meanCurrent = (1 / n) Apply[Plus, traceTable];

(* compute the variance of traceTable *)
variance = (1 / (n - 1)) Apply[Plus,
                               Map[(# - meanCurrent)^2 &,
                                   traceTable
                               ]
                         ];
variance
] /; Length[q] == Length[sclist] ||
Message[ColquhounHawkesMC::dlen, q, sclist]


CurrentVariance[EnsembleSize -> m_Integer, q_?MatrixQ,
sclist_?MatrixQ, initstate_Symbol, height_?NumberQ,
duration_?NumberQ, n_Integer, u_?NumberQ,
{t_Symbol, tmax_?NumberQ, tstep_?NumberQ}] :=

Module[{stateList, traceTable, meanCurrent, variance},
(* immediately do some argument checking *)
If[duration > tmax,
   Message[ColquhounHawkesMC::pulselen, duration, tmax];
   Return[$Failed]
];
If[tstep > duration / 5,
   Message[ColquhounHawkesMC::stepsz, tstep];
   Return[$Failed]
];
If[tstep < 0,
   Message[ColquhounHawkesMC::negative, tstep];
   Return[$Failed]
];
stateList = First[Transpose[sclist]];
If[Not[MemberQ[stateList, initstate]],
   Message[ColquhounHawkesMC::nomem, initstate, stateList];
   Return[$Failed]
];

(* the only difference from CurrentVariance[] without option *)
(* is in the following line:                                 *)
(*                   (and remember, Mma is case sensitive,   *)
(*                    i.e. MeanCurrent =!= meanCurrent)      *)
traceTable = Table[m MeanCurrent[q, sclist, initstate, height,
duration, m, u, {t, tmax, tstep}], {n}];
meanCurrent = (1 / n) Apply[Plus, traceTable];

(* compute the variance of traceTable *)
variance = (1 / (n - 1)) Apply[Plus,
                               Map[(# - meanCurrent)^2 &,
                                   traceTable
                               ]
                         ];
variance
] /; Length[q] == Length[sclist] ||
Message[ColquhounHawkesMC::dlen, q, sclist]


CoefficientOfVariation[q_?MatrixQ, sclist_?MatrixQ, initstate_Symbol,
                       height_?NumberQ, duration_?NumberQ, n_Integer,
                       u_?NumberQ, {t_Symbol, tmax_?NumberQ,
                       tstep_?NumberQ}] :=

Module[{stateList, traceTable, meanCurrent, cv},
(* immediately do some argument checking *)
If[duration > tmax,
   Message[ColquhounHawkesMC::pulselen, duration, tmax];
   Return[$Failed]
];
If[tstep > duration / 5,
   Message[ColquhounHawkesMC::stepsz, tstep];
   Return[$Failed]
];
If[tstep < 0,
   Message[ColquhounHawkesMC::negative, tstep];
   Return[$Failed]
];
stateList = First[Transpose[sclist]];
If[Not[MemberQ[stateList, initstate]],
   Message[ColquhounHawkesMC::nomem, initstate, stateList];
   Return[$Failed]
];

traceTable = Table[SingleTrace[q, sclist, initstate, height,
duration, u, {t, tmax, tstep}], {n}];
meanCurrent = (1 / n) Apply[Plus, traceTable];

(* compute the coefficient of variation of traceTable *)
cv = 100 Sqrt[(1 / (n - 1)) Apply[Plus,
                                  Map[(# - meanCurrent)^2 &,
                                      traceTable
                                  ]
                            ]
         ] / (-meanCurrent);
cv
] /; Length[q] == Length[sclist] ||
Message[ColquhounHawkesMC::dlen, q, sclist]


CoefficientOfVariation[EnsembleSize -> m_Integer,
q_?MatrixQ, sclist_?MatrixQ, initstate_Symbol, height_?NumberQ,
duration_?NumberQ, n_Integer, u_?NumberQ,
{t_Symbol, tmax_?NumberQ, tstep_?NumberQ}] :=

Module[{stateList, traceTable, meanCurrent, cv},
(* immediately do some argument checking *)
If[duration > tmax,
   Message[ColquhounHawkesMC::pulselen, duration, tmax];
   Return[$Failed]
];
If[tstep > duration / 5,
   Message[ColquhounHawkesMC::stepsz, tstep];
   Return[$Failed]
];
If[tstep < 0,
   Message[ColquhounHawkesMC::negative, tstep];
   Return[$Failed]
];
stateList = First[Transpose[sclist]];
If[Not[MemberQ[stateList, initstate]],
   Message[ColquhounHawkesMC::nomem, initstate, stateList];
   Return[$Failed]
];

(* the only difference from CoefficientOfVariation[] without *)
(* option is in the following line:                          *)
(*                   (and remember, Mma is case sensitive,   *)
(*                    i.e. MeanCurrent =!= meanCurrent)      *)
traceTable = Table[m MeanCurrent[q, sclist, initstate, height,
duration, m, u, {t, tmax, tstep}], {n}];
meanCurrent = (1 / n) Apply[Plus, traceTable];

(* compute the coefficient of variation of traceTable *)
cv = 100 Sqrt[(1 / (n - 1)) Apply[Plus,
                                  Map[(# - meanCurrent)^2 &,
                                      traceTable
                                  ]
                            ]
         ] / (-meanCurrent);
cv
] /; Length[q] == Length[sclist] ||
Message[ColquhounHawkesMC::dlen, q, sclist]


CurrentThirdMoment[q_?MatrixQ, sclist_?MatrixQ, initstate_Symbol,
                   height_?NumberQ, duration_?NumberQ, n_Integer,
                   u_?NumberQ, {t_Symbol, tmax_?NumberQ,
                   tstep_?NumberQ}] :=

Module[{stateList, traceTable, meanCurrent, thirdMoment},
(* immediately do some argument checking *)
If[duration > tmax,
   Message[ColquhounHawkesMC::pulselen, duration, tmax];
   Return[$Failed]
];
If[tstep > duration / 5,
   Message[ColquhounHawkesMC::stepsz, tstep];
   Return[$Failed]
];
If[tstep < 0,
   Message[ColquhounHawkesMC::negative, tstep];
   Return[$Failed]
];
stateList = First[Transpose[sclist]];
If[Not[MemberQ[stateList, initstate]],
   Message[ColquhounHawkesMC::nomem, initstate, stateList];
   Return[$Failed]
];

traceTable = Table[SingleTrace[q, sclist, initstate, height,
duration, u, {t, tmax, tstep}], {n}];
meanCurrent = (1 / n) Apply[Plus, traceTable];

(* compute the third central moment of traceTable *)
thirdMoment = (1 / n) Apply[Plus,
                            Map[(# - meanCurrent)^3 &,
                                traceTable
                            ]
                      ];
thirdMoment
] /; Length[q] == Length[sclist] ||
Message[ColquhounHawkesMC::dlen, q, sclist]


CurrentThirdMoment[EnsembleSize -> m_Integer, q_?MatrixQ,
sclist_?MatrixQ, initstate_Symbol, height_?NumberQ,
duration_?NumberQ, n_Integer, u_?NumberQ,
{t_Symbol, tmax_?NumberQ, tstep_?NumberQ}] :=

Module[{stateList, traceTable, meanCurrent, thirdMoment},
(* immediately do some argument checking *)
If[duration > tmax,
   Message[ColquhounHawkesMC::pulselen, duration, tmax];
   Return[$Failed]
];
If[tstep > duration / 5,
   Message[ColquhounHawkesMC::stepsz, tstep];
   Return[$Failed]
];
If[tstep < 0,
   Message[ColquhounHawkesMC::negative, tstep];
   Return[$Failed]
];
stateList = First[Transpose[sclist]];
If[Not[MemberQ[stateList, initstate]],
   Message[ColquhounHawkesMC::nomem, initstate, stateList];
   Return[$Failed]
];

(* the only difference from CurrentThirdMoment[] without     *)
(* option is in the following line:                          *)
(*                   (and remember, Mma is case sensitive,   *)
(*                    i.e. MeanCurrent =!= meanCurrent)      *)
traceTable = Table[m MeanCurrent[q, sclist, initstate, height,
duration, m, u, {t, tmax, tstep}], {n}];
meanCurrent = (1 / n) Apply[Plus, traceTable];

(* compute the third central moment of traceTable *)
thirdMoment = (1 / n) Apply[Plus,
                            Map[(# - meanCurrent)^3 &,
                                traceTable
                            ]
                      ];
thirdMoment
] /; Length[q] == Length[sclist] ||
Message[ColquhounHawkesMC::dlen, q, sclist]


FilterTest[EnsembleSize -> m_Integer,
q_?MatrixQ, sclist_?MatrixQ, initstate_Symbol,
height_?NumberQ, duration_?NumberQ, u_?NumberQ,
{t_Symbol, tmax_?NumberQ, samplingfreq_?NumberQ, fc_?NumberQ}] :=

Module[{tstep, stateList, conductivityList, initStateNr,
        sigmaG, filterN, filterA,
        sampledCurrent, graph1, filteredCurrent, graph2},
tstep = 1 / samplingfreq; (* ms *)

(* initialize filter parameters *)

sigmaG = 0.1325 / (fc / samplingfreq);
         (* Colquhoun & Sigworth, (A2), p. 257,
            in units of sample intervals *)
filterN = Round[4 sigmaG];
         (* number of filter terms = 1 + 2 filterN *)

filterA = Map[N[1 / (Sqrt[2 Pi] sigmaG) E^(-#^2 / (2 sigmaG^2))] &,
    Range[-filterN, filterN]]; (* raw filter coefficients *)

filterA /= Plus @@ filterA; (* adjust normalization:
                               final filter coefficients *)
(* end of filter coefficient preparation *)

sampledCurrent = Join[Table[0, {filterN}],
m CMeanCurrent[Flatten[q /. c[t] -> height],
               Flatten[q /. c[t] -> 0],
               conductivityList, initStateNr, N[duration],
               m, N[u], {N[tmax + filterN tstep], N[tstep]}]
                 ];
   
graph1 = ListPlot[Drop[Drop[sampledCurrent, filterN], -filterN],
                  PlotJoined -> True,
                  PlotRange ->
                  {-m u Max[Transpose[sclist][[2]]], 0},
                  AxesLabel -> {"t/samples", "I/pA"},
                  PlotLabel ->
                  "Ensemble Current Before Filtering",
                  DisplayFunction -> Identity];
   
(* apply Gaussian filter on sampledCurrent *)

filteredCurrent = Map[# . filterA &, Partition[sampledCurrent, 1 + 2 filterN, 1]];

graph2 = ListPlot[filteredCurrent, PlotJoined -> True,
                  PlotRange ->
                  {-m u Max[Transpose[sclist][[2]]], 0},
                  AxesLabel -> {"t/samples", "I/pA"},
                  PlotLabel ->
                  "Ensemble Current After Filtering",
                  DisplayFunction -> Identity];

{Show[graph1, DisplayFunction -> $DisplayFunction],
 Show[graph2, DisplayFunction -> $DisplayFunction]}
] /; Length[q] == Length[sclist] ||
Message[ColquhounHawkesMC::dlen, q, sclist]


PeakEPSCAmplitudeDistribution[EnsembleSize -> m_Integer,
q_?MatrixQ, sclist_?MatrixQ, initstate_Symbol,
height_?NumberQ, duration_?NumberQ, n_Integer, u_?NumberQ,
{t_Symbol, tmax_?NumberQ, samplingfreq_?NumberQ, fc_?NumberQ,
tint_?NumberQ}] :=

Module[{tstep, stateList, conductivityList, initStateNr, binWidth,
        distribution, sigmaG, filterN, filterA, argumentsToCPC,
        peakCurrentTable, mean, variance, thirdMoment},
tstep = 1 / samplingfreq; (* ms *)
If[duration > tmax,
   Message[ColquhounHawkesMC::pulselen, duration, tmax];
   Return[$Failed]
];
If[tstep > duration / 5,
   Message[ColquhounHawkesMC::stepsz, tstep];
   Return[$Failed]
];
If[samplingfreq < 0,
   Message[ColquhounHawkesMC::negative, samplingfreq];
   Return[$Failed]
];
If[fc < 0,
   Message[ColquhounHawkesMC::negative, fc];
   Return[$Failed]
];
If[tint < 0,
   Message[ColquhounHawkesMC::negative, tint];
   Return[$Failed]
];
stateList = First[Transpose[sclist]];
conductivityList = Last[Transpose[sclist]];
If[Not[MemberQ[stateList, initstate]],
   Message[ColquhounHawkesMC::nomem, initstate, stateList];
   Return[$Failed]
];
initStateNr = First[Flatten[Position[stateList, initstate]]];

binWidth = u Max[conductivityList]; (* picoamperes *)
distribution = Table[0, {m + 1}]; (* initialize distribution *)

(* initialize filter parameters *)

sigmaG = 0.1325 / (fc / samplingfreq);
         (* Colquhoun & Sigworth, (A2), p. 257,
            in units of sample intervals *)
filterN = Round[4 sigmaG];
         (* number of filter terms = 1 + 2 filterN *)

filterA =
Map[N[1 / (Sqrt[2 Pi] sigmaG) E^(-#^2 / (2 sigmaG^2))] &,
    Range[-filterN, filterN]]; (* raw filter coefficients *)

filterA /= Plus @@ filterA; (* adjust normalization:
                               final filter coefficients *)

(* compute table of n simulated peak EPSC amplitude values *)
argumentsToCPC = {m,
                  Flatten[q /. c[t] -> height],
                  Flatten[q /. c[t] -> 0],
                  conductivityList, initStateNr,
                  N[duration], N[u], {N[tmax],
                  N[tstep], filterA, N[tint]}
		 };
peakCurrentTable =
Table[-CPeakCurrent[Sequence @@ argumentsToCPC], {n}];

mean = Plus @@ peakCurrentTable / n;
variance = Plus @@ ((peakCurrentTable - mean)^2) / (n - 1);
thirdMoment = Plus @@ ((peakCurrentTable - mean)^3) / n;

(* compute distribution from peakCurrentTable *)
Scan[++distribution[[Round[# / binWidth] + 1]] &,
     peakCurrentTable];

{binWidth, mean, variance, thirdMoment, distribution}
] /; Length[q] == Length[sclist] ||
Message[ColquhounHawkesMC::dlen, q, sclist]


DistributionPlot[distr__List] :=
Module[{distributionlist, binWidth, mean, variance,
        thirdMoment, m, distribution, n,
        output, outputAddendum, outputEnd, outputIF,
        graph,  numbersInGraph},

distributionlist = List[distr];
If[Not[Equal @@ First[Transpose[distributionlist]]],
   Message[ColquhounHawkesMC::bine, distr];
   Return[$Failed]
];

(* extract binWidth,
   extract mean, variance, thirdMoment to be printed
   only in the plot of a _single_ distribution      *)
binWidth = distributionlist[[1, 1]]; (* picoamperes *)
mean = distributionlist[[1, 2]]; (* picoamperes *)
variance = distributionlist[[1, 3]]; (* pA^2 *)
thirdMoment = distributionlist[[1, 4]]; (* pA^3 *)

(* strip off binWidth, mean, variance, thirdMoment *)
distributionlist = Last[Transpose[distributionlist]];
m = Max[Map[Length, distributionlist]] - 1;

(* compute superposition of the entries of distributionlist,
   padding the shorter ones with zeros to the right *)

distribution = Plus @@
Map[Join[#, Table[0, {m + 1 - Length[#]}]] &,
    distributionlist];

n = Plus @@ distribution; (* sum of numbers of experiments
                             used for normalization *) 

(* output for placement within InterpolatingFunction head *)
(* the zeros must be integers, not approximate reals (0.) *)
output = {{-3 binWidth / 2, - 3 binWidth / 2, {0, 0}, {0}},
          {-binWidth / 2, -3 binWidth / 2,
          {0, 0}, {0}}};   (* start at zero *)

outputAddendum = MapIndexed[
{(First[#2] - 1 / 2) binWidth, (First[#2] - 3 / 2) binWidth,
 {#1 / n, 0}, {0}} &,
                            distribution];   (* central
part of the distribution containing nonzero values *)

outputEnd = {{(m + 3 / 2) binWidth, (m + 1 / 2) binWidth,
             {0, 0}, {0}}};   (* end at zero *)

outputIF =
InterpolatingFunction[{-3 binWidth / 2, (m + 3 / 2) binWidth},
                      Join[output, outputAddendum, outputEnd]][
                      current];

graph = Plot[outputIF,
             {current, -3 binWidth / 2, (m + 3 / 2) binWidth},
             PlotPoints -> Max[200, Length[distribution]],
             AxesLabel -> {"I/pA", "p"},
             PlotLabel -> "Peak EPSC Amplitude Distribution",
             DisplayFunction -> Identity];

(* numbers in graph only in the case of a single distribution *)
numbersInGraph =
If[Length[distributionlist] == 1,
   Graphics[{
   Text[FontForm["mean: " <> ToString[SetPrecision[
                 mean, 4]] <> " pA",
                 {"Helvetica", 15}],
        {(m + 3 / 2) binWidth, (0.83 / n) Max[distribution]},
        {-1, 0}
   ],
   Text[FontForm["s.d.: " <> ToString[SetPrecision[
                 Sqrt[variance], 3]] <> " pA",
                 {"Helvetica", 15}],
        {(m + 3 / 2) binWidth, (0.66 / n) Max[distribution]},
        {-1, 0}
   ],
   Text[FontForm["var: " <> ToString[SetPrecision[
                 variance, 3]] <> " pA^2",
                 {"Helvetica", 15}],
        {(m + 3 / 2) binWidth, (0.5 / n) Max[distribution]},
        {-1, 0}
   ],
   Text[FontForm["c.v.: " <> ToString[SetPrecision[
                 100 Sqrt[variance] / mean, 4]] <> " %",
                 {"Helvetica", 15}],
        {(m + 3 / 2) binWidth, (0.33 / n) Max[distribution]},
        {-1, 0}
   ],
   Text[FontForm["m3: " <> ToString[SetPrecision[
                 thirdMoment, 3]] <> " pA^3",
                 {"Helvetica", 15}],
        {(m + 3 / 2) binWidth, (0.16 / n) Max[distribution]},
        {-1, 0}
   ]}],
(* else *)
   Graphics[{}]
];

Show[graph, numbersInGraph,
     PlotRange -> All, DisplayFunction -> $DisplayFunction]
]


End[]   (* end the private context *)

Protect[Help, c, SingleTrace, TraceTable, MeanCurrent,
EnsembleSize, CurrentVariance, CoefficientOfVariation,
CurrentThirdMoment, FilterTest, PeakEPSCAmplitudeDistribution,
DistributionPlot]
(* protect exported symbols *)

EndPackage[]   (* end the package context *)
