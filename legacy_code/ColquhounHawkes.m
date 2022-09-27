(* :Title: ColquhounHawkes *)

(* :Author: Arnd Roth
	Abteilung Zellphysiologie
	Max-Planck-Institut fuer Medizinische Forschung
	Postfach 10 38 20, D-69028 Heidelberg, Germany
	email: roth@sunny.mpimf-heidelberg.mpg.de *)

(* :Summary: Implements parts of "Relaxation and fluctuations of
	membrane currents that flow through drug-operated channels",
	by D. Colquhoun & A.G. Hawkes, Proc. R. Soc. Lond. B 199,
	231 - 262 (1977) *)

(* :Package Version: 1.1 *)

(* :Copyright: Copyright 1993-94, Max Planck Institute for Medical Research *)

(* :Context: ChannelKinetics`ColquhounHawkes` *)

(* :History: Version 1.0 by Arnd Roth, October - December, 1992.
	Version 1.1 by Arnd Roth, minor enhancements, December, 1994. *)

(* :Keywords: Q-matrix, numerical solution of ODE, mean occupancy,
	mean current, current variance, third central moment *)

(* :Source: see above *)

(* :Warning: *)

(* :Mathematica Version: 2.1 *)

(* :Limitation: none *)

(* :Discussion: DiagramToQMatrix[] resides in a separate package
	because of its memory requirements. *)

(* set up the package context, included any imports *)

BeginPackage["ChannelKinetics`ColquhounHawkes`",
             "Graphics`Legend`",
             "Utilities`FilterOptions`"]

(* usage messages for the exported functions and the context itself *)

ColquhounHawkes::usage = "ColquhounHawkes.m is a package that implements
	parts of \"Relaxation and fluctuations of membrane currents that
	flow through drug-operated channels\", by D. Colquhoun & A.G.
	Hawkes, Proc. R. Soc. Lond. B 199, 231 - 262 (1977)."

Help::usage = "Help[] lists all functions defined in the
	ColquhounHawkes package."

SquarePulseConcentration::usage =
	"SquarePulseConcentration[t, height, duration] gives a single
	square pulse function of t. Its value is height (moles per cubic
	decimeter) for 0 < t < duration milliseconds and zero elsewhere."

Occupancy::usage = "Occupancy[q, initocc, concrule, {t, tmax}] computes
	the solution of the equation p'[t] == Transpose[q /. concrule] . p[t]
	subject to p[0] == initocc using an adaptive stepsize Runge-Kutta
	algorithm, from 0 to tmax milliseconds. Concentration dependent
	entries of q are assumed to have a symbolic factor c[t] in them,
	therefore concrule must be of the form c[t] -> conc[t]."

OccupancyPlot::usage = "OccupancyPlot[occ, sclist, {t, tmax}]
	plots the entries of the vector occ (function of t, as returned
	from the Occupancy[] function), labeling them according to sclist
	(whose entries have the form {state name, conductivity};
	conductivity in picosiemens), from 0 to tmax milliseconds."

CurrentPlot::usage = "CurrentPlot[occ, sclist, n, u, {t, tmax}]
	plots the average current through n channels for u = uapplied - urev
	in volts, from 0 to tmax milliseconds. The interval of +- 1 standard
	deviation is shown in gray. For information on occ and sclist see
	?OccupancyPlot."

CurrentRisetime::usage = "CurrentRisetime[occ, sclist, t] gives the
	20/80% risetime (milliseconds) of the current, which is computed
	using occ, the occupancy function of t, and sclist, the list of the
	states and their conductivities."

CurrentVariancePlot::usage = "CurrentVariancePlot[occ, sclist,
	n, u, {t, tmax}] plots the variance of the current through n channels
	for u = uapplied - urev in volts, from 0 to tmax milliseconds. For
	information on occ and sclist see ?OccupancyPlot."

CoefficientOfVariationPlot::usage = "CoefficientOfVariationPlot[occ,
	sclist, n, u, {t, tmax}] plots the coefficient of variation (i.e.
	standard deviation / mean, in percent) of the current through n
	channels for u = uapplied - urev in volts, from 0 to tmax
	milliseconds. For information on occ and sclist see ?OccupancyPlot."

CurrentThirdMomentPlot::usage = "CurrentThirdMomentPlot[occ,
	sclist, n, u, {t, tmax}] plots the third central moment of the
	current through n channels for u = uapplied - urev in volts, from 0
	to tmax milliseconds. Since the current is negative by convention,
	the third moment undergoes the same sign change. For information on
	occ and sclist see ?OccupancyPlot."

FirstLatencies::usage = "FirstLatencies[q, sclist, initocc, concrule,
	{t, tmax}] gives the probability density function for a first
	opening of a channel at time t milliseconds if it was closed at
	time zero. For information on the arguments see ?Occupancy and
	?OccupancyPlot."

Unprotect[Help, SquarePulseConcentration, Occupancy, OccupancyPlot,
CurrentPlot, CurrentRisetime, CurrentVariancePlot,
CoefficientOfVariationPlot, CurrentThirdMomentPlot, FirstLatencies]
(* useful if the user reads in this package more than once *)

Begin["`Private`"]

(* error messages for exported objects *)

ColquhounHawkes::dlen = "`1` and `2` have different length."

ColquhounHawkes::dlen3 = "`1`, `2` and `3` have different length."

(* definition of the exported functions *)

Help[] := Print["The following functions are available: \n
     SquarePulseConcentration[t, height, duration] \n
     Occupancy[q, initocc, concrule, {t, tmax}] \n
     OccupancyPlot[occ, sclist, {t, tmax}] \n
     CurrentPlot[occ, sclist, n, u, {t, tmax}] \n
     CurrentRisetime[occ, sclist, t] \n
     CurrentVariancePlot[occ, sclist, n, u, {t, tmax}] \n
     CoefficientOfVariationPlot[occ, sclist, n, u, {t, tmax}] \n
     CurrentThirdMomentPlot[occ, sclist, n, u, {t, tmax}] \n
     FirstLatencies[q, sclist, initocc, concrule, {t, tmax}] \n
     Help[] \n
You can get detailed information on each function by typing \n
     ?function \n
followed by SHIFT-RETURN or ENTER. \n
The definition of a function (Mathematica code) is available at \n
     ??function \n
followed by SHIFT-RETURN or ENTER, as usual."]



SquarePulseConcentration[t_Symbol + offset_.,
                         height_?NumberQ, duration_?NumberQ] :=
height (Sign[t + offset] - Sign[t + offset - duration]) / 2



Options[Occupancy] =
Join[Select[Options[NDSolve],
            FreeQ[First[#], AccuracyGoal | PrecisionGoal] &],
     {AccuracyGoal -> 4, PrecisionGoal -> 4}]

Occupancy[q_?MatrixQ, initocc_List, concrule_Rule | concrule:{_Rule..},
          {t_Symbol, tmax_?NumberQ}, opts___] :=
Module[{pVector, equations},

pVector = Table[p[i][t], {i, Length[q]}];
equations = Join[
Thread[D[pVector, t] == Transpose[q /. concrule] . pVector],
Thread[(pVector /. t -> 0) == initocc]
            ];

pVector /. Flatten[NDSolve[equations, pVector, {t, 0, tmax},
                           FilterOptions[NDSolve, opts],
                           Sequence @@ Options[Occupancy]]]
] /; Length[q] == Length[initocc] ||
Message[ColquhounHawkes::dlen, q, initocc]



OccupancyPlot[occ_List, sclist_?MatrixQ,
              {t_Symbol, tmax_?NumberQ}, opts___] :=

Plot[Evaluate[Prepend[occ, 1 - First[occ]]], {t, 0, tmax},
     Evaluate[
     FilterOptions[Plot, opts],
     PlotStyle -> Join[{{}}, Table[
{Hue[i / Length[occ]]}, {i, 0, Length[occ] - 1}]],
     PlotLegend -> Prepend[Table[
ToString[Global`p[sclist[[i, 1]]]], {i, 1, Length[sclist]}],
                           ToString[1 - Global`p[sclist[[1, 1]]]]],
     LegendPosition -> {1, -0.4},
     LegendSize -> {0.8, 0.8},
     AxesLabel -> {"t/ms", "p[i]"},
     PlotLabel -> "Occupancy",
     PlotRange -> {-0.01, 1.01}, AxesOrigin -> {0, 0}]
] /; Length[occ] == Length[sclist] ||
Message[ColquhounHawkes::dlen, occ, sclist]



CurrentPlot[occ_List, sclist_?MatrixQ, n_Integer, u_?NumberQ,
            {t_Symbol, tmax_?NumberQ}, opts___] :=

Module[{funs},
(* funs = {current, current - 1 sigma, current + 1 sigma} *)
funs = {-n u occ . Transpose[sclist][[2]],
        -n u occ . Transpose[sclist][[2]] -
	Sqrt[n u^2 * (occ . (Transpose[sclist][[2]]^2) -
                     (occ . Transpose[sclist][[2]])^2)],
	-n u occ . Transpose[sclist][[2]] +
	Sqrt[n u^2 * (occ . (Transpose[sclist][[2]]^2) -
                     (occ . Transpose[sclist][[2]])^2)]};
Plot[Evaluate[funs],
     {t, 0, tmax},
     Evaluate[
     FilterOptions[Plot, opts],
     PlotStyle -> {GrayLevel[0], GrayLevel[0.5],
                   GrayLevel[0.5]},
     AxesLabel -> {"t/ms", "I/pA"},
     PlotLabel -> "Current",
     PlotRange -> {-n u Max[Transpose[sclist][[2]]], 0}]
]
] /; Length[occ] == Length[sclist] ||
Message[ColquhounHawkes::dlen, occ, sclist]



CurrentRisetime[occ_List, sclist_?MatrixQ, t_Symbol] :=
Module[{peakCurrent, peakTimeRule, peakTime, t80, t20},

{peakCurrent, peakTimeRule} =
FindMinimum[-occ . Transpose[sclist][[2]],
            {t, 0.01, 0.02}];
peakTime = t /. peakTimeRule;
(* considerable heuristics goes into these starting values, *)
(* so do not trust this routine too much.                   *)
t80 = t /. FindRoot[-occ . Transpose[sclist][[2]] ==
                     0.8 peakCurrent, {t,
                                       0.5 peakTime,
                                       0.6 peakTime}];
t20 = t /. FindRoot[-occ . Transpose[sclist][[2]] ==
                    0.2 peakCurrent, {t,
                                      0.05 peakTime,
                                      0.1 peakTime}];
t80 - t20
] /; Length[occ] == Length[sclist] ||
Message[ColquhounHawkes::dlen, occ, sclist]



CurrentVariancePlot[occ_List, sclist_?MatrixQ, n_Integer, u_?NumberQ,
                    {t_Symbol, tmax_?NumberQ}, opts___] :=
Module[{},
Plot[Evaluate[n u^2 * (occ . (Transpose[sclist][[2]]^2) -
                      (occ . Transpose[sclist][[2]])^2)],
     {t, 0, tmax},
     Evaluate[
     FilterOptions[Plot, opts],
     PlotRange -> {0, Automatic},
     AxesLabel -> {"t/ms", "var[I[t]]/(pA^2)"},
     PlotLabel -> "Variance of Current"]]
] /; Length[occ] == Length[sclist] ||
Message[ColquhounHawkes::dlen, occ, sclist]



CoefficientOfVariationPlot[occ_List, sclist_?MatrixQ, n_Integer,
                           u_?NumberQ, {t_Symbol, tmax_?NumberQ},
                           opts___] :=
Module[{},
(* ordinate in %, therefore c.v. = (100 s.d. / mean) % *)
Plot[100 *
     Evaluate[Sqrt[n u^2 * (occ . (Transpose[sclist][[2]]^2) -
                           (occ . Transpose[sclist][[2]])^2)] /
              (n u occ . Transpose[sclist][[2]])],
     {t, 0.001, tmax},
     Evaluate[
     FilterOptions[Plot, opts],
     PlotRange -> {0, Automatic},
     AxesLabel -> {"t/ms", "c.v./%"},
     PlotLabel -> "Coefficient of Variation"]]
] /; Length[occ] == Length[sclist] ||
Message[ColquhounHawkes::dlen, occ, sclist]



CurrentThirdMomentPlot[occ_List, sclist_?MatrixQ, n_Integer,
                       u_?NumberQ, {t_Symbol, tmax_?NumberQ},
                       opts___] :=
Module[{},
Plot[Evaluate[-n u^3 * (occ . (Transpose[sclist][[2]]^3) -
(3 (occ . (Transpose[sclist][[2]]^2)) (occ . Transpose[sclist][[2]])) +
                    2 (occ . Transpose[sclist][[2]])^3)],
     {t, 0, tmax},
     Evaluate[
     FilterOptions[Plot, opts],
     PlotRange -> All,
     PlotPoints -> 100,
     AxesLabel -> {"t/ms", "m3[I[t]]/(pA^3)"},
     PlotLabel -> "Third Central Moment of Current"]]
] /; Length[occ] == Length[sclist] ||
Message[ColquhounHawkes::dlen, occ, sclist]



Options[FirstLatencies] = Options[Occupancy]

FirstLatencies[q_?MatrixQ, sclist_?MatrixQ, initocc_List, concrule_Rule |
               concrule:{_Rule..}, {t_Symbol, tmax_?NumberQ}, opts___] :=
Module[{takelist, qClosed},
takelist = Flatten[Position[sclist, {_, 0} | {_, 0.}]];
qClosed = Transpose[Transpose[q[[takelist]]][[takelist]]];
initoccClosed = initocc[[takelist]];
initoccClosed /= Plus @@ initoccClosed;
(* D. Colquhoun & A.G. Hawkes, Proc. R. Soc. Lond. B 230, 15-52 (1987),
   equation 6.11 *)
Chop[Occupancy[qClosed, initoccClosed, concrule, {t, tmax},
               FilterOptions[NDSolve, opts],
               Sequence @@ Options[FirstLatencies]] .
     (-qClosed /. concrule) . Table[1, {Length[takelist]}]]
] /; Length[q] == Length[sclist] == Length[initocc] ||
Message[ColquhounHawkes::dlen3, q, sclist, initocc]



End[]   (* end the private context *)

Protect[Help, SquarePulseConcentration, Occupancy, OccupancyPlot,
CurrentPlot, CurrentRisetime, CurrentVariancePlot,
CoefficientOfVariationPlot, CurrentThirdMomentPlot, FirstLatencies]
(* protect exported symbols *)

EndPackage[]   (* end the package context *)
