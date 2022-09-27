(* :Title: NeuronInterface *)

(* :Author: Arnd Roth
	Abteilung Zellphysiologie
	Max-Planck-Institut fuer Medizinische Forschung
	Postfach 10 38 20, D-69028 Heidelberg, Germany
	email: roth@sunny.mpimf-heidelberg.mpg.de *)

(* :Summary: This package provides two functions, WriteNeuronForm[] and
	WriteDoubleForm[]. They constitute an interface for transferring
	tabulated functions from Mathematica to Neuron and Double. *)

(* :Package Version: 1.1 *)

(* :Copyright: Copyright 1993-94, Max Planck Institute for Medical Research *)

(* :Context: ChannelKinetics`NeuronInterface` *)

(* :History: Version 1.0 by Arnd Roth, April, 1993.
	Version 1.1 by Arnd Roth, December, 1994. *)

(* :Keywords: Neuron (a computer program), reference data file format,
	generalized forcing function, Double (a computer program) *)

(* :Source: Neuron: "A program for simulation of nerve equations with
	branching geometries" by M. Hines, Int. J. of Biomed. Computing 24,
	55-68 (1989). Double: a program for conducting double patch clamp
	experiments by F. Helmchen, Max-Planck-Institut fuer Medizinische
	Forschung. *)

(* :Warning: The "Double" program allows only certain table lengths --
	1024 or 2048 table entries should work, however. In the "Double"
	program, you must correctly set the "sampling rate" and "sweep
	length". Example: you have generated a table of 2048 {time,
	functionvalue} pairs, where time ranges from 0 to 102.35 ms in
	steps of 0.05 ms. In "Double", first set SAMPLING RATE = 0.02 ms,
	and then SWEEP LENGTH = 102.4 ms.
	The Neuron reference data file format is much more flexible. It
	allows any table length, and even the time steps need not be
	constant. *)

(* :Mathematica Version: 2.1 *)

(* :Limitation: none, at least as far as Mathematica is concerned.
	But see :Warning: *)

(* :Discussion: See The Mathematica Book p. 352 ff. for information
	on PaddedForm[] and TableForm[]. These are quite general
	mechanisms for writing tables of numbers. *)

(* set up the package context, included any imports *)


BeginPackage["ChannelKinetics`NeuronInterface`"]

(* usage messages for the exported functions and the context itself *)

NeuronInterface::usage = "NeuronInterface.m is a package that provides
	two functions, WriteNeuronForm[] and WriteDoubleForm[]. They
	constitute an interface for transferring tabulated functions
	from Mathematica to Neuron and Double."

WriteNeuronForm::usage = "WriteNeuronForm[\"filename\", {{time1, value1},
	{time2, value2}, ...}] writes a list of {timei, valuei} pairs to
	filename. It uses a format suitable for the Neuron functions
	force() and stepforce()."

WriteDoubleForm::usage = "WriteDoubleForm[\"filename\", {{time1, value1},
	{time2, value2}, ...}] writes a list of {timei, valuei} pairs to
	filename. It uses a format suitable for the Double program."

Unprotect[WriteNeuronForm, WriteDoubleForm]
(* useful if the user reads in this package more than once *)

Begin["`Private`"]

(* error messages for exported objects *)

NeuronInterface::lpn = "`1` is not a list of pairs of numbers."

(* definition of the exported functions *)


WriteNeuronForm[filename_String, list_List] :=
Module[{stmp},

stmp = OpenWrite[filename, FormatType -> OutputForm];

WriteString[stmp,
            "This file is in Neuron reference data file format.\n",
            "It was generated automatically by Mathematica.\n",
            "Please do not change it manually.\n",
            "Except for this header, each line contains two numbers,\n",
            "time and function value.\n",
            "Date: "];

Write[stmp, Date[]];

Write[stmp,
      PaddedForm[
                 TableForm[N[list],
                           TableSpacing -> {0, 1}],
                 {10, 7}, ExponentFunction -> (Null &)]
];

Close[stmp];
] /; MatrixQ[list] && Last[Dimensions[list]] == 2 ||
     Message[NeuronInterface::lpn, list]


WriteDoubleForm[filename_String, list_List] :=
Module[{stmp},

stmp = OpenWrite[filename, FormatType -> OutputForm];

(* this writes the Double header: *)
(* column width, number of columns, number of rows, 0 *)
Write[stmp,
      PaddedForm[TableForm[{12, 2, Length[list], 0},
                           TableDirections -> {Row},
                           TableSpacing -> {0}],
                 11]
];

WriteString[stmp,
            "        Time     Voltage\n"];

Write[stmp, 
      PaddedForm[
                 TableForm[N[list],
                           TableSpacing -> {0, 0}],
                 {10, 7}, ExponentFunction -> (Null &)]
];

Close[stmp];
] /; MatrixQ[list] && Last[Dimensions[list]] == 2 ||
     Message[NeuronInterface::lpn, list]


End[]   (* end the private context *)

Protect[WriteNeuronForm, WriteDoubleForm]   (* protect exported symbols *)

EndPackage[]   (* end the package context *)
