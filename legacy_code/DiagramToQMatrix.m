(* :Title: DiagramToQMatrix *)

(* :Author: Arnd Roth
	Abteilung Zellphysiologie
	Max-Planck-Institut fuer Medizinische Forschung
	Postfach 10 38 20, D-69028 Heidelberg, Germany
	email: roth@sunny.mpimf-heidelberg.mpg.de *)

(* :Summary: Builds Colquhoun's Q-matrix from a reaction diagram
	prompting for nonzero transition rates *)

(* :Package Version: 1.3 *)

(* :Copyright: Copyright 1992-94, Max Planck Institute for Medical Research *)

(* :Context: ChannelKinetics`DiagramToQMatrix` *)

(* :History: 
	Version 1.0 by Arnd Roth, September, 1992.
	Revised version 1.1 by Arnd Roth, October, 1992.
	Revised: check for rates in cycles to have the same product.
	         Version 1.2, Arnd Roth, December, 1992.
	Version 1.3 by Arnd Roth, December, 1994. *)

(* :Keywords: *)

(* :Source: *)

(* :Warning: This package will be revised and improved considerably
	as soon as the new Mathematica frontend becomes available *)

(* :Mathematica Version: 2.0 *)

(* :Limitation: none *)

(* :Discussion: checks for the transition rates in either direction of
	cycles to multiply up to the same value (microscopic reversibility) *)

(* set up the package context, included any imports *)


BeginPackage["ChannelKinetics`DiagramToQMatrix`",
             "DiscreteMath`Combinatorica`"]

DiagramToQMatrix::usage = "DiagramToQMatrix[diagram, stateconductivitylist]
	builds Colquhoun's Q-matrix from a transition diagram, prompting for
	nonzero transition rates. Their unit is (ms^-1). Concentration
	dependent rates must have a symbolic factor c[t] in them. The
	command \"repeat -m\" entered in an input window causes the mth-last
	query to be repeated. Diagram format requrements: the entries
	diagram[[i, j]] may be \n(1) state name for i odd and j odd, \n(2)
	connected for i odd xor j odd, \n(3) blanks elsewhere. \n   The
	entries of stateconductivitylist are of the form {state name,
	conductivity}. The unit of conductivity is picosiemens."

connected::usage = "connected is a symbol denoting nonzero transition
	rate constants between two states in a transition diagram."

repeat::usage = "\"repeat -m\" entered in an input window causes the
	m-th last query to be repeated."

Unprotect[DiagramToQMatrix, connected, repeat]
(* useful if the user reads in this package more than once *)

Begin["`Private`"]


DiagramToQMatrix[diagram_?MatrixQ, stateconductivitylist_List] := Module[
{unorderedPairsHorizontal, unorderedPairsVertical, unorderedPairs,
orderedPairs, stateList, orderedStateNumberPairs, qMatrix, n, k, m,
adjacencyMatrix, g, independentCycles, disjointCycleList,
independentCyclesAsPairs, back, forth, errorCycleNumbers,
errorCycles},
Print[MatrixForm[diagram /. {connected -> "|==|", Null -> " "}]];
unorderedPairsHorizontal =
Map[{diagram[[#[[1]], #[[2]] - 1]], diagram[[#[[1]], #[[2]] + 1]]} &,
Select[Position[diagram, connected], OddQ[#[[1]]] &]];
unorderedPairsVertical =
Map[{Transpose[diagram][[#[[1]], #[[2]] - 1]],
     Transpose[diagram][[#[[1]], #[[2]] + 1]]} &,
Select[Position[Transpose[diagram], connected], OddQ[#[[1]]] &]];
unorderedPairs = Join[unorderedPairsHorizontal, unorderedPairsVertical];
orderedPairs = Flatten[Map[{#, Reverse[#]} &, unorderedPairs], 1];
stateList = Transpose[stateconductivitylist][[1]];
orderedStateNumberPairs = Map[Position[stateList, #][[1, 1]] &,
                              orderedPairs, {2}];
qMatrix = Table[0, {Length[stateList]}, {Length[stateList]}];
n = 1;
While[n <= Length[orderedPairs],
   k = Input[
             "k[" <> ToString[orderedPairs[[n, 1]]] <> ", " <>
                     ToString[orderedPairs[[n, 2]]] <> "] = ?"];

(* has there been a repeat -m statement ? *)

   If[Head[(m = k - repeat)] === Integer &&
      1 <= n + m <= Length[orderedPairs],
      k = Input["repeat: " <>
                "k[" <> ToString[orderedPairs[[n + m, 1]]] <> ", " <>
                        ToString[orderedPairs[[n + m, 2]]] <> "] = ?"];
      qMatrix[[orderedStateNumberPairs[[n + m, 1]],
               orderedStateNumberPairs[[n + m, 2]]]] = k,

(* else *)

      qMatrix[[orderedStateNumberPairs[[n, 1]],
               orderedStateNumberPairs[[n, 2]]]] = k;
      ++n
   ];
]; (* while *)

(* sum up diagonal terms *)

Do[qMatrix[[i, i]] =
   - Sum[qMatrix[[i, j]], {j, 1, Length[stateList]}],
{i, 1, Length[stateList]}];

(* check transition rate products in cycles: *)

adjacencyMatrix = Sign[Abs[qMatrix] /. Abs[_] -> 1];
Do[adjacencyMatrix[[i, i]] = 0, {i, Length[adjacencyMatrix]}];
g = Graph[adjacencyMatrix, CircularVertices[Length[adjacencyMatrix]]];

If[!AcyclicQ[g],
   independentCycles = {};
   While[!SameQ[{}, disjointCycleList = ExtractCycles[g]],
         independentCycles = Join[independentCycles,
                                  disjointCycleList];
         Map[(g = DeleteEdge[g, #[[{1, 2}]]]) &,
             disjointCycleList];
   ];
   (* translate cycles into corresponding pairs of states *)
   independentCyclesAsPairs = Map[Partition[#, 2, 1] &,
                                  independentCycles];
   back = Apply[Times, Map[qMatrix[[Sequence @@ #]] &,
                           independentCyclesAsPairs,
                           {2}],
                {1}];
   forth = Apply[Times, Map[qMatrix[[Sequence @@ Reverse[#]]] &,
                            independentCyclesAsPairs,
                            {2}],
                 {1}];
   errorCycleNumbers =
   Flatten[Position[(back - forth) / (back + forth),
                    x_ /; Abs[x] > 0.000001, {1}, Heads -> False]];
                    (* _very_ error prone, I tell you - A.R. *)
   If[!SameQ[{}, errorCycleNumbers],
      errorCycles = independentCycles[[errorCycleNumbers]];
      Print["\nThe cycle(s)"];
      Print[ToString[Map[stateList[[#]] &, errorCycles]]];
      Print["in the reaction diagram contain(s) transition rate constants"];
      Print["that have different products in different directions."];
      Print["Please invoke DiagramToQMatrix[] again"];
      Print["and use the correct rates."];
   ]
];

qMatrix = N[qMatrix]; (* we want qMatrix to be real *)

Print["\nList of transition rates: \n"];
Do[
   Print["k[" <> ToString[orderedPairs[[n, 1]]] <> ", " <>
                 ToString[orderedPairs[[n, 2]]] <> "] = " <>
         ToString[qMatrix[[orderedStateNumberPairs[[n, 1]],
                           orderedStateNumberPairs[[n, 2]]]]] <>
         " ms^-1"],
{n, 1, Length[orderedPairs]}];

Return[qMatrix]
]

End[]

Protect[DiagramToQMatrix, connected, repeat]

EndPackage[]
