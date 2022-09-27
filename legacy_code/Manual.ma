(*^

::[	Information =

	"This is a Mathematica Notebook file.  It contains ASCII text, and can be
	transferred by email, ftp, or other text-file transfer utility.  It should
	be read or edited using a copy of Mathematica or MathReader.  If you 
	received this as email, use your mail application or copy/paste to save 
	everything from the line containing (*^ down to the line containing ^*)
	into a plain text file.  On some systems you may have to give the file a 
	name ending with ".ma" to allow Mathematica to recognize it as a Notebook.
	The line below identifies what version of Mathematica created this file,
	but it can be opened using any other version as well.";

	FrontEndVersion = "X Window System Mathematica Notebook Front End Version 2.2";

	X11StandardFontEncoding; 
	
	fontset = title, inactive, noPageBreakBelow, noPageBreakInGroup, nohscroll, preserveAspect, groupLikeTitle, center, M7, bold, e8,  24, fontName, "times";
	fontset = subtitle, inactive, noPageBreakBelow, noPageBreakInGroup, nohscroll, preserveAspect, groupLikeTitle, center, M7, bold, e6,  18, fontName, "times";
	fontset = subsubtitle, inactive, noPageBreakBelow, noPageBreakInGroup, nohscroll, preserveAspect, groupLikeTitle, center, M7, italic, e6,  14, fontName, "times";
	fontset = section, inactive, noPageBreakBelow, nohscroll, preserveAspect, groupLikeSection, grayBox, M22, bold, a20,  18, fontName, "times";
	fontset = subsection, inactive, noPageBreakBelow, nohscroll, preserveAspect, groupLikeSection, blackBox, M19, bold, a15,  14, fontName, "times";
	fontset = subsubsection, inactive, noPageBreakBelow, nohscroll, preserveAspect, groupLikeSection, whiteBox, M18, bold, a12,  12, fontName, "times";
	fontset = text, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  12, fontName, "times";
	fontset = smalltext, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  10, fontName, "times";
	fontset = input, noPageBreakInGroup, nowordwrap, preserveAspect, groupLikeInput, M42, N23, bold,  12, fontName, "courier";
	fontset = output, output, inactive, noPageBreakInGroup, nowordwrap, preserveAspect, groupLikeOutput, M42, N23, L-5,  12, fontName, "courier";
	fontset = message, inactive, noPageBreakInGroup, nowordwrap, preserveAspect, groupLikeOutput, M42, N23,  12, fontName, "courier";
	fontset = print, inactive, noPageBreakInGroup, nowordwrap, preserveAspect, groupLikeOutput, M42, N23,  12, fontName, "courier";
	fontset = info, inactive, noPageBreakInGroup, nowordwrap, preserveAspect, groupLikeOutput, M42, N23,  12, fontName, "courier";
	fontset = postscript, PostScript, formatAsPostScript, output, inactive, noPageBreakInGroup, nowordwrap, preserveAspect, groupLikeGraphics, M7, l34, w282, h287,  12, fontName, "courier";
	fontset = name, inactive, noPageBreakInGroup, nohscroll, preserveAspect, M7, italic, B65535,  10, fontName, "times";
	fontset = header, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7, italic,  12, fontName, "times";
	fontset = leftheader,  12, fontName, "times";
	fontset = footer, inactive, nohscroll, noKeepOnOnePage, preserveAspect, center, M7, italic,  12, fontName, "times";
	fontset = leftfooter,  12, fontName, "times";
	fontset = help, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  12, fontName, "times";
	fontset = clipboard, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  12, fontName, "times";
	fontset = completions, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  12, fontName, "courier";
	fontset = special1, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  12, fontName, "times";
	fontset = special2, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  12, fontName, "times";
	fontset = special3, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  12, fontName, "times";
	fontset = special4, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  12, fontName, "times";
	fontset = special5, inactive, nohscroll, noKeepOnOnePage, preserveAspect, M7,  12, fontName, "times";paletteColors = 128; automaticGrouping; currentKernel; 
]
:[font = title; inactive; preserveAspect; startGroup]
How to use the ChannelKinetics
Mathematica   Packages
;[s]
5:0,0;15,1;30,2;31,3;42,4;53,-1;
5:1,0,0 ,times,1,24,0,0,0;1,0,0 ,Courier,1,24,0,0,0;1,0,0 ,times,1,24,0,0,0;1,0,0 ,times,3,24,0,0,0;1,0,0 ,times,1,24,0,0,0;
:[font = text; inactive; preserveAspect; center]
Arnd Roth
Abteilung Zellphysiologie
Max-Planck-Institut fuer Medizinische Forschung
Postfach 10 38 20, D-69028 Heidelberg, Germany
roth@sunny.mpimf-heidelberg.mpg.de
:[font = text; inactive; preserveAspect; center]
12.12.1994
:[font = section; inactive; Cclosed; preserveAspect; startGroup]
Summary
:[font = text; inactive; preserveAspect; endGroup]
The ChannelKinetics Mathematica Packages implement parts of "Relaxation and fluctuations of membrane currents that flow through drug-operated channels" by D. Colquhoun & A.G. Hawkes, Proc. R. Soc. Lond. B 199, 231-262 (1977).

DiagramToQMatrix builds Colquhoun's Q-matrix from a transition diagram, prompting for nonzero transition rate constants. It automatically checks cyclic diagrams for microscopical reversibility.


ColquhounHawkes contains various functions for

- computing the occupancy of the different states of a channel using the Runge-Kutta algorithm, which allows for arbitrary transmitter concentration functions of time,

- for plotting the mean current as a function of time,
- its variance, coefficient of variation and third central moment,
- and for computing the 20%-80% risetime of the current.


ColquhounHawkesMC is an analog of ColquhounHawkes based on Monte Carlo simulation of the channel state transitions. It is restricted to square pulse transmitter concentration functions.

Additionally, it contains a function that simulates experiments for determinimg the peak EPSC amplitude distribution for an ensemble of channels. This includes the effects of gaussian lowpass filtering and averaging over a certain interval of time during the peak.

The most recent version of ColquhounHawkesMC, version 1.2, installs and uses some C routines collected in the file "chmc". This file must reside in the same directory as ColquhounHawkesMC, as specified in Appendix A. If this is not possible on certain computer systems, you can install "chmc" manually before you load the package. Alternatively, you might want to change ColquhounHawkesMC's Mathematica code portion that is responsible for installing the C routines. It is located directly below the definition of the error messages for the exported functions.See Appendix B for information on how to build "chmc" on your computer system.
;[s]
31:0,0;4,1;19,2;20,3;31,4;227,5;243,6;423,7;438,8;584,9;637,10;821,11;838,12;855,13;870,14;957,15;1005,16;1301,17;1318,18;1390,19;1394,20;1444,21;1461,22;1561,23;1565,24;1645,25;1662,26;1665,27;1676,28;1882,29;1886,30;1912,-1;
31:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,4,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,4,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = section; inactive; Cclosed; preserveAspect; startGroup]
The Transition Diagram To Q-Matrix Conversion Package: DiagramToQMatrix
;[s]
2:0,0;55,1;71,-1;
2:1,0,0 ,times,1,18,0,0,0;1,0,0 ,Courier,1,18,0,0,0;
:[font = text; inactive; preserveAspect]
This package defines a single function with the same name, DiagramToQMatrix[].
We turn right away to a simple example, because that is the best way to show what DiagramToQMatrix[] does.
;[s]
5:0,0;59,1;77,2;161,3;179,4;185,-1;
5:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = text; inactive; preserveAspect]
This loads the package. (If you type a line like this, do not change spelling, capitalization, nor the "`" character.)
:[font = input; preserveAspect]
<<ChannelKinetics`DiagramToQMatrix`
:[font = text; inactive; preserveAspect]
Prepare the following two expressions that will be used as arguments to DiagramToQMatrix[].
;[s]
3:0,0;72,1;90,2;91,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect]
diagram = { (* must be rectangular *)
            {C1, connected, C2       , connected, O},
            {  ,          , connected,          ,  },
            {  ,          , C3       ,          ,  }
          };

stateConductivityList = { (* conductivity in pS *)
                          {C1, 0},
                          {C2, 0},
                          {C3, 0},
                          {O,  8}
                        };
:[font = text; inactive; preserveAspect]
Now we call DiagramToQMatrix[] on them and assign the resulting Q-matrix to be the value of q. DiagramToQMatrix[] prompts you for the nonzero transition rates. By convention, their unit is ms^-1, and concentration-dependent rates contain a factor c[t].
The following prompts and user input lines occurred during execution of the example below:

          k[C1, C2] = ? 100000 c[t]
          k[C2, C1] = ? 50
          k[C2, O] = ?  10
          k[O, C2] = ?  0.5
          k[C2, C3] = ? 4
          k[C3, C2] = ? 0.02
;[s]
30:0,0;12,1;30,2;92,3;93,4;95,5;113,6;247,7;251,8;267,9;274,10;279,11;295,12;345,13;369,14;380,15;381,16;405,17;407,18;408,19;432,20;434,21;435,22;459,23;462,24;463,25;487,26;488,27;489,28;513,29;517,-1;
30:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,3,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;
:[font = input; preserveAspect; startGroup]
q = DiagramToQMatrix[diagram, stateConductivityList]
:[font = print; inactive; preserveAspect]
C1     |==|   C2     |==|   O

              |==|           

              C3             

List of transition rates: 

k[C1, C2] = 100000. c[t] ms^-1
k[C2, C1] = 50. ms^-1
k[C2, O] = 10. ms^-1
k[O, C2] = 0.5 ms^-1
k[C2, C3] = 4. ms^-1
k[C3, C2] = 0.02 ms^-1
:[font = output; output; inactive; preserveAspect; endGroup]
{{-100000.*c[t], 100000.*c[t], 0, 0}, 
  {50., -64., 4., 10.}, 
  {0, 0.02, -0.02, 0}, 
  {0, 0.5, 0, -0.5}}
;[o]
{{-100000. c[t], 100000. c[t], 0, 0}, 
 
  {50., -64., 4., 10.}, 
 
  {0, 0.02, -0.02, 0}, 
 
  {0, 0.5, 0, -0.5}}
:[font = text; inactive; preserveAspect]

Now we can always refer to this Q-matrix as q.
;[s]
3:0,0;45,1;46,2;47,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
q
:[font = output; output; inactive; preserveAspect; endGroup]
{{-100000.*c[t], 100000.*c[t], 0, 0}, 
  {50., -64., 4., 10.}, 
  {0, 0.02, -0.02, 0}, 
  {0, 0.5, 0, -0.5}}
;[o]
{{-100000. c[t], 100000. c[t], 0, 0}, 
 
  {50., -64., 4., 10.}, 
 
  {0, 0.02, -0.02, 0}, 
 
  {0, 0.5, 0, -0.5}}
:[font = text; inactive; preserveAspect]
For example, it might be convenient to display it with its entries nicely arranged in a rectangular array.
:[font = input; preserveAspect; startGroup]
MatrixForm[q]
:[font = output; output; inactive; preserveAspect; endGroup]
MatrixForm[{{-100000.*c[t], 100000.*c[t], 0, 0}, {50., -64., 4., 10.}, 
   {0, 0.02, -0.02, 0}, {0, 0.5, 0, -0.5}}]
;[o]
-100000. c[t]   100000. c[t]    0               0

50.             -64.            4.              10.

0               0.02            -0.02           0

0               0.5             0               -0.5
:[font = text; inactive; preserveAspect]
Often there will be several different calculations that use the same Q-matrix. If we store q in its input form, we can reuse it later simply by evaluating this input form, without rebuilding it from the transition diagram, reentering all the rates by hand. Also, the DiagramToQMatrix package is not needed in this case.
We accomplish this by invoking InputForm[] and changing the "cell style" of the result from output to input (in the Style/Cell Style menu). One might also rearrange the terms a bit and prepend a q = to the matrix.
;[s]
11:0,0;91,1;92,2;267,3;283,4;351,5;362,6;436,7;452,8;515,9;518,10;533,-1;
11:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,4,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
InputForm[q]
:[font = output; output; inactive; preserveAspect; fontLeading = 0; endGroup]
InputForm[{{-100000.*c[t], 
    100000.*c[t], 0, 0}, 
   {50., -64., 4., 10.}, 
   {0, 0.02, -0.02, 0}, 
   {0, 0.5, 0, -0.5}}]
;[o]
{{-100000.*c[t], 100000.*c[t], 0, 0}, 
  {50., -64., 4., 10.}, 
  {0, 0.02, -0.02, 0}, 
  {0, 0.5, 0, -0.5}}
:[font = input; preserveAspect; fontLeading = 0]
q = {
      {-100000.*c[t], 100000.*c[t], 0, 0}, 
      {50., -64., 4., 10.}, 
      {0, 0.02, -0.02, 0}, 
      {0, 0.5, 0, -0.5}
    }; (* c[t] in M *)
:[font = text; inactive; preserveAspect]
For more information on the structure of the arguments that are passed to DiagramToQMatrix[], type
;[s]
3:0,0;74,1;92,2;98,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
?DiagramToQMatrix
:[font = info; inactive; preserveAspect; endGroup]
DiagramToQMatrix[diagram, stateconductivitylist]
   builds Colquhoun's Q-matrix from a transition
   diagram, prompting for nonzero transition rates.
   Their unit is (ms^-1). Concentration dependent
   rates must have a symbolic factor c[t] in them.
   The command "repeat -m" entered in an input
   window causes the mth-last query to be repeated.
   Diagram format requrements: the entries
   diagram[[i, j]] may be 
(1) state name for i odd and j odd, 
(2) connected for i odd xor j odd, 
(3) blanks elsewhere. 
   The entries of stateconductivitylist are of the
   form {state name, conductivity}. The unit of
   conductivity is picosiemens.
:[font = text; inactive; preserveAspect; endGroup]
This is a precise but not very readable description, so it might be useful to look at the example diagram above in order to see what it means. The rectangularity of the diagram is essential, i.e., each line must have the same number of commas in it.
:[font = section; inactive; Cclosed; preserveAspect; startGroup]
The Exact Solution Package: ColquhounHawkes
;[s]
3:0,0;28,1;43,2;43,-1;
3:1,0,0 ,times,1,18,0,0,0;1,0,0 ,Courier,1,18,0,0,0;1,0,0 ,times,1,18,0,0,0;
:[font = text; inactive; preserveAspect]
This loads the package.
:[font = input; preserveAspect]
<<ChannelKinetics`ColquhounHawkes`
:[font = text; inactive; preserveAspect]
You can get a list of the functions defined in this package by typing
:[font = input; preserveAspect; startGroup]
Help[]
:[font = print; inactive; preserveAspect; endGroup]
The following functions are available: 
      SquarePulseConcentration[t, height, duration] 
      Occupancy[q, initocc, concrule, {t, tmax}] 
      OccupancyPlot[occ, sclist, {t, tmax}] 
      CurrentPlot[occ, sclist, n, u, {t, tmax}] 
      CurrentRisetime[occ, sclist, t] 
      CurrentVariancePlot[occ, sclist, n, u, {t, tmax}] 
      CoefficientOfVariationPlot[occ, sclist, n, u, {t, tmax}] 
      CurrentThirdMomentPlot[occ, sclist, n, u, {t, tmax}] 
      FirstLatencies[q, sclist, initocc, concrule, {t, tmax}] 
      Help[] 
 You can get detailed information on each function by typing 
      ?function 
 followed by SHIFT-RETURN or ENTER. 
 The definition of a function (Mathematica code) is available at 
      ??function 
 followed by SHIFT-RETURN or ENTER, as usual.
:[font = input; preserveAspect; startGroup]
?SquarePulseConcentration
:[font = info; inactive; preserveAspect; endGroup]
SquarePulseConcentration[t, height, duration]
   gives a single square pulse function of t. Its
   value is height (moles per cubic decimeter) for
   0 < t < duration milliseconds and zero
   elsewhere.
:[font = text; inactive; preserveAspect]
We construct a square pulse transmitter concentration function with a pulse length of 1 millisecond and a pulse height of 1 mM. We call it mySquare, for example.
;[s]
3:0,0;139,1;147,2;161,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
mySquare = SquarePulseConcentration[t, 0.001, 1]
:[font = output; output; inactive; preserveAspect; endGroup]
0.0005*(-Sign[-1 + t] + Sign[t])
;[o]
0.0005 (-Sign[-1 + t] + Sign[t])
:[font = text; inactive; preserveAspect]
Copy q and stateConductivityList from the section above, and newly add in an initialOccupancy such that at t = 0, all channels are in state C1.
;[s]
11:0,0;5,1;6,2;11,3;32,4;77,5;93,6;107,7;112,8;140,9;142,10;143,-1;
11:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect]
q = {
      {-100000.*c[t], 100000.*c[t], 0, 0}, 
      {50., -64., 4., 10.}, 
      {0, 0.02, -0.02, 0}, 
      {0, 0.5, 0, -0.5}
    }; (* c[t] in M *)

stateConductivityList = { (* conductivity in pS *)
                          {C1, 0},
                          {C2, 0},
                          {C3, 0},
                          {O,  8}
                        };

initialOccupancy = {1, 0, 0, 0};
:[font = text; inactive; preserveAspect]
The order of the entries of the occupancy vector initialOccupancy corresponds to the order of the entries of stateConductivityList. For example, this setting of initialOccupancy means that the initial occupancy of state C1 is unity, and the occupancies of the states C2, C3 and O are all zero. The same ordering is used for the occupancy vector returned by the Occupancy[] function:
;[s]
17:0,0;49,1;65,2;109,3;130,4;161,5;177,6;220,7;222,8;267,9;269,10;271,11;273,12;278,13;279,14;361,15;372,16;382,-1;
17:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
?Occupancy
:[font = info; inactive; preserveAspect; endGroup]
Occupancy[q, initocc, concrule, {t, tmax}]
   computes the solution of the equation p'[t] ==
   Transpose[q /. concrule] . p[t] subject to p[0]
   == initocc using an adaptive stepsize
   Runge-Kutta algorithm, from 0 to tmax
   milliseconds. Concentration dependent entries
   of q are assumed to have a symbolic factor c[t]
   in them, therefore concrule must be of the form
   c[t] -> conc[t].
:[font = text; inactive; preserveAspect]
The actual computation of the occupancies as a function of time is done by this function.
:[font = input; preserveAspect]
myOcc = Occupancy[
q, initialOccupancy, c[t] -> mySquare, {t, 10.1}];
:[font = text; inactive; preserveAspect]
The resulting occupancy vector is represented by InterpolatingFunction[] objects. They provide a spline interpolation of the occupancies of the states of the channel in the time range they have been computed in (here, from 0 to 10.1 milliseconds). The advantage of this approach is that for a given Q-matrix and transmitter concentration time course, the occupancy equation has to be solved only once, while several (occupancy, current, variance, c.v. etc.) plots can be generated from it. This can save a lot of time. Furthermore, since the solution is stored in a standard Mathematica format, it can be conveniently accessed for further analysis beyond the plots. As a simple example, we check for the initial conditions to be satisfied:
;[s]
7:0,0;49,1;72,2;355,3;400,4;575,5;586,6;739,-1;
7:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,4,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
initialOccupancy == Chop[myOcc /. t -> 0]
:[font = output; output; inactive; preserveAspect; endGroup]
True
;[o]
True
:[font = text; inactive; preserveAspect]
We now proceed to generating some plots from myOcc. First, the occupancies of the different states themselves.
;[s]
3:0,0;45,1;50,2;110,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
?OccupancyPlot
:[font = info; inactive; preserveAspect; endGroup]
OccupancyPlot[occ, sclist, {t, tmax}] plots the
   entries of the vector occ (function of t, as
   returned from the Occupancy[] function),
   labeling them according to sclist (whose
   entries have the form {state name,
   conductivity}; conductivity in picosiemens),
   from 0 to tmax milliseconds.
:[font = text; inactive; preserveAspect]
This makes a color plot.
:[font = input; preserveAspect; startGroup]
OccupancyPlot[myOcc, stateConductivityList,
              {t, 10}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 0; pictureWidth = 450; pictureHeight = 194]
%!
%%Creator: Mathematica
%%AspectRatio: .43371 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.357978 0.334169 0.216854 0.334169 [
[ 0 0 0 0 ]
[ 1 .43371 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
P
p
% Start of sub-graphic
p
0.0238095 0.0103264 0.692147 0.423382 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.0952381 0.00605916 0.605916 [
[(2)] .21429 .00606 0 2 Msboxa
[(4)] .40476 .00606 0 2 Msboxa
[(6)] .59524 .00606 0 2 Msboxa
[(8)] .78571 .00606 0 2 Msboxa
[(10)] .97619 .00606 0 2 Msboxa
[(t/ms)] 1.025 .00606 -1 0 Msboxa
[(Occupancy)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(0.2)] .01131 .12724 1 0 Msboxa
[(0.4)] .01131 .24843 1 0 Msboxa
[(0.6)] .01131 .36961 1 0 Msboxa
[(0.8)] .01131 .49079 1 0 Msboxa
[(1)] .01131 .61197 1 0 Msboxa
[(p[i])] .02381 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
p
.002 w
.21429 .00606 m
.21429 .01231 L
s
P
[(2)] .21429 .00606 0 2 Mshowa
p
.002 w
.40476 .00606 m
.40476 .01231 L
s
P
[(4)] .40476 .00606 0 2 Mshowa
p
.002 w
.59524 .00606 m
.59524 .01231 L
s
P
[(6)] .59524 .00606 0 2 Mshowa
p
.002 w
.78571 .00606 m
.78571 .01231 L
s
P
[(8)] .78571 .00606 0 2 Mshowa
p
.002 w
.97619 .00606 m
.97619 .01231 L
s
P
[(10)] .97619 .00606 0 2 Mshowa
p
.001 w
.0619 .00606 m
.0619 .00981 L
s
P
p
.001 w
.1 .00606 m
.1 .00981 L
s
P
p
.001 w
.1381 .00606 m
.1381 .00981 L
s
P
p
.001 w
.17619 .00606 m
.17619 .00981 L
s
P
p
.001 w
.25238 .00606 m
.25238 .00981 L
s
P
p
.001 w
.29048 .00606 m
.29048 .00981 L
s
P
p
.001 w
.32857 .00606 m
.32857 .00981 L
s
P
p
.001 w
.36667 .00606 m
.36667 .00981 L
s
P
p
.001 w
.44286 .00606 m
.44286 .00981 L
s
P
p
.001 w
.48095 .00606 m
.48095 .00981 L
s
P
p
.001 w
.51905 .00606 m
.51905 .00981 L
s
P
p
.001 w
.55714 .00606 m
.55714 .00981 L
s
P
p
.001 w
.63333 .00606 m
.63333 .00981 L
s
P
p
.001 w
.67143 .00606 m
.67143 .00981 L
s
P
p
.001 w
.70952 .00606 m
.70952 .00981 L
s
P
p
.001 w
.74762 .00606 m
.74762 .00981 L
s
P
p
.001 w
.82381 .00606 m
.82381 .00981 L
s
P
p
.001 w
.8619 .00606 m
.8619 .00981 L
s
P
p
.001 w
.9 .00606 m
.9 .00981 L
s
P
p
.001 w
.9381 .00606 m
.9381 .00981 L
s
P
[(t/ms)] 1.025 .00606 -1 0 Mshowa
p
.002 w
0 .00606 m
1 .00606 L
s
P
[(Occupancy)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .12724 m
.03006 .12724 L
s
P
[(0.2)] .01131 .12724 1 0 Mshowa
p
.002 w
.02381 .24843 m
.03006 .24843 L
s
P
[(0.4)] .01131 .24843 1 0 Mshowa
p
.002 w
.02381 .36961 m
.03006 .36961 L
s
P
[(0.6)] .01131 .36961 1 0 Mshowa
p
.002 w
.02381 .49079 m
.03006 .49079 L
s
P
[(0.8)] .01131 .49079 1 0 Mshowa
p
.002 w
.02381 .61197 m
.03006 .61197 L
s
P
[(1)] .01131 .61197 1 0 Mshowa
p
.001 w
.02381 .0303 m
.02756 .0303 L
s
P
p
.001 w
.02381 .05453 m
.02756 .05453 L
s
P
p
.001 w
.02381 .07877 m
.02756 .07877 L
s
P
p
.001 w
.02381 .10301 m
.02756 .10301 L
s
P
p
.001 w
.02381 .15148 m
.02756 .15148 L
s
P
p
.001 w
.02381 .17572 m
.02756 .17572 L
s
P
p
.001 w
.02381 .19995 m
.02756 .19995 L
s
P
p
.001 w
.02381 .22419 m
.02756 .22419 L
s
P
p
.001 w
.02381 .27266 m
.02756 .27266 L
s
P
p
.001 w
.02381 .2969 m
.02756 .2969 L
s
P
p
.001 w
.02381 .32114 m
.02756 .32114 L
s
P
p
.001 w
.02381 .34537 m
.02756 .34537 L
s
P
p
.001 w
.02381 .39385 m
.02756 .39385 L
s
P
p
.001 w
.02381 .41808 m
.02756 .41808 L
s
P
p
.001 w
.02381 .44232 m
.02756 .44232 L
s
P
p
.001 w
.02381 .46656 m
.02756 .46656 L
s
P
p
.001 w
.02381 .51503 m
.02756 .51503 L
s
P
p
.001 w
.02381 .53926 m
.02756 .53926 L
s
P
p
.001 w
.02381 .5635 m
.02756 .5635 L
s
P
p
.001 w
.02381 .58774 m
.02756 .58774 L
s
P
[(p[i])] .02381 .61803 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
p
p
.004 w
.02381 .00606 m
.02505 .35886 L
.02629 .42486 L
.02753 .45052 L
.02877 .4689 L
.03125 .49837 L
.03373 .52137 L
.03621 .53938 L
.03869 .55349 L
.04117 .56456 L
.04365 .57323 L
.04613 .58002 L
.04861 .58535 L
.05109 .58951 L
.05357 .59279 L
.05605 .59536 L
.05853 .59737 L
.06101 .59896 L
.06349 .60018 L
.06597 .60114 L
.06845 .60191 L
.07093 .60252 L
.07341 .603 L
.07589 .60339 L
.07837 .6037 L
.08333 .60414 L
.08581 .6043 L
.08829 .60442 L
.09077 .60453 L
.09325 .60462 L
.09821 .60476 L
.10317 .60486 L
.1131 .60501 L
.11558 .60504 L
.11682 .60505 L
.11806 .60507 L
.12054 .59743 L
.12178 .59374 L
.12302 .59106 L
.1255 .58677 L
.12798 .58291 L
.13294 .57546 L
.14286 .56107 L
.18254 .5092 L
.22222 .46545 L
.2619 .42849 L
.30159 .39718 L
.34127 .37061 L
.38095 .34803 L
.42063 .32882 L
Mistroke
.46032 .31243 L
.5 .29842 L
.53968 .28638 L
.57937 .27602 L
.61905 .26705 L
.65873 .25926 L
.69841 .25246 L
.7381 .2465 L
.77778 .24125 L
.81746 .23658 L
.85714 .23242 L
.89683 .22867 L
.93651 .22528 L
.97619 .22218 L
Mfstroke
P
P
p
1 0 0 r
p
.004 w
.02381 .61197 m
.02505 .25918 L
.02629 .19318 L
.02753 .16751 L
.02877 .14914 L
.03125 .11966 L
.03373 .09666 L
.03621 .07866 L
.03869 .06454 L
.04117 .05347 L
.04365 .0448 L
.04613 .03801 L
.04861 .03268 L
.05109 .02853 L
.05357 .02524 L
.05605 .02268 L
.05853 .02067 L
.06101 .01908 L
.06349 .01785 L
.06597 .01689 L
.06845 .01613 L
.07093 .01552 L
.07341 .01503 L
.07589 .01465 L
.07837 .01434 L
.08333 .0139 L
.08581 .01374 L
.08829 .01361 L
.09077 .0135 L
.09325 .01341 L
.09821 .01328 L
.10317 .01317 L
.1131 .01302 L
.11558 .01299 L
.11682 .01298 L
.11806 .01297 L
.12054 .0206 L
.12178 .02429 L
.12302 .02697 L
.1255 .03126 L
.12798 .03512 L
.13294 .04257 L
.14286 .05696 L
.18254 .10883 L
.22222 .15259 L
.2619 .18955 L
.30159 .22085 L
.34127 .24742 L
.38095 .27 L
.42063 .28922 L
Mistroke
.46032 .3056 L
.5 .31962 L
.53968 .33165 L
.57937 .34202 L
.61905 .35099 L
.65873 .35878 L
.69841 .36557 L
.7381 .37153 L
.77778 .37679 L
.81746 .38145 L
.85714 .38562 L
.89683 .38936 L
.93651 .39275 L
.97619 .39585 L
Mfstroke
P
P
p
.5 1 0 r
p
.004 w
.02381 .00606 m
.02505 .32004 L
.02629 .32718 L
.02877 .26644 L
.03125 .21335 L
.03373 .17169 L
.03621 .13904 L
.03869 .11345 L
.04117 .09338 L
.04365 .07766 L
.04613 .06536 L
.04861 .0557 L
.05109 .04811 L
.05357 .04221 L
.05605 .03755 L
.05853 .03391 L
.06101 .03107 L
.06349 .02885 L
.06597 .02707 L
.06845 .02566 L
.07093 .02455 L
.07341 .02367 L
.07589 .02297 L
.07837 .02241 L
.08333 .0216 L
.08581 .0213 L
.08829 .02107 L
.09077 .02087 L
.09325 .0207 L
.09821 .02044 L
.10317 .02025 L
.1131 .01997 L
.11558 .01991 L
.11682 .01988 L
.11806 .01985 L
.1193 .01816 L
.12054 .013 L
.12178 .01074 L
.12302 .00975 L
.12426 .0093 L
.1255 .00911 L
.12674 .00902 L
.12798 .00897 L
.12922 .00894 L
.13046 .00892 L
.13294 .00888 L
.14286 .00876 L
.15278 .00865 L
.1627 .00854 L
.18254 .00834 L
Mistroke
.22222 .00799 L
.2619 .00769 L
.30159 .00744 L
.34127 .00723 L
.38095 .00706 L
.42063 .00691 L
.46032 .00679 L
.5 .00668 L
.53968 .00659 L
.57937 .00652 L
.61905 .00646 L
.65873 .00641 L
.69841 .00636 L
.7381 .00633 L
.77778 .0063 L
.81746 .00627 L
.85714 .00625 L
.89683 .00623 L
.93651 .00621 L
.97619 .0062 L
Mfstroke
P
P
p
0 1 1 r
p
.004 w
.02381 .00606 m
.02877 .0644 L
.03125 .08861 L
.03373 .10789 L
.03869 .13572 L
.04117 .14576 L
.04365 .15394 L
.04861 .16624 L
.05357 .17489 L
.05853 .18131 L
.06349 .18633 L
.08333 .2006 L
.10317 .21201 L
.1131 .21742 L
.11558 .21876 L
.11806 .22008 L
.1193 .22074 L
.12054 .22116 L
.12178 .2214 L
.12302 .22155 L
.13294 .22235 L
.14286 .22305 L
.18254 .22538 L
.20238 .22629 L
.22222 .22705 L
.24206 .22767 L
.2619 .22816 L
.28175 .22854 L
.29167 .22869 L
.30159 .22881 L
.31151 .22891 L
.32143 .22899 L
.32639 .22902 L
.33135 .22904 L
.33631 .22906 L
.33879 .22907 L
.34127 .22908 L
.34375 .22908 L
.34623 .22909 L
.34747 .22909 L
.34871 .22909 L
.34995 .22909 L
.35119 .22909 L
.35243 .22909 L
.35367 .22909 L
.35491 .22909 L
.35615 .22909 L
.35739 .22909 L
.35863 .22909 L
.36111 .22909 L
Mistroke
.36359 .22908 L
.36607 .22908 L
.37103 .22907 L
.37599 .22905 L
.38095 .22903 L
.39087 .22897 L
.40079 .2289 L
.42063 .22871 L
.44048 .22846 L
.46032 .22816 L
.5 .22744 L
.53968 .22656 L
.57937 .22555 L
.61905 .22445 L
.65873 .22326 L
.69841 .22199 L
.7381 .22068 L
.77778 .21931 L
.81746 .21792 L
.85714 .21649 L
.89683 .21504 L
.93651 .21358 L
.97619 .2121 L
Mfstroke
P
P
p
.5 0 1 r
p
.004 w
.02381 .00606 m
.02877 .15018 L
.03125 .20854 L
.03373 .25391 L
.03621 .28914 L
.03869 .31644 L
.04117 .33755 L
.04365 .35376 L
.04613 .36613 L
.04861 .37554 L
.05109 .3826 L
.05357 .38781 L
.05481 .38986 L
.05605 .3916 L
.05729 .39306 L
.05853 .39427 L
.05977 .39525 L
.06101 .39605 L
.06225 .39666 L
.06349 .39712 L
.06473 .39747 L
.06597 .39769 L
.06721 .39781 L
.06845 .39785 L
.06969 .39781 L
.07093 .39769 L
.07217 .39751 L
.07341 .39728 L
.07589 .39668 L
.07837 .39591 L
.08333 .39405 L
.09325 .3896 L
.10317 .38472 L
.1131 .37974 L
.11558 .37849 L
.11682 .37787 L
.11806 .37725 L
.1193 .37661 L
.12054 .37539 L
.12178 .37373 L
.12302 .37188 L
.14286 .34137 L
.18254 .2876 L
.22222 .24253 L
.2619 .20475 L
.30159 .17305 L
.34127 .14642 L
.38095 .12407 L
.42063 .10532 L
.46032 .0896 L
Mistroke
.5 .07642 L
.53968 .06535 L
.57937 .05606 L
.61905 .04826 L
.65873 .04171 L
.69841 .03622 L
.7381 .03162 L
.77778 .02775 L
.81746 .02451 L
.85714 .02179 L
.89683 .01952 L
.93651 .01761 L
.97619 .016 L
Mfstroke
P
P
P
MathSubEnd
P
% End of sub-graphic
p
p
.70886 .06648 m
.70886 .33381 L
.97619 .33381 L
.97619 .06648 L
F
1 g
.69215 .08319 m
.69215 .35052 L
.95948 .35052 L
.95948 .08319 L
F
0 g
.001 w
.69215 .08319 m
.95948 .08319 L
.95948 .35052 L
.69215 .35052 L
.69215 .08319 L
s
% Start of sub-graphic
p
0.692147 0.0831865 0.959482 0.350522 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0297619 0.297619 0.0166667 0.166667 [
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 1 L
0 1 L
closepath
clip
newpath
p
p
p
% Start of sub-graphic
p
0.0535714 0.03 0.35119 0.196667 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
.5 0 1 r
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[O])] .38988 .11333 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.223333 0.35119 0.39 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
0 1 1 r
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[C3])] .38988 .30667 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.416667 0.35119 0.583333 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
.5 1 0 r
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[C2])] .38988 .5 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.61 0.35119 0.776667 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
1 0 0 r
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[C1])] .38988 .69333 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.803333 0.35119 0.97 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(1 - p[C1])] .38988 .88667 -1 0 Mshowa
P
P
p
P
P
MathSubEnd
P
% End of sub-graphic
P
P
P
0 0 m
1 0 L
1 .43371 L
0 .43371 L
closepath
clip
newpath
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; preserveAspect; endGroup]
The Unformatted text for this cell was not generated.
Use options in the Actions Preferences dialog box to 
control when Unformatted text is generated.
;[o]
-Graphics-
:[font = text; inactive; preserveAspect]
The color plot looks nice on the screen, but on a black-and-white printer, dashed lines might be easier to distinguish. The dashing definition is given as an option to OccupancyPlot[]:
;[s]
3:0,0;168,1;183,2;184,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
printerOption =
PlotStyle -> {
               {},
               {Dashing[{0.05, 0.05}]},
               {Dashing[{0.01, 0.01}]},
               {Dashing[{0.01, 0.05}]},
               {Dashing[{0.01, 0.02, 0.05, 0.02}]}
             };

OccupancyPlot[myOcc, stateConductivityList,
              {t, 10}, printerOption]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 0; pictureWidth = 450; pictureHeight = 194]
%!
%%Creator: Mathematica
%%AspectRatio: .43371 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.357978 0.334169 0.216854 0.334169 [
[ 0 0 0 0 ]
[ 1 .43371 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
P
p
% Start of sub-graphic
p
0.0238095 0.0103264 0.692147 0.423382 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.0952381 0.00605916 0.605916 [
[(2)] .21429 .00606 0 2 Msboxa
[(4)] .40476 .00606 0 2 Msboxa
[(6)] .59524 .00606 0 2 Msboxa
[(8)] .78571 .00606 0 2 Msboxa
[(10)] .97619 .00606 0 2 Msboxa
[(t/ms)] 1.025 .00606 -1 0 Msboxa
[(Occupancy)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(0.2)] .01131 .12724 1 0 Msboxa
[(0.4)] .01131 .24843 1 0 Msboxa
[(0.6)] .01131 .36961 1 0 Msboxa
[(0.8)] .01131 .49079 1 0 Msboxa
[(1)] .01131 .61197 1 0 Msboxa
[(p[i])] .02381 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
p
.002 w
.21429 .00606 m
.21429 .01231 L
s
P
[(2)] .21429 .00606 0 2 Mshowa
p
.002 w
.40476 .00606 m
.40476 .01231 L
s
P
[(4)] .40476 .00606 0 2 Mshowa
p
.002 w
.59524 .00606 m
.59524 .01231 L
s
P
[(6)] .59524 .00606 0 2 Mshowa
p
.002 w
.78571 .00606 m
.78571 .01231 L
s
P
[(8)] .78571 .00606 0 2 Mshowa
p
.002 w
.97619 .00606 m
.97619 .01231 L
s
P
[(10)] .97619 .00606 0 2 Mshowa
p
.001 w
.0619 .00606 m
.0619 .00981 L
s
P
p
.001 w
.1 .00606 m
.1 .00981 L
s
P
p
.001 w
.1381 .00606 m
.1381 .00981 L
s
P
p
.001 w
.17619 .00606 m
.17619 .00981 L
s
P
p
.001 w
.25238 .00606 m
.25238 .00981 L
s
P
p
.001 w
.29048 .00606 m
.29048 .00981 L
s
P
p
.001 w
.32857 .00606 m
.32857 .00981 L
s
P
p
.001 w
.36667 .00606 m
.36667 .00981 L
s
P
p
.001 w
.44286 .00606 m
.44286 .00981 L
s
P
p
.001 w
.48095 .00606 m
.48095 .00981 L
s
P
p
.001 w
.51905 .00606 m
.51905 .00981 L
s
P
p
.001 w
.55714 .00606 m
.55714 .00981 L
s
P
p
.001 w
.63333 .00606 m
.63333 .00981 L
s
P
p
.001 w
.67143 .00606 m
.67143 .00981 L
s
P
p
.001 w
.70952 .00606 m
.70952 .00981 L
s
P
p
.001 w
.74762 .00606 m
.74762 .00981 L
s
P
p
.001 w
.82381 .00606 m
.82381 .00981 L
s
P
p
.001 w
.8619 .00606 m
.8619 .00981 L
s
P
p
.001 w
.9 .00606 m
.9 .00981 L
s
P
p
.001 w
.9381 .00606 m
.9381 .00981 L
s
P
[(t/ms)] 1.025 .00606 -1 0 Mshowa
p
.002 w
0 .00606 m
1 .00606 L
s
P
[(Occupancy)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .12724 m
.03006 .12724 L
s
P
[(0.2)] .01131 .12724 1 0 Mshowa
p
.002 w
.02381 .24843 m
.03006 .24843 L
s
P
[(0.4)] .01131 .24843 1 0 Mshowa
p
.002 w
.02381 .36961 m
.03006 .36961 L
s
P
[(0.6)] .01131 .36961 1 0 Mshowa
p
.002 w
.02381 .49079 m
.03006 .49079 L
s
P
[(0.8)] .01131 .49079 1 0 Mshowa
p
.002 w
.02381 .61197 m
.03006 .61197 L
s
P
[(1)] .01131 .61197 1 0 Mshowa
p
.001 w
.02381 .0303 m
.02756 .0303 L
s
P
p
.001 w
.02381 .05453 m
.02756 .05453 L
s
P
p
.001 w
.02381 .07877 m
.02756 .07877 L
s
P
p
.001 w
.02381 .10301 m
.02756 .10301 L
s
P
p
.001 w
.02381 .15148 m
.02756 .15148 L
s
P
p
.001 w
.02381 .17572 m
.02756 .17572 L
s
P
p
.001 w
.02381 .19995 m
.02756 .19995 L
s
P
p
.001 w
.02381 .22419 m
.02756 .22419 L
s
P
p
.001 w
.02381 .27266 m
.02756 .27266 L
s
P
p
.001 w
.02381 .2969 m
.02756 .2969 L
s
P
p
.001 w
.02381 .32114 m
.02756 .32114 L
s
P
p
.001 w
.02381 .34537 m
.02756 .34537 L
s
P
p
.001 w
.02381 .39385 m
.02756 .39385 L
s
P
p
.001 w
.02381 .41808 m
.02756 .41808 L
s
P
p
.001 w
.02381 .44232 m
.02756 .44232 L
s
P
p
.001 w
.02381 .46656 m
.02756 .46656 L
s
P
p
.001 w
.02381 .51503 m
.02756 .51503 L
s
P
p
.001 w
.02381 .53926 m
.02756 .53926 L
s
P
p
.001 w
.02381 .5635 m
.02756 .5635 L
s
P
p
.001 w
.02381 .58774 m
.02756 .58774 L
s
P
[(p[i])] .02381 .61803 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
p
p
.004 w
.02381 .00606 m
.02505 .35886 L
.02629 .42486 L
.02753 .45052 L
.02877 .4689 L
.03125 .49837 L
.03373 .52137 L
.03621 .53938 L
.03869 .55349 L
.04117 .56456 L
.04365 .57323 L
.04613 .58002 L
.04861 .58535 L
.05109 .58951 L
.05357 .59279 L
.05605 .59536 L
.05853 .59737 L
.06101 .59896 L
.06349 .60018 L
.06597 .60114 L
.06845 .60191 L
.07093 .60252 L
.07341 .603 L
.07589 .60339 L
.07837 .6037 L
.08333 .60414 L
.08581 .6043 L
.08829 .60442 L
.09077 .60453 L
.09325 .60462 L
.09821 .60476 L
.10317 .60486 L
.1131 .60501 L
.11558 .60504 L
.11682 .60505 L
.11806 .60507 L
.12054 .59743 L
.12178 .59374 L
.12302 .59106 L
.1255 .58677 L
.12798 .58291 L
.13294 .57546 L
.14286 .56107 L
.18254 .5092 L
.22222 .46545 L
.2619 .42849 L
.30159 .39718 L
.34127 .37061 L
.38095 .34803 L
.42063 .32882 L
Mistroke
.46032 .31243 L
.5 .29842 L
.53968 .28638 L
.57937 .27602 L
.61905 .26705 L
.65873 .25926 L
.69841 .25246 L
.7381 .2465 L
.77778 .24125 L
.81746 .23658 L
.85714 .23242 L
.89683 .22867 L
.93651 .22528 L
.97619 .22218 L
Mfstroke
P
P
p
[ .05 .05 ] 0 setdash
p
.004 w
.02381 .61197 m
.02505 .25918 L
.02629 .19318 L
.02753 .16751 L
.02877 .14914 L
.03125 .11966 L
.03373 .09666 L
.03621 .07866 L
.03869 .06454 L
.04117 .05347 L
.04365 .0448 L
.04613 .03801 L
.04861 .03268 L
.05109 .02853 L
.05357 .02524 L
.05605 .02268 L
.05853 .02067 L
.06101 .01908 L
.06349 .01785 L
.06597 .01689 L
.06845 .01613 L
.07093 .01552 L
.07341 .01503 L
.07589 .01465 L
.07837 .01434 L
.08333 .0139 L
.08581 .01374 L
.08829 .01361 L
.09077 .0135 L
.09325 .01341 L
.09821 .01328 L
.10317 .01317 L
.1131 .01302 L
.11558 .01299 L
.11682 .01298 L
.11806 .01297 L
.12054 .0206 L
.12178 .02429 L
.12302 .02697 L
.1255 .03126 L
.12798 .03512 L
.13294 .04257 L
.14286 .05696 L
.18254 .10883 L
.22222 .15259 L
.2619 .18955 L
.30159 .22085 L
.34127 .24742 L
.38095 .27 L
.42063 .28922 L
Mistroke
.46032 .3056 L
.5 .31962 L
.53968 .33165 L
.57937 .34202 L
.61905 .35099 L
.65873 .35878 L
.69841 .36557 L
.7381 .37153 L
.77778 .37679 L
.81746 .38145 L
.85714 .38562 L
.89683 .38936 L
.93651 .39275 L
.97619 .39585 L
Mfstroke
P
P
p
[ .01 .01 ] 0 setdash
p
.004 w
.02381 .00606 m
.02505 .32004 L
.02629 .32718 L
.02877 .26644 L
.03125 .21335 L
.03373 .17169 L
.03621 .13904 L
.03869 .11345 L
.04117 .09338 L
.04365 .07766 L
.04613 .06536 L
.04861 .0557 L
.05109 .04811 L
.05357 .04221 L
.05605 .03755 L
.05853 .03391 L
.06101 .03107 L
.06349 .02885 L
.06597 .02707 L
.06845 .02566 L
.07093 .02455 L
.07341 .02367 L
.07589 .02297 L
.07837 .02241 L
.08333 .0216 L
.08581 .0213 L
.08829 .02107 L
.09077 .02087 L
.09325 .0207 L
.09821 .02044 L
.10317 .02025 L
.1131 .01997 L
.11558 .01991 L
.11682 .01988 L
.11806 .01985 L
.1193 .01816 L
.12054 .013 L
.12178 .01074 L
.12302 .00975 L
.12426 .0093 L
.1255 .00911 L
.12674 .00902 L
.12798 .00897 L
.12922 .00894 L
.13046 .00892 L
.13294 .00888 L
.14286 .00876 L
.15278 .00865 L
.1627 .00854 L
.18254 .00834 L
Mistroke
.22222 .00799 L
.2619 .00769 L
.30159 .00744 L
.34127 .00723 L
.38095 .00706 L
.42063 .00691 L
.46032 .00679 L
.5 .00668 L
.53968 .00659 L
.57937 .00652 L
.61905 .00646 L
.65873 .00641 L
.69841 .00636 L
.7381 .00633 L
.77778 .0063 L
.81746 .00627 L
.85714 .00625 L
.89683 .00623 L
.93651 .00621 L
.97619 .0062 L
Mfstroke
P
P
p
[ .01 .05 ] 0 setdash
p
.004 w
.02381 .00606 m
.02877 .0644 L
.03125 .08861 L
.03373 .10789 L
.03869 .13572 L
.04117 .14576 L
.04365 .15394 L
.04861 .16624 L
.05357 .17489 L
.05853 .18131 L
.06349 .18633 L
.08333 .2006 L
.10317 .21201 L
.1131 .21742 L
.11558 .21876 L
.11806 .22008 L
.1193 .22074 L
.12054 .22116 L
.12178 .2214 L
.12302 .22155 L
.13294 .22235 L
.14286 .22305 L
.18254 .22538 L
.20238 .22629 L
.22222 .22705 L
.24206 .22767 L
.2619 .22816 L
.28175 .22854 L
.29167 .22869 L
.30159 .22881 L
.31151 .22891 L
.32143 .22899 L
.32639 .22902 L
.33135 .22904 L
.33631 .22906 L
.33879 .22907 L
.34127 .22908 L
.34375 .22908 L
.34623 .22909 L
.34747 .22909 L
.34871 .22909 L
.34995 .22909 L
.35119 .22909 L
.35243 .22909 L
.35367 .22909 L
.35491 .22909 L
.35615 .22909 L
.35739 .22909 L
.35863 .22909 L
.36111 .22909 L
Mistroke
.36359 .22908 L
.36607 .22908 L
.37103 .22907 L
.37599 .22905 L
.38095 .22903 L
.39087 .22897 L
.40079 .2289 L
.42063 .22871 L
.44048 .22846 L
.46032 .22816 L
.5 .22744 L
.53968 .22656 L
.57937 .22555 L
.61905 .22445 L
.65873 .22326 L
.69841 .22199 L
.7381 .22068 L
.77778 .21931 L
.81746 .21792 L
.85714 .21649 L
.89683 .21504 L
.93651 .21358 L
.97619 .2121 L
Mfstroke
P
P
p
[ .01 .02 .05 .02 ] 0 setdash
p
.004 w
.02381 .00606 m
.02877 .15018 L
.03125 .20854 L
.03373 .25391 L
.03621 .28914 L
.03869 .31644 L
.04117 .33755 L
.04365 .35376 L
.04613 .36613 L
.04861 .37554 L
.05109 .3826 L
.05357 .38781 L
.05481 .38986 L
.05605 .3916 L
.05729 .39306 L
.05853 .39427 L
.05977 .39525 L
.06101 .39605 L
.06225 .39666 L
.06349 .39712 L
.06473 .39747 L
.06597 .39769 L
.06721 .39781 L
.06845 .39785 L
.06969 .39781 L
.07093 .39769 L
.07217 .39751 L
.07341 .39728 L
.07589 .39668 L
.07837 .39591 L
.08333 .39405 L
.09325 .3896 L
.10317 .38472 L
.1131 .37974 L
.11558 .37849 L
.11682 .37787 L
.11806 .37725 L
.1193 .37661 L
.12054 .37539 L
.12178 .37373 L
.12302 .37188 L
.14286 .34137 L
.18254 .2876 L
.22222 .24253 L
.2619 .20475 L
.30159 .17305 L
.34127 .14642 L
.38095 .12407 L
.42063 .10532 L
.46032 .0896 L
Mistroke
.5 .07642 L
.53968 .06535 L
.57937 .05606 L
.61905 .04826 L
.65873 .04171 L
.69841 .03622 L
.7381 .03162 L
.77778 .02775 L
.81746 .02451 L
.85714 .02179 L
.89683 .01952 L
.93651 .01761 L
.97619 .016 L
Mfstroke
P
P
P
MathSubEnd
P
% End of sub-graphic
p
p
.70886 .06648 m
.70886 .33381 L
.97619 .33381 L
.97619 .06648 L
F
1 g
.69215 .08319 m
.69215 .35052 L
.95948 .35052 L
.95948 .08319 L
F
0 g
.001 w
.69215 .08319 m
.95948 .08319 L
.95948 .35052 L
.69215 .35052 L
.69215 .08319 L
s
% Start of sub-graphic
p
0.692147 0.0831865 0.959482 0.350522 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0297619 0.297619 0.0166667 0.166667 [
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 1 L
0 1 L
closepath
clip
newpath
p
p
p
% Start of sub-graphic
p
0.0535714 0.03 0.35119 0.196667 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
[ .06667 .13333 .33333 .13333 ] 0 setdash
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[O])] .38988 .11333 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.223333 0.35119 0.39 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
[ .06667 .33333 ] 0 setdash
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[C3])] .38988 .30667 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.416667 0.35119 0.583333 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
[ .06667 .06667 ] 0 setdash
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[C2])] .38988 .5 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.61 0.35119 0.776667 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
[ .33333 .33333 ] 0 setdash
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[C1])] .38988 .69333 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.803333 0.35119 0.97 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(1 - p[C1])] .38988 .88667 -1 0 Mshowa
P
P
p
P
P
MathSubEnd
P
% End of sub-graphic
P
P
P
0 0 m
1 0 L
1 .43371 L
0 .43371 L
closepath
clip
newpath
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; preserveAspect; endGroup]
The Unformatted text for this cell was not generated.
Use options in the Actions Preferences dialog box to 
control when Unformatted text is generated.
;[o]
-Graphics-
:[font = text; inactive; preserveAspect]
Next, we plot the current. It is negative by convention.
:[font = input; preserveAspect; startGroup]
?CurrentPlot
:[font = info; inactive; preserveAspect; endGroup]
CurrentPlot[occ, sclist, n, u, {t, tmax}] plots
   the average current through n channels for u =
   uapplied - urev in volts, from 0 to tmax
   milliseconds. The interval of +- 1 standard
   deviation is shown in gray. For information on
   occ and sclist see ?OccupancyPlot.
:[font = input; preserveAspect; startGroup]
n = 10;    (* number of available channels *)
u = 0.07; (* Volts, voltage across the membrane *)

CurrentPlot[myOcc, stateConductivityList,
            n, u, {t, 10}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174]
%!
%%Creator: Mathematica
%%AspectRatio: .61803 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.0952381 0.618034 0.110363 [
[(2)] .21429 .61803 0 2 Msboxa
[(4)] .40476 .61803 0 2 Msboxa
[(6)] .59524 .61803 0 2 Msboxa
[(8)] .78571 .61803 0 2 Msboxa
[(10)] .97619 .61803 0 2 Msboxa
[(t/ms)] 1.025 .61803 -1 0 Msboxa
[(Current)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(-5)] .01131 .06622 1 0 Msboxa
[(-4)] .01131 .17658 1 0 Msboxa
[(-3)] .01131 .28694 1 0 Msboxa
[(-2)] .01131 .39731 1 0 Msboxa
[(-1)] .01131 .50767 1 0 Msboxa
[(I/pA)] .02381 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .62528 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.21429 .61803 m
.21429 .62428 L
s
P
[(2)] .21429 .61803 0 2 Mshowa
p
.002 w
.40476 .61803 m
.40476 .62428 L
s
P
[(4)] .40476 .61803 0 2 Mshowa
p
.002 w
.59524 .61803 m
.59524 .62428 L
s
P
[(6)] .59524 .61803 0 2 Mshowa
p
.002 w
.78571 .61803 m
.78571 .62428 L
s
P
[(8)] .78571 .61803 0 2 Mshowa
p
.002 w
.97619 .61803 m
.97619 .62428 L
s
P
[(10)] .97619 .61803 0 2 Mshowa
p
.001 w
.0619 .61803 m
.0619 .62178 L
s
P
p
.001 w
.1 .61803 m
.1 .62178 L
s
P
p
.001 w
.1381 .61803 m
.1381 .62178 L
s
P
p
.001 w
.17619 .61803 m
.17619 .62178 L
s
P
p
.001 w
.25238 .61803 m
.25238 .62178 L
s
P
p
.001 w
.29048 .61803 m
.29048 .62178 L
s
P
p
.001 w
.32857 .61803 m
.32857 .62178 L
s
P
p
.001 w
.36667 .61803 m
.36667 .62178 L
s
P
p
.001 w
.44286 .61803 m
.44286 .62178 L
s
P
p
.001 w
.48095 .61803 m
.48095 .62178 L
s
P
p
.001 w
.51905 .61803 m
.51905 .62178 L
s
P
p
.001 w
.55714 .61803 m
.55714 .62178 L
s
P
p
.001 w
.63333 .61803 m
.63333 .62178 L
s
P
p
.001 w
.67143 .61803 m
.67143 .62178 L
s
P
p
.001 w
.70952 .61803 m
.70952 .62178 L
s
P
p
.001 w
.74762 .61803 m
.74762 .62178 L
s
P
p
.001 w
.82381 .61803 m
.82381 .62178 L
s
P
p
.001 w
.8619 .61803 m
.8619 .62178 L
s
P
p
.001 w
.9 .61803 m
.9 .62178 L
s
P
p
.001 w
.9381 .61803 m
.9381 .62178 L
s
P
[(t/ms)] 1.025 .61803 -1 0 Mshowa
p
.002 w
0 .61803 m
1 .61803 L
s
P
[(Current)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .06622 m
.03006 .06622 L
s
P
[(-5)] .01131 .06622 1 0 Mshowa
p
.002 w
.02381 .17658 m
.03006 .17658 L
s
P
[(-4)] .01131 .17658 1 0 Mshowa
p
.002 w
.02381 .28694 m
.03006 .28694 L
s
P
[(-3)] .01131 .28694 1 0 Mshowa
p
.002 w
.02381 .39731 m
.03006 .39731 L
s
P
[(-2)] .01131 .39731 1 0 Mshowa
p
.002 w
.02381 .50767 m
.03006 .50767 L
s
P
[(-1)] .01131 .50767 1 0 Mshowa
p
.001 w
.02381 .08829 m
.02756 .08829 L
s
P
p
.001 w
.02381 .11036 m
.02756 .11036 L
s
P
p
.001 w
.02381 .13244 m
.02756 .13244 L
s
P
p
.001 w
.02381 .15451 m
.02756 .15451 L
s
P
p
.001 w
.02381 .19865 m
.02756 .19865 L
s
P
p
.001 w
.02381 .22073 m
.02756 .22073 L
s
P
p
.001 w
.02381 .2428 m
.02756 .2428 L
s
P
p
.001 w
.02381 .26487 m
.02756 .26487 L
s
P
p
.001 w
.02381 .30902 m
.02756 .30902 L
s
P
p
.001 w
.02381 .33109 m
.02756 .33109 L
s
P
p
.001 w
.02381 .35316 m
.02756 .35316 L
s
P
p
.001 w
.02381 .37523 m
.02756 .37523 L
s
P
p
.001 w
.02381 .41938 m
.02756 .41938 L
s
P
p
.001 w
.02381 .44145 m
.02756 .44145 L
s
P
p
.001 w
.02381 .46353 m
.02756 .46353 L
s
P
p
.001 w
.02381 .4856 m
.02756 .4856 L
s
P
p
.001 w
.02381 .52974 m
.02756 .52974 L
s
P
p
.001 w
.02381 .55182 m
.02756 .55182 L
s
P
p
.001 w
.02381 .57389 m
.02756 .57389 L
s
P
p
.001 w
.02381 .59596 m
.02756 .59596 L
s
P
p
.001 w
.02381 .04415 m
.02756 .04415 L
s
P
p
.001 w
.02381 .02207 m
.02756 .02207 L
s
P
[(I/pA)] .02381 .61803 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
p
p
.004 w
.02381 .61803 m
.02877 .47103 L
.03125 .41151 L
.03373 .36523 L
.03621 .32929 L
.03869 .30145 L
.04117 .27992 L
.04365 .26338 L
.04613 .25077 L
.04861 .24117 L
.05109 .23396 L
.05357 .22865 L
.05481 .22655 L
.05605 .22478 L
.05729 .22329 L
.05853 .22206 L
.05977 .22106 L
.06101 .22025 L
.06225 .21962 L
.06349 .21915 L
.06473 .2188 L
.06597 .21857 L
.06721 .21844 L
.06845 .21841 L
.06969 .21845 L
.07093 .21857 L
.07217 .21875 L
.07341 .21899 L
.07589 .21961 L
.07837 .22038 L
.08333 .22228 L
.09325 .22683 L
.10317 .2318 L
.1131 .23688 L
.11558 .23815 L
.11682 .23878 L
.11806 .23942 L
.1193 .24007 L
.12054 .24132 L
.12178 .24301 L
.12302 .2449 L
.14286 .27601 L
.18254 .33087 L
.22222 .37683 L
.2619 .41537 L
.30159 .44771 L
.34127 .47487 L
.38095 .49767 L
.42063 .51679 L
.46032 .53282 L
Mistroke
.5 .54627 L
.53968 .55756 L
.57937 .56703 L
.61905 .57499 L
.65873 .58167 L
.69841 .58727 L
.7381 .59197 L
.77778 .59591 L
.81746 .59921 L
.85714 .60198 L
.89683 .60431 L
.93651 .60626 L
.97619 .6079 L
Mfstroke
P
P
p
.5 g
p
.004 w
.02381 .61803 m
.02629 .48463 L
.02877 .38782 L
.03125 .31932 L
.03373 .26914 L
.03621 .23178 L
.03869 .20376 L
.04117 .18263 L
.04365 .16673 L
.04613 .1548 L
.04861 .14583 L
.05109 .13917 L
.05357 .13429 L
.05481 .13238 L
.05605 .13076 L
.05729 .12941 L
.05853 .12829 L
.05977 .12738 L
.06101 .12664 L
.06225 .12608 L
.06349 .12565 L
.06473 .12533 L
.06597 .12513 L
.06721 .12502 L
.06845 .12498 L
.06969 .12502 L
.07093 .12513 L
.07217 .12529 L
.07341 .12551 L
.07589 .12607 L
.07837 .12677 L
.08333 .12849 L
.09325 .13263 L
.10317 .13718 L
.1131 .14186 L
.11558 .14303 L
.11682 .14362 L
.11806 .14421 L
.1193 .14482 L
.12054 .14597 L
.12178 .14755 L
.12302 .14931 L
.14286 .17885 L
.18254 .23339 L
.22222 .2815 L
.2619 .32361 L
.30159 .36038 L
.34127 .39241 L
.38095 .42027 L
.42063 .44445 L
Mistroke
.46032 .46544 L
.5 .48366 L
.53968 .49949 L
.57937 .51326 L
.61905 .52524 L
.65873 .53567 L
.69841 .54476 L
.7381 .55268 L
.77778 .5596 L
.81746 .56563 L
.85714 .5709 L
.89683 .57551 L
.93651 .57953 L
.97619 .58307 L
Mfstroke
P
P
p
.5 g
p
.004 w
.02381 .61803 m
0 0 rlineto
.02381 .61803 m
.02381 .61803 L
s
.02578 .61803 m
.02629 .60932 L
s
.02629 .60932 m
.02877 .55425 L
.03125 .5037 L
.03373 .46132 L
.03869 .39914 L
.04117 .3772 L
.04365 .36003 L
.04613 .34673 L
.04861 .3365 L
.05109 .32876 L
.05357 .323 L
.05605 .3188 L
.05729 .31718 L
.05853 .31583 L
.05977 .31473 L
.06101 .31385 L
.06225 .31316 L
.06349 .31264 L
.06473 .31226 L
.06597 .31201 L
.06721 .31187 L
.06845 .31183 L
.06969 .31188 L
.07093 .31201 L
.07217 .31221 L
.07341 .31247 L
.07589 .31315 L
.07837 .314 L
.08333 .31607 L
.09325 .32103 L
.10317 .32642 L
.1131 .3319 L
.11558 .33327 L
.11682 .33395 L
.11806 .33463 L
.1193 .33533 L
.12054 .33666 L
.12178 .33847 L
.12302 .34049 L
.14286 .37317 L
.18254 .42834 L
.22222 .47217 L
.2619 .50712 L
.30159 .53503 L
.34127 .55732 L
.38095 .57506 L
.42063 .58912 L
.46032 .6002 L
.5 .60888 L
.53968 .61563 L
Mistroke
Mfstroke
.55812 .61803 m
.53968 .61563 L
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
P
P
P
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; preserveAspect; endGroup]
The Unformatted text for this cell was not generated.
Use options in the Actions Preferences dialog box to 
control when Unformatted text is generated.
;[o]
-Graphics-
:[font = text; inactive; preserveAspect]
This gives a current plot covering a smaller time interval.
:[font = input; preserveAspect; startGroup]
CurrentPlot[myOcc, stateConductivityList,
            n, u, {t, 1}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174]
%!
%%Creator: Mathematica
%%AspectRatio: .61803 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.618034 0.110363 [
[(0.2)] .21429 .61803 0 2 Msboxa
[(0.4)] .40476 .61803 0 2 Msboxa
[(0.6)] .59524 .61803 0 2 Msboxa
[(0.8)] .78571 .61803 0 2 Msboxa
[(1)] .97619 .61803 0 2 Msboxa
[(t/ms)] 1.025 .61803 -1 0 Msboxa
[(Current)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(-5)] .01131 .06622 1 0 Msboxa
[(-4)] .01131 .17658 1 0 Msboxa
[(-3)] .01131 .28694 1 0 Msboxa
[(-2)] .01131 .39731 1 0 Msboxa
[(-1)] .01131 .50767 1 0 Msboxa
[(I/pA)] .02381 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .62528 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.21429 .61803 m
.21429 .62428 L
s
P
[(0.2)] .21429 .61803 0 2 Mshowa
p
.002 w
.40476 .61803 m
.40476 .62428 L
s
P
[(0.4)] .40476 .61803 0 2 Mshowa
p
.002 w
.59524 .61803 m
.59524 .62428 L
s
P
[(0.6)] .59524 .61803 0 2 Mshowa
p
.002 w
.78571 .61803 m
.78571 .62428 L
s
P
[(0.8)] .78571 .61803 0 2 Mshowa
p
.002 w
.97619 .61803 m
.97619 .62428 L
s
P
[(1)] .97619 .61803 0 2 Mshowa
p
.001 w
.0619 .61803 m
.0619 .62178 L
s
P
p
.001 w
.1 .61803 m
.1 .62178 L
s
P
p
.001 w
.1381 .61803 m
.1381 .62178 L
s
P
p
.001 w
.17619 .61803 m
.17619 .62178 L
s
P
p
.001 w
.25238 .61803 m
.25238 .62178 L
s
P
p
.001 w
.29048 .61803 m
.29048 .62178 L
s
P
p
.001 w
.32857 .61803 m
.32857 .62178 L
s
P
p
.001 w
.36667 .61803 m
.36667 .62178 L
s
P
p
.001 w
.44286 .61803 m
.44286 .62178 L
s
P
p
.001 w
.48095 .61803 m
.48095 .62178 L
s
P
p
.001 w
.51905 .61803 m
.51905 .62178 L
s
P
p
.001 w
.55714 .61803 m
.55714 .62178 L
s
P
p
.001 w
.63333 .61803 m
.63333 .62178 L
s
P
p
.001 w
.67143 .61803 m
.67143 .62178 L
s
P
p
.001 w
.70952 .61803 m
.70952 .62178 L
s
P
p
.001 w
.74762 .61803 m
.74762 .62178 L
s
P
p
.001 w
.82381 .61803 m
.82381 .62178 L
s
P
p
.001 w
.8619 .61803 m
.8619 .62178 L
s
P
p
.001 w
.9 .61803 m
.9 .62178 L
s
P
p
.001 w
.9381 .61803 m
.9381 .62178 L
s
P
[(t/ms)] 1.025 .61803 -1 0 Mshowa
p
.002 w
0 .61803 m
1 .61803 L
s
P
[(Current)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .06622 m
.03006 .06622 L
s
P
[(-5)] .01131 .06622 1 0 Mshowa
p
.002 w
.02381 .17658 m
.03006 .17658 L
s
P
[(-4)] .01131 .17658 1 0 Mshowa
p
.002 w
.02381 .28694 m
.03006 .28694 L
s
P
[(-3)] .01131 .28694 1 0 Mshowa
p
.002 w
.02381 .39731 m
.03006 .39731 L
s
P
[(-2)] .01131 .39731 1 0 Mshowa
p
.002 w
.02381 .50767 m
.03006 .50767 L
s
P
[(-1)] .01131 .50767 1 0 Mshowa
p
.001 w
.02381 .08829 m
.02756 .08829 L
s
P
p
.001 w
.02381 .11036 m
.02756 .11036 L
s
P
p
.001 w
.02381 .13244 m
.02756 .13244 L
s
P
p
.001 w
.02381 .15451 m
.02756 .15451 L
s
P
p
.001 w
.02381 .19865 m
.02756 .19865 L
s
P
p
.001 w
.02381 .22073 m
.02756 .22073 L
s
P
p
.001 w
.02381 .2428 m
.02756 .2428 L
s
P
p
.001 w
.02381 .26487 m
.02756 .26487 L
s
P
p
.001 w
.02381 .30902 m
.02756 .30902 L
s
P
p
.001 w
.02381 .33109 m
.02756 .33109 L
s
P
p
.001 w
.02381 .35316 m
.02756 .35316 L
s
P
p
.001 w
.02381 .37523 m
.02756 .37523 L
s
P
p
.001 w
.02381 .41938 m
.02756 .41938 L
s
P
p
.001 w
.02381 .44145 m
.02756 .44145 L
s
P
p
.001 w
.02381 .46353 m
.02756 .46353 L
s
P
p
.001 w
.02381 .4856 m
.02756 .4856 L
s
P
p
.001 w
.02381 .52974 m
.02756 .52974 L
s
P
p
.001 w
.02381 .55182 m
.02756 .55182 L
s
P
p
.001 w
.02381 .57389 m
.02756 .57389 L
s
P
p
.001 w
.02381 .59596 m
.02756 .59596 L
s
P
p
.001 w
.02381 .04415 m
.02756 .04415 L
s
P
p
.001 w
.02381 .02207 m
.02756 .02207 L
s
P
[(I/pA)] .02381 .61803 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
p
p
.004 w
.02381 .61803 m
.06349 .4993 L
.10317 .40129 L
.12302 .36523 L
.14286 .33576 L
.1627 .31173 L
.18254 .29216 L
.20238 .27625 L
.22222 .26338 L
.24206 .25302 L
.2619 .24469 L
.28175 .23803 L
.30159 .23277 L
.32143 .22865 L
.34127 .22545 L
.36111 .22303 L
.38095 .22124 L
.39087 .22055 L
.40079 .21997 L
.41071 .21951 L
.42063 .21915 L
.43056 .21886 L
.44048 .21865 L
.44544 .21857 L
.4504 .21851 L
.45536 .21846 L
.45784 .21844 L
.46032 .21843 L
.4628 .21842 L
.46404 .21841 L
.46528 .21841 L
.46652 .21841 L
.46776 .21841 L
.469 .21841 L
.47024 .21841 L
.47148 .21841 L
.47272 .21841 L
.47396 .21841 L
.4752 .21842 L
.47768 .21843 L
.48016 .21844 L
.48512 .21847 L
.49008 .21851 L
.5 .21863 L
.50992 .21879 L
.51984 .21899 L
.53968 .21947 L
.57937 .22073 L
.61905 .22228 L
.65873 .22401 L
Mistroke
.69841 .22587 L
.7381 .2278 L
.77778 .22979 L
.81746 .2318 L
.85714 .23383 L
.89683 .23586 L
.93651 .2379 L
.97619 .23992 L
Mfstroke
P
P
p
.5 g
p
.004 w
.02381 .61803 m
.04365 .50891 L
.06349 .42231 L
.08333 .35774 L
.10317 .30803 L
.12302 .26914 L
.14286 .23841 L
.1627 .21402 L
.18254 .19459 L
.20238 .17908 L
.22222 .16673 L
.24206 .15692 L
.2619 .14911 L
.28175 .14293 L
.30159 .13807 L
.32143 .13429 L
.34127 .13138 L
.36111 .12917 L
.38095 .12755 L
.39087 .12692 L
.40079 .1264 L
.41071 .12598 L
.42063 .12565 L
.43056 .12539 L
.44048 .1252 L
.44544 .12513 L
.4504 .12507 L
.45536 .12503 L
.45784 .12502 L
.46032 .125 L
.4628 .12499 L
.46404 .12499 L
.46528 .12498 L
.46652 .12498 L
.46776 .12498 L
.469 .12498 L
.47024 .12498 L
.47148 .12498 L
.47272 .12498 L
.47396 .12499 L
.4752 .12499 L
.47768 .125 L
.48016 .12501 L
.48512 .12504 L
.49008 .12508 L
.5 .12519 L
.50992 .12533 L
.51984 .12551 L
.53968 .12594 L
.57937 .12708 L
Mistroke
.61905 .12849 L
.65873 .13006 L
.69841 .13175 L
.7381 .13352 L
.77778 .13533 L
.81746 .13718 L
.85714 .13905 L
.89683 .14092 L
.93651 .1428 L
.97619 .14468 L
Mfstroke
P
P
p
.5 g
p
.004 w
.02381 .61803 m
0 0 rlineto
.02381 .61803 m
.02381 .61803 L
s
s
s
s
s
s
s
s
s
s
s
s
s
.04421 .61803 m
.06349 .5763 L
s
.06349 .5763 m
.10317 .49455 L
.14286 .43312 L
.1627 .40945 L
.18254 .38974 L
.20238 .37341 L
.22222 .36003 L
.24206 .34912 L
.2619 .34027 L
.28175 .33314 L
.30159 .32746 L
.32143 .323 L
.34127 .31953 L
.36111 .31689 L
.38095 .31494 L
.39087 .31418 L
.40079 .31355 L
.41071 .31305 L
.42063 .31264 L
.43056 .31233 L
.44048 .31209 L
.44544 .31201 L
.4504 .31194 L
.45536 .31189 L
.45784 .31187 L
.46032 .31186 L
.4628 .31184 L
.46404 .31184 L
.46528 .31183 L
.46652 .31183 L
.46776 .31183 L
.469 .31183 L
.47024 .31183 L
.47148 .31183 L
.47272 .31183 L
.47396 .31184 L
.4752 .31184 L
.47768 .31185 L
.48016 .31187 L
.48512 .3119 L
.49008 .31195 L
.5 .31208 L
.50992 .31226 L
.51984 .31247 L
.53968 .31299 L
.57937 .31438 L
.61905 .31607 L
.65873 .31796 L
.69841 .31998 L
.7381 .32209 L
Mistroke
.77778 .32424 L
.81746 .32642 L
.85714 .32861 L
.89683 .33081 L
.93651 .33299 L
.97619 .33517 L
Mfstroke
P
P
P
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; preserveAspect; endGroup]
The Unformatted text for this cell was not generated.
Use options in the Actions Preferences dialog box to 
control when Unformatted text is generated.
;[o]
-Graphics-
:[font = input; preserveAspect; startGroup]
?CurrentRisetime
:[font = info; inactive; preserveAspect; endGroup]
CurrentRisetime[occ, sclist, t] gives the 20/80%
   risetime (milliseconds) of the current, which
   is computed using occ, the occupancy function
   of t, and sclist, the list of the states and
   their conductivities.
:[font = text; inactive; preserveAspect]
Any implementation of CurrentRisetime[] must rely on numerical root finding. This requires the routine to guess what starting values for the secant method will lead it to converge in the right place. Such guesswork is fallible if the current function is a sufficiently pathological one. Our example, though, is well-behaved so there should be no problems. (You can always verify the result of CurrentRisetime[] by looking at the current plot.)
;[s]
5:0,0;22,1;39,2;393,3;410,4;443,-1;
5:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
CurrentRisetime[myOcc, stateConductivityList, t] *
milliseconds
:[font = output; output; inactive; preserveAspect; endGroup]
0.1308250346597757*milliseconds
;[o]
0.130825 milliseconds
:[font = input; preserveAspect; startGroup]
?CurrentVariancePlot
:[font = info; inactive; preserveAspect; endGroup]
CurrentVariancePlot[occ, sclist, n, u, {t, tmax}]
   plots the variance of the current through n
   channels for u = uapplied - urev in volts, from
   0 to tmax milliseconds. For information on occ
   and sclist see ?OccupancyPlot.
:[font = text; inactive; preserveAspect]
This plots the variance of the current, in pA^2. Note that the argument sequence to most of the plotting functions is the same. We take the n and u from the current plot above.
;[s]
5:0,0;140,1;141,2;146,3;147,4;176,-1;
5:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
CurrentVariancePlot[myOcc, stateConductivityList,
                    n, u, {t, 10}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174]
%!
%%Creator: Mathematica
%%AspectRatio: .61803 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.0952381 0 0.769086 [
[(0)] .02381 0 0 2 Msboxa
[(2)] .21429 0 0 2 Msboxa
[(4)] .40476 0 0 2 Msboxa
[(6)] .59524 0 0 2 Msboxa
[(8)] .78571 0 0 2 Msboxa
[(10)] .97619 0 0 2 Msboxa
[(t/ms)] 1.025 0 -1 0 Msboxa
[(Variance of Current)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(0.2)] .01131 .15382 1 0 Msboxa
[(0.4)] .01131 .30763 1 0 Msboxa
[(0.6)] .01131 .46145 1 0 Msboxa
[(0.8)] .01131 .61527 1 0 Msboxa
[(var[I[t]]/\(pA^2\))] .02381 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.02381 0 m
.02381 .00625 L
s
P
[(0)] .02381 0 0 2 Mshowa
p
.002 w
.21429 0 m
.21429 .00625 L
s
P
[(2)] .21429 0 0 2 Mshowa
p
.002 w
.40476 0 m
.40476 .00625 L
s
P
[(4)] .40476 0 0 2 Mshowa
p
.002 w
.59524 0 m
.59524 .00625 L
s
P
[(6)] .59524 0 0 2 Mshowa
p
.002 w
.78571 0 m
.78571 .00625 L
s
P
[(8)] .78571 0 0 2 Mshowa
p
.002 w
.97619 0 m
.97619 .00625 L
s
P
[(10)] .97619 0 0 2 Mshowa
p
.001 w
.0619 0 m
.0619 .00375 L
s
P
p
.001 w
.1 0 m
.1 .00375 L
s
P
p
.001 w
.1381 0 m
.1381 .00375 L
s
P
p
.001 w
.17619 0 m
.17619 .00375 L
s
P
p
.001 w
.25238 0 m
.25238 .00375 L
s
P
p
.001 w
.29048 0 m
.29048 .00375 L
s
P
p
.001 w
.32857 0 m
.32857 .00375 L
s
P
p
.001 w
.36667 0 m
.36667 .00375 L
s
P
p
.001 w
.44286 0 m
.44286 .00375 L
s
P
p
.001 w
.48095 0 m
.48095 .00375 L
s
P
p
.001 w
.51905 0 m
.51905 .00375 L
s
P
p
.001 w
.55714 0 m
.55714 .00375 L
s
P
p
.001 w
.63333 0 m
.63333 .00375 L
s
P
p
.001 w
.67143 0 m
.67143 .00375 L
s
P
p
.001 w
.70952 0 m
.70952 .00375 L
s
P
p
.001 w
.74762 0 m
.74762 .00375 L
s
P
p
.001 w
.82381 0 m
.82381 .00375 L
s
P
p
.001 w
.8619 0 m
.8619 .00375 L
s
P
p
.001 w
.9 0 m
.9 .00375 L
s
P
p
.001 w
.9381 0 m
.9381 .00375 L
s
P
[(t/ms)] 1.025 0 -1 0 Mshowa
p
.002 w
0 0 m
1 0 L
s
P
[(Variance of Current)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .15382 m
.03006 .15382 L
s
P
[(0.2)] .01131 .15382 1 0 Mshowa
p
.002 w
.02381 .30763 m
.03006 .30763 L
s
P
[(0.4)] .01131 .30763 1 0 Mshowa
p
.002 w
.02381 .46145 m
.03006 .46145 L
s
P
[(0.6)] .01131 .46145 1 0 Mshowa
p
.002 w
.02381 .61527 m
.03006 .61527 L
s
P
[(0.8)] .01131 .61527 1 0 Mshowa
p
.001 w
.02381 .03076 m
.02756 .03076 L
s
P
p
.001 w
.02381 .06153 m
.02756 .06153 L
s
P
p
.001 w
.02381 .09229 m
.02756 .09229 L
s
P
p
.001 w
.02381 .12305 m
.02756 .12305 L
s
P
p
.001 w
.02381 .18458 m
.02756 .18458 L
s
P
p
.001 w
.02381 .21534 m
.02756 .21534 L
s
P
p
.001 w
.02381 .24611 m
.02756 .24611 L
s
P
p
.001 w
.02381 .27687 m
.02756 .27687 L
s
P
p
.001 w
.02381 .3384 m
.02756 .3384 L
s
P
p
.001 w
.02381 .36916 m
.02756 .36916 L
s
P
p
.001 w
.02381 .39992 m
.02756 .39992 L
s
P
p
.001 w
.02381 .43069 m
.02756 .43069 L
s
P
p
.001 w
.02381 .49221 m
.02756 .49221 L
s
P
p
.001 w
.02381 .52298 m
.02756 .52298 L
s
P
p
.001 w
.02381 .55374 m
.02756 .55374 L
s
P
p
.001 w
.02381 .58451 m
.02756 .58451 L
s
P
[(var[I[t]]/\(pA^2\))] .02381 .61803 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
p
.004 w
.02381 0 m
.02629 .24542 L
.02753 .35594 L
.02877 .43722 L
.03001 .4956 L
.03125 .53664 L
.03249 .56467 L
.03373 .58301 L
.03497 .59427 L
.03621 .60037 L
.03745 .60278 L
.03869 .6026 L
.03993 .60068 L
.04117 .59762 L
.04365 .58981 L
.04861 .5739 L
.05109 .5674 L
.05357 .56218 L
.05605 .55816 L
.05729 .55656 L
.05853 .55522 L
.05977 .55411 L
.06101 .5532 L
.06225 .5525 L
.06349 .55197 L
.06473 .55157 L
.06597 .55131 L
.06721 .55116 L
.06845 .55112 L
.06969 .55117 L
.07093 .55131 L
.07217 .55151 L
.07341 .55178 L
.07589 .55248 L
.07837 .55336 L
.08333 .55546 L
.09325 .56031 L
.10317 .56532 L
.1131 .5701 L
.11558 .57125 L
.11682 .57182 L
.11806 .57238 L
.1193 .57295 L
.12054 .57402 L
.12178 .57545 L
.12302 .577 L
.12798 .58304 L
.13294 .58825 L
.1379 .59258 L
.14286 .59609 L
Mistroke
.14782 .59882 L
.1503 .59991 L
.15278 .60083 L
.15526 .60158 L
.15774 .60216 L
.15898 .60239 L
.16022 .60258 L
.16146 .60273 L
.1627 .60284 L
.16394 .60292 L
.16518 .60296 L
.16642 .60296 L
.16766 .60293 L
.1689 .60286 L
.17014 .60276 L
.17262 .60245 L
.17386 .60225 L
.1751 .60201 L
.17758 .60144 L
.18254 .59995 L
.1875 .598 L
.19246 .59561 L
.20238 .58969 L
.22222 .57392 L
.2619 .53155 L
.30159 .48151 L
.34127 .42928 L
.38095 .37825 L
.42063 .33039 L
.46032 .28669 L
.5 .24754 L
.53968 .21291 L
.57937 .18261 L
.61905 .15628 L
.65873 .13357 L
.69841 .11409 L
.7381 .09744 L
.77778 .08326 L
.81746 .07121 L
.85714 .06101 L
.89683 .05237 L
.93651 .04509 L
.97619 .03891 L
Mfstroke
P
P
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; preserveAspect; endGroup]
The Unformatted text for this cell was not generated.
Use options in the Actions Preferences dialog box to 
control when Unformatted text is generated.
;[o]
-Graphics-
:[font = input; preserveAspect; startGroup]
?CoefficientOfVariationPlot
:[font = info; inactive; preserveAspect; endGroup]
CoefficientOfVariationPlot[occ, sclist, n, u, {t,
   tmax}] plots the coefficient of variation (i.e.
   standard deviation / mean, in percent) of the
   current through n channels for u = uapplied -
   urev in volts, from 0 to tmax milliseconds. For
   information on occ and sclist see
   ?OccupancyPlot.
:[font = input; preserveAspect; startGroup]
CoefficientOfVariationPlot[myOcc, stateConductivityList,
                           n, u, {t, 10}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174]
%!
%%Creator: Mathematica
%%AspectRatio: .61803 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.0952381 0 0.00264093 [
[(0)] .02381 0 0 2 Msboxa
[(2)] .21429 0 0 2 Msboxa
[(4)] .40476 0 0 2 Msboxa
[(6)] .59524 0 0 2 Msboxa
[(8)] .78571 0 0 2 Msboxa
[(10)] .97619 0 0 2 Msboxa
[(t/ms)] 1.025 0 -1 0 Msboxa
[(Coefficient of Variation)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(50)] .01131 .13205 1 0 Msboxa
[(100)] .01131 .26409 1 0 Msboxa
[(150)] .01131 .39614 1 0 Msboxa
[(200)] .01131 .52819 1 0 Msboxa
[(c.v./%)] .02381 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.02381 0 m
.02381 .00625 L
s
P
[(0)] .02381 0 0 2 Mshowa
p
.002 w
.21429 0 m
.21429 .00625 L
s
P
[(2)] .21429 0 0 2 Mshowa
p
.002 w
.40476 0 m
.40476 .00625 L
s
P
[(4)] .40476 0 0 2 Mshowa
p
.002 w
.59524 0 m
.59524 .00625 L
s
P
[(6)] .59524 0 0 2 Mshowa
p
.002 w
.78571 0 m
.78571 .00625 L
s
P
[(8)] .78571 0 0 2 Mshowa
p
.002 w
.97619 0 m
.97619 .00625 L
s
P
[(10)] .97619 0 0 2 Mshowa
p
.001 w
.0619 0 m
.0619 .00375 L
s
P
p
.001 w
.1 0 m
.1 .00375 L
s
P
p
.001 w
.1381 0 m
.1381 .00375 L
s
P
p
.001 w
.17619 0 m
.17619 .00375 L
s
P
p
.001 w
.25238 0 m
.25238 .00375 L
s
P
p
.001 w
.29048 0 m
.29048 .00375 L
s
P
p
.001 w
.32857 0 m
.32857 .00375 L
s
P
p
.001 w
.36667 0 m
.36667 .00375 L
s
P
p
.001 w
.44286 0 m
.44286 .00375 L
s
P
p
.001 w
.48095 0 m
.48095 .00375 L
s
P
p
.001 w
.51905 0 m
.51905 .00375 L
s
P
p
.001 w
.55714 0 m
.55714 .00375 L
s
P
p
.001 w
.63333 0 m
.63333 .00375 L
s
P
p
.001 w
.67143 0 m
.67143 .00375 L
s
P
p
.001 w
.70952 0 m
.70952 .00375 L
s
P
p
.001 w
.74762 0 m
.74762 .00375 L
s
P
p
.001 w
.82381 0 m
.82381 .00375 L
s
P
p
.001 w
.8619 0 m
.8619 .00375 L
s
P
p
.001 w
.9 0 m
.9 .00375 L
s
P
p
.001 w
.9381 0 m
.9381 .00375 L
s
P
[(t/ms)] 1.025 0 -1 0 Mshowa
p
.002 w
0 0 m
1 0 L
s
P
[(Coefficient of Variation)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .13205 m
.03006 .13205 L
s
P
[(50)] .01131 .13205 1 0 Mshowa
p
.002 w
.02381 .26409 m
.03006 .26409 L
s
P
[(100)] .01131 .26409 1 0 Mshowa
p
.002 w
.02381 .39614 m
.03006 .39614 L
s
P
[(150)] .01131 .39614 1 0 Mshowa
p
.002 w
.02381 .52819 m
.03006 .52819 L
s
P
[(200)] .01131 .52819 1 0 Mshowa
p
.001 w
.02381 .02641 m
.02756 .02641 L
s
P
p
.001 w
.02381 .05282 m
.02756 .05282 L
s
P
p
.001 w
.02381 .07923 m
.02756 .07923 L
s
P
p
.001 w
.02381 .10564 m
.02756 .10564 L
s
P
p
.001 w
.02381 .15846 m
.02756 .15846 L
s
P
p
.001 w
.02381 .18487 m
.02756 .18487 L
s
P
p
.001 w
.02381 .21127 m
.02756 .21127 L
s
P
p
.001 w
.02381 .23768 m
.02756 .23768 L
s
P
p
.001 w
.02381 .2905 m
.02756 .2905 L
s
P
p
.001 w
.02381 .31691 m
.02756 .31691 L
s
P
p
.001 w
.02381 .34332 m
.02756 .34332 L
s
P
p
.001 w
.02381 .36973 m
.02756 .36973 L
s
P
p
.001 w
.02381 .42255 m
.02756 .42255 L
s
P
p
.001 w
.02381 .44896 m
.02756 .44896 L
s
P
p
.001 w
.02381 .47537 m
.02756 .47537 L
s
P
p
.001 w
.02381 .50178 m
.02756 .50178 L
s
P
p
.001 w
.02381 .5546 m
.02756 .5546 L
s
P
p
.001 w
.02381 .581 m
.02756 .581 L
s
P
p
.001 w
.02381 .60741 m
.02756 .60741 L
s
P
[(c.v./%)] .02381 .61803 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
p
.004 w
s
.02505 .61803 m
.02514 .36056 L
s
.02514 .36056 m
.02638 .22596 L
.02762 .17549 L
.02886 .14781 L
.0301 .12983 L
.03134 .11704 L
.03258 .1074 L
.03382 .09986 L
.0363 .08884 L
.03754 .08471 L
.03878 .08125 L
.04126 .07581 L
.04374 .07184 L
.04622 .06891 L
.0487 .06674 L
.05118 .06513 L
.05366 .06396 L
.0549 .0635 L
.05614 .06311 L
.05738 .06279 L
.05862 .06252 L
.05986 .06231 L
.0611 .06213 L
.06234 .062 L
.06358 .06189 L
.06482 .06182 L
.06606 .06177 L
.0673 .06175 L
.06854 .06174 L
.06978 .06175 L
.07102 .06178 L
.07226 .06182 L
.0735 .06187 L
.07598 .06201 L
.07846 .06218 L
.08342 .0626 L
.10326 .06471 L
.10822 .06528 L
.11318 .06585 L
.11566 .06613 L
.1169 .06628 L
.11814 .06642 L
.11938 .06657 L
.12062 .06686 L
.1231 .06769 L
.13302 .07137 L
.14294 .07505 L
.18262 .08967 L
.2223 .10441 L
.26198 .11959 L
Mistroke
.30165 .13543 L
.34133 .15212 L
.38101 .16984 L
.42069 .1887 L
.46037 .20886 L
.50005 .23044 L
.53973 .2536 L
.5794 .27849 L
.61908 .30526 L
.65876 .33401 L
.69844 .36488 L
.73812 .39799 L
.7778 .43342 L
.81748 .47125 L
.85715 .51147 L
.89683 .55415 L
.93651 .59917 L
Mfstroke
.95225 .61803 m
.93651 .59917 L
s
s
P
P
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; preserveAspect; endGroup]
The Unformatted text for this cell was not generated.
Use options in the Actions Preferences dialog box to 
control when Unformatted text is generated.
;[o]
-Graphics-
:[font = input; preserveAspect; startGroup]
?CurrentThirdMomentPlot
:[font = info; inactive; preserveAspect; endGroup]
CurrentThirdMomentPlot[occ, sclist, n, u, {t,
   tmax}] plots the third central moment of the
   current through n channels for u = uapplied -
   urev in volts, from 0 to tmax milliseconds.
   Since the current is negative by convention,
   the third moment undergoes the same sign
   change. For information on occ and sclist see
   ?OccupancyPlot.
:[font = input; preserveAspect; startGroup]
CurrentThirdMomentPlot[myOcc, stateConductivityList,
                       n, u, {t, 10}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174]
%!
%%Creator: Mathematica
%%AspectRatio: .61803 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.0952381 0.361704 2.05335 [
[(2)] .21429 .3617 0 2 Msboxa
[(4)] .40476 .3617 0 2 Msboxa
[(6)] .59524 .3617 0 2 Msboxa
[(8)] .78571 .3617 0 2 Msboxa
[(10)] .97619 .3617 0 2 Msboxa
[(t/ms)] 1.025 .3617 -1 0 Msboxa
[(Third Central Moment of Current)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(-0.15)] .01131 .0537 1 0 Msboxa
[(-0.1)] .01131 .15637 1 0 Msboxa
[(-0.05)] .01131 .25904 1 0 Msboxa
[(0.05)] .01131 .46437 1 0 Msboxa
[(0.1)] .01131 .56704 1 0 Msboxa
[(m3[I[t]]/\(pA^3\))] .02381 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.21429 .3617 m
.21429 .36795 L
s
P
[(2)] .21429 .3617 0 2 Mshowa
p
.002 w
.40476 .3617 m
.40476 .36795 L
s
P
[(4)] .40476 .3617 0 2 Mshowa
p
.002 w
.59524 .3617 m
.59524 .36795 L
s
P
[(6)] .59524 .3617 0 2 Mshowa
p
.002 w
.78571 .3617 m
.78571 .36795 L
s
P
[(8)] .78571 .3617 0 2 Mshowa
p
.002 w
.97619 .3617 m
.97619 .36795 L
s
P
[(10)] .97619 .3617 0 2 Mshowa
p
.001 w
.0619 .3617 m
.0619 .36545 L
s
P
p
.001 w
.1 .3617 m
.1 .36545 L
s
P
p
.001 w
.1381 .3617 m
.1381 .36545 L
s
P
p
.001 w
.17619 .3617 m
.17619 .36545 L
s
P
p
.001 w
.25238 .3617 m
.25238 .36545 L
s
P
p
.001 w
.29048 .3617 m
.29048 .36545 L
s
P
p
.001 w
.32857 .3617 m
.32857 .36545 L
s
P
p
.001 w
.36667 .3617 m
.36667 .36545 L
s
P
p
.001 w
.44286 .3617 m
.44286 .36545 L
s
P
p
.001 w
.48095 .3617 m
.48095 .36545 L
s
P
p
.001 w
.51905 .3617 m
.51905 .36545 L
s
P
p
.001 w
.55714 .3617 m
.55714 .36545 L
s
P
p
.001 w
.63333 .3617 m
.63333 .36545 L
s
P
p
.001 w
.67143 .3617 m
.67143 .36545 L
s
P
p
.001 w
.70952 .3617 m
.70952 .36545 L
s
P
p
.001 w
.74762 .3617 m
.74762 .36545 L
s
P
p
.001 w
.82381 .3617 m
.82381 .36545 L
s
P
p
.001 w
.8619 .3617 m
.8619 .36545 L
s
P
p
.001 w
.9 .3617 m
.9 .36545 L
s
P
p
.001 w
.9381 .3617 m
.9381 .36545 L
s
P
[(t/ms)] 1.025 .3617 -1 0 Mshowa
p
.002 w
0 .3617 m
1 .3617 L
s
P
[(Third Central Moment of Current)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .0537 m
.03006 .0537 L
s
P
[(-0.15)] .01131 .0537 1 0 Mshowa
p
.002 w
.02381 .15637 m
.03006 .15637 L
s
P
[(-0.1)] .01131 .15637 1 0 Mshowa
p
.002 w
.02381 .25904 m
.03006 .25904 L
s
P
[(-0.05)] .01131 .25904 1 0 Mshowa
p
.002 w
.02381 .46437 m
.03006 .46437 L
s
P
[(0.05)] .01131 .46437 1 0 Mshowa
p
.002 w
.02381 .56704 m
.03006 .56704 L
s
P
[(0.1)] .01131 .56704 1 0 Mshowa
p
.001 w
.02381 .07423 m
.02756 .07423 L
s
P
p
.001 w
.02381 .09477 m
.02756 .09477 L
s
P
p
.001 w
.02381 .1153 m
.02756 .1153 L
s
P
p
.001 w
.02381 .13584 m
.02756 .13584 L
s
P
p
.001 w
.02381 .1769 m
.02756 .1769 L
s
P
p
.001 w
.02381 .19744 m
.02756 .19744 L
s
P
p
.001 w
.02381 .21797 m
.02756 .21797 L
s
P
p
.001 w
.02381 .2385 m
.02756 .2385 L
s
P
p
.001 w
.02381 .27957 m
.02756 .27957 L
s
P
p
.001 w
.02381 .3001 m
.02756 .3001 L
s
P
p
.001 w
.02381 .32064 m
.02756 .32064 L
s
P
p
.001 w
.02381 .34117 m
.02756 .34117 L
s
P
p
.001 w
.02381 .38224 m
.02756 .38224 L
s
P
p
.001 w
.02381 .40277 m
.02756 .40277 L
s
P
p
.001 w
.02381 .4233 m
.02756 .4233 L
s
P
p
.001 w
.02381 .44384 m
.02756 .44384 L
s
P
p
.001 w
.02381 .48491 m
.02756 .48491 L
s
P
p
.001 w
.02381 .50544 m
.02756 .50544 L
s
P
p
.001 w
.02381 .52597 m
.02756 .52597 L
s
P
p
.001 w
.02381 .54651 m
.02756 .54651 L
s
P
p
.001 w
.02381 .03317 m
.02756 .03317 L
s
P
p
.001 w
.02381 .01263 m
.02756 .01263 L
s
P
p
.001 w
.02381 .58757 m
.02756 .58757 L
s
P
p
.001 w
.02381 .60811 m
.02756 .60811 L
s
P
[(m3[I[t]]/\(pA^3\))] .02381 .61803 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
p
p
.004 w
.02381 .3617 m
.02501 .22419 L
.02561 .14461 L
.02621 .08512 L
.02652 .0631 L
.02682 .04581 L
.02712 .03279 L
.02742 .02362 L
.02772 .01785 L
.02802 .01509 L
.02832 .01496 L
.02862 .01713 L
.02892 .02129 L
.02922 .02716 L
.02982 .04311 L
.03102 .0864 L
.03343 .19013 L
.03583 .28883 L
.03824 .37053 L
.04064 .43415 L
.04305 .48204 L
.04545 .51745 L
.04786 .54349 L
.05026 .56251 L
.05267 .57623 L
.05507 .58606 L
.05628 .58985 L
.05748 .593 L
.05868 .59559 L
.05988 .5977 L
.06109 .5994 L
.06229 .60071 L
.06349 .60171 L
.06409 .60211 L
.06469 .60245 L
.0653 .60273 L
.0659 .60294 L
.0665 .6031 L
.0668 .60317 L
.0671 .60322 L
.0674 .60326 L
.0677 .60329 L
.068 .60331 L
.0683 .60332 L
.0686 .60331 L
.0689 .6033 L
.0692 .60328 L
.0695 .60324 L
.07011 .60315 L
.07071 .60302 L
Mistroke
.07131 .60286 L
.07191 .60267 L
.07431 .60161 L
.07672 .60018 L
.08153 .59644 L
.09115 .58684 L
.10077 .57579 L
.11039 .56405 L
.1152 .55805 L
.1176 .55502 L
.11821 .55426 L
.11881 .5535 L
.11911 .55311 L
.11941 .55262 L
.12001 .55124 L
.12121 .54751 L
.12241 .54306 L
.12482 .53337 L
.12963 .51315 L
.13925 .47223 L
.14887 .43148 L
.15849 .39156 L
.16811 .35294 L
.17773 .31602 L
.18735 .28108 L
.19697 .24831 L
.20659 .21784 L
.21621 .18974 L
.22583 .16403 L
.23545 .14067 L
.24507 .11963 L
.25469 .10085 L
.26431 .08424 L
.27393 .06972 L
.28355 .05717 L
.29317 .04649 L
.30279 .03758 L
.31241 .0303 L
.32203 .02456 L
.32684 .02223 L
.33165 .02024 L
.33646 .01858 L
.34127 .01723 L
.34608 .01619 L
.34848 .01578 L
.35089 .01543 L
.35329 .01516 L
.3545 .01505 L
.3557 .01495 L
.3569 .01487 L
Mistroke
.3581 .01481 L
.35871 .01478 L
.35931 .01476 L
.35991 .01475 L
.36051 .01473 L
.36081 .01473 L
.36111 .01472 L
.36141 .01472 L
.36171 .01472 L
.36201 .01472 L
.36231 .01472 L
.36261 .01472 L
.36291 .01472 L
.36322 .01472 L
.36352 .01472 L
.36412 .01473 L
.36472 .01475 L
.36532 .01476 L
.36652 .01481 L
.36772 .01487 L
.37013 .01504 L
.37253 .01526 L
.37494 .01553 L
.37975 .01625 L
.38456 .01717 L
.38937 .01829 L
.39899 .02106 L
.40861 .02449 L
.41823 .0285 L
.42785 .03302 L
.43747 .03799 L
.44709 .04335 L
.45671 .04905 L
.46633 .05503 L
.47595 .06125 L
.48557 .06766 L
.49519 .07422 L
.50481 .08091 L
.51443 .08768 L
.52405 .09451 L
.53367 .10138 L
.54329 .10825 L
.55291 .11511 L
.56253 .12193 L
.57215 .12871 L
.58177 .13542 L
.59139 .14205 L
.60101 .1486 L
.61063 .15505 L
.62025 .16138 L
Mistroke
.62987 .1676 L
.63949 .17369 L
.64911 .17966 L
.65873 .1855 L
.66835 .1912 L
.67797 .19676 L
.68759 .20218 L
.69721 .20745 L
.70683 .21259 L
.71645 .21759 L
.72607 .22244 L
.73569 .22716 L
.74531 .23173 L
.75493 .23615 L
.76455 .24045 L
.77417 .24461 L
.78379 .24864 L
.79341 .25254 L
.80303 .2563 L
.81265 .25995 L
.82227 .26347 L
.83189 .26686 L
.84151 .27014 L
.85113 .27331 L
.86075 .27636 L
.87037 .2793 L
.87999 .28215 L
.88961 .28489 L
.89923 .28753 L
.90885 .29007 L
.91847 .29251 L
.92809 .29487 L
.93771 .29714 L
.94733 .29933 L
.95695 .30144 L
.96657 .30348 L
.97619 .30544 L
Mfstroke
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; preserveAspect; endGroup]
The Unformatted text for this cell was not generated.
Use options in the Actions Preferences dialog box to 
control when Unformatted text is generated.
;[o]
-Graphics-
:[font = subsection; inactive; Cclosed; preserveAspect; startGroup]
First Latencies
:[font = input; preserveAspect; startGroup]
?FirstLatencies
:[font = info; inactive; preserveAspect; endGroup]
FirstLatencies[q, sclist, initocc, concrule,
   {t, tmax}] gives the probability density
   function for a first opening of a channel at
   time t milliseconds if it was closed at time
   zero. For information on the arguments see
   ?Occupancy and ?OccupancyPlot.
:[font = input; preserveAspect]
myFL = FirstLatencies[q, stateConductivityList,
                      initialOccupancy,
                      c[t] -> 0.001, {t, 1000}];
:[font = input; preserveAspect; startGroup]
Plot[myFL, {t, 0, 1}, AxesLabel -> {"t/ms",
     "PDF"}, PlotLabel -> "First Latencies"]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174]
%!
%%Creator: Mathematica
%%AspectRatio: .61803 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.0147151 0.108759 [
[(0.2)] .21429 .01472 0 2 Msboxa
[(0.4)] .40476 .01472 0 2 Msboxa
[(0.6)] .59524 .01472 0 2 Msboxa
[(0.8)] .78571 .01472 0 2 Msboxa
[(1)] .97619 .01472 0 2 Msboxa
[(t/ms)] 1.025 .01472 -1 0 Msboxa
[(First Latencies)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(1)] .01131 .12347 1 0 Msboxa
[(2)] .01131 .23223 1 0 Msboxa
[(3)] .01131 .34099 1 0 Msboxa
[(4)] .01131 .44975 1 0 Msboxa
[(5)] .01131 .55851 1 0 Msboxa
[(PDF)] .02381 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.21429 .01472 m
.21429 .02097 L
s
P
[(0.2)] .21429 .01472 0 2 Mshowa
p
.002 w
.40476 .01472 m
.40476 .02097 L
s
P
[(0.4)] .40476 .01472 0 2 Mshowa
p
.002 w
.59524 .01472 m
.59524 .02097 L
s
P
[(0.6)] .59524 .01472 0 2 Mshowa
p
.002 w
.78571 .01472 m
.78571 .02097 L
s
P
[(0.8)] .78571 .01472 0 2 Mshowa
p
.002 w
.97619 .01472 m
.97619 .02097 L
s
P
[(1)] .97619 .01472 0 2 Mshowa
p
.001 w
.0619 .01472 m
.0619 .01847 L
s
P
p
.001 w
.1 .01472 m
.1 .01847 L
s
P
p
.001 w
.1381 .01472 m
.1381 .01847 L
s
P
p
.001 w
.17619 .01472 m
.17619 .01847 L
s
P
p
.001 w
.25238 .01472 m
.25238 .01847 L
s
P
p
.001 w
.29048 .01472 m
.29048 .01847 L
s
P
p
.001 w
.32857 .01472 m
.32857 .01847 L
s
P
p
.001 w
.36667 .01472 m
.36667 .01847 L
s
P
p
.001 w
.44286 .01472 m
.44286 .01847 L
s
P
p
.001 w
.48095 .01472 m
.48095 .01847 L
s
P
p
.001 w
.51905 .01472 m
.51905 .01847 L
s
P
p
.001 w
.55714 .01472 m
.55714 .01847 L
s
P
p
.001 w
.63333 .01472 m
.63333 .01847 L
s
P
p
.001 w
.67143 .01472 m
.67143 .01847 L
s
P
p
.001 w
.70952 .01472 m
.70952 .01847 L
s
P
p
.001 w
.74762 .01472 m
.74762 .01847 L
s
P
p
.001 w
.82381 .01472 m
.82381 .01847 L
s
P
p
.001 w
.8619 .01472 m
.8619 .01847 L
s
P
p
.001 w
.9 .01472 m
.9 .01847 L
s
P
p
.001 w
.9381 .01472 m
.9381 .01847 L
s
P
[(t/ms)] 1.025 .01472 -1 0 Mshowa
p
.002 w
0 .01472 m
1 .01472 L
s
P
[(First Latencies)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .12347 m
.03006 .12347 L
s
P
[(1)] .01131 .12347 1 0 Mshowa
p
.002 w
.02381 .23223 m
.03006 .23223 L
s
P
[(2)] .01131 .23223 1 0 Mshowa
p
.002 w
.02381 .34099 m
.03006 .34099 L
s
P
[(3)] .01131 .34099 1 0 Mshowa
p
.002 w
.02381 .44975 m
.03006 .44975 L
s
P
[(4)] .01131 .44975 1 0 Mshowa
p
.002 w
.02381 .55851 m
.03006 .55851 L
s
P
[(5)] .01131 .55851 1 0 Mshowa
p
.001 w
.02381 .03647 m
.02756 .03647 L
s
P
p
.001 w
.02381 .05822 m
.02756 .05822 L
s
P
p
.001 w
.02381 .07997 m
.02756 .07997 L
s
P
p
.001 w
.02381 .10172 m
.02756 .10172 L
s
P
p
.001 w
.02381 .14523 m
.02756 .14523 L
s
P
p
.001 w
.02381 .16698 m
.02756 .16698 L
s
P
p
.001 w
.02381 .18873 m
.02756 .18873 L
s
P
p
.001 w
.02381 .21048 m
.02756 .21048 L
s
P
p
.001 w
.02381 .25398 m
.02756 .25398 L
s
P
p
.001 w
.02381 .27574 m
.02756 .27574 L
s
P
p
.001 w
.02381 .29749 m
.02756 .29749 L
s
P
p
.001 w
.02381 .31924 m
.02756 .31924 L
s
P
p
.001 w
.02381 .36274 m
.02756 .36274 L
s
P
p
.001 w
.02381 .3845 m
.02756 .3845 L
s
P
p
.001 w
.02381 .40625 m
.02756 .40625 L
s
P
p
.001 w
.02381 .428 m
.02756 .428 L
s
P
p
.001 w
.02381 .4715 m
.02756 .4715 L
s
P
p
.001 w
.02381 .49325 m
.02756 .49325 L
s
P
p
.001 w
.02381 .51501 m
.02756 .51501 L
s
P
p
.001 w
.02381 .53676 m
.02756 .53676 L
s
P
p
.001 w
.02381 .58026 m
.02756 .58026 L
s
P
p
.001 w
.02381 .60201 m
.02756 .60201 L
s
P
[(PDF)] .02381 .61803 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
p
.004 w
.02381 .01472 m
.02505 .1421 L
.02629 .24476 L
.02753 .32718 L
.02877 .39312 L
.03001 .44557 L
.03125 .48703 L
.03249 .51953 L
.03373 .54469 L
.03497 .56386 L
.03621 .57818 L
.03745 .58854 L
.03869 .59569 L
.03993 .60022 L
.04117 .60264 L
.04241 .60332 L
.04365 .60261 L
.04489 .60077 L
.04613 .59804 L
.04737 .59459 L
.04861 .59056 L
.05357 .57079 L
.06349 .52506 L
.08333 .43844 L
.10317 .36581 L
.14286 .25579 L
.1627 .21452 L
.18254 .18029 L
.20238 .15193 L
.22222 .12842 L
.24206 .10896 L
.2619 .09287 L
.28175 .07956 L
.30159 .06851 L
.32143 .05936 L
.34127 .05176 L
.36111 .04546 L
.38095 .04026 L
.40079 .03594 L
.42063 .03234 L
.44048 .02935 L
.46032 .02687 L
.5 .02322 L
.51984 .02186 L
.53968 .02075 L
.55952 .01981 L
.57937 .01902 L
.59921 .01836 L
.61905 .01781 L
.63889 .01735 L
Mistroke
.65873 .01697 L
.67857 .01665 L
.69841 .0164 L
.71825 .01619 L
.7381 .01601 L
.75794 .01587 L
.77778 .01576 L
.79762 .01566 L
.81746 .01558 L
.85714 .01545 L
.89683 .01537 L
.91667 .01533 L
.93651 .01531 L
.97619 .01526 L
Mfstroke
P
P
% End of Graphics
MathPictureEnd

:[font = output; output; inactive; preserveAspect; endGroup]
Graphics["<<>>"]
;[o]
-Graphics-
:[font = text; inactive; preserveAspect]
Check the normalization:
:[font = input; preserveAspect; startGroup]
NIntegrate[myFL, {t, 0, 1000}, MaxRecursion -> 15]
:[font = output; output; inactive; preserveAspect; endGroup; endGroup]
0.999878946671809
;[o]
0.999879
:[font = subsection; inactive; Cclosed; preserveAspect; startGroup]
Double Pulses
:[font = text; inactive; preserveAspect]
All this was for a single square pulse transmitter concentration function, 1ms long, 1 mM high. But the Occupancy[] function allows for arbitrary transmitter concentration functions - exponentials, gaussians, multiple pulses, and others. So let us try a double pulse calculation.
;[s]
3:0,0;104,1;115,2;279,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = text; inactive; preserveAspect]
Construct a double square pulse transmitter concentration function with a pulse length of 1 millisecond, a pulse height of 1 mM, and a pulse distance of 8 milliseconds. We call it myDoublePulse, for example.
;[s]
3:0,0;180,1;193,2;207,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
myDoublePulse =
SquarePulseConcentration[t, 0.001, 1] +
SquarePulseConcentration[t - 9, 0.001, 1]
:[font = output; output; inactive; preserveAspect; endGroup]
0.0005*(-Sign[-10 + t] + Sign[-9 + t]) + 
  0.0005*(-Sign[-1 + t] + Sign[t])
;[o]
0.0005 (-Sign[-10 + t] + Sign[-9 + t]) + 
 
  0.0005 (-Sign[-1 + t] + Sign[t])
:[font = text; inactive; preserveAspect]
See what the concentration function looks like. Plot[] takes many options whose description in Wolfram is worth looking at (p. 137-143).
;[s]
3:0,0;48,1;54,2;136,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
Plot[myDoublePulse, {t, -1, 11},
     PlotRange -> All,
     AxesOrigin -> {-1, 0},
     AxesLabel -> {"t/ms", "c[t]/M"},
     PlotLabel -> "Transmitter Concentration"]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174]
%!
%%Creator: Mathematica
%%AspectRatio: .61803 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.103175 0.0793651 0.0147151 588.604 [
[(0)] .10317 .01472 0 2 Msboxa
[(2)] .2619 .01472 0 2 Msboxa
[(4)] .42063 .01472 0 2 Msboxa
[(6)] .57937 .01472 0 2 Msboxa
[(8)] .7381 .01472 0 2 Msboxa
[(10)] .89683 .01472 0 2 Msboxa
[(t/ms)] 1.025 .01472 -1 0 Msboxa
[(Transmitter Concentration)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(0.0002)] .01131 .13244 1 0 Msboxa
[(0.0004)] .01131 .25016 1 0 Msboxa
[(0.0006)] .01131 .36788 1 0 Msboxa
[(0.0008)] .01131 .4856 1 0 Msboxa
[(0.001)] .01131 .60332 1 0 Msboxa
[(c[t]/M)] .02381 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.10317 .01472 m
.10317 .02097 L
s
P
[(0)] .10317 .01472 0 2 Mshowa
p
.002 w
.2619 .01472 m
.2619 .02097 L
s
P
[(2)] .2619 .01472 0 2 Mshowa
p
.002 w
.42063 .01472 m
.42063 .02097 L
s
P
[(4)] .42063 .01472 0 2 Mshowa
p
.002 w
.57937 .01472 m
.57937 .02097 L
s
P
[(6)] .57937 .01472 0 2 Mshowa
p
.002 w
.7381 .01472 m
.7381 .02097 L
s
P
[(8)] .7381 .01472 0 2 Mshowa
p
.002 w
.89683 .01472 m
.89683 .02097 L
s
P
[(10)] .89683 .01472 0 2 Mshowa
p
.001 w
.13492 .01472 m
.13492 .01847 L
s
P
p
.001 w
.16667 .01472 m
.16667 .01847 L
s
P
p
.001 w
.19841 .01472 m
.19841 .01847 L
s
P
p
.001 w
.23016 .01472 m
.23016 .01847 L
s
P
p
.001 w
.29365 .01472 m
.29365 .01847 L
s
P
p
.001 w
.3254 .01472 m
.3254 .01847 L
s
P
p
.001 w
.35714 .01472 m
.35714 .01847 L
s
P
p
.001 w
.38889 .01472 m
.38889 .01847 L
s
P
p
.001 w
.45238 .01472 m
.45238 .01847 L
s
P
p
.001 w
.48413 .01472 m
.48413 .01847 L
s
P
p
.001 w
.51587 .01472 m
.51587 .01847 L
s
P
p
.001 w
.54762 .01472 m
.54762 .01847 L
s
P
p
.001 w
.61111 .01472 m
.61111 .01847 L
s
P
p
.001 w
.64286 .01472 m
.64286 .01847 L
s
P
p
.001 w
.6746 .01472 m
.6746 .01847 L
s
P
p
.001 w
.70635 .01472 m
.70635 .01847 L
s
P
p
.001 w
.76984 .01472 m
.76984 .01847 L
s
P
p
.001 w
.80159 .01472 m
.80159 .01847 L
s
P
p
.001 w
.83333 .01472 m
.83333 .01847 L
s
P
p
.001 w
.86508 .01472 m
.86508 .01847 L
s
P
p
.001 w
.07143 .01472 m
.07143 .01847 L
s
P
p
.001 w
.03968 .01472 m
.03968 .01847 L
s
P
p
.001 w
.00794 .01472 m
.00794 .01847 L
s
P
p
.001 w
.92857 .01472 m
.92857 .01847 L
s
P
p
.001 w
.96032 .01472 m
.96032 .01847 L
s
P
p
.001 w
.99206 .01472 m
.99206 .01847 L
s
P
[(t/ms)] 1.025 .01472 -1 0 Mshowa
p
.002 w
0 .01472 m
1 .01472 L
s
P
[(Transmitter Concentration)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .13244 m
.03006 .13244 L
s
P
[(0.0002)] .01131 .13244 1 0 Mshowa
p
.002 w
.02381 .25016 m
.03006 .25016 L
s
P
[(0.0004)] .01131 .25016 1 0 Mshowa
p
.002 w
.02381 .36788 m
.03006 .36788 L
s
P
[(0.0006)] .01131 .36788 1 0 Mshowa
p
.002 w
.02381 .4856 m
.03006 .4856 L
s
P
[(0.0008)] .01131 .4856 1 0 Mshowa
p
.002 w
.02381 .60332 m
.03006 .60332 L
s
P
[(0.001)] .01131 .60332 1 0 Mshowa
p
.001 w
.02381 .03826 m
.02756 .03826 L
s
P
p
.001 w
.02381 .0618 m
.02756 .0618 L
s
P
p
.001 w
.02381 .08535 m
.02756 .08535 L
s
P
p
.001 w
.02381 .10889 m
.02756 .10889 L
s
P
p
.001 w
.02381 .15598 m
.02756 .15598 L
s
P
p
.001 w
.02381 .17952 m
.02756 .17952 L
s
P
p
.001 w
.02381 .20307 m
.02756 .20307 L
s
P
p
.001 w
.02381 .22661 m
.02756 .22661 L
s
P
p
.001 w
.02381 .2737 m
.02756 .2737 L
s
P
p
.001 w
.02381 .29724 m
.02756 .29724 L
s
P
p
.001 w
.02381 .32079 m
.02756 .32079 L
s
P
p
.001 w
.02381 .34433 m
.02756 .34433 L
s
P
p
.001 w
.02381 .39142 m
.02756 .39142 L
s
P
p
.001 w
.02381 .41497 m
.02756 .41497 L
s
P
p
.001 w
.02381 .43851 m
.02756 .43851 L
s
P
p
.001 w
.02381 .46205 m
.02756 .46205 L
s
P
p
.001 w
.02381 .50914 m
.02756 .50914 L
s
P
p
.001 w
.02381 .53269 m
.02756 .53269 L
s
P
p
.001 w
.02381 .55623 m
.02756 .55623 L
s
P
p
.001 w
.02381 .57977 m
.02756 .57977 L
s
P
[(c[t]/M)] .02381 .61803 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
p
p
.004 w
.02381 .01472 m
.04365 .01472 L
.06349 .01472 L
.07341 .01472 L
.08333 .01472 L
.08829 .01472 L
.09325 .01472 L
.09573 .01472 L
.09821 .01472 L
.09945 .01472 L
.10069 .01472 L
.10317 .30902 L
.10441 .60332 L
.10565 .60332 L
.10813 .60332 L
.1131 .60332 L
.12302 .60332 L
.14286 .60332 L
.15278 .60332 L
.1627 .60332 L
.16766 .60332 L
.17262 .60332 L
.1751 .60332 L
.17758 .60332 L
.17882 .60332 L
.18006 .60332 L
.18254 .30902 L
.18378 .01472 L
.18502 .01472 L
.1875 .01472 L
.19246 .01472 L
.20238 .01472 L
.22222 .01472 L
.2619 .01472 L
.30159 .01472 L
.34127 .01472 L
.38095 .01472 L
.42063 .01472 L
.46032 .01472 L
.5 .01472 L
.53968 .01472 L
.57937 .01472 L
.61905 .01472 L
.65873 .01472 L
.69841 .01472 L
.7381 .01472 L
.75794 .01472 L
.77778 .01472 L
.7877 .01472 L
.79762 .01472 L
Mistroke
.80258 .01472 L
.80754 .01472 L
.81002 .01472 L
.8125 .01472 L
.81374 .01472 L
.81498 .01472 L
.81746 .30902 L
.8187 .60332 L
.81994 .60332 L
.82242 .60332 L
.82738 .60332 L
.8373 .60332 L
.85714 .60332 L
.86706 .60332 L
.87698 .60332 L
.88194 .60332 L
.8869 .60332 L
.88938 .60332 L
.89187 .60332 L
.89311 .60332 L
.89435 .60332 L
.89683 .30902 L
.89807 .01472 L
.89931 .01472 L
.90179 .01472 L
.90675 .01472 L
.91667 .01472 L
.93651 .01472 L
.97619 .01472 L
Mfstroke
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; preserveAspect; endGroup]
The Unformatted text for this cell was not generated.
Use options in the Actions Preferences dialog box to 
control when Unformatted text is generated.
;[o]
-Graphics-
:[font = text; inactive; preserveAspect]
Compute the occupancy for this double pulse concentration function in the time interval from 0 to 20.1 milliseconds.
:[font = input; preserveAspect]
myOcc = Occupancy[
q, initialOccupancy, c[t] -> myDoublePulse, {t, 20.1}];
:[font = text; inactive; preserveAspect]
But there is a possible pitfall. The stepsize adaption facility of the Runge-Kutta algorithm employed by Occupancy[] effectively assumes the transmitter concentration function to vary smoothly with time. Although the square pulse functions are essentially non-smooth, usually there is no problem at all. But in the case of two pulses, if the pulse distance is too great, the algorithm may miss the second pulse. If this happens, you must increase the accuracy demands on the algorithm using the options PrecisionGoal, AccuracyGoal, and MaxSteps. (PrecisionGoal -> n is an option to some numerical functions that states that the result of a computation should have n significant digits. AccuracyGoal -> n states that the result of a computation should have n significant digits at the right of the decimal point. MaxSteps -> limit causes Occupancy[] to terminate if it takes more than limit steps in t.) Specifying Occupancy[..., {t, 20.1}, PrecisionGoal -> 8, AccuracyGoal -> 8, MaxSteps -> 2000] or similar values should force the algorithm to use a stepsize small enough not to miss the second pulse. In Mathematica version 2.2, there is a new option MaxStepSize that can also be used to enforce small enough steps.
;[s]
27:0,0;105,1;116,2;503,3;516,4;518,5;530,6;536,7;544,8;547,9;565,10;686,11;703,12;812,13;829,14;837,15;848,16;884,17;889,18;899,19;900,20;914,21;996,22;1106,23;1117,24;1153,25;1164,26;1217,-1;
27:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = text; inactive; preserveAspect]
The new occupancy plot looks like this:
:[font = input; preserveAspect; startGroup]
OccupancyPlot[myOcc, stateConductivityList,
              {t, 20}, printerOption]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 0; pictureWidth = 450; pictureHeight = 194]
%!
%%Creator: Mathematica
%%AspectRatio: .43371 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.357978 0.334169 0.216854 0.334169 [
[ 0 0 0 0 ]
[ 1 .43371 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
P
p
% Start of sub-graphic
p
0.0238095 0.0103264 0.692147 0.423382 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.047619 0.00605916 0.605916 [
[(5)] .2619 .00606 0 2 Msboxa
[(10)] .5 .00606 0 2 Msboxa
[(15)] .7381 .00606 0 2 Msboxa
[(20)] .97619 .00606 0 2 Msboxa
[(t/ms)] 1.025 .00606 -1 0 Msboxa
[(Occupancy)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(0.2)] .01131 .12724 1 0 Msboxa
[(0.4)] .01131 .24843 1 0 Msboxa
[(0.6)] .01131 .36961 1 0 Msboxa
[(0.8)] .01131 .49079 1 0 Msboxa
[(1)] .01131 .61197 1 0 Msboxa
[(p[i])] .02381 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
p
.002 w
.2619 .00606 m
.2619 .01231 L
s
P
[(5)] .2619 .00606 0 2 Mshowa
p
.002 w
.5 .00606 m
.5 .01231 L
s
P
[(10)] .5 .00606 0 2 Mshowa
p
.002 w
.7381 .00606 m
.7381 .01231 L
s
P
[(15)] .7381 .00606 0 2 Mshowa
p
.002 w
.97619 .00606 m
.97619 .01231 L
s
P
[(20)] .97619 .00606 0 2 Mshowa
p
.001 w
.07143 .00606 m
.07143 .00981 L
s
P
p
.001 w
.11905 .00606 m
.11905 .00981 L
s
P
p
.001 w
.16667 .00606 m
.16667 .00981 L
s
P
p
.001 w
.21429 .00606 m
.21429 .00981 L
s
P
p
.001 w
.30952 .00606 m
.30952 .00981 L
s
P
p
.001 w
.35714 .00606 m
.35714 .00981 L
s
P
p
.001 w
.40476 .00606 m
.40476 .00981 L
s
P
p
.001 w
.45238 .00606 m
.45238 .00981 L
s
P
p
.001 w
.54762 .00606 m
.54762 .00981 L
s
P
p
.001 w
.59524 .00606 m
.59524 .00981 L
s
P
p
.001 w
.64286 .00606 m
.64286 .00981 L
s
P
p
.001 w
.69048 .00606 m
.69048 .00981 L
s
P
p
.001 w
.78571 .00606 m
.78571 .00981 L
s
P
p
.001 w
.83333 .00606 m
.83333 .00981 L
s
P
p
.001 w
.88095 .00606 m
.88095 .00981 L
s
P
p
.001 w
.92857 .00606 m
.92857 .00981 L
s
P
[(t/ms)] 1.025 .00606 -1 0 Mshowa
p
.002 w
0 .00606 m
1 .00606 L
s
P
[(Occupancy)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .12724 m
.03006 .12724 L
s
P
[(0.2)] .01131 .12724 1 0 Mshowa
p
.002 w
.02381 .24843 m
.03006 .24843 L
s
P
[(0.4)] .01131 .24843 1 0 Mshowa
p
.002 w
.02381 .36961 m
.03006 .36961 L
s
P
[(0.6)] .01131 .36961 1 0 Mshowa
p
.002 w
.02381 .49079 m
.03006 .49079 L
s
P
[(0.8)] .01131 .49079 1 0 Mshowa
p
.002 w
.02381 .61197 m
.03006 .61197 L
s
P
[(1)] .01131 .61197 1 0 Mshowa
p
.001 w
.02381 .0303 m
.02756 .0303 L
s
P
p
.001 w
.02381 .05453 m
.02756 .05453 L
s
P
p
.001 w
.02381 .07877 m
.02756 .07877 L
s
P
p
.001 w
.02381 .10301 m
.02756 .10301 L
s
P
p
.001 w
.02381 .15148 m
.02756 .15148 L
s
P
p
.001 w
.02381 .17572 m
.02756 .17572 L
s
P
p
.001 w
.02381 .19995 m
.02756 .19995 L
s
P
p
.001 w
.02381 .22419 m
.02756 .22419 L
s
P
p
.001 w
.02381 .27266 m
.02756 .27266 L
s
P
p
.001 w
.02381 .2969 m
.02756 .2969 L
s
P
p
.001 w
.02381 .32114 m
.02756 .32114 L
s
P
p
.001 w
.02381 .34537 m
.02756 .34537 L
s
P
p
.001 w
.02381 .39385 m
.02756 .39385 L
s
P
p
.001 w
.02381 .41808 m
.02756 .41808 L
s
P
p
.001 w
.02381 .44232 m
.02756 .44232 L
s
P
p
.001 w
.02381 .46656 m
.02756 .46656 L
s
P
p
.001 w
.02381 .51503 m
.02756 .51503 L
s
P
p
.001 w
.02381 .53926 m
.02756 .53926 L
s
P
p
.001 w
.02381 .5635 m
.02756 .5635 L
s
P
p
.001 w
.02381 .58774 m
.02756 .58774 L
s
P
[(p[i])] .02381 .61803 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
p
p
.004 w
.02381 .00606 m
.02505 .42486 L
.02629 .4689 L
.02753 .49837 L
.02877 .52137 L
.03001 .53938 L
.03125 .55349 L
.03249 .56456 L
.03373 .57323 L
.03497 .58002 L
.03621 .58535 L
.03745 .58951 L
.03869 .59279 L
.03993 .59536 L
.04117 .59737 L
.04241 .59896 L
.04365 .60018 L
.04613 .60191 L
.04737 .60252 L
.04861 .603 L
.04985 .60339 L
.05109 .6037 L
.05357 .60414 L
.05481 .6043 L
.05605 .60442 L
.05729 .60453 L
.05853 .60462 L
.06101 .60476 L
.06349 .60486 L
.06845 .60501 L
.06969 .60504 L
.07093 .60507 L
.07217 .59743 L
.07341 .59106 L
.07589 .58291 L
.07837 .57546 L
.08333 .56107 L
.10317 .5092 L
.14286 .42849 L
.18254 .37061 L
.22222 .32882 L
.2619 .29842 L
.30159 .27602 L
.34127 .25926 L
.38095 .2465 L
.42063 .23658 L
.43056 .23433 L
.44048 .2323 L
.44544 .23134 L
.44792 .23086 L
Mistroke
.4504 .23039 L
.45164 .23016 L
.45288 .43358 L
.45412 .5074 L
.45536 .5296 L
.4566 .54636 L
.45784 .55947 L
.45908 .56973 L
.46032 .57778 L
.46156 .58409 L
.4628 .58902 L
.46404 .59289 L
.46528 .59593 L
.46652 .59831 L
.46776 .60018 L
.469 .60164 L
.47024 .60278 L
.47272 .60437 L
.47396 .60493 L
.4752 .60538 L
.47644 .60573 L
.47768 .60601 L
.48016 .60641 L
.4814 .60655 L
.48264 .60667 L
.48388 .60676 L
.48512 .60684 L
.4876 .60695 L
.48884 .607 L
.49008 .60703 L
.49504 .60714 L
.49628 .60716 L
.49752 .60718 L
.49876 .6072 L
.5 .6072 L
.50124 .59985 L
.50248 .59629 L
.50496 .59088 L
.50992 .58074 L
.51984 .56168 L
.53968 .52786 L
.57937 .47459 L
.61905 .4356 L
.65873 .40659 L
.69841 .38468 L
.7381 .36778 L
.77778 .35442 L
.81746 .34355 L
.85714 .33448 L
.89683 .32671 L
Mistroke
.93651 .31988 L
.97619 .31373 L
Mfstroke
P
P
p
[ .05 .05 ] 0 setdash
p
.004 w
.02381 .61197 m
.02505 .19318 L
.02629 .14914 L
.02753 .11966 L
.02877 .09666 L
.03001 .07866 L
.03125 .06454 L
.03249 .05347 L
.03373 .0448 L
.03497 .03801 L
.03621 .03268 L
.03745 .02853 L
.03869 .02524 L
.03993 .02268 L
.04117 .02067 L
.04241 .01908 L
.04365 .01785 L
.04613 .01613 L
.04737 .01552 L
.04861 .01503 L
.04985 .01465 L
.05109 .01434 L
.05357 .0139 L
.05481 .01374 L
.05605 .01361 L
.05729 .0135 L
.05853 .01341 L
.06101 .01328 L
.06349 .01317 L
.06845 .01302 L
.06969 .01299 L
.07093 .01297 L
.07217 .0206 L
.07341 .02697 L
.07589 .03512 L
.07837 .04257 L
.08333 .05696 L
.10317 .10883 L
.14286 .18955 L
.18254 .24742 L
.22222 .28922 L
.2619 .31962 L
.30159 .34202 L
.34127 .35878 L
.38095 .37153 L
.42063 .38145 L
.43056 .3837 L
.44048 .38573 L
.44544 .3867 L
.44792 .38717 L
Mistroke
.4504 .38764 L
.45164 .38788 L
.45288 .18446 L
.45412 .11064 L
.45536 .08844 L
.4566 .07168 L
.45784 .05856 L
.45908 .04831 L
.46032 .04025 L
.46156 .03394 L
.4628 .02901 L
.46404 .02514 L
.46528 .02211 L
.46652 .01972 L
.46776 .01785 L
.469 .01639 L
.47024 .01525 L
.47272 .01366 L
.47396 .0131 L
.4752 .01265 L
.47644 .0123 L
.47768 .01202 L
.48016 .01162 L
.4814 .01148 L
.48264 .01137 L
.48388 .01127 L
.48512 .0112 L
.4876 .01108 L
.48884 .01104 L
.49008 .011 L
.49504 .01089 L
.49628 .01087 L
.49752 .01085 L
.49876 .01083 L
.5 .01083 L
.50124 .01818 L
.50248 .02174 L
.50496 .02716 L
.50992 .03729 L
.51984 .05636 L
.53968 .09017 L
.57937 .14345 L
.61905 .18244 L
.65873 .21145 L
.69841 .23335 L
.7381 .25025 L
.77778 .26361 L
.81746 .27448 L
.85714 .28356 L
.89683 .29132 L
Mistroke
.93651 .29815 L
.97619 .3043 L
Mfstroke
P
P
p
[ .01 .01 ] 0 setdash
p
.004 w
.02381 .00606 m
.02505 .32718 L
.02629 .26644 L
.02753 .21335 L
.02877 .17169 L
.03001 .13904 L
.03125 .11345 L
.03249 .09338 L
.03373 .07766 L
.03497 .06536 L
.03621 .0557 L
.03745 .04811 L
.03869 .04221 L
.03993 .03755 L
.04117 .03391 L
.04241 .03107 L
.04365 .02885 L
.04489 .02707 L
.04613 .02566 L
.04737 .02455 L
.04861 .02367 L
.04985 .02297 L
.05109 .02241 L
.05357 .0216 L
.05481 .0213 L
.05605 .02107 L
.05729 .02087 L
.05853 .0207 L
.06101 .02044 L
.06349 .02025 L
.06845 .01997 L
.06969 .01991 L
.07093 .01985 L
.07217 .013 L
.07341 .00975 L
.07465 .00911 L
.07589 .00897 L
.07713 .00892 L
.07837 .00888 L
.08333 .00876 L
.10317 .00834 L
.14286 .00769 L
.18254 .00723 L
.22222 .00691 L
.2619 .00668 L
.30159 .00652 L
.34127 .00641 L
.38095 .00633 L
.42063 .00627 L
.43056 .00626 L
Mistroke
.44048 .00625 L
.44544 .00624 L
.44792 .00624 L
.4504 .00624 L
.45164 .00624 L
.45288 .19242 L
.45536 .15628 L
.4566 .12594 L
.45784 .10222 L
.45908 .08358 L
.46032 .06899 L
.46156 .05755 L
.4628 .04862 L
.46404 .0416 L
.46528 .03609 L
.46652 .03177 L
.46776 .02838 L
.469 .02574 L
.47024 .02368 L
.47148 .02206 L
.47272 .02077 L
.47396 .01975 L
.4752 .01894 L
.47644 .0183 L
.47768 .01779 L
.48016 .01706 L
.4814 .0168 L
.48264 .01659 L
.48388 .01642 L
.48512 .01628 L
.4876 .01606 L
.48884 .01598 L
.49008 .01591 L
.49504 .0157 L
.49752 .01562 L
.49876 .01559 L
.5 .01554 L
.50124 .00952 L
.50248 .00834 L
.50372 .00811 L
.50496 .00805 L
.50744 .008 L
.50992 .00796 L
.51984 .00781 L
.53968 .00755 L
.55952 .00733 L
.57937 .00715 L
.61905 .00686 L
.65873 .00666 L
.69841 .00652 L
Mistroke
.7381 .00642 L
.77778 .00635 L
.81746 .0063 L
.85714 .00626 L
.89683 .00623 L
.91667 .00622 L
.93651 .00621 L
.97619 .0062 L
Mfstroke
P
P
p
[ .01 .05 ] 0 setdash
p
.004 w
.02381 .00606 m
.02629 .0644 L
.02753 .08861 L
.02877 .10789 L
.03125 .13572 L
.03249 .14576 L
.03373 .15394 L
.03621 .16624 L
.03869 .17489 L
.04117 .18131 L
.04365 .18633 L
.05357 .2006 L
.06349 .21201 L
.06845 .21742 L
.06969 .21876 L
.07093 .22008 L
.07217 .22116 L
.07341 .22155 L
.07589 .22198 L
.07837 .22235 L
.08333 .22305 L
.10317 .22538 L
.1131 .22629 L
.12302 .22705 L
.13294 .22767 L
.14286 .22816 L
.15278 .22854 L
.15774 .22869 L
.1627 .22881 L
.16766 .22891 L
.17262 .22899 L
.1751 .22902 L
.17758 .22904 L
.18006 .22906 L
.1813 .22907 L
.18254 .22908 L
.18378 .22908 L
.18502 .22909 L
.18626 .22909 L
.1875 .22909 L
.18874 .22909 L
.18998 .22909 L
.19122 .22909 L
.19246 .22909 L
.19494 .22908 L
.19618 .22907 L
.19742 .22907 L
.20238 .22903 L
.20486 .229 L
.20734 .22897 L
Mistroke
.2123 .2289 L
.22222 .22871 L
.23214 .22846 L
.24206 .22816 L
.2619 .22744 L
.30159 .22555 L
.34127 .22326 L
.38095 .22068 L
.42063 .21792 L
.43056 .21717 L
.44048 .21645 L
.44544 .21609 L
.44792 .21591 L
.4504 .21573 L
.45164 .21564 L
.45288 .22055 L
.45412 .24127 L
.45536 .2587 L
.45784 .28362 L
.45908 .29248 L
.46032 .29961 L
.46156 .3054 L
.4628 .31011 L
.46528 .31724 L
.46776 .32231 L
.47024 .32607 L
.4752 .33156 L
.48016 .33579 L
.49008 .34295 L
.49504 .3463 L
.49752 .34794 L
.49876 .34876 L
.5 .34957 L
.50124 .34998 L
.50248 .35008 L
.50372 .35013 L
.50496 .35016 L
.50744 .35021 L
.50992 .35025 L
.5124 .35028 L
.51488 .35031 L
.51612 .35032 L
.51736 .35033 L
.5186 .35034 L
.51984 .35034 L
.52108 .35034 L
.52232 .35035 L
.52356 .35034 L
.5248 .35034 L
.52604 .35034 L
Mistroke
.52728 .35033 L
.52976 .35031 L
.53224 .35029 L
.53472 .35026 L
.53968 .35018 L
.54464 .35007 L
.5496 .34994 L
.55952 .34962 L
.57937 .34872 L
.59921 .34754 L
.61905 .34614 L
.65873 .34282 L
.69841 .33899 L
.7381 .33483 L
.77778 .33046 L
.81746 .32596 L
.85714 .32139 L
.89683 .31679 L
.93651 .3122 L
.97619 .30763 L
Mfstroke
P
P
p
[ .01 .02 .05 .02 ] 0 setdash
p
.004 w
.02381 .00606 m
.02629 .15018 L
.02753 .20854 L
.02877 .25391 L
.03001 .28914 L
.03125 .31644 L
.03249 .33755 L
.03373 .35376 L
.03497 .36613 L
.03621 .37554 L
.03745 .3826 L
.03869 .38781 L
.03993 .3916 L
.04117 .39427 L
.04241 .39605 L
.04365 .39712 L
.04489 .39769 L
.04613 .39785 L
.04737 .39769 L
.04861 .39728 L
.05357 .39405 L
.05853 .3896 L
.06349 .38472 L
.06845 .37974 L
.06969 .37849 L
.07093 .37725 L
.07341 .37188 L
.08333 .34137 L
.10317 .2876 L
.14286 .20475 L
.18254 .14642 L
.20238 .12407 L
.22222 .10532 L
.2619 .07642 L
.30159 .05606 L
.32143 .04826 L
.34127 .04171 L
.36111 .03622 L
.38095 .03162 L
.42063 .02451 L
.43056 .02302 L
.44048 .02172 L
.44544 .02112 L
.44792 .02083 L
.4504 .02054 L
.45164 .0204 L
.45288 .03273 L
.45412 .08413 L
.45536 .12674 L
.4566 .15996 L
Mistroke
.45784 .18575 L
.45908 .20579 L
.46032 .22129 L
.46156 .23326 L
.4628 .24241 L
.46404 .24941 L
.46528 .25471 L
.46652 .25869 L
.46776 .26161 L
.469 .26371 L
.47024 .26515 L
.47148 .2661 L
.47272 .26666 L
.47396 .26694 L
.4752 .26699 L
.47644 .26685 L
.47768 .26657 L
.48016 .26569 L
.48264 .26452 L
.48512 .26319 L
.49008 .26029 L
.49504 .25726 L
.49752 .25574 L
.49876 .25498 L
.5 .25422 L
.50248 .24999 L
.50496 .24479 L
.50992 .23464 L
.51984 .21564 L
.53968 .18225 L
.55952 .15425 L
.57937 .13084 L
.61905 .09471 L
.63889 .08085 L
.65873 .06922 L
.69841 .05129 L
.7381 .03865 L
.77778 .02974 L
.81746 .02342 L
.8373 .02098 L
.85714 .01895 L
.87698 .01723 L
.89683 .0158 L
.93651 .01359 L
.97619 .01202 L
Mfstroke
P
P
P
MathSubEnd
P
% End of sub-graphic
p
p
.70886 .06648 m
.70886 .33381 L
.97619 .33381 L
.97619 .06648 L
F
1 g
.69215 .08319 m
.69215 .35052 L
.95948 .35052 L
.95948 .08319 L
F
0 g
.001 w
.69215 .08319 m
.95948 .08319 L
.95948 .35052 L
.69215 .35052 L
.69215 .08319 L
s
% Start of sub-graphic
p
0.692147 0.0831865 0.959482 0.350522 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0297619 0.297619 0.0166667 0.166667 [
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 1 L
0 1 L
closepath
clip
newpath
p
p
p
% Start of sub-graphic
p
0.0535714 0.03 0.35119 0.196667 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
[ .06667 .13333 .33333 .13333 ] 0 setdash
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[O])] .38988 .11333 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.223333 0.35119 0.39 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
[ .06667 .33333 ] 0 setdash
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[C3])] .38988 .30667 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.416667 0.35119 0.583333 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
[ .06667 .06667 ] 0 setdash
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[C2])] .38988 .5 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.61 0.35119 0.776667 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
[ .33333 .33333 ] 0 setdash
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[C1])] .38988 .69333 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.803333 0.35119 0.97 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(1 - p[C1])] .38988 .88667 -1 0 Mshowa
P
P
p
P
P
MathSubEnd
P
% End of sub-graphic
P
P
P
0 0 m
1 0 L
1 .43371 L
0 .43371 L
closepath
clip
newpath
% End of Graphics
MathPictureEnd
:[font = output; output; inactive; preserveAspect; endGroup]
The Unformatted text for this cell was not generated.
Use options in the Actions Preferences dialog box to 
control when Unformatted text is generated.
;[o]
-Graphics-
:[font = text; inactive; preserveAspect; endGroup]
We see that, even with no increased setting of AccuracyGoal and PrecisionGoal, the second pulse has not been missed in this case.
;[s]
5:0,0;47,1;59,2;64,3;77,4;129,-1;
5:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = subsection; inactive; Cclosed; preserveAspect; startGroup]
Open channel (and other) blockers can be modeled easily:
:[font = input; preserveAspect]
Needs["ChannelKinetics`DiagramToQMatrix`"]
:[font = text; inactive; preserveAspect]
Add a blocked state B to the transition diagram:
;[s]
3:0,0;20,1;21,2;48,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect]
diagram =
{ (* must be rectangular *)
  {C1, connected, C2       , connected, O        },
  {  ,          , connected,          , connected},
  {  ,          , C3       ,          , B        }
};

stateConductivityList = { (* conductivity in pS *)
                          {C1, 0},
                          {C2, 0},
                          {C3, 0},
                          {O,  8},
                          {B,  0}
                        };

initialOccupancy = {1, 0, 0, 0, 0};
:[font = input; preserveAspect; startGroup]
qB = DiagramToQMatrix[diagram, stateConductivityList]
:[font = print; inactive; preserveAspect]
C1     |==|   C2     |==|   O

              |==|          |==|

              C3            B

List of transition rates: 

k[C1, C2] = 100000. c[t] ms^-1
k[C2, C1] = 50. ms^-1
k[C2, O] = 10. ms^-1
k[O, C2] = 0.5 ms^-1
k[C2, C3] = 4. ms^-1
k[C3, C2] = 0.02 ms^-1
k[O, B] = 50000. b[t] ms^-1
k[B, O] = 0.01 ms^-1
:[font = output; output; inactive; preserveAspect; endGroup]
{{-100000.*c[t], 100000.*c[t], 0, 0, 0}, 
  {50., -64.00000000000001, 4., 10., 0}, 
  {0, 0.02, -0.02, 0, 0}, 
  {0, 0.5, 0, -0.5 - 50000.*b[t], 50000.*b[t]}, 
  {0, 0, 0, 0.01, -0.01}}
;[o]
{{-100000. c[t], 100000. c[t], 0, 0, 0}, 
 
  {50., -64., 4., 10., 0}, {0, 0.02, -0.02, 0, 0}, 
 
  {0, 0.5, 0, -0.5 - 50000. b[t], 50000. b[t]}, 
 
  {0, 0, 0, 0.01, -0.01}}
:[font = text; inactive; preserveAspect]

Now we can always refer to this Q-matrix as qB.
;[s]
3:0,0;45,1;47,2;48,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
qB
:[font = output; output; inactive; preserveAspect; endGroup]
{{-100000.*c[t], 100000.*c[t], 0, 0, 0}, 
  {50., -64.00000000000001, 4., 10., 0}, 
  {0, 0.02, -0.02, 0, 0}, 
  {0, 0.5, 0, -0.5 - 50000.*b[t], 50000.*b[t]}, 
  {0, 0, 0, 0.01, -0.01}}
;[o]
{{-100000. c[t], 100000. c[t], 0, 0, 0}, 
 
  {50., -64., 4., 10., 0}, {0, 0.02, -0.02, 0, 0}, 
 
  {0, 0.5, 0, -0.5 - 50000. b[t], 50000. b[t]}, 
 
  {0, 0, 0, 0.01, -0.01}}
:[font = input; preserveAspect; startGroup]
MatrixForm[qB]
:[font = output; output; inactive; preserveAspect; fontSize = 9; endGroup]
MatrixForm[{{-100000.*c[t], 100000.*c[t], 0, 0, 0}, {50., -64.00000000000001, 4., 10., 0}, 
 
   {0, 0.02, -0.02, 0, 0}, {0, 0.5, 0, -0.5 - 50000.*b[t], 50000.*b[t]}, {0, 0, 0, 0.01, -0.01}}]
;[o]
-100000. c[t]        100000. c[t]         0                    0                    0

50.                  -64.                 4.                   10.                  0

0                    0.02                 -0.02                0                    0

0                    0.5                  0                    -0.5 - 50000. b[t]   50000. b[t]

0                    0                    0                    0.01                 -0.01
:[font = input; preserveAspect; fontLeading = 0]
qB = {{-100000.*c[t], 100000.*c[t], 0, 0, 0},
      {50., -64., 4., 10., 0},
      {0, 0.02, -0.02, 0, 0},
      {0, 0.5, 0, -0.5 - 50000.*b[t], 50000.*b[t]},
      {0, 0, 0, 0.01, -0.01}};
:[font = text; inactive; preserveAspect]
We construct two square pulse transmitter concentration functions: one with a pulse length of 1 millisecond and a pulse height of 1 mM (glutamate), and another with a pulse length of 10.1 ms and a height of 0.01 mM (blocker).
;[s]
5:0,0;136,1;145,2;216,3;223,4;225,-1;
5:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
glutamate = SquarePulseConcentration[t, 0.001, 1]
:[font = output; output; inactive; preserveAspect; endGroup]
0.0005*(-Sign[-1 + t] + Sign[t])
;[o]
0.0005 (-Sign[-1 + t] + Sign[t])
:[font = input; preserveAspect; startGroup]
blocker = SquarePulseConcentration[t, 0.00001, 10.1]
:[font = output; output; inactive; preserveAspect; endGroup]
5.*10^-6*(-Sign[-10.1 + t] + Sign[t])
;[o]
     -6
5. 10   (-Sign[-10.1 + t] + Sign[t])
:[font = text; inactive; preserveAspect]
The actual computation of the occupancies as a function of time is done by this function.
:[font = input; preserveAspect]
myOcc = Occupancy[qB, initialOccupancy,
                  {c[t] -> glutamate, b[t] -> blocker},
                  {t, 10.1}];
:[font = text; inactive; preserveAspect]
This makes a color plot.
:[font = input; preserveAspect; startGroup]
OccupancyPlot[myOcc, stateConductivityList,
              {t, 10}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 0; pictureWidth = 448; pictureHeight = 194]
%!
%%Creator: Mathematica
%%AspectRatio: .43371 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.357978 0.334169 0.216854 0.334169 [
[ 0 0 0 0 ]
[ 1 .43371 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
P
p
% Start of sub-graphic
p
0.0238095 0.0103264 0.692147 0.423382 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.0952381 0.00605916 0.605916 [
[(2)] .21429 .00606 0 2 Msboxa
[(4)] .40476 .00606 0 2 Msboxa
[(6)] .59524 .00606 0 2 Msboxa
[(8)] .78571 .00606 0 2 Msboxa
[(10)] .97619 .00606 0 2 Msboxa
[(t/ms)] 1.025 .00606 -1 0 Msboxa
[(Occupancy)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(0.2)] .01131 .12724 1 0 Msboxa
[(0.4)] .01131 .24843 1 0 Msboxa
[(0.6)] .01131 .36961 1 0 Msboxa
[(0.8)] .01131 .49079 1 0 Msboxa
[(1)] .01131 .61197 1 0 Msboxa
[(p[i])] .02381 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
p
.002 w
.21429 .00606 m
.21429 .01231 L
s
P
[(2)] .21429 .00606 0 2 Mshowa
p
.002 w
.40476 .00606 m
.40476 .01231 L
s
P
[(4)] .40476 .00606 0 2 Mshowa
p
.002 w
.59524 .00606 m
.59524 .01231 L
s
P
[(6)] .59524 .00606 0 2 Mshowa
p
.002 w
.78571 .00606 m
.78571 .01231 L
s
P
[(8)] .78571 .00606 0 2 Mshowa
p
.002 w
.97619 .00606 m
.97619 .01231 L
s
P
[(10)] .97619 .00606 0 2 Mshowa
p
.001 w
.0619 .00606 m
.0619 .00981 L
s
P
p
.001 w
.1 .00606 m
.1 .00981 L
s
P
p
.001 w
.1381 .00606 m
.1381 .00981 L
s
P
p
.001 w
.17619 .00606 m
.17619 .00981 L
s
P
p
.001 w
.25238 .00606 m
.25238 .00981 L
s
P
p
.001 w
.29048 .00606 m
.29048 .00981 L
s
P
p
.001 w
.32857 .00606 m
.32857 .00981 L
s
P
p
.001 w
.36667 .00606 m
.36667 .00981 L
s
P
p
.001 w
.44286 .00606 m
.44286 .00981 L
s
P
p
.001 w
.48095 .00606 m
.48095 .00981 L
s
P
p
.001 w
.51905 .00606 m
.51905 .00981 L
s
P
p
.001 w
.55714 .00606 m
.55714 .00981 L
s
P
p
.001 w
.63333 .00606 m
.63333 .00981 L
s
P
p
.001 w
.67143 .00606 m
.67143 .00981 L
s
P
p
.001 w
.70952 .00606 m
.70952 .00981 L
s
P
p
.001 w
.74762 .00606 m
.74762 .00981 L
s
P
p
.001 w
.82381 .00606 m
.82381 .00981 L
s
P
p
.001 w
.8619 .00606 m
.8619 .00981 L
s
P
p
.001 w
.9 .00606 m
.9 .00981 L
s
P
p
.001 w
.9381 .00606 m
.9381 .00981 L
s
P
[(t/ms)] 1.025 .00606 -1 0 Mshowa
p
.002 w
0 .00606 m
1 .00606 L
s
P
[(Occupancy)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .12724 m
.03006 .12724 L
s
P
[(0.2)] .01131 .12724 1 0 Mshowa
p
.002 w
.02381 .24843 m
.03006 .24843 L
s
P
[(0.4)] .01131 .24843 1 0 Mshowa
p
.002 w
.02381 .36961 m
.03006 .36961 L
s
P
[(0.6)] .01131 .36961 1 0 Mshowa
p
.002 w
.02381 .49079 m
.03006 .49079 L
s
P
[(0.8)] .01131 .49079 1 0 Mshowa
p
.002 w
.02381 .61197 m
.03006 .61197 L
s
P
[(1)] .01131 .61197 1 0 Mshowa
p
.001 w
.02381 .0303 m
.02756 .0303 L
s
P
p
.001 w
.02381 .05453 m
.02756 .05453 L
s
P
p
.001 w
.02381 .07877 m
.02756 .07877 L
s
P
p
.001 w
.02381 .10301 m
.02756 .10301 L
s
P
p
.001 w
.02381 .15148 m
.02756 .15148 L
s
P
p
.001 w
.02381 .17572 m
.02756 .17572 L
s
P
p
.001 w
.02381 .19995 m
.02756 .19995 L
s
P
p
.001 w
.02381 .22419 m
.02756 .22419 L
s
P
p
.001 w
.02381 .27266 m
.02756 .27266 L
s
P
p
.001 w
.02381 .2969 m
.02756 .2969 L
s
P
p
.001 w
.02381 .32114 m
.02756 .32114 L
s
P
p
.001 w
.02381 .34537 m
.02756 .34537 L
s
P
p
.001 w
.02381 .39385 m
.02756 .39385 L
s
P
p
.001 w
.02381 .41808 m
.02756 .41808 L
s
P
p
.001 w
.02381 .44232 m
.02756 .44232 L
s
P
p
.001 w
.02381 .46656 m
.02756 .46656 L
s
P
p
.001 w
.02381 .51503 m
.02756 .51503 L
s
P
p
.001 w
.02381 .53926 m
.02756 .53926 L
s
P
p
.001 w
.02381 .5635 m
.02756 .5635 L
s
P
p
.001 w
.02381 .58774 m
.02756 .58774 L
s
P
[(p[i])] .02381 .61803 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
p
p
.004 w
.02381 .00606 m
.02505 .35886 L
.02629 .42486 L
.02877 .4689 L
.03001 .48458 L
.03125 .49839 L
.03373 .5214 L
.03621 .53942 L
.03869 .55357 L
.04117 .56468 L
.04365 .57338 L
.04613 .58023 L
.04861 .58561 L
.05109 .58985 L
.05357 .59315 L
.05853 .59784 L
.06101 .5995 L
.06349 .60082 L
.06597 .60187 L
.06845 .60271 L
.07093 .60339 L
.07341 .60394 L
.07837 .60478 L
.08333 .60536 L
.08829 .60579 L
.09325 .60612 L
.10317 .60658 L
.10813 .60677 L
.1131 .60694 L
.11558 .60703 L
.11682 .60707 L
.11806 .60711 L
.12054 .60181 L
.12178 .59932 L
.12302 .5975 L
.1255 .59469 L
.12798 .5922 L
.13294 .5875 L
.14286 .57873 L
.1627 .56342 L
.18254 .55063 L
.22222 .53091 L
.2619 .51688 L
.30159 .50671 L
.34127 .49917 L
.38095 .49344 L
.42063 .48894 L
.46032 .48527 L
.5 .48217 L
.53968 .47947 L
Mistroke
.57937 .47704 L
.61905 .4748 L
.65873 .47269 L
.69841 .47067 L
.7381 .46872 L
.77778 .46681 L
.81746 .46494 L
.85714 .4631 L
.89683 .46128 L
.93651 .45948 L
.97619 .4577 L
Mfstroke
P
P
p
1 0 0 r
p
.004 w
.02381 .61197 m
.02505 .25918 L
.02629 .19318 L
.02877 .14913 L
.03001 .13345 L
.03125 .11965 L
.03373 .09664 L
.03621 .07861 L
.03869 .06446 L
.04117 .05336 L
.04365 .04465 L
.04613 .0378 L
.04861 .03243 L
.05109 .02819 L
.05357 .02488 L
.05853 .02019 L
.06101 .01853 L
.06349 .01722 L
.06597 .01617 L
.06845 .01533 L
.07093 .01465 L
.07341 .01409 L
.07837 .01326 L
.08333 .01267 L
.08829 .01224 L
.09325 .01192 L
.10317 .01145 L
.10813 .01126 L
.1131 .01109 L
.11558 .01101 L
.11682 .01097 L
.11806 .01093 L
.12054 .01622 L
.12178 .01871 L
.12302 .02053 L
.1255 .02335 L
.12798 .02583 L
.13294 .03053 L
.14286 .0393 L
.1627 .05462 L
.18254 .0674 L
.22222 .08712 L
.2619 .10115 L
.30159 .11132 L
.34127 .11886 L
.38095 .12459 L
.42063 .1291 L
.46032 .13276 L
.5 .13586 L
.53968 .13856 L
Mistroke
.57937 .14099 L
.61905 .14324 L
.65873 .14535 L
.69841 .14737 L
.7381 .14932 L
.77778 .15122 L
.81746 .15309 L
.85714 .15493 L
.89683 .15675 L
.93651 .15855 L
.97619 .16034 L
Mfstroke
P
P
p
.8 1 0 r
p
.004 w
.02381 .00606 m
.02505 .32004 L
.02629 .32718 L
.02877 .26643 L
.03125 .21331 L
.03373 .17162 L
.03621 .13892 L
.03869 .11327 L
.04117 .09312 L
.04365 .07729 L
.04613 .0649 L
.04861 .05516 L
.05109 .04753 L
.05357 .04148 L
.05605 .03668 L
.05853 .03289 L
.06101 .02988 L
.06349 .02748 L
.06597 .02555 L
.06845 .02401 L
.07093 .02276 L
.07341 .02174 L
.07837 .02019 L
.08333 .01909 L
.08829 .01828 L
.09325 .01767 L
.10317 .01676 L
.10813 .01639 L
.1131 .01606 L
.11558 .01589 L
.11682 .01581 L
.11806 .01574 L
.1193 .01452 L
.12054 .01082 L
.12178 .00924 L
.12302 .00851 L
.12426 .00819 L
.1255 .00804 L
.12674 .00796 L
.12798 .00792 L
.13294 .00782 L
.14286 .00766 L
.1627 .0074 L
.18254 .00718 L
.22222 .00685 L
.24206 .00673 L
.2619 .00663 L
.28175 .00654 L
.30159 .00648 L
.32143 .00642 L
Mistroke
.34127 .00637 L
.36111 .00633 L
.38095 .0063 L
.40079 .00627 L
.42063 .00625 L
.44048 .00623 L
.46032 .00622 L
.48016 .00621 L
.5 .0062 L
.51984 .00619 L
.53968 .00618 L
.55952 .00618 L
.57937 .00617 L
.59921 .00617 L
.61905 .00616 L
.65873 .00616 L
.69841 .00615 L
.7381 .00615 L
.77778 .00615 L
.81746 .00615 L
.85714 .00615 L
.89683 .00615 L
.91667 .00615 L
.92659 .00615 L
.93651 .00615 L
.94147 .00614 L
.94395 .00614 L
.94643 .00614 L
.94767 .00614 L
.94891 .00614 L
.95015 .00614 L
.95139 .00614 L
.95263 .00614 L
.95387 .00614 L
.95511 .00614 L
.95635 .00614 L
.95759 .00614 L
.95883 .00614 L
.96007 .00614 L
.96131 .00614 L
.96255 .00614 L
.96379 .00614 L
.96503 .00614 L
.96627 .00614 L
.96875 .00614 L
.97123 .00614 L
.97371 .00614 L
.97619 .00614 L
Mfstroke
P
P
p
0 1 .4 r
p
.004 w
.02381 .00606 m
.02877 .0644 L
.03373 .10788 L
.03621 .1233 L
.03869 .13568 L
.04117 .1457 L
.04365 .15385 L
.04861 .16603 L
.05109 .17064 L
.05357 .17452 L
.05853 .18074 L
.06349 .18553 L
.07341 .19269 L
.08333 .19822 L
.10317 .20715 L
.1131 .21103 L
.11558 .21195 L
.11806 .21286 L
.1193 .2133 L
.12054 .21358 L
.12178 .21372 L
.12302 .21381 L
.1255 .21393 L
.12798 .21402 L
.13294 .21418 L
.14286 .21445 L
.15278 .21465 L
.1627 .2148 L
.16766 .21486 L
.17262 .2149 L
.17758 .21493 L
.18006 .21495 L
.18254 .21496 L
.18502 .21496 L
.18626 .21496 L
.1875 .21497 L
.18874 .21497 L
.18998 .21497 L
.19122 .21497 L
.19246 .21497 L
.1937 .21497 L
.19494 .21496 L
.19618 .21496 L
.19742 .21496 L
.1999 .21495 L
.20238 .21494 L
.20734 .21492 L
.2123 .21488 L
.22222 .21479 L
.23214 .21467 L
Mistroke
.24206 .21453 L
.2619 .21418 L
.30159 .21326 L
.34127 .21214 L
.38095 .21089 L
.42063 .20955 L
.46032 .20815 L
.5 .20672 L
.53968 .20527 L
.57937 .20381 L
.61905 .20235 L
.65873 .20089 L
.69841 .19943 L
.7381 .19798 L
.77778 .19654 L
.81746 .19511 L
.85714 .19369 L
.89683 .19227 L
.93651 .19087 L
.97619 .18948 L
Mfstroke
P
P
p
0 .4 1 r
p
.004 w
.02381 .00606 m
.02629 .07534 L
.02877 .14841 L
.03125 .20456 L
.03373 .24712 L
.03621 .27908 L
.03869 .30278 L
.04117 .32004 L
.04241 .3267 L
.04365 .33226 L
.04489 .33683 L
.04613 .34053 L
.04737 .34348 L
.04861 .34575 L
.04985 .34743 L
.05109 .34858 L
.05233 .34928 L
.05357 .34959 L
.05481 .34954 L
.05605 .3492 L
.05729 .34858 L
.05853 .34774 L
.05977 .34668 L
.06101 .34545 L
.06349 .34252 L
.07341 .32715 L
.08333 .30951 L
.10317 .27458 L
.14286 .20054 L
.1627 .16704 L
.18254 .13945 L
.22222 .09794 L
.24206 .08248 L
.2619 .06972 L
.28175 .0592 L
.30159 .0505 L
.32143 .04332 L
.34127 .03741 L
.36111 .03253 L
.38095 .02852 L
.40079 .02521 L
.42063 .02248 L
.44048 .02023 L
.46032 .01837 L
.48016 .01684 L
.5 .01557 L
.51984 .01453 L
.53968 .01367 L
.55952 .01296 L
.57937 .01237 L
Mistroke
.59921 .01189 L
.61905 .01149 L
.63889 .01116 L
.65873 .01089 L
.67857 .01066 L
.69841 .01048 L
.71825 .01032 L
.7381 .0102 L
.75794 .01009 L
.77778 .01 L
.81746 .00987 L
.8373 .00981 L
.85714 .00977 L
.89683 .0097 L
.91667 .00968 L
.92659 .00966 L
.93651 .00965 L
.94147 .00965 L
.94395 .00965 L
.94519 .00965 L
.94643 .00965 L
.94767 .00964 L
.94891 .00964 L
.95015 .00964 L
.95139 .00964 L
.95263 .00965 L
.95387 .00965 L
.95635 .00965 L
.95883 .00965 L
.96131 .00966 L
.96627 .00967 L
.97123 .00968 L
.97619 .0097 L
Mfstroke
P
P
p
.8 0 1 r
p
.004 w
.02381 .00606 m
.06349 .06346 L
.10317 .12627 L
.12302 .15226 L
.14286 .17425 L
.1627 .19235 L
.18254 .20722 L
.22222 .2295 L
.24206 .23776 L
.2619 .24454 L
.28175 .25009 L
.30159 .25465 L
.32143 .25839 L
.34127 .26143 L
.36111 .2639 L
.38095 .26591 L
.40079 .26753 L
.42063 .26883 L
.44048 .26988 L
.46032 .27071 L
.48016 .27136 L
.5 .27186 L
.51984 .27225 L
.53968 .27253 L
.5496 .27264 L
.55952 .27273 L
.56944 .27281 L
.57937 .27287 L
.58929 .27291 L
.59921 .27294 L
.60417 .27296 L
.60913 .27297 L
.61409 .27297 L
.61657 .27298 L
.61781 .27298 L
.61905 .27298 L
.62029 .27298 L
.62153 .27298 L
.62277 .27298 L
.62401 .27298 L
.62525 .27298 L
.62649 .27298 L
.62773 .27298 L
.62897 .27298 L
.63021 .27298 L
.63145 .27298 L
.63393 .27298 L
.63641 .27297 L
.63889 .27297 L
.64385 .27296 L
Mistroke
.64881 .27296 L
.65873 .27293 L
.66865 .2729 L
.67857 .27287 L
.69841 .27278 L
.7381 .27256 L
.77778 .2723 L
.81746 .272 L
.85714 .27168 L
.89683 .27134 L
.93651 .27099 L
.97619 .27054 L
Mfstroke
P
P
P
MathSubEnd
P
% End of sub-graphic
p
p
.70886 .06648 m
.70886 .33381 L
.97619 .33381 L
.97619 .06648 L
F
1 g
.69215 .08319 m
.69215 .35052 L
.95948 .35052 L
.95948 .08319 L
F
0 g
.001 w
.69215 .08319 m
.95948 .08319 L
.95948 .35052 L
.69215 .35052 L
.69215 .08319 L
s
% Start of sub-graphic
p
0.692147 0.0831865 0.959482 0.350522 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0297619 0.297619 0.0139665 0.139665 [
[ 0 0 0 0 ]
[ 1 1 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 1 L
0 1 L
closepath
clip
newpath
p
p
p
% Start of sub-graphic
p
0.0535714 0.0251397 0.35119 0.164804 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
.8 0 1 r
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[B])] .38988 .09497 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.187151 0.35119 0.326816 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
0 .4 1 r
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[O])] .38988 .25698 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.349162 0.35119 0.488827 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
0 1 .4 r
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[C3])] .38988 .41899 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.511173 0.35119 0.650838 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
.8 1 0 r
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[C2])] .38988 .58101 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.673184 0.35119 0.812849 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
1 0 0 r
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(p[C1])] .38988 .74302 -1 0 Mshowa
P
p
% Start of sub-graphic
p
0.0535714 0.835196 0.35119 0.97486 MathSubStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.952381 0.309017 0.588604 [
[ 0 0 0 0 ]
[ 1 .61803 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
p
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
.004 w
.02381 .30902 m
.97619 .30902 L
s
P
MathSubEnd
P
% End of sub-graphic
[(1 - p[C1])] .38988 .90503 -1 0 Mshowa
P
P
p
P
P
MathSubEnd
P
% End of sub-graphic
P
P
P
0 0 m
1 0 L
1 .43371 L
0 .43371 L
closepath
clip
newpath
% End of Graphics
MathPictureEnd

:[font = output; output; inactive; preserveAspect; endGroup]
Graphics["<<>>"]
;[o]
-Graphics-
:[font = text; inactive; preserveAspect]
Next, we plot the current. It is negative by convention.
:[font = input; preserveAspect; startGroup]
n = 10;    (* number of available channels *)
u = 0.07; (* Volts, voltage across the membrane *)

CurrentPlot[myOcc, stateConductivityList,
            n, u, {t, 10}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 283; pictureHeight = 175]
%!
%%Creator: Mathematica
%%AspectRatio: .61803 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.0952381 0.618034 0.110363 [
[(2)] .21429 .61803 0 2 Msboxa
[(4)] .40476 .61803 0 2 Msboxa
[(6)] .59524 .61803 0 2 Msboxa
[(8)] .78571 .61803 0 2 Msboxa
[(10)] .97619 .61803 0 2 Msboxa
[(t/ms)] 1.025 .61803 -1 0 Msboxa
[(Current)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(-5)] .01131 .06622 1 0 Msboxa
[(-4)] .01131 .17658 1 0 Msboxa
[(-3)] .01131 .28694 1 0 Msboxa
[(-2)] .01131 .39731 1 0 Msboxa
[(-1)] .01131 .50767 1 0 Msboxa
[(I/pA)] .02381 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .62528 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.21429 .61803 m
.21429 .62428 L
s
P
[(2)] .21429 .61803 0 2 Mshowa
p
.002 w
.40476 .61803 m
.40476 .62428 L
s
P
[(4)] .40476 .61803 0 2 Mshowa
p
.002 w
.59524 .61803 m
.59524 .62428 L
s
P
[(6)] .59524 .61803 0 2 Mshowa
p
.002 w
.78571 .61803 m
.78571 .62428 L
s
P
[(8)] .78571 .61803 0 2 Mshowa
p
.002 w
.97619 .61803 m
.97619 .62428 L
s
P
[(10)] .97619 .61803 0 2 Mshowa
p
.001 w
.0619 .61803 m
.0619 .62178 L
s
P
p
.001 w
.1 .61803 m
.1 .62178 L
s
P
p
.001 w
.1381 .61803 m
.1381 .62178 L
s
P
p
.001 w
.17619 .61803 m
.17619 .62178 L
s
P
p
.001 w
.25238 .61803 m
.25238 .62178 L
s
P
p
.001 w
.29048 .61803 m
.29048 .62178 L
s
P
p
.001 w
.32857 .61803 m
.32857 .62178 L
s
P
p
.001 w
.36667 .61803 m
.36667 .62178 L
s
P
p
.001 w
.44286 .61803 m
.44286 .62178 L
s
P
p
.001 w
.48095 .61803 m
.48095 .62178 L
s
P
p
.001 w
.51905 .61803 m
.51905 .62178 L
s
P
p
.001 w
.55714 .61803 m
.55714 .62178 L
s
P
p
.001 w
.63333 .61803 m
.63333 .62178 L
s
P
p
.001 w
.67143 .61803 m
.67143 .62178 L
s
P
p
.001 w
.70952 .61803 m
.70952 .62178 L
s
P
p
.001 w
.74762 .61803 m
.74762 .62178 L
s
P
p
.001 w
.82381 .61803 m
.82381 .62178 L
s
P
p
.001 w
.8619 .61803 m
.8619 .62178 L
s
P
p
.001 w
.9 .61803 m
.9 .62178 L
s
P
p
.001 w
.9381 .61803 m
.9381 .62178 L
s
P
[(t/ms)] 1.025 .61803 -1 0 Mshowa
p
.002 w
0 .61803 m
1 .61803 L
s
P
[(Current)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .06622 m
.03006 .06622 L
s
P
[(-5)] .01131 .06622 1 0 Mshowa
p
.002 w
.02381 .17658 m
.03006 .17658 L
s
P
[(-4)] .01131 .17658 1 0 Mshowa
p
.002 w
.02381 .28694 m
.03006 .28694 L
s
P
[(-3)] .01131 .28694 1 0 Mshowa
p
.002 w
.02381 .39731 m
.03006 .39731 L
s
P
[(-2)] .01131 .39731 1 0 Mshowa
p
.002 w
.02381 .50767 m
.03006 .50767 L
s
P
[(-1)] .01131 .50767 1 0 Mshowa
p
.001 w
.02381 .08829 m
.02756 .08829 L
s
P
p
.001 w
.02381 .11036 m
.02756 .11036 L
s
P
p
.001 w
.02381 .13244 m
.02756 .13244 L
s
P
p
.001 w
.02381 .15451 m
.02756 .15451 L
s
P
p
.001 w
.02381 .19865 m
.02756 .19865 L
s
P
p
.001 w
.02381 .22073 m
.02756 .22073 L
s
P
p
.001 w
.02381 .2428 m
.02756 .2428 L
s
P
p
.001 w
.02381 .26487 m
.02756 .26487 L
s
P
p
.001 w
.02381 .30902 m
.02756 .30902 L
s
P
p
.001 w
.02381 .33109 m
.02756 .33109 L
s
P
p
.001 w
.02381 .35316 m
.02756 .35316 L
s
P
p
.001 w
.02381 .37523 m
.02756 .37523 L
s
P
p
.001 w
.02381 .41938 m
.02756 .41938 L
s
P
p
.001 w
.02381 .44145 m
.02756 .44145 L
s
P
p
.001 w
.02381 .46353 m
.02756 .46353 L
s
P
p
.001 w
.02381 .4856 m
.02756 .4856 L
s
P
p
.001 w
.02381 .52974 m
.02756 .52974 L
s
P
p
.001 w
.02381 .55182 m
.02756 .55182 L
s
P
p
.001 w
.02381 .57389 m
.02756 .57389 L
s
P
p
.001 w
.02381 .59596 m
.02756 .59596 L
s
P
p
.001 w
.02381 .04415 m
.02756 .04415 L
s
P
p
.001 w
.02381 .02207 m
.02756 .02207 L
s
P
p
.001 w
.02381 0 m
.02756 0 L
s
P
[(I/pA)] .02381 .61803 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
p
p
.004 w
.02381 .61803 m
.02629 .54737 L
.02877 .47284 L
.03125 .41556 L
.03373 .37215 L
.03621 .33955 L
.03869 .31538 L
.04117 .29777 L
.04241 .29098 L
.04365 .28531 L
.04489 .28065 L
.04613 .27687 L
.04737 .27387 L
.04861 .27155 L
.04985 .26984 L
.05109 .26866 L
.05233 .26795 L
.05357 .26764 L
.05481 .26768 L
.05605 .26803 L
.05729 .26866 L
.05853 .26952 L
.05977 .2706 L
.06101 .27186 L
.06349 .27484 L
.07341 .29052 L
.08333 .30851 L
.10317 .34414 L
.14286 .41966 L
.1627 .45384 L
.18254 .48197 L
.22222 .52431 L
.24206 .54009 L
.2619 .5531 L
.28175 .56383 L
.30159 .5727 L
.32143 .58002 L
.34127 .58606 L
.36111 .59103 L
.38095 .59512 L
.40079 .5985 L
.42063 .60128 L
.44048 .60358 L
.46032 .60548 L
.48016 .60704 L
.5 .60833 L
.51984 .6094 L
.53968 .61027 L
.55952 .611 L
.57937 .6116 L
Mistroke
.59921 .61209 L
.61905 .6125 L
.63889 .61283 L
.65873 .61311 L
.67857 .61334 L
.69841 .61353 L
.71825 .61369 L
.7381 .61382 L
.75794 .61392 L
.77778 .61401 L
.81746 .61415 L
.8373 .6142 L
.85714 .61425 L
.89683 .61432 L
.91667 .61434 L
.92659 .61436 L
.93651 .61437 L
.94147 .61437 L
.94395 .61437 L
.94519 .61438 L
.94643 .61438 L
.94767 .61438 L
.94891 .61438 L
.95015 .61438 L
.95139 .61438 L
.95263 .61438 L
.95387 .61438 L
.95635 .61437 L
.95883 .61437 L
.96131 .61437 L
.96627 .61435 L
.97123 .61434 L
.97619 .61432 L
Mfstroke
P
P
p
.5 g
p
.004 w
.02381 .61803 m
.02629 .48517 L
.02877 .38998 L
.03001 .35408 L
.03125 .32383 L
.03373 .27649 L
.03621 .24231 L
.03869 .21768 L
.04117 .20012 L
.04241 .19342 L
.04365 .18788 L
.04489 .18335 L
.04613 .17968 L
.04737 .17678 L
.04861 .17455 L
.04985 .17291 L
.05109 .17178 L
.05233 .1711 L
.05357 .1708 L
.05481 .17084 L
.05605 .17118 L
.05729 .17178 L
.05853 .17261 L
.05977 .17364 L
.06101 .17485 L
.06349 .17772 L
.07341 .19297 L
.08333 .21079 L
.10317 .24706 L
.14286 .32842 L
.18254 .40099 L
.22222 .45421 L
.2619 .49317 L
.30159 .52175 L
.34127 .54277 L
.38095 .5582 L
.42063 .56954 L
.46032 .5779 L
.5 .58404 L
.53968 .58851 L
.57937 .59175 L
.61905 .59408 L
.65873 .59574 L
.67857 .59637 L
.69841 .59691 L
.7381 .59772 L
.77778 .5983 L
.81746 .59871 L
.8373 .59887 L
.85714 .599 L
Mistroke
.89683 .59921 L
.91667 .59929 L
.92659 .59933 L
.93651 .59936 L
.94147 .59937 L
.94395 .59938 L
.94519 .59938 L
.94643 .59939 L
.94767 .59939 L
.94891 .59939 L
.95015 .59939 L
.95139 .59939 L
.95263 .59939 L
.95387 .59938 L
.95635 .59938 L
.95883 .59937 L
.96131 .59935 L
.96627 .59932 L
.97123 .59927 L
.97619 .5992 L
Mfstroke
P
P
p
.5 g
p
.004 w
.02381 .61803 m
.02877 .5557 L
.03373 .46781 L
.03621 .43679 L
.03869 .41308 L
.04117 .39543 L
.04241 .38853 L
.04365 .38274 L
.04489 .37796 L
.04613 .37406 L
.04737 .37095 L
.04861 .36855 L
.04985 .36677 L
.05109 .36555 L
.05233 .36481 L
.05357 .36448 L
.05481 .36452 L
.05605 .36489 L
.05729 .36554 L
.05853 .36644 L
.05977 .36756 L
.06101 .36887 L
.06349 .37196 L
.07341 .38806 L
.08333 .40623 L
.10317 .44123 L
.14286 .5109 L
.1627 .54016 L
.18254 .56295 L
.20238 .58069 L
.22222 .59441 L
.24206 .60497 L
.2619 .61303 L
s
.27822 .61803 m
.2619 .61303 L
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
s
P
P
P
% End of Graphics
MathPictureEnd

:[font = output; output; inactive; preserveAspect; endGroup]
Graphics["<<>>"]
;[o]
-Graphics-
:[font = input; preserveAspect; startGroup]
CurrentRisetime[myOcc, stateConductivityList, t] *
milliseconds
:[font = output; output; inactive; preserveAspect; endGroup; endGroup; endGroup]
0.1060867526677526978*milliseconds
;[o]
0.106087 milliseconds
:[font = section; inactive; Cclosed; preserveAspect; startGroup]
The Monte Carlo Simulation Package: ColquhounHawkesMC
;[s]
2:0,0;36,1;53,-1;
2:1,0,0 ,times,1,18,0,0,0;1,0,0 ,Courier,1,18,0,0,0;
:[font = text; inactive; preserveAspect]
Load the package. You should start a fresh Mathematica session before loading this package.
;[s]
3:0,0;43,1;54,2;91,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
<<ChannelKinetics`ColquhounHawkesMC`
:[font = print; inactive; preserveAspect; endGroup]
C routine installation successful.
:[font = text; inactive; preserveAspect]
You can get a list of the functions defined in this package by typing
:[font = input; preserveAspect; startGroup]
Help[]
:[font = print; inactive; preserveAspect; endGroup]
The following functions are available: 
      CSeedRandom[n] 
      SingleTrace[q, sclist, initstate, 
                  height, duration, u, {t, tmax, tstep}] 
      TraceTable[q, sclist, initstate, 
                 height, duration, n, u, {t, tmax, tstep}] 
      MeanCurrent[q, sclist, initstate, 
                  height, duration, n, u, {t, tmax, tstep}] 
      CurrentVariance[option, q, sclist, initstate, 
                      height, duration, n, u, {t, tmax, tstep}] 
      CoefficientOfVariation[option, q, sclist, initstate, 
                             height, duration, n, u, 
                             {t, tmax, tstep}] 
      CurrentThirdMoment[option, q, sclist, initstate, 
                         height, duration, n, u, {t, tmax, tstep}] 
      FilterTest[EnsembleSize -> m, q, sclist, initstate, height, 
                 duration, u, {t, tmax, samplingfreq, fc}] 
      PeakEPSCAmplitudeDistribution[ 
      EnsembleSize -> m, q, sclist, initstate, height, duration, 
      n, u, {t, tmax, samplingfreq, fc, tint}] 
      DistributionPlot[distr] 
      Help[], 
 
 where option is an optional argument of the form 
      EnsembleSize -> m 
 (m = 1 by default). 
 
 You can get detailed information on each function by typing 
      ?function 
 followed by SHIFT-RETURN or ENTER. 
 The definition of a function (Mathematica code) is available at 
      ??function 
 followed by SHIFT-RETURN or ENTER, as usual.
:[font = text; inactive; preserveAspect]
Copy q and stateConductivityList from the section above, and newly add in the variable initialState such that at t = 0, all channels are in state C1. Note that initialState is not the same type of expression as initialOccupancy.
;[s]
15:0,0;5,1;6,2;11,3;32,4;87,5;99,6;113,7;118,8;146,9;148,10;160,11;172,12;211,13;227,14;228,-1;
15:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect]
q = {
      {-100000.*c[t], 100000.*c[t], 0, 0}, 
      {50., -64., 4., 10.}, 
      {0, 0.02, -0.02, 0}, 
      {0, 0.5, 0, -0.5}
    }; (* c[t] in M *)

stateConductivityList = { (* conductivity in pS *)
                          {C1, 0},
                          {C2, 0},
                          {C3, 0},
                          {O,  8}
                        };

initialState = C1;
:[font = text; inactive; preserveAspect]
Simulations in ColquhounHawkesMC are done using a random number generator. (The routine used is due to L'Ecuyer, "Efficient and Portable Combined Random Number Generators", Commun. ACM 31, 742-774 (1988), implemented in C by Eberhard v. Kitzing.) When the package is loaded, it takes the time of day as the seed for the random number generator. Two different Mathematica sessions will therefore almost always give different sequences of random numbers and, therefore, different results of the simulations. If you want to make sure that you always get the same sequence of pseudorandom numbers, you can explicitly give an integer seed for the random number generator, using CSeedRandom[].
;[s]
9:0,0;15,1;32,2;185,3;187,4;359,5;370,6;673,7;686,8;687,-1;
9:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
?CSeedRandom
:[font = info; inactive; preserveAspect; endGroup]
CSeedRandom[n] resets the pseudorandom  number
   generator for the C routines, using the integer
   n as a seed.  The sign of n is neglected, and
   it must not be zero.
:[font = text; inactive; preserveAspect]
An example call.
:[font = input; preserveAspect]
CSeedRandom[6328]
:[font = text; inactive; preserveAspect]
CSeedRandom[] gives a seed to the random number generator called by the C routines. It is different from Mathematica's built-in SeedRandom[] which resets the seed for Mathematica's own random number generator.
;[s]
11:0,0;13,1;58,2;82,3;105,4;116,5;128,6;140,7;167,8;178,9;184,10;209,-1;
11:1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,4,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,6,12,0,0,0;1,0,0 ,times,4,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = text; inactive; preserveAspect]
Now we turn to doing some simulations. First, we try simulation of the current flowing through a single channel.
:[font = input; preserveAspect; startGroup]
?SingleTrace
:[font = info; inactive; preserveAspect; endGroup]
SingleTrace[q, sclist, initstate, height,
   duration, u, {t, tmax, tstep}] calls a C
   routine that performs a Monte Carlo simulation
   of the state transitions of a single channel,
   from t = 0 to tmax milliseconds, using a
   sampling interval of tstep ms; q (ms^-1) is the
   transition rate matrix; sclist has entries
   {state, conductivity (pS)}; initstate is the
   initial state of the channel; height (M) and
   duration (ms) define the transmitter
   concentration square pulse function; u (V) is
   the voltage across the membrane minus the
   reversal potential. SingleTrace[] returns a
   list of real numbers of length Floor[tmax /
   tstep] + 1 that gives the single channel
   current (pA) at ascending integer multiples of
   tstep.
:[font = text; inactive; preserveAspect]
Prepare some variables for the simulation (alternatively, you might wish to give these values directly as arguments to SingleTrace[]):
;[s]
3:0,0;119,1;132,2;134,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect]
height = 0.001; (* M *)
duration = 1;   (* ms *)
u = 0.07;       (* V *)
tmax = 10;      (* ms *)
tstep = 0.2;    (* ms *)
:[font = text; inactive; preserveAspect]
Invoke SingleTrace[].
;[s]
3:0,0;7,1;20,2;21,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
myTrace =
SingleTrace[q, stateConductivityList, initialState,
            height, duration, u, {t, tmax, tstep}]
:[font = output; output; inactive; preserveAspect; endGroup]
{0, -0.56, -0.56, -0.56, -0.56, -0.56, -0.56, -0.56, 0, 
 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
  0, 0, 0, 0, 0, 0}
;[o]
{0, -0.56, -0.56, -0.56, -0.56, -0.56, -0.56, -0.56, 0, 
 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
  0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
  0, 0, 0, 0, 0, 0}
:[font = text; inactive; preserveAspect]
This is a list of numbers that represents the single channel current at sample points with distance tstep milliseconds. We plot it using the built-in Mathematica function ListPlot[].
;[s]
7:0,0;100,1;105,2;150,3;161,4;171,5;181,6;182,-1;
7:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
ListPlot[myTrace]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174]
%!
%%Creator: Mathematica
%%AspectRatio: .61803 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.0186741 0.603319 1.05108 [
[(10)] .21055 .60332 0 2 Msboxa
[(20)] .39729 .60332 0 2 Msboxa
[(30)] .58403 .60332 0 2 Msboxa
[(40)] .77077 .60332 0 2 Msboxa
[(50)] .95752 .60332 0 2 Msboxa
[(-0.5)] .01131 .07778 1 0 Msboxa
[(-0.4)] .01131 .18289 1 0 Msboxa
[(-0.3)] .01131 .288 1 0 Msboxa
[(-0.2)] .01131 .3931 1 0 Msboxa
[(-0.1)] .01131 .49821 1 0 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.21055 .60332 m
.21055 .60957 L
s
P
[(10)] .21055 .60332 0 2 Mshowa
p
.002 w
.39729 .60332 m
.39729 .60957 L
s
P
[(20)] .39729 .60332 0 2 Mshowa
p
.002 w
.58403 .60332 m
.58403 .60957 L
s
P
[(30)] .58403 .60332 0 2 Mshowa
p
.002 w
.77077 .60332 m
.77077 .60957 L
s
P
[(40)] .77077 .60332 0 2 Mshowa
p
.002 w
.95752 .60332 m
.95752 .60957 L
s
P
[(50)] .95752 .60332 0 2 Mshowa
p
.001 w
.06116 .60332 m
.06116 .60707 L
s
P
p
.001 w
.09851 .60332 m
.09851 .60707 L
s
P
p
.001 w
.13585 .60332 m
.13585 .60707 L
s
P
p
.001 w
.1732 .60332 m
.1732 .60707 L
s
P
p
.001 w
.2479 .60332 m
.2479 .60707 L
s
P
p
.001 w
.28525 .60332 m
.28525 .60707 L
s
P
p
.001 w
.3226 .60332 m
.3226 .60707 L
s
P
p
.001 w
.35994 .60332 m
.35994 .60707 L
s
P
p
.001 w
.43464 .60332 m
.43464 .60707 L
s
P
p
.001 w
.47199 .60332 m
.47199 .60707 L
s
P
p
.001 w
.50934 .60332 m
.50934 .60707 L
s
P
p
.001 w
.54669 .60332 m
.54669 .60707 L
s
P
p
.001 w
.62138 .60332 m
.62138 .60707 L
s
P
p
.001 w
.65873 .60332 m
.65873 .60707 L
s
P
p
.001 w
.69608 .60332 m
.69608 .60707 L
s
P
p
.001 w
.73343 .60332 m
.73343 .60707 L
s
P
p
.001 w
.80812 .60332 m
.80812 .60707 L
s
P
p
.001 w
.84547 .60332 m
.84547 .60707 L
s
P
p
.001 w
.88282 .60332 m
.88282 .60707 L
s
P
p
.001 w
.92017 .60332 m
.92017 .60707 L
s
P
p
.001 w
.99486 .60332 m
.99486 .60707 L
s
P
p
.002 w
0 .60332 m
1 .60332 L
s
P
p
.002 w
.02381 .07778 m
.03006 .07778 L
s
P
[(-0.5)] .01131 .07778 1 0 Mshowa
p
.002 w
.02381 .18289 m
.03006 .18289 L
s
P
[(-0.4)] .01131 .18289 1 0 Mshowa
p
.002 w
.02381 .288 m
.03006 .288 L
s
P
[(-0.3)] .01131 .288 1 0 Mshowa
p
.002 w
.02381 .3931 m
.03006 .3931 L
s
P
[(-0.2)] .01131 .3931 1 0 Mshowa
p
.002 w
.02381 .49821 m
.03006 .49821 L
s
P
[(-0.1)] .01131 .49821 1 0 Mshowa
p
.001 w
.02381 .0988 m
.02756 .0988 L
s
P
p
.001 w
.02381 .11982 m
.02756 .11982 L
s
P
p
.001 w
.02381 .14084 m
.02756 .14084 L
s
P
p
.001 w
.02381 .16187 m
.02756 .16187 L
s
P
p
.001 w
.02381 .20391 m
.02756 .20391 L
s
P
p
.001 w
.02381 .22493 m
.02756 .22493 L
s
P
p
.001 w
.02381 .24595 m
.02756 .24595 L
s
P
p
.001 w
.02381 .26697 m
.02756 .26697 L
s
P
p
.001 w
.02381 .30902 m
.02756 .30902 L
s
P
p
.001 w
.02381 .33004 m
.02756 .33004 L
s
P
p
.001 w
.02381 .35106 m
.02756 .35106 L
s
P
p
.001 w
.02381 .37208 m
.02756 .37208 L
s
P
p
.001 w
.02381 .41412 m
.02756 .41412 L
s
P
p
.001 w
.02381 .43515 m
.02756 .43515 L
s
P
p
.001 w
.02381 .45617 m
.02756 .45617 L
s
P
p
.001 w
.02381 .47719 m
.02756 .47719 L
s
P
p
.001 w
.02381 .51923 m
.02756 .51923 L
s
P
p
.001 w
.02381 .54025 m
.02756 .54025 L
s
P
p
.001 w
.02381 .56128 m
.02756 .56128 L
s
P
p
.001 w
.02381 .5823 m
.02756 .5823 L
s
P
p
.001 w
.02381 .05676 m
.02756 .05676 L
s
P
p
.001 w
.02381 .03574 m
.02756 .03574 L
s
P
p
.001 w
.02381 .01472 m
.02756 .01472 L
s
P
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
p
.008 w
.04248 .60332 Mdot
.06116 .01472 Mdot
.07983 .01472 Mdot
.09851 .01472 Mdot
.11718 .01472 Mdot
.13585 .01472 Mdot
.15453 .01472 Mdot
.1732 .01472 Mdot
.19188 .60332 Mdot
.21055 .60332 Mdot
.22923 .60332 Mdot
.2479 .60332 Mdot
.26657 .60332 Mdot
.28525 .60332 Mdot
.30392 .60332 Mdot
.3226 .60332 Mdot
.34127 .60332 Mdot
.35994 .60332 Mdot
.37862 .60332 Mdot
.39729 .60332 Mdot
.41597 .60332 Mdot
.43464 .60332 Mdot
.45331 .60332 Mdot
.47199 .60332 Mdot
.49066 .60332 Mdot
.50934 .60332 Mdot
.52801 .60332 Mdot
.54669 .60332 Mdot
.56536 .60332 Mdot
.58403 .60332 Mdot
.60271 .60332 Mdot
.62138 .60332 Mdot
.64006 .60332 Mdot
.65873 .60332 Mdot
.6774 .60332 Mdot
.69608 .60332 Mdot
.71475 .60332 Mdot
.73343 .60332 Mdot
.7521 .60332 Mdot
.77077 .60332 Mdot
.78945 .60332 Mdot
.80812 .60332 Mdot
.8268 .60332 Mdot
.84547 .60332 Mdot
.86415 .60332 Mdot
.88282 .60332 Mdot
.90149 .60332 Mdot
.92017 .60332 Mdot
.93884 .60332 Mdot
.95752 .60332 Mdot
.97619 .60332 Mdot
P
% End of Graphics
MathPictureEnd

:[font = output; output; inactive; preserveAspect; endGroup]
Graphics["<<>>"]
;[o]
-Graphics-
:[font = text; inactive; preserveAspect]
We can make this look better by giving some options to ListPlot[]:
;[s]
3:0,0;55,1;65,2;66,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
ListPlot[myTrace, PlotJoined -> True, PlotRange -> All,
         AspectRatio -> 1 / 5,
         AxesLabel -> {"t/samples", "I/pA"},
         PlotLabel -> "Single Channel Current"]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 0; pictureWidth = 492; pictureHeight = 99]
%!
%%Creator: Mathematica
%%AspectRatio: .2 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0047619 0.0190476 0.195238 0.340136 [
[(10)] .19524 .19524 0 2 Msboxa
[(20)] .38571 .19524 0 2 Msboxa
[(30)] .57619 .19524 0 2 Msboxa
[(40)] .76667 .19524 0 2 Msboxa
[(50)] .95714 .19524 0 2 Msboxa
[(t/samples)] 1.025 .19524 -1 0 Msboxa
[(Single Channel Current)] .5 .2 0 -2 0 0 1 Mouter Mrotsboxa
[(-0.5)] -0.00774 .02517 1 0 Msboxa
[(-0.4)] -0.00774 .05918 1 0 Msboxa
[(-0.3)] -0.00774 .0932 1 0 Msboxa
[(-0.2)] -0.00774 .12721 1 0 Msboxa
[(-0.1)] -0.00774 .16122 1 0 Msboxa
[(I/pA)] .00476 .2 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .20249 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.19524 .19524 m
.19524 .20149 L
s
P
[(10)] .19524 .19524 0 2 Mshowa
p
.002 w
.38571 .19524 m
.38571 .20149 L
s
P
[(20)] .38571 .19524 0 2 Mshowa
p
.002 w
.57619 .19524 m
.57619 .20149 L
s
P
[(30)] .57619 .19524 0 2 Mshowa
p
.002 w
.76667 .19524 m
.76667 .20149 L
s
P
[(40)] .76667 .19524 0 2 Mshowa
p
.002 w
.95714 .19524 m
.95714 .20149 L
s
P
[(50)] .95714 .19524 0 2 Mshowa
p
.001 w
.04286 .19524 m
.04286 .19899 L
s
P
p
.001 w
.08095 .19524 m
.08095 .19899 L
s
P
p
.001 w
.11905 .19524 m
.11905 .19899 L
s
P
p
.001 w
.15714 .19524 m
.15714 .19899 L
s
P
p
.001 w
.23333 .19524 m
.23333 .19899 L
s
P
p
.001 w
.27143 .19524 m
.27143 .19899 L
s
P
p
.001 w
.30952 .19524 m
.30952 .19899 L
s
P
p
.001 w
.34762 .19524 m
.34762 .19899 L
s
P
p
.001 w
.42381 .19524 m
.42381 .19899 L
s
P
p
.001 w
.4619 .19524 m
.4619 .19899 L
s
P
p
.001 w
.5 .19524 m
.5 .19899 L
s
P
p
.001 w
.5381 .19524 m
.5381 .19899 L
s
P
p
.001 w
.61429 .19524 m
.61429 .19899 L
s
P
p
.001 w
.65238 .19524 m
.65238 .19899 L
s
P
p
.001 w
.69048 .19524 m
.69048 .19899 L
s
P
p
.001 w
.72857 .19524 m
.72857 .19899 L
s
P
p
.001 w
.80476 .19524 m
.80476 .19899 L
s
P
p
.001 w
.84286 .19524 m
.84286 .19899 L
s
P
p
.001 w
.88095 .19524 m
.88095 .19899 L
s
P
p
.001 w
.91905 .19524 m
.91905 .19899 L
s
P
p
.001 w
.99524 .19524 m
.99524 .19899 L
s
P
[(t/samples)] 1.025 .19524 -1 0 Mshowa
p
.002 w
0 .19524 m
1 .19524 L
s
P
[(Single Channel Current)] .5 .2 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.00476 .02517 m
.01101 .02517 L
s
P
[(-0.5)] -0.00774 .02517 1 0 Mshowa
p
.002 w
.00476 .05918 m
.01101 .05918 L
s
P
[(-0.4)] -0.00774 .05918 1 0 Mshowa
p
.002 w
.00476 .0932 m
.01101 .0932 L
s
P
[(-0.3)] -0.00774 .0932 1 0 Mshowa
p
.002 w
.00476 .12721 m
.01101 .12721 L
s
P
[(-0.2)] -0.00774 .12721 1 0 Mshowa
p
.002 w
.00476 .16122 m
.01101 .16122 L
s
P
[(-0.1)] -0.00774 .16122 1 0 Mshowa
p
.001 w
.00476 .03197 m
.00851 .03197 L
s
P
p
.001 w
.00476 .03878 m
.00851 .03878 L
s
P
p
.001 w
.00476 .04558 m
.00851 .04558 L
s
P
p
.001 w
.00476 .05238 m
.00851 .05238 L
s
P
p
.001 w
.00476 .06599 m
.00851 .06599 L
s
P
p
.001 w
.00476 .07279 m
.00851 .07279 L
s
P
p
.001 w
.00476 .07959 m
.00851 .07959 L
s
P
p
.001 w
.00476 .08639 m
.00851 .08639 L
s
P
p
.001 w
.00476 .1 m
.00851 .1 L
s
P
p
.001 w
.00476 .1068 m
.00851 .1068 L
s
P
p
.001 w
.00476 .11361 m
.00851 .11361 L
s
P
p
.001 w
.00476 .12041 m
.00851 .12041 L
s
P
p
.001 w
.00476 .13401 m
.00851 .13401 L
s
P
p
.001 w
.00476 .14082 m
.00851 .14082 L
s
P
p
.001 w
.00476 .14762 m
.00851 .14762 L
s
P
p
.001 w
.00476 .15442 m
.00851 .15442 L
s
P
p
.001 w
.00476 .16803 m
.00851 .16803 L
s
P
p
.001 w
.00476 .17483 m
.00851 .17483 L
s
P
p
.001 w
.00476 .18163 m
.00851 .18163 L
s
P
p
.001 w
.00476 .18844 m
.00851 .18844 L
s
P
p
.001 w
.00476 .01837 m
.00851 .01837 L
s
P
p
.001 w
.00476 .01156 m
.00851 .01156 L
s
P
p
.001 w
.00476 .00476 m
.00851 .00476 L
s
P
[(I/pA)] .00476 .2 0 -4 Mshowa
p
.002 w
.00476 0 m
.00476 .2 L
s
P
P
.004 w
.02381 .19524 m
.04286 .00476 L
.0619 .00476 L
.08095 .00476 L
.1 .00476 L
.11905 .00476 L
.1381 .00476 L
.15714 .00476 L
.17619 .19524 L
.19524 .19524 L
.21429 .19524 L
.23333 .19524 L
.25238 .19524 L
.27143 .19524 L
.29048 .19524 L
.30952 .19524 L
.32857 .19524 L
.34762 .19524 L
.36667 .19524 L
.38571 .19524 L
.40476 .19524 L
.42381 .19524 L
.44286 .19524 L
.4619 .19524 L
.48095 .19524 L
.5 .19524 L
.51905 .19524 L
.5381 .19524 L
.55714 .19524 L
.57619 .19524 L
.59524 .19524 L
.61429 .19524 L
.63333 .19524 L
.65238 .19524 L
.67143 .19524 L
.69048 .19524 L
.70952 .19524 L
.72857 .19524 L
.74762 .19524 L
.76667 .19524 L
.78571 .19524 L
.80476 .19524 L
.82381 .19524 L
.84286 .19524 L
.8619 .19524 L
.88095 .19524 L
.9 .19524 L
.91905 .19524 L
.9381 .19524 L
.95714 .19524 L
Mistroke
.97619 .19524 L
Mfstroke
0 0 m
1 0 L
1 .2 L
0 .2 L
closepath
clip
newpath
% End of Graphics
MathPictureEnd

:[font = output; output; inactive; preserveAspect; endGroup]
Graphics["<<>>"]
;[o]
-Graphics-
:[font = text; inactive; preserveAspect]
A smaller setting for tstep will make the transitions steeper.
;[s]
3:0,0;22,1;27,2;62,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
tstep = 0.01; (* ms *)
myTrace =
SingleTrace[q, stateConductivityList, initialState,
            height, duration, u, {t, tmax, tstep}];
ListPlot[myTrace, PlotJoined -> True, PlotRange -> All,
         AspectRatio -> 1 / 5,
         AxesLabel -> {"t/samples", "I/pA"},
         PlotLabel -> "Single Channel Current"]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 0; pictureWidth = 492; pictureHeight = 99]
%!
%%Creator: Mathematica
%%AspectRatio: .2 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0228571 0.000952381 0.195238 0.340136 [
[(200)] .21333 .19524 0 2 Msboxa
[(400)] .40381 .19524 0 2 Msboxa
[(600)] .59429 .19524 0 2 Msboxa
[(800)] .78476 .19524 0 2 Msboxa
[(1000)] .97524 .19524 0 2 Msboxa
[(t/samples)] 1.025 .19524 -1 0 Msboxa
[(Single Channel Current)] .5 .2 0 -2 0 0 1 Mouter Mrotsboxa
[(-0.5)] .01036 .02517 1 0 Msboxa
[(-0.4)] .01036 .05918 1 0 Msboxa
[(-0.3)] .01036 .0932 1 0 Msboxa
[(-0.2)] .01036 .12721 1 0 Msboxa
[(-0.1)] .01036 .16122 1 0 Msboxa
[(I/pA)] .02286 .2 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .20249 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.21333 .19524 m
.21333 .20149 L
s
P
[(200)] .21333 .19524 0 2 Mshowa
p
.002 w
.40381 .19524 m
.40381 .20149 L
s
P
[(400)] .40381 .19524 0 2 Mshowa
p
.002 w
.59429 .19524 m
.59429 .20149 L
s
P
[(600)] .59429 .19524 0 2 Mshowa
p
.002 w
.78476 .19524 m
.78476 .20149 L
s
P
[(800)] .78476 .19524 0 2 Mshowa
p
.002 w
.97524 .19524 m
.97524 .20149 L
s
P
[(1000)] .97524 .19524 0 2 Mshowa
p
.001 w
.06095 .19524 m
.06095 .19899 L
s
P
p
.001 w
.09905 .19524 m
.09905 .19899 L
s
P
p
.001 w
.13714 .19524 m
.13714 .19899 L
s
P
p
.001 w
.17524 .19524 m
.17524 .19899 L
s
P
p
.001 w
.25143 .19524 m
.25143 .19899 L
s
P
p
.001 w
.28952 .19524 m
.28952 .19899 L
s
P
p
.001 w
.32762 .19524 m
.32762 .19899 L
s
P
p
.001 w
.36571 .19524 m
.36571 .19899 L
s
P
p
.001 w
.4419 .19524 m
.4419 .19899 L
s
P
p
.001 w
.48 .19524 m
.48 .19899 L
s
P
p
.001 w
.5181 .19524 m
.5181 .19899 L
s
P
p
.001 w
.55619 .19524 m
.55619 .19899 L
s
P
p
.001 w
.63238 .19524 m
.63238 .19899 L
s
P
p
.001 w
.67048 .19524 m
.67048 .19899 L
s
P
p
.001 w
.70857 .19524 m
.70857 .19899 L
s
P
p
.001 w
.74667 .19524 m
.74667 .19899 L
s
P
p
.001 w
.82286 .19524 m
.82286 .19899 L
s
P
p
.001 w
.86095 .19524 m
.86095 .19899 L
s
P
p
.001 w
.89905 .19524 m
.89905 .19899 L
s
P
p
.001 w
.93714 .19524 m
.93714 .19899 L
s
P
[(t/samples)] 1.025 .19524 -1 0 Mshowa
p
.002 w
0 .19524 m
1 .19524 L
s
P
[(Single Channel Current)] .5 .2 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02286 .02517 m
.02911 .02517 L
s
P
[(-0.5)] .01036 .02517 1 0 Mshowa
p
.002 w
.02286 .05918 m
.02911 .05918 L
s
P
[(-0.4)] .01036 .05918 1 0 Mshowa
p
.002 w
.02286 .0932 m
.02911 .0932 L
s
P
[(-0.3)] .01036 .0932 1 0 Mshowa
p
.002 w
.02286 .12721 m
.02911 .12721 L
s
P
[(-0.2)] .01036 .12721 1 0 Mshowa
p
.002 w
.02286 .16122 m
.02911 .16122 L
s
P
[(-0.1)] .01036 .16122 1 0 Mshowa
p
.001 w
.02286 .03197 m
.02661 .03197 L
s
P
p
.001 w
.02286 .03878 m
.02661 .03878 L
s
P
p
.001 w
.02286 .04558 m
.02661 .04558 L
s
P
p
.001 w
.02286 .05238 m
.02661 .05238 L
s
P
p
.001 w
.02286 .06599 m
.02661 .06599 L
s
P
p
.001 w
.02286 .07279 m
.02661 .07279 L
s
P
p
.001 w
.02286 .07959 m
.02661 .07959 L
s
P
p
.001 w
.02286 .08639 m
.02661 .08639 L
s
P
p
.001 w
.02286 .1 m
.02661 .1 L
s
P
p
.001 w
.02286 .1068 m
.02661 .1068 L
s
P
p
.001 w
.02286 .11361 m
.02661 .11361 L
s
P
p
.001 w
.02286 .12041 m
.02661 .12041 L
s
P
p
.001 w
.02286 .13401 m
.02661 .13401 L
s
P
p
.001 w
.02286 .14082 m
.02661 .14082 L
s
P
p
.001 w
.02286 .14762 m
.02661 .14762 L
s
P
p
.001 w
.02286 .15442 m
.02661 .15442 L
s
P
p
.001 w
.02286 .16803 m
.02661 .16803 L
s
P
p
.001 w
.02286 .17483 m
.02661 .17483 L
s
P
p
.001 w
.02286 .18163 m
.02661 .18163 L
s
P
p
.001 w
.02286 .18844 m
.02661 .18844 L
s
P
p
.001 w
.02286 .01837 m
.02661 .01837 L
s
P
p
.001 w
.02286 .01156 m
.02661 .01156 L
s
P
p
.001 w
.02286 .00476 m
.02661 .00476 L
s
P
[(I/pA)] .02286 .2 0 -4 Mshowa
p
.002 w
.02286 0 m
.02286 .2 L
s
P
P
.004 w
.02381 .19524 m
.02476 .19524 L
.02571 .19524 L
.02667 .19524 L
.02762 .19524 L
.02857 .19524 L
.02952 .19524 L
.03048 .19524 L
.03143 .19524 L
.03238 .19524 L
.03333 .19524 L
.03429 .19524 L
.03524 .19524 L
.03619 .19524 L
.03714 .19524 L
.0381 .19524 L
.03905 .19524 L
.04 .19524 L
.04095 .19524 L
.0419 .19524 L
.04286 .19524 L
.04381 .19524 L
.04476 .19524 L
.04571 .19524 L
.04667 .19524 L
.04762 .19524 L
.04857 .19524 L
.04952 .19524 L
.05048 .19524 L
.05143 .19524 L
.05238 .19524 L
.05333 .19524 L
.05429 .19524 L
.05524 .19524 L
.05619 .00476 L
.05714 .00476 L
.0581 .00476 L
.05905 .00476 L
.06 .00476 L
.06095 .00476 L
.0619 .00476 L
.06286 .00476 L
.06381 .00476 L
.06476 .00476 L
.06571 .00476 L
.06667 .00476 L
.06762 .00476 L
.06857 .00476 L
.06952 .00476 L
.07048 .00476 L
Mistroke
.07143 .00476 L
.07238 .00476 L
.07333 .00476 L
.07429 .00476 L
.07524 .00476 L
.07619 .00476 L
.07714 .00476 L
.0781 .00476 L
.07905 .00476 L
.08 .00476 L
.08095 .00476 L
.0819 .00476 L
.08286 .00476 L
.08381 .00476 L
.08476 .00476 L
.08571 .00476 L
.08667 .00476 L
.08762 .00476 L
.08857 .00476 L
.08952 .00476 L
.09048 .00476 L
.09143 .00476 L
.09238 .00476 L
.09333 .00476 L
.09429 .00476 L
.09524 .00476 L
.09619 .00476 L
.09714 .00476 L
.0981 .00476 L
.09905 .00476 L
.1 .00476 L
.10095 .00476 L
.1019 .00476 L
.10286 .00476 L
.10381 .00476 L
.10476 .00476 L
.10571 .00476 L
.10667 .00476 L
.10762 .00476 L
.10857 .00476 L
.10952 .00476 L
.11048 .00476 L
.11143 .00476 L
.11238 .00476 L
.11333 .00476 L
.11429 .00476 L
.11524 .00476 L
.11619 .00476 L
.11714 .00476 L
.1181 .00476 L
Mistroke
.11905 .00476 L
.12 .00476 L
.12095 .00476 L
.1219 .00476 L
.12286 .00476 L
.12381 .00476 L
.12476 .00476 L
.12571 .00476 L
.12667 .00476 L
.12762 .00476 L
.12857 .00476 L
.12952 .00476 L
.13048 .00476 L
.13143 .00476 L
.13238 .00476 L
.13333 .00476 L
.13429 .00476 L
.13524 .00476 L
.13619 .00476 L
.13714 .00476 L
.1381 .00476 L
.13905 .00476 L
.14 .00476 L
.14095 .00476 L
.1419 .00476 L
.14286 .00476 L
.14381 .00476 L
.14476 .00476 L
.14571 .00476 L
.14667 .00476 L
.14762 .00476 L
.14857 .00476 L
.14952 .00476 L
.15048 .00476 L
.15143 .00476 L
.15238 .00476 L
.15333 .00476 L
.15429 .00476 L
.15524 .00476 L
.15619 .00476 L
.15714 .00476 L
.1581 .00476 L
.15905 .00476 L
.16 .00476 L
.16095 .00476 L
.1619 .00476 L
.16286 .00476 L
.16381 .00476 L
.16476 .00476 L
.16571 .00476 L
Mistroke
.16667 .00476 L
.16762 .00476 L
.16857 .00476 L
.16952 .00476 L
.17048 .00476 L
.17143 .00476 L
.17238 .00476 L
.17333 .00476 L
.17429 .00476 L
.17524 .00476 L
.17619 .00476 L
.17714 .00476 L
.1781 .00476 L
.17905 .00476 L
.18 .00476 L
.18095 .00476 L
.1819 .00476 L
.18286 .00476 L
.18381 .00476 L
.18476 .00476 L
.18571 .00476 L
.18667 .00476 L
.18762 .00476 L
.18857 .00476 L
.18952 .00476 L
.19048 .00476 L
.19143 .00476 L
.19238 .00476 L
.19333 .00476 L
.19429 .00476 L
.19524 .00476 L
.19619 .00476 L
.19714 .00476 L
.1981 .00476 L
.19905 .00476 L
.2 .00476 L
.20095 .00476 L
.2019 .00476 L
.20286 .00476 L
.20381 .00476 L
.20476 .00476 L
.20571 .00476 L
.20667 .00476 L
.20762 .00476 L
.20857 .00476 L
.20952 .00476 L
.21048 .00476 L
.21143 .00476 L
.21238 .00476 L
.21333 .00476 L
Mistroke
.21429 .00476 L
.21524 .00476 L
.21619 .00476 L
.21714 .00476 L
.2181 .00476 L
.21905 .00476 L
.22 .00476 L
.22095 .00476 L
.2219 .00476 L
.22286 .00476 L
.22381 .00476 L
.22476 .00476 L
.22571 .00476 L
.22667 .00476 L
.22762 .00476 L
.22857 .00476 L
.22952 .00476 L
.23048 .00476 L
.23143 .00476 L
.23238 .00476 L
.23333 .00476 L
.23429 .00476 L
.23524 .00476 L
.23619 .00476 L
.23714 .00476 L
.2381 .00476 L
.23905 .00476 L
.24 .00476 L
.24095 .00476 L
.2419 .00476 L
.24286 .00476 L
.24381 .00476 L
.24476 .00476 L
.24571 .00476 L
.24667 .00476 L
.24762 .00476 L
.24857 .00476 L
.24952 .00476 L
.25048 .00476 L
.25143 .00476 L
.25238 .00476 L
.25333 .00476 L
.25429 .00476 L
.25524 .00476 L
.25619 .00476 L
.25714 .00476 L
.2581 .00476 L
.25905 .00476 L
.26 .00476 L
.26095 .00476 L
Mistroke
.2619 .00476 L
.26286 .00476 L
.26381 .00476 L
.26476 .00476 L
.26571 .00476 L
.26667 .00476 L
.26762 .00476 L
.26857 .00476 L
.26952 .00476 L
.27048 .00476 L
.27143 .00476 L
.27238 .00476 L
.27333 .00476 L
.27429 .00476 L
.27524 .00476 L
.27619 .00476 L
.27714 .00476 L
.2781 .00476 L
.27905 .00476 L
.28 .00476 L
.28095 .00476 L
.2819 .00476 L
.28286 .00476 L
.28381 .00476 L
.28476 .00476 L
.28571 .00476 L
.28667 .00476 L
.28762 .00476 L
.28857 .00476 L
.28952 .00476 L
.29048 .00476 L
.29143 .00476 L
.29238 .00476 L
.29333 .00476 L
.29429 .00476 L
.29524 .00476 L
.29619 .00476 L
.29714 .00476 L
.2981 .00476 L
.29905 .00476 L
.3 .00476 L
.30095 .00476 L
.3019 .00476 L
.30286 .00476 L
.30381 .00476 L
.30476 .00476 L
.30571 .00476 L
.30667 .00476 L
.30762 .00476 L
.30857 .00476 L
Mistroke
.30952 .00476 L
.31048 .00476 L
.31143 .00476 L
.31238 .00476 L
.31333 .00476 L
.31429 .00476 L
.31524 .00476 L
.31619 .00476 L
.31714 .00476 L
.3181 .00476 L
.31905 .00476 L
.32 .00476 L
.32095 .00476 L
.3219 .00476 L
.32286 .00476 L
.32381 .00476 L
.32476 .00476 L
.32571 .00476 L
.32667 .00476 L
.32762 .00476 L
.32857 .00476 L
.32952 .00476 L
.33048 .00476 L
.33143 .00476 L
.33238 .00476 L
.33333 .00476 L
.33429 .00476 L
.33524 .00476 L
.33619 .00476 L
.33714 .00476 L
.3381 .00476 L
.33905 .00476 L
.34 .00476 L
.34095 .00476 L
.3419 .00476 L
.34286 .00476 L
.34381 .00476 L
.34476 .00476 L
.34571 .00476 L
.34667 .00476 L
.34762 .00476 L
.34857 .00476 L
.34952 .00476 L
.35048 .00476 L
.35143 .00476 L
.35238 .00476 L
.35333 .00476 L
.35429 .00476 L
.35524 .00476 L
.35619 .00476 L
Mistroke
.35714 .00476 L
.3581 .00476 L
.35905 .00476 L
.36 .00476 L
.36095 .00476 L
.3619 .00476 L
.36286 .00476 L
.36381 .00476 L
.36476 .00476 L
.36571 .00476 L
.36667 .00476 L
.36762 .00476 L
.36857 .00476 L
.36952 .00476 L
.37048 .00476 L
.37143 .00476 L
.37238 .00476 L
.37333 .00476 L
.37429 .00476 L
.37524 .00476 L
.37619 .00476 L
.37714 .00476 L
.3781 .00476 L
.37905 .00476 L
.38 .00476 L
.38095 .00476 L
.3819 .00476 L
.38286 .00476 L
.38381 .00476 L
.38476 .00476 L
.38571 .00476 L
.38667 .00476 L
.38762 .00476 L
.38857 .00476 L
.38952 .00476 L
.39048 .00476 L
.39143 .00476 L
.39238 .00476 L
.39333 .00476 L
.39429 .00476 L
.39524 .19524 L
.39619 .19524 L
.39714 .19524 L
.3981 .19524 L
.39905 .19524 L
.4 .19524 L
.40095 .19524 L
.4019 .19524 L
.40286 .19524 L
.40381 .19524 L
Mistroke
.40476 .19524 L
.40571 .19524 L
.40667 .19524 L
.40762 .19524 L
.40857 .19524 L
.40952 .19524 L
.41048 .19524 L
.41143 .19524 L
.41238 .19524 L
.41333 .19524 L
.41429 .19524 L
.41524 .19524 L
.41619 .19524 L
.41714 .19524 L
.4181 .19524 L
.41905 .19524 L
.42 .19524 L
.42095 .19524 L
.4219 .19524 L
.42286 .19524 L
.42381 .19524 L
.42476 .19524 L
.42571 .19524 L
.42667 .19524 L
.42762 .19524 L
.42857 .19524 L
.42952 .19524 L
.43048 .19524 L
.43143 .19524 L
.43238 .19524 L
.43333 .19524 L
.43429 .19524 L
.43524 .19524 L
.43619 .19524 L
.43714 .19524 L
.4381 .19524 L
.43905 .19524 L
.44 .19524 L
.44095 .19524 L
.4419 .19524 L
.44286 .19524 L
.44381 .19524 L
.44476 .19524 L
.44571 .19524 L
.44667 .19524 L
.44762 .19524 L
.44857 .19524 L
.44952 .19524 L
.45048 .19524 L
.45143 .19524 L
Mistroke
.45238 .19524 L
.45333 .19524 L
.45429 .19524 L
.45524 .19524 L
.45619 .19524 L
.45714 .19524 L
.4581 .19524 L
.45905 .19524 L
.46 .19524 L
.46095 .19524 L
.4619 .19524 L
.46286 .19524 L
.46381 .19524 L
.46476 .19524 L
.46571 .19524 L
.46667 .19524 L
.46762 .19524 L
.46857 .19524 L
.46952 .19524 L
.47048 .19524 L
.47143 .19524 L
.47238 .19524 L
.47333 .19524 L
.47429 .19524 L
.47524 .19524 L
.47619 .19524 L
.47714 .19524 L
.4781 .19524 L
.47905 .19524 L
.48 .19524 L
.48095 .19524 L
.4819 .19524 L
.48286 .19524 L
.48381 .19524 L
.48476 .19524 L
.48571 .19524 L
.48667 .19524 L
.48762 .19524 L
.48857 .19524 L
.48952 .19524 L
.49048 .19524 L
.49143 .19524 L
.49238 .19524 L
.49333 .19524 L
.49429 .19524 L
.49524 .19524 L
.49619 .19524 L
.49714 .19524 L
.4981 .19524 L
.49905 .19524 L
Mistroke
.5 .19524 L
.50095 .19524 L
.5019 .19524 L
.50286 .19524 L
.50381 .19524 L
.50476 .19524 L
.50571 .19524 L
.50667 .19524 L
.50762 .19524 L
.50857 .19524 L
.50952 .19524 L
.51048 .19524 L
.51143 .19524 L
.51238 .19524 L
.51333 .19524 L
.51429 .19524 L
.51524 .19524 L
.51619 .19524 L
.51714 .19524 L
.5181 .19524 L
.51905 .19524 L
.52 .19524 L
.52095 .19524 L
.5219 .19524 L
.52286 .19524 L
.52381 .19524 L
.52476 .19524 L
.52571 .19524 L
.52667 .19524 L
.52762 .19524 L
.52857 .19524 L
.52952 .19524 L
.53048 .19524 L
.53143 .19524 L
.53238 .19524 L
.53333 .19524 L
.53429 .19524 L
.53524 .19524 L
.53619 .19524 L
.53714 .19524 L
.5381 .19524 L
.53905 .19524 L
.54 .19524 L
.54095 .19524 L
.5419 .19524 L
.54286 .19524 L
.54381 .19524 L
.54476 .19524 L
.54571 .19524 L
.54667 .19524 L
Mistroke
.54762 .19524 L
.54857 .19524 L
.54952 .19524 L
.55048 .19524 L
.55143 .19524 L
.55238 .19524 L
.55333 .19524 L
.55429 .19524 L
.55524 .19524 L
.55619 .19524 L
.55714 .19524 L
.5581 .19524 L
.55905 .19524 L
.56 .19524 L
.56095 .19524 L
.5619 .19524 L
.56286 .19524 L
.56381 .19524 L
.56476 .19524 L
.56571 .19524 L
.56667 .19524 L
.56762 .19524 L
.56857 .19524 L
.56952 .19524 L
.57048 .19524 L
.57143 .19524 L
.57238 .19524 L
.57333 .19524 L
.57429 .19524 L
.57524 .19524 L
.57619 .19524 L
.57714 .19524 L
.5781 .19524 L
.57905 .19524 L
.58 .19524 L
.58095 .19524 L
.5819 .19524 L
.58286 .19524 L
.58381 .19524 L
.58476 .19524 L
.58571 .19524 L
.58667 .19524 L
.58762 .19524 L
.58857 .19524 L
.58952 .19524 L
.59048 .19524 L
.59143 .19524 L
.59238 .19524 L
.59333 .19524 L
.59429 .19524 L
Mistroke
.59524 .19524 L
.59619 .19524 L
.59714 .19524 L
.5981 .19524 L
.59905 .19524 L
.6 .19524 L
.60095 .19524 L
.6019 .19524 L
.60286 .19524 L
.60381 .19524 L
.60476 .19524 L
.60571 .19524 L
.60667 .19524 L
.60762 .19524 L
.60857 .19524 L
.60952 .19524 L
.61048 .19524 L
.61143 .19524 L
.61238 .19524 L
.61333 .19524 L
.61429 .19524 L
.61524 .19524 L
.61619 .19524 L
.61714 .19524 L
.6181 .19524 L
.61905 .19524 L
.62 .19524 L
.62095 .19524 L
.6219 .19524 L
.62286 .19524 L
.62381 .19524 L
.62476 .19524 L
.62571 .19524 L
.62667 .19524 L
.62762 .19524 L
.62857 .19524 L
.62952 .19524 L
.63048 .19524 L
.63143 .19524 L
.63238 .19524 L
.63333 .19524 L
.63429 .19524 L
.63524 .19524 L
.63619 .19524 L
.63714 .19524 L
.6381 .19524 L
.63905 .19524 L
.64 .19524 L
.64095 .19524 L
.6419 .19524 L
Mistroke
.64286 .19524 L
.64381 .19524 L
.64476 .19524 L
.64571 .19524 L
.64667 .19524 L
.64762 .19524 L
.64857 .19524 L
.64952 .19524 L
.65048 .19524 L
.65143 .19524 L
.65238 .19524 L
.65333 .19524 L
.65429 .19524 L
.65524 .19524 L
.65619 .19524 L
.65714 .19524 L
.6581 .19524 L
.65905 .19524 L
.66 .19524 L
.66095 .19524 L
.6619 .19524 L
.66286 .19524 L
.66381 .19524 L
.66476 .19524 L
.66571 .19524 L
.66667 .19524 L
.66762 .19524 L
.66857 .19524 L
.66952 .19524 L
.67048 .19524 L
.67143 .19524 L
.67238 .19524 L
.67333 .19524 L
.67429 .19524 L
.67524 .19524 L
.67619 .19524 L
.67714 .19524 L
.6781 .19524 L
.67905 .19524 L
.68 .19524 L
.68095 .19524 L
.6819 .19524 L
.68286 .19524 L
.68381 .19524 L
.68476 .19524 L
.68571 .19524 L
.68667 .19524 L
.68762 .19524 L
.68857 .19524 L
.68952 .19524 L
Mistroke
.69048 .19524 L
.69143 .19524 L
.69238 .19524 L
.69333 .19524 L
.69429 .19524 L
.69524 .19524 L
.69619 .19524 L
.69714 .19524 L
.6981 .19524 L
.69905 .19524 L
.7 .19524 L
.70095 .19524 L
.7019 .19524 L
.70286 .19524 L
.70381 .19524 L
.70476 .19524 L
.70571 .19524 L
.70667 .19524 L
.70762 .19524 L
.70857 .19524 L
.70952 .19524 L
.71048 .19524 L
.71143 .19524 L
.71238 .19524 L
.71333 .19524 L
.71429 .19524 L
.71524 .19524 L
.71619 .19524 L
.71714 .19524 L
.7181 .19524 L
.71905 .19524 L
.72 .19524 L
.72095 .19524 L
.7219 .19524 L
.72286 .19524 L
.72381 .19524 L
.72476 .19524 L
.72571 .19524 L
.72667 .19524 L
.72762 .19524 L
.72857 .19524 L
.72952 .19524 L
.73048 .19524 L
.73143 .19524 L
.73238 .19524 L
.73333 .19524 L
.73429 .19524 L
.73524 .19524 L
.73619 .19524 L
.73714 .19524 L
Mistroke
.7381 .19524 L
.73905 .19524 L
.74 .19524 L
.74095 .19524 L
.7419 .19524 L
.74286 .19524 L
.74381 .19524 L
.74476 .19524 L
.74571 .19524 L
.74667 .19524 L
.74762 .19524 L
.74857 .19524 L
.74952 .19524 L
.75048 .19524 L
.75143 .19524 L
.75238 .19524 L
.75333 .19524 L
.75429 .19524 L
.75524 .19524 L
.75619 .19524 L
.75714 .19524 L
.7581 .19524 L
.75905 .19524 L
.76 .19524 L
.76095 .19524 L
.7619 .19524 L
.76286 .19524 L
.76381 .19524 L
.76476 .19524 L
.76571 .19524 L
.76667 .19524 L
.76762 .19524 L
.76857 .19524 L
.76952 .19524 L
.77048 .19524 L
.77143 .19524 L
.77238 .19524 L
.77333 .19524 L
.77429 .19524 L
.77524 .19524 L
.77619 .19524 L
.77714 .19524 L
.7781 .19524 L
.77905 .19524 L
.78 .19524 L
.78095 .19524 L
.7819 .19524 L
.78286 .19524 L
.78381 .19524 L
.78476 .19524 L
Mistroke
.78571 .19524 L
.78667 .19524 L
.78762 .19524 L
.78857 .19524 L
.78952 .19524 L
.79048 .19524 L
.79143 .19524 L
.79238 .19524 L
.79333 .19524 L
.79429 .19524 L
.79524 .19524 L
.79619 .19524 L
.79714 .19524 L
.7981 .19524 L
.79905 .19524 L
.8 .19524 L
.80095 .19524 L
.8019 .19524 L
.80286 .19524 L
.80381 .19524 L
.80476 .19524 L
.80571 .19524 L
.80667 .19524 L
.80762 .19524 L
.80857 .19524 L
.80952 .19524 L
.81048 .19524 L
.81143 .19524 L
.81238 .19524 L
.81333 .19524 L
.81429 .19524 L
.81524 .19524 L
.81619 .19524 L
.81714 .19524 L
.8181 .19524 L
.81905 .19524 L
.82 .19524 L
.82095 .19524 L
.8219 .19524 L
.82286 .19524 L
.82381 .19524 L
.82476 .19524 L
.82571 .19524 L
.82667 .19524 L
.82762 .19524 L
.82857 .19524 L
.82952 .19524 L
.83048 .19524 L
.83143 .19524 L
.83238 .19524 L
Mistroke
.83333 .19524 L
.83429 .19524 L
.83524 .19524 L
.83619 .19524 L
.83714 .19524 L
.8381 .19524 L
.83905 .19524 L
.84 .19524 L
.84095 .19524 L
.8419 .19524 L
.84286 .19524 L
.84381 .19524 L
.84476 .19524 L
.84571 .19524 L
.84667 .19524 L
.84762 .19524 L
.84857 .19524 L
.84952 .19524 L
.85048 .19524 L
.85143 .19524 L
.85238 .19524 L
.85333 .19524 L
.85429 .19524 L
.85524 .19524 L
.85619 .19524 L
.85714 .19524 L
.8581 .19524 L
.85905 .19524 L
.86 .19524 L
.86095 .19524 L
.8619 .19524 L
.86286 .19524 L
.86381 .19524 L
.86476 .19524 L
.86571 .19524 L
.86667 .19524 L
.86762 .19524 L
.86857 .19524 L
.86952 .19524 L
.87048 .19524 L
.87143 .19524 L
.87238 .19524 L
.87333 .19524 L
.87429 .19524 L
.87524 .19524 L
.87619 .19524 L
.87714 .19524 L
.8781 .19524 L
.87905 .19524 L
.88 .19524 L
Mistroke
.88095 .19524 L
.8819 .19524 L
.88286 .19524 L
.88381 .19524 L
.88476 .19524 L
.88571 .19524 L
.88667 .19524 L
.88762 .19524 L
.88857 .19524 L
.88952 .19524 L
.89048 .19524 L
.89143 .19524 L
.89238 .19524 L
.89333 .19524 L
.89429 .19524 L
.89524 .19524 L
.89619 .19524 L
.89714 .19524 L
.8981 .19524 L
.89905 .19524 L
.9 .19524 L
.90095 .19524 L
.9019 .19524 L
.90286 .19524 L
.90381 .19524 L
.90476 .19524 L
.90571 .19524 L
.90667 .19524 L
.90762 .19524 L
.90857 .19524 L
.90952 .19524 L
.91048 .19524 L
.91143 .19524 L
.91238 .19524 L
.91333 .19524 L
.91429 .19524 L
.91524 .19524 L
.91619 .19524 L
.91714 .19524 L
.9181 .19524 L
.91905 .19524 L
.92 .19524 L
.92095 .19524 L
.9219 .19524 L
.92286 .19524 L
.92381 .19524 L
.92476 .19524 L
.92571 .19524 L
.92667 .19524 L
.92762 .19524 L
Mistroke
.92857 .19524 L
.92952 .19524 L
.93048 .19524 L
.93143 .19524 L
.93238 .19524 L
.93333 .19524 L
.93429 .19524 L
.93524 .19524 L
.93619 .19524 L
.93714 .19524 L
.9381 .19524 L
.93905 .19524 L
.94 .19524 L
.94095 .19524 L
.9419 .19524 L
.94286 .19524 L
.94381 .19524 L
.94476 .19524 L
.94571 .19524 L
.94667 .19524 L
.94762 .19524 L
.94857 .19524 L
.94952 .19524 L
.95048 .19524 L
.95143 .19524 L
.95238 .19524 L
.95333 .19524 L
.95429 .19524 L
.95524 .19524 L
.95619 .19524 L
.95714 .19524 L
.9581 .19524 L
.95905 .19524 L
.96 .19524 L
.96095 .19524 L
.9619 .19524 L
.96286 .19524 L
.96381 .19524 L
.96476 .19524 L
.96571 .19524 L
.96667 .19524 L
.96762 .19524 L
.96857 .19524 L
.96952 .19524 L
.97048 .19524 L
.97143 .19524 L
.97238 .19524 L
.97333 .19524 L
.97429 .19524 L
.97524 .19524 L
Mistroke
.97619 .19524 L
Mfstroke
0 0 m
1 0 L
1 .2 L
0 .2 L
closepath
clip
newpath
% End of Graphics
MathPictureEnd

:[font = output; output; inactive; preserveAspect; endGroup]
Graphics["<<>>"]
;[o]
-Graphics-
:[font = text; inactive; preserveAspect]
We can easily change the unit of the x-axis to be milliseconds.
:[font = input; preserveAspect; startGroup]
ListPlot[Transpose[{Range[0, tmax, tstep], myTrace}],
         PlotJoined -> True, PlotRange -> All,
         AspectRatio -> 1 / 5,
         AxesLabel -> {"t/ms", "I/pA"},
         PlotLabel -> "Single Channel Current"]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 2; pictureWidth = 492; pictureHeight = 99]
%!
%%Creator: Mathematica
%%AspectRatio: .2 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.0952381 0.195238 0.340136 [
[(2)] .21429 .19524 0 2 Msboxa
[(4)] .40476 .19524 0 2 Msboxa
[(6)] .59524 .19524 0 2 Msboxa
[(8)] .78571 .19524 0 2 Msboxa
[(10)] .97619 .19524 0 2 Msboxa
[(t/ms)] 1.025 .19524 -1 0 Msboxa
[(Single Channel Current)] .5 .2 0 -2 0 0 1 Mouter Mrotsboxa
[(-0.5)] .01131 .02517 1 0 Msboxa
[(-0.4)] .01131 .05918 1 0 Msboxa
[(-0.3)] .01131 .0932 1 0 Msboxa
[(-0.2)] .01131 .12721 1 0 Msboxa
[(-0.1)] .01131 .16122 1 0 Msboxa
[(I/pA)] .02381 .2 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .20249 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.21429 .19524 m
.21429 .20149 L
s
P
[(2)] .21429 .19524 0 2 Mshowa
p
.002 w
.40476 .19524 m
.40476 .20149 L
s
P
[(4)] .40476 .19524 0 2 Mshowa
p
.002 w
.59524 .19524 m
.59524 .20149 L
s
P
[(6)] .59524 .19524 0 2 Mshowa
p
.002 w
.78571 .19524 m
.78571 .20149 L
s
P
[(8)] .78571 .19524 0 2 Mshowa
p
.002 w
.97619 .19524 m
.97619 .20149 L
s
P
[(10)] .97619 .19524 0 2 Mshowa
p
.001 w
.0619 .19524 m
.0619 .19899 L
s
P
p
.001 w
.1 .19524 m
.1 .19899 L
s
P
p
.001 w
.1381 .19524 m
.1381 .19899 L
s
P
p
.001 w
.17619 .19524 m
.17619 .19899 L
s
P
p
.001 w
.25238 .19524 m
.25238 .19899 L
s
P
p
.001 w
.29048 .19524 m
.29048 .19899 L
s
P
p
.001 w
.32857 .19524 m
.32857 .19899 L
s
P
p
.001 w
.36667 .19524 m
.36667 .19899 L
s
P
p
.001 w
.44286 .19524 m
.44286 .19899 L
s
P
p
.001 w
.48095 .19524 m
.48095 .19899 L
s
P
p
.001 w
.51905 .19524 m
.51905 .19899 L
s
P
p
.001 w
.55714 .19524 m
.55714 .19899 L
s
P
p
.001 w
.63333 .19524 m
.63333 .19899 L
s
P
p
.001 w
.67143 .19524 m
.67143 .19899 L
s
P
p
.001 w
.70952 .19524 m
.70952 .19899 L
s
P
p
.001 w
.74762 .19524 m
.74762 .19899 L
s
P
p
.001 w
.82381 .19524 m
.82381 .19899 L
s
P
p
.001 w
.8619 .19524 m
.8619 .19899 L
s
P
p
.001 w
.9 .19524 m
.9 .19899 L
s
P
p
.001 w
.9381 .19524 m
.9381 .19899 L
s
P
[(t/ms)] 1.025 .19524 -1 0 Mshowa
p
.002 w
0 .19524 m
1 .19524 L
s
P
[(Single Channel Current)] .5 .2 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .02517 m
.03006 .02517 L
s
P
[(-0.5)] .01131 .02517 1 0 Mshowa
p
.002 w
.02381 .05918 m
.03006 .05918 L
s
P
[(-0.4)] .01131 .05918 1 0 Mshowa
p
.002 w
.02381 .0932 m
.03006 .0932 L
s
P
[(-0.3)] .01131 .0932 1 0 Mshowa
p
.002 w
.02381 .12721 m
.03006 .12721 L
s
P
[(-0.2)] .01131 .12721 1 0 Mshowa
p
.002 w
.02381 .16122 m
.03006 .16122 L
s
P
[(-0.1)] .01131 .16122 1 0 Mshowa
p
.001 w
.02381 .03197 m
.02756 .03197 L
s
P
p
.001 w
.02381 .03878 m
.02756 .03878 L
s
P
p
.001 w
.02381 .04558 m
.02756 .04558 L
s
P
p
.001 w
.02381 .05238 m
.02756 .05238 L
s
P
p
.001 w
.02381 .06599 m
.02756 .06599 L
s
P
p
.001 w
.02381 .07279 m
.02756 .07279 L
s
P
p
.001 w
.02381 .07959 m
.02756 .07959 L
s
P
p
.001 w
.02381 .08639 m
.02756 .08639 L
s
P
p
.001 w
.02381 .1 m
.02756 .1 L
s
P
p
.001 w
.02381 .1068 m
.02756 .1068 L
s
P
p
.001 w
.02381 .11361 m
.02756 .11361 L
s
P
p
.001 w
.02381 .12041 m
.02756 .12041 L
s
P
p
.001 w
.02381 .13401 m
.02756 .13401 L
s
P
p
.001 w
.02381 .14082 m
.02756 .14082 L
s
P
p
.001 w
.02381 .14762 m
.02756 .14762 L
s
P
p
.001 w
.02381 .15442 m
.02756 .15442 L
s
P
p
.001 w
.02381 .16803 m
.02756 .16803 L
s
P
p
.001 w
.02381 .17483 m
.02756 .17483 L
s
P
p
.001 w
.02381 .18163 m
.02756 .18163 L
s
P
p
.001 w
.02381 .18844 m
.02756 .18844 L
s
P
p
.001 w
.02381 .01837 m
.02756 .01837 L
s
P
p
.001 w
.02381 .01156 m
.02756 .01156 L
s
P
p
.001 w
.02381 .00476 m
.02756 .00476 L
s
P
[(I/pA)] .02381 .2 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .2 L
s
P
P
.004 w
.02381 .19524 m
.02476 .19524 L
.02571 .19524 L
.02667 .19524 L
.02762 .19524 L
.02857 .19524 L
.02952 .19524 L
.03048 .19524 L
.03143 .19524 L
.03238 .19524 L
.03333 .19524 L
.03429 .19524 L
.03524 .19524 L
.03619 .19524 L
.03714 .19524 L
.0381 .19524 L
.03905 .19524 L
.04 .19524 L
.04095 .19524 L
.0419 .19524 L
.04286 .19524 L
.04381 .19524 L
.04476 .19524 L
.04571 .19524 L
.04667 .19524 L
.04762 .19524 L
.04857 .19524 L
.04952 .19524 L
.05048 .19524 L
.05143 .19524 L
.05238 .19524 L
.05333 .19524 L
.05429 .19524 L
.05524 .19524 L
.05619 .00476 L
.05714 .00476 L
.0581 .00476 L
.05905 .00476 L
.06 .00476 L
.06095 .00476 L
.0619 .00476 L
.06286 .00476 L
.06381 .00476 L
.06476 .00476 L
.06571 .00476 L
.06667 .00476 L
.06762 .00476 L
.06857 .00476 L
.06952 .00476 L
.07048 .00476 L
Mistroke
.07143 .00476 L
.07238 .00476 L
.07333 .00476 L
.07429 .00476 L
.07524 .00476 L
.07619 .00476 L
.07714 .00476 L
.0781 .00476 L
.07905 .00476 L
.08 .00476 L
.08095 .00476 L
.0819 .00476 L
.08286 .00476 L
.08381 .00476 L
.08476 .00476 L
.08571 .00476 L
.08667 .00476 L
.08762 .00476 L
.08857 .00476 L
.08952 .00476 L
.09048 .00476 L
.09143 .00476 L
.09238 .00476 L
.09333 .00476 L
.09429 .00476 L
.09524 .00476 L
.09619 .00476 L
.09714 .00476 L
.0981 .00476 L
.09905 .00476 L
.1 .00476 L
.10095 .00476 L
.1019 .00476 L
.10286 .00476 L
.10381 .00476 L
.10476 .00476 L
.10571 .00476 L
.10667 .00476 L
.10762 .00476 L
.10857 .00476 L
.10952 .00476 L
.11048 .00476 L
.11143 .00476 L
.11238 .00476 L
.11333 .00476 L
.11429 .00476 L
.11524 .00476 L
.11619 .00476 L
.11714 .00476 L
.1181 .00476 L
Mistroke
.11905 .00476 L
.12 .00476 L
.12095 .00476 L
.1219 .00476 L
.12286 .00476 L
.12381 .00476 L
.12476 .00476 L
.12571 .00476 L
.12667 .00476 L
.12762 .00476 L
.12857 .00476 L
.12952 .00476 L
.13048 .00476 L
.13143 .00476 L
.13238 .00476 L
.13333 .00476 L
.13429 .00476 L
.13524 .00476 L
.13619 .00476 L
.13714 .00476 L
.1381 .00476 L
.13905 .00476 L
.14 .00476 L
.14095 .00476 L
.1419 .00476 L
.14286 .00476 L
.14381 .00476 L
.14476 .00476 L
.14571 .00476 L
.14667 .00476 L
.14762 .00476 L
.14857 .00476 L
.14952 .00476 L
.15048 .00476 L
.15143 .00476 L
.15238 .00476 L
.15333 .00476 L
.15429 .00476 L
.15524 .00476 L
.15619 .00476 L
.15714 .00476 L
.1581 .00476 L
.15905 .00476 L
.16 .00476 L
.16095 .00476 L
.1619 .00476 L
.16286 .00476 L
.16381 .00476 L
.16476 .00476 L
.16571 .00476 L
Mistroke
.16667 .00476 L
.16762 .00476 L
.16857 .00476 L
.16952 .00476 L
.17048 .00476 L
.17143 .00476 L
.17238 .00476 L
.17333 .00476 L
.17429 .00476 L
.17524 .00476 L
.17619 .00476 L
.17714 .00476 L
.1781 .00476 L
.17905 .00476 L
.18 .00476 L
.18095 .00476 L
.1819 .00476 L
.18286 .00476 L
.18381 .00476 L
.18476 .00476 L
.18571 .00476 L
.18667 .00476 L
.18762 .00476 L
.18857 .00476 L
.18952 .00476 L
.19048 .00476 L
.19143 .00476 L
.19238 .00476 L
.19333 .00476 L
.19429 .00476 L
.19524 .00476 L
.19619 .00476 L
.19714 .00476 L
.1981 .00476 L
.19905 .00476 L
.2 .00476 L
.20095 .00476 L
.2019 .00476 L
.20286 .00476 L
.20381 .00476 L
.20476 .00476 L
.20571 .00476 L
.20667 .00476 L
.20762 .00476 L
.20857 .00476 L
.20952 .00476 L
.21048 .00476 L
.21143 .00476 L
.21238 .00476 L
.21333 .00476 L
Mistroke
.21429 .00476 L
.21524 .00476 L
.21619 .00476 L
.21714 .00476 L
.2181 .00476 L
.21905 .00476 L
.22 .00476 L
.22095 .00476 L
.2219 .00476 L
.22286 .00476 L
.22381 .00476 L
.22476 .00476 L
.22571 .00476 L
.22667 .00476 L
.22762 .00476 L
.22857 .00476 L
.22952 .00476 L
.23048 .00476 L
.23143 .00476 L
.23238 .00476 L
.23333 .00476 L
.23429 .00476 L
.23524 .00476 L
.23619 .00476 L
.23714 .00476 L
.2381 .00476 L
.23905 .00476 L
.24 .00476 L
.24095 .00476 L
.2419 .00476 L
.24286 .00476 L
.24381 .00476 L
.24476 .00476 L
.24571 .00476 L
.24667 .00476 L
.24762 .00476 L
.24857 .00476 L
.24952 .00476 L
.25048 .00476 L
.25143 .00476 L
.25238 .00476 L
.25333 .00476 L
.25429 .00476 L
.25524 .00476 L
.25619 .00476 L
.25714 .00476 L
.2581 .00476 L
.25905 .00476 L
.26 .00476 L
.26095 .00476 L
Mistroke
.2619 .00476 L
.26286 .00476 L
.26381 .00476 L
.26476 .00476 L
.26571 .00476 L
.26667 .00476 L
.26762 .00476 L
.26857 .00476 L
.26952 .00476 L
.27048 .00476 L
.27143 .00476 L
.27238 .00476 L
.27333 .00476 L
.27429 .00476 L
.27524 .00476 L
.27619 .00476 L
.27714 .00476 L
.2781 .00476 L
.27905 .00476 L
.28 .00476 L
.28095 .00476 L
.2819 .00476 L
.28286 .00476 L
.28381 .00476 L
.28476 .00476 L
.28571 .00476 L
.28667 .00476 L
.28762 .00476 L
.28857 .00476 L
.28952 .00476 L
.29048 .00476 L
.29143 .00476 L
.29238 .00476 L
.29333 .00476 L
.29429 .00476 L
.29524 .00476 L
.29619 .00476 L
.29714 .00476 L
.2981 .00476 L
.29905 .00476 L
.3 .00476 L
.30095 .00476 L
.3019 .00476 L
.30286 .00476 L
.30381 .00476 L
.30476 .00476 L
.30571 .00476 L
.30667 .00476 L
.30762 .00476 L
.30857 .00476 L
Mistroke
.30952 .00476 L
.31048 .00476 L
.31143 .00476 L
.31238 .00476 L
.31333 .00476 L
.31429 .00476 L
.31524 .00476 L
.31619 .00476 L
.31714 .00476 L
.3181 .00476 L
.31905 .00476 L
.32 .00476 L
.32095 .00476 L
.3219 .00476 L
.32286 .00476 L
.32381 .00476 L
.32476 .00476 L
.32571 .00476 L
.32667 .00476 L
.32762 .00476 L
.32857 .00476 L
.32952 .00476 L
.33048 .00476 L
.33143 .00476 L
.33238 .00476 L
.33333 .00476 L
.33429 .00476 L
.33524 .00476 L
.33619 .00476 L
.33714 .00476 L
.3381 .00476 L
.33905 .00476 L
.34 .00476 L
.34095 .00476 L
.3419 .00476 L
.34286 .00476 L
.34381 .00476 L
.34476 .00476 L
.34571 .00476 L
.34667 .00476 L
.34762 .00476 L
.34857 .00476 L
.34952 .00476 L
.35048 .00476 L
.35143 .00476 L
.35238 .00476 L
.35333 .00476 L
.35429 .00476 L
.35524 .00476 L
.35619 .00476 L
Mistroke
.35714 .00476 L
.3581 .00476 L
.35905 .00476 L
.36 .00476 L
.36095 .00476 L
.3619 .00476 L
.36286 .00476 L
.36381 .00476 L
.36476 .00476 L
.36571 .00476 L
.36667 .00476 L
.36762 .00476 L
.36857 .00476 L
.36952 .00476 L
.37048 .00476 L
.37143 .00476 L
.37238 .00476 L
.37333 .00476 L
.37429 .00476 L
.37524 .00476 L
.37619 .00476 L
.37714 .00476 L
.3781 .00476 L
.37905 .00476 L
.38 .00476 L
.38095 .00476 L
.3819 .00476 L
.38286 .00476 L
.38381 .00476 L
.38476 .00476 L
.38571 .00476 L
.38667 .00476 L
.38762 .00476 L
.38857 .00476 L
.38952 .00476 L
.39048 .00476 L
.39143 .00476 L
.39238 .00476 L
.39333 .00476 L
.39429 .00476 L
.39524 .19524 L
.39619 .19524 L
.39714 .19524 L
.3981 .19524 L
.39905 .19524 L
.4 .19524 L
.40095 .19524 L
.4019 .19524 L
.40286 .19524 L
.40381 .19524 L
Mistroke
.40476 .19524 L
.40571 .19524 L
.40667 .19524 L
.40762 .19524 L
.40857 .19524 L
.40952 .19524 L
.41048 .19524 L
.41143 .19524 L
.41238 .19524 L
.41333 .19524 L
.41429 .19524 L
.41524 .19524 L
.41619 .19524 L
.41714 .19524 L
.4181 .19524 L
.41905 .19524 L
.42 .19524 L
.42095 .19524 L
.4219 .19524 L
.42286 .19524 L
.42381 .19524 L
.42476 .19524 L
.42571 .19524 L
.42667 .19524 L
.42762 .19524 L
.42857 .19524 L
.42952 .19524 L
.43048 .19524 L
.43143 .19524 L
.43238 .19524 L
.43333 .19524 L
.43429 .19524 L
.43524 .19524 L
.43619 .19524 L
.43714 .19524 L
.4381 .19524 L
.43905 .19524 L
.44 .19524 L
.44095 .19524 L
.4419 .19524 L
.44286 .19524 L
.44381 .19524 L
.44476 .19524 L
.44571 .19524 L
.44667 .19524 L
.44762 .19524 L
.44857 .19524 L
.44952 .19524 L
.45048 .19524 L
.45143 .19524 L
Mistroke
.45238 .19524 L
.45333 .19524 L
.45429 .19524 L
.45524 .19524 L
.45619 .19524 L
.45714 .19524 L
.4581 .19524 L
.45905 .19524 L
.46 .19524 L
.46095 .19524 L
.4619 .19524 L
.46286 .19524 L
.46381 .19524 L
.46476 .19524 L
.46571 .19524 L
.46667 .19524 L
.46762 .19524 L
.46857 .19524 L
.46952 .19524 L
.47048 .19524 L
.47143 .19524 L
.47238 .19524 L
.47333 .19524 L
.47429 .19524 L
.47524 .19524 L
.47619 .19524 L
.47714 .19524 L
.4781 .19524 L
.47905 .19524 L
.48 .19524 L
.48095 .19524 L
.4819 .19524 L
.48286 .19524 L
.48381 .19524 L
.48476 .19524 L
.48571 .19524 L
.48667 .19524 L
.48762 .19524 L
.48857 .19524 L
.48952 .19524 L
.49048 .19524 L
.49143 .19524 L
.49238 .19524 L
.49333 .19524 L
.49429 .19524 L
.49524 .19524 L
.49619 .19524 L
.49714 .19524 L
.4981 .19524 L
.49905 .19524 L
Mistroke
.5 .19524 L
.50095 .19524 L
.5019 .19524 L
.50286 .19524 L
.50381 .19524 L
.50476 .19524 L
.50571 .19524 L
.50667 .19524 L
.50762 .19524 L
.50857 .19524 L
.50952 .19524 L
.51048 .19524 L
.51143 .19524 L
.51238 .19524 L
.51333 .19524 L
.51429 .19524 L
.51524 .19524 L
.51619 .19524 L
.51714 .19524 L
.5181 .19524 L
.51905 .19524 L
.52 .19524 L
.52095 .19524 L
.5219 .19524 L
.52286 .19524 L
.52381 .19524 L
.52476 .19524 L
.52571 .19524 L
.52667 .19524 L
.52762 .19524 L
.52857 .19524 L
.52952 .19524 L
.53048 .19524 L
.53143 .19524 L
.53238 .19524 L
.53333 .19524 L
.53429 .19524 L
.53524 .19524 L
.53619 .19524 L
.53714 .19524 L
.5381 .19524 L
.53905 .19524 L
.54 .19524 L
.54095 .19524 L
.5419 .19524 L
.54286 .19524 L
.54381 .19524 L
.54476 .19524 L
.54571 .19524 L
.54667 .19524 L
Mistroke
.54762 .19524 L
.54857 .19524 L
.54952 .19524 L
.55048 .19524 L
.55143 .19524 L
.55238 .19524 L
.55333 .19524 L
.55429 .19524 L
.55524 .19524 L
.55619 .19524 L
.55714 .19524 L
.5581 .19524 L
.55905 .19524 L
.56 .19524 L
.56095 .19524 L
.5619 .19524 L
.56286 .19524 L
.56381 .19524 L
.56476 .19524 L
.56571 .19524 L
.56667 .19524 L
.56762 .19524 L
.56857 .19524 L
.56952 .19524 L
.57048 .19524 L
.57143 .19524 L
.57238 .19524 L
.57333 .19524 L
.57429 .19524 L
.57524 .19524 L
.57619 .19524 L
.57714 .19524 L
.5781 .19524 L
.57905 .19524 L
.58 .19524 L
.58095 .19524 L
.5819 .19524 L
.58286 .19524 L
.58381 .19524 L
.58476 .19524 L
.58571 .19524 L
.58667 .19524 L
.58762 .19524 L
.58857 .19524 L
.58952 .19524 L
.59048 .19524 L
.59143 .19524 L
.59238 .19524 L
.59333 .19524 L
.59429 .19524 L
Mistroke
.59524 .19524 L
.59619 .19524 L
.59714 .19524 L
.5981 .19524 L
.59905 .19524 L
.6 .19524 L
.60095 .19524 L
.6019 .19524 L
.60286 .19524 L
.60381 .19524 L
.60476 .19524 L
.60571 .19524 L
.60667 .19524 L
.60762 .19524 L
.60857 .19524 L
.60952 .19524 L
.61048 .19524 L
.61143 .19524 L
.61238 .19524 L
.61333 .19524 L
.61429 .19524 L
.61524 .19524 L
.61619 .19524 L
.61714 .19524 L
.6181 .19524 L
.61905 .19524 L
.62 .19524 L
.62095 .19524 L
.6219 .19524 L
.62286 .19524 L
.62381 .19524 L
.62476 .19524 L
.62571 .19524 L
.62667 .19524 L
.62762 .19524 L
.62857 .19524 L
.62952 .19524 L
.63048 .19524 L
.63143 .19524 L
.63238 .19524 L
.63333 .19524 L
.63429 .19524 L
.63524 .19524 L
.63619 .19524 L
.63714 .19524 L
.6381 .19524 L
.63905 .19524 L
.64 .19524 L
.64095 .19524 L
.6419 .19524 L
Mistroke
.64286 .19524 L
.64381 .19524 L
.64476 .19524 L
.64571 .19524 L
.64667 .19524 L
.64762 .19524 L
.64857 .19524 L
.64952 .19524 L
.65048 .19524 L
.65143 .19524 L
.65238 .19524 L
.65333 .19524 L
.65429 .19524 L
.65524 .19524 L
.65619 .19524 L
.65714 .19524 L
.6581 .19524 L
.65905 .19524 L
.66 .19524 L
.66095 .19524 L
.6619 .19524 L
.66286 .19524 L
.66381 .19524 L
.66476 .19524 L
.66571 .19524 L
.66667 .19524 L
.66762 .19524 L
.66857 .19524 L
.66952 .19524 L
.67048 .19524 L
.67143 .19524 L
.67238 .19524 L
.67333 .19524 L
.67429 .19524 L
.67524 .19524 L
.67619 .19524 L
.67714 .19524 L
.6781 .19524 L
.67905 .19524 L
.68 .19524 L
.68095 .19524 L
.6819 .19524 L
.68286 .19524 L
.68381 .19524 L
.68476 .19524 L
.68571 .19524 L
.68667 .19524 L
.68762 .19524 L
.68857 .19524 L
.68952 .19524 L
Mistroke
.69048 .19524 L
.69143 .19524 L
.69238 .19524 L
.69333 .19524 L
.69429 .19524 L
.69524 .19524 L
.69619 .19524 L
.69714 .19524 L
.6981 .19524 L
.69905 .19524 L
.7 .19524 L
.70095 .19524 L
.7019 .19524 L
.70286 .19524 L
.70381 .19524 L
.70476 .19524 L
.70571 .19524 L
.70667 .19524 L
.70762 .19524 L
.70857 .19524 L
.70952 .19524 L
.71048 .19524 L
.71143 .19524 L
.71238 .19524 L
.71333 .19524 L
.71429 .19524 L
.71524 .19524 L
.71619 .19524 L
.71714 .19524 L
.7181 .19524 L
.71905 .19524 L
.72 .19524 L
.72095 .19524 L
.7219 .19524 L
.72286 .19524 L
.72381 .19524 L
.72476 .19524 L
.72571 .19524 L
.72667 .19524 L
.72762 .19524 L
.72857 .19524 L
.72952 .19524 L
.73048 .19524 L
.73143 .19524 L
.73238 .19524 L
.73333 .19524 L
.73429 .19524 L
.73524 .19524 L
.73619 .19524 L
.73714 .19524 L
Mistroke
.7381 .19524 L
.73905 .19524 L
.74 .19524 L
.74095 .19524 L
.7419 .19524 L
.74286 .19524 L
.74381 .19524 L
.74476 .19524 L
.74571 .19524 L
.74667 .19524 L
.74762 .19524 L
.74857 .19524 L
.74952 .19524 L
.75048 .19524 L
.75143 .19524 L
.75238 .19524 L
.75333 .19524 L
.75429 .19524 L
.75524 .19524 L
.75619 .19524 L
.75714 .19524 L
.7581 .19524 L
.75905 .19524 L
.76 .19524 L
.76095 .19524 L
.7619 .19524 L
.76286 .19524 L
.76381 .19524 L
.76476 .19524 L
.76571 .19524 L
.76667 .19524 L
.76762 .19524 L
.76857 .19524 L
.76952 .19524 L
.77048 .19524 L
.77143 .19524 L
.77238 .19524 L
.77333 .19524 L
.77429 .19524 L
.77524 .19524 L
.77619 .19524 L
.77714 .19524 L
.7781 .19524 L
.77905 .19524 L
.78 .19524 L
.78095 .19524 L
.7819 .19524 L
.78286 .19524 L
.78381 .19524 L
.78476 .19524 L
Mistroke
.78571 .19524 L
.78667 .19524 L
.78762 .19524 L
.78857 .19524 L
.78952 .19524 L
.79048 .19524 L
.79143 .19524 L
.79238 .19524 L
.79333 .19524 L
.79429 .19524 L
.79524 .19524 L
.79619 .19524 L
.79714 .19524 L
.7981 .19524 L
.79905 .19524 L
.8 .19524 L
.80095 .19524 L
.8019 .19524 L
.80286 .19524 L
.80381 .19524 L
.80476 .19524 L
.80571 .19524 L
.80667 .19524 L
.80762 .19524 L
.80857 .19524 L
.80952 .19524 L
.81048 .19524 L
.81143 .19524 L
.81238 .19524 L
.81333 .19524 L
.81429 .19524 L
.81524 .19524 L
.81619 .19524 L
.81714 .19524 L
.8181 .19524 L
.81905 .19524 L
.82 .19524 L
.82095 .19524 L
.8219 .19524 L
.82286 .19524 L
.82381 .19524 L
.82476 .19524 L
.82571 .19524 L
.82667 .19524 L
.82762 .19524 L
.82857 .19524 L
.82952 .19524 L
.83048 .19524 L
.83143 .19524 L
.83238 .19524 L
Mistroke
.83333 .19524 L
.83429 .19524 L
.83524 .19524 L
.83619 .19524 L
.83714 .19524 L
.8381 .19524 L
.83905 .19524 L
.84 .19524 L
.84095 .19524 L
.8419 .19524 L
.84286 .19524 L
.84381 .19524 L
.84476 .19524 L
.84571 .19524 L
.84667 .19524 L
.84762 .19524 L
.84857 .19524 L
.84952 .19524 L
.85048 .19524 L
.85143 .19524 L
.85238 .19524 L
.85333 .19524 L
.85429 .19524 L
.85524 .19524 L
.85619 .19524 L
.85714 .19524 L
.8581 .19524 L
.85905 .19524 L
.86 .19524 L
.86095 .19524 L
.8619 .19524 L
.86286 .19524 L
.86381 .19524 L
.86476 .19524 L
.86571 .19524 L
.86667 .19524 L
.86762 .19524 L
.86857 .19524 L
.86952 .19524 L
.87048 .19524 L
.87143 .19524 L
.87238 .19524 L
.87333 .19524 L
.87429 .19524 L
.87524 .19524 L
.87619 .19524 L
.87714 .19524 L
.8781 .19524 L
.87905 .19524 L
.88 .19524 L
Mistroke
.88095 .19524 L
.8819 .19524 L
.88286 .19524 L
.88381 .19524 L
.88476 .19524 L
.88571 .19524 L
.88667 .19524 L
.88762 .19524 L
.88857 .19524 L
.88952 .19524 L
.89048 .19524 L
.89143 .19524 L
.89238 .19524 L
.89333 .19524 L
.89429 .19524 L
.89524 .19524 L
.89619 .19524 L
.89714 .19524 L
.8981 .19524 L
.89905 .19524 L
.9 .19524 L
.90095 .19524 L
.9019 .19524 L
.90286 .19524 L
.90381 .19524 L
.90476 .19524 L
.90571 .19524 L
.90667 .19524 L
.90762 .19524 L
.90857 .19524 L
.90952 .19524 L
.91048 .19524 L
.91143 .19524 L
.91238 .19524 L
.91333 .19524 L
.91429 .19524 L
.91524 .19524 L
.91619 .19524 L
.91714 .19524 L
.9181 .19524 L
.91905 .19524 L
.92 .19524 L
.92095 .19524 L
.9219 .19524 L
.92286 .19524 L
.92381 .19524 L
.92476 .19524 L
.92571 .19524 L
.92667 .19524 L
.92762 .19524 L
Mistroke
.92857 .19524 L
.92952 .19524 L
.93048 .19524 L
.93143 .19524 L
.93238 .19524 L
.93333 .19524 L
.93429 .19524 L
.93524 .19524 L
.93619 .19524 L
.93714 .19524 L
.9381 .19524 L
.93905 .19524 L
.94 .19524 L
.94095 .19524 L
.9419 .19524 L
.94286 .19524 L
.94381 .19524 L
.94476 .19524 L
.94571 .19524 L
.94667 .19524 L
.94762 .19524 L
.94857 .19524 L
.94952 .19524 L
.95048 .19524 L
.95143 .19524 L
.95238 .19524 L
.95333 .19524 L
.95429 .19524 L
.95524 .19524 L
.95619 .19524 L
.95714 .19524 L
.9581 .19524 L
.95905 .19524 L
.96 .19524 L
.96095 .19524 L
.9619 .19524 L
.96286 .19524 L
.96381 .19524 L
.96476 .19524 L
.96571 .19524 L
.96667 .19524 L
.96762 .19524 L
.96857 .19524 L
.96952 .19524 L
.97048 .19524 L
.97143 .19524 L
.97238 .19524 L
.97333 .19524 L
.97429 .19524 L
.97524 .19524 L
Mistroke
.97619 .19524 L
Mfstroke
0 0 m
1 0 L
1 .2 L
0 .2 L
closepath
clip
newpath
% End of Graphics
MathPictureEnd

:[font = output; output; inactive; preserveAspect; endGroup]
Graphics["<<>>"]
;[o]
-Graphics-
:[font = text; inactive; preserveAspect]
Using TraceTable[], we generate a list of traces.
;[s]
3:0,0;6,1;18,2;49,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
?TraceTable
:[font = info; inactive; preserveAspect; endGroup]
TraceTable[q, sclist, initstate, height, duration,
   n, u, {t, tmax, tstep}] returns a list of n
   independent single channel current functions of
   t. See ?SingleTrace for information on the other
   arguments.
:[font = input; preserveAspect]
n = 3; (* 3 traces *)

myTraces =
TraceTable[q, stateConductivityList, initialState,
           height, duration, n, u, {t, tmax, tstep}];
:[font = text; inactive; preserveAspect]
This error message is not always useful.
:[font = text; inactive; preserveAspect]
We map ListPlot[] on every element of the trace list.
;[s]
3:0,0;7,1;17,2;53,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
Map[
    ListPlot[Transpose[{Range[0, tmax, tstep], #}],
             PlotJoined -> True, PlotRange -> {-0.6, 0},
             AspectRatio -> 1 / 5,
             AxesLabel -> {"t/ms", "I/pA"},
             PlotLabel -> "Single Channel Current"] &,
    myTraces];
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 0; pictureWidth = 496; pictureHeight = 100; startGroup]
%!
%%Creator: Mathematica
%%AspectRatio: .2 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.0952381 0.2 0.333333 [
[(2)] .21429 .2 0 2 Msboxa
[(4)] .40476 .2 0 2 Msboxa
[(6)] .59524 .2 0 2 Msboxa
[(8)] .78571 .2 0 2 Msboxa
[(10)] .97619 .2 0 2 Msboxa
[(t/ms)] 1.025 .2 -1 0 Msboxa
[(Single Channel Current)] .5 .2 0 -2 0 0 1 Mouter Mrotsboxa
[(-0.6)] .01131 0 1 0 Msboxa
[(-0.5)] .01131 .03333 1 0 Msboxa
[(-0.4)] .01131 .06667 1 0 Msboxa
[(-0.3)] .01131 .1 1 0 Msboxa
[(-0.2)] .01131 .13333 1 0 Msboxa
[(-0.1)] .01131 .16667 1 0 Msboxa
[(I/pA)] .02381 .2 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .20725 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.21429 .2 m
.21429 .20625 L
s
P
[(2)] .21429 .2 0 2 Mshowa
p
.002 w
.40476 .2 m
.40476 .20625 L
s
P
[(4)] .40476 .2 0 2 Mshowa
p
.002 w
.59524 .2 m
.59524 .20625 L
s
P
[(6)] .59524 .2 0 2 Mshowa
p
.002 w
.78571 .2 m
.78571 .20625 L
s
P
[(8)] .78571 .2 0 2 Mshowa
p
.002 w
.97619 .2 m
.97619 .20625 L
s
P
[(10)] .97619 .2 0 2 Mshowa
p
.001 w
.0619 .2 m
.0619 .20375 L
s
P
p
.001 w
.1 .2 m
.1 .20375 L
s
P
p
.001 w
.1381 .2 m
.1381 .20375 L
s
P
p
.001 w
.17619 .2 m
.17619 .20375 L
s
P
p
.001 w
.25238 .2 m
.25238 .20375 L
s
P
p
.001 w
.29048 .2 m
.29048 .20375 L
s
P
p
.001 w
.32857 .2 m
.32857 .20375 L
s
P
p
.001 w
.36667 .2 m
.36667 .20375 L
s
P
p
.001 w
.44286 .2 m
.44286 .20375 L
s
P
p
.001 w
.48095 .2 m
.48095 .20375 L
s
P
p
.001 w
.51905 .2 m
.51905 .20375 L
s
P
p
.001 w
.55714 .2 m
.55714 .20375 L
s
P
p
.001 w
.63333 .2 m
.63333 .20375 L
s
P
p
.001 w
.67143 .2 m
.67143 .20375 L
s
P
p
.001 w
.70952 .2 m
.70952 .20375 L
s
P
p
.001 w
.74762 .2 m
.74762 .20375 L
s
P
p
.001 w
.82381 .2 m
.82381 .20375 L
s
P
p
.001 w
.8619 .2 m
.8619 .20375 L
s
P
p
.001 w
.9 .2 m
.9 .20375 L
s
P
p
.001 w
.9381 .2 m
.9381 .20375 L
s
P
[(t/ms)] 1.025 .2 -1 0 Mshowa
p
.002 w
0 .2 m
1 .2 L
s
P
[(Single Channel Current)] .5 .2 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 0 m
.03006 0 L
s
P
[(-0.6)] .01131 0 1 0 Mshowa
p
.002 w
.02381 .03333 m
.03006 .03333 L
s
P
[(-0.5)] .01131 .03333 1 0 Mshowa
p
.002 w
.02381 .06667 m
.03006 .06667 L
s
P
[(-0.4)] .01131 .06667 1 0 Mshowa
p
.002 w
.02381 .1 m
.03006 .1 L
s
P
[(-0.3)] .01131 .1 1 0 Mshowa
p
.002 w
.02381 .13333 m
.03006 .13333 L
s
P
[(-0.2)] .01131 .13333 1 0 Mshowa
p
.002 w
.02381 .16667 m
.03006 .16667 L
s
P
[(-0.1)] .01131 .16667 1 0 Mshowa
p
.001 w
.02381 .00667 m
.02756 .00667 L
s
P
p
.001 w
.02381 .01333 m
.02756 .01333 L
s
P
p
.001 w
.02381 .02 m
.02756 .02 L
s
P
p
.001 w
.02381 .02667 m
.02756 .02667 L
s
P
p
.001 w
.02381 .04 m
.02756 .04 L
s
P
p
.001 w
.02381 .04667 m
.02756 .04667 L
s
P
p
.001 w
.02381 .05333 m
.02756 .05333 L
s
P
p
.001 w
.02381 .06 m
.02756 .06 L
s
P
p
.001 w
.02381 .07333 m
.02756 .07333 L
s
P
p
.001 w
.02381 .08 m
.02756 .08 L
s
P
p
.001 w
.02381 .08667 m
.02756 .08667 L
s
P
p
.001 w
.02381 .09333 m
.02756 .09333 L
s
P
p
.001 w
.02381 .10667 m
.02756 .10667 L
s
P
p
.001 w
.02381 .11333 m
.02756 .11333 L
s
P
p
.001 w
.02381 .12 m
.02756 .12 L
s
P
p
.001 w
.02381 .12667 m
.02756 .12667 L
s
P
p
.001 w
.02381 .14 m
.02756 .14 L
s
P
p
.001 w
.02381 .14667 m
.02756 .14667 L
s
P
p
.001 w
.02381 .15333 m
.02756 .15333 L
s
P
p
.001 w
.02381 .16 m
.02756 .16 L
s
P
p
.001 w
.02381 .17333 m
.02756 .17333 L
s
P
p
.001 w
.02381 .18 m
.02756 .18 L
s
P
p
.001 w
.02381 .18667 m
.02756 .18667 L
s
P
p
.001 w
.02381 .19333 m
.02756 .19333 L
s
P
[(I/pA)] .02381 .2 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .2 L
s
P
P
0 0 m
1 0 L
1 .2 L
0 .2 L
closepath
clip
newpath
.004 w
.02381 .2 m
.02476 .2 L
.02571 .2 L
.02667 .2 L
.02762 .2 L
.02857 .2 L
.02952 .2 L
.03048 .2 L
.03143 .2 L
.03238 .2 L
.03333 .2 L
.03429 .2 L
.03524 .2 L
.03619 .2 L
.03714 .2 L
.0381 .2 L
.03905 .2 L
.04 .2 L
.04095 .2 L
.0419 .2 L
.04286 .2 L
.04381 .2 L
.04476 .2 L
.04571 .2 L
.04667 .2 L
.04762 .2 L
.04857 .2 L
.04952 .2 L
.05048 .2 L
.05143 .2 L
.05238 .2 L
.05333 .2 L
.05429 .2 L
.05524 .2 L
.05619 .2 L
.05714 .01333 L
.0581 .01333 L
.05905 .01333 L
.06 .01333 L
.06095 .01333 L
.0619 .01333 L
.06286 .01333 L
.06381 .01333 L
.06476 .01333 L
.06571 .01333 L
.06667 .01333 L
.06762 .01333 L
.06857 .01333 L
.06952 .01333 L
.07048 .01333 L
Mistroke
.07143 .01333 L
.07238 .01333 L
.07333 .01333 L
.07429 .01333 L
.07524 .01333 L
.07619 .01333 L
.07714 .01333 L
.0781 .01333 L
.07905 .01333 L
.08 .01333 L
.08095 .01333 L
.0819 .01333 L
.08286 .01333 L
.08381 .01333 L
.08476 .01333 L
.08571 .01333 L
.08667 .01333 L
.08762 .01333 L
.08857 .01333 L
.08952 .01333 L
.09048 .01333 L
.09143 .01333 L
.09238 .01333 L
.09333 .01333 L
.09429 .01333 L
.09524 .01333 L
.09619 .01333 L
.09714 .01333 L
.0981 .01333 L
.09905 .01333 L
.1 .01333 L
.10095 .01333 L
.1019 .01333 L
.10286 .01333 L
.10381 .01333 L
.10476 .01333 L
.10571 .01333 L
.10667 .01333 L
.10762 .01333 L
.10857 .01333 L
.10952 .01333 L
.11048 .01333 L
.11143 .01333 L
.11238 .01333 L
.11333 .01333 L
.11429 .01333 L
.11524 .01333 L
.11619 .01333 L
.11714 .01333 L
.1181 .01333 L
Mistroke
.11905 .01333 L
.12 .01333 L
.12095 .01333 L
.1219 .01333 L
.12286 .01333 L
.12381 .01333 L
.12476 .01333 L
.12571 .01333 L
.12667 .2 L
.12762 .2 L
.12857 .2 L
.12952 .2 L
.13048 .2 L
.13143 .2 L
.13238 .2 L
.13333 .2 L
.13429 .2 L
.13524 .2 L
.13619 .2 L
.13714 .2 L
.1381 .2 L
.13905 .2 L
.14 .2 L
.14095 .2 L
.1419 .2 L
.14286 .2 L
.14381 .2 L
.14476 .2 L
.14571 .2 L
.14667 .2 L
.14762 .2 L
.14857 .2 L
.14952 .2 L
.15048 .2 L
.15143 .2 L
.15238 .2 L
.15333 .2 L
.15429 .2 L
.15524 .2 L
.15619 .2 L
.15714 .2 L
.1581 .2 L
.15905 .2 L
.16 .2 L
.16095 .2 L
.1619 .2 L
.16286 .2 L
.16381 .2 L
.16476 .2 L
.16571 .2 L
Mistroke
.16667 .2 L
.16762 .2 L
.16857 .2 L
.16952 .2 L
.17048 .2 L
.17143 .2 L
.17238 .2 L
.17333 .2 L
.17429 .2 L
.17524 .2 L
.17619 .2 L
.17714 .2 L
.1781 .2 L
.17905 .2 L
.18 .2 L
.18095 .2 L
.1819 .2 L
.18286 .2 L
.18381 .2 L
.18476 .2 L
.18571 .2 L
.18667 .2 L
.18762 .2 L
.18857 .2 L
.18952 .2 L
.19048 .2 L
.19143 .2 L
.19238 .2 L
.19333 .2 L
.19429 .2 L
.19524 .2 L
.19619 .2 L
.19714 .2 L
.1981 .2 L
.19905 .2 L
.2 .2 L
.20095 .2 L
.2019 .2 L
.20286 .2 L
.20381 .2 L
.20476 .2 L
.20571 .2 L
.20667 .2 L
.20762 .2 L
.20857 .2 L
.20952 .2 L
.21048 .2 L
.21143 .2 L
.21238 .2 L
.21333 .2 L
Mistroke
.21429 .2 L
.21524 .2 L
.21619 .2 L
.21714 .2 L
.2181 .2 L
.21905 .2 L
.22 .2 L
.22095 .2 L
.2219 .2 L
.22286 .2 L
.22381 .2 L
.22476 .2 L
.22571 .2 L
.22667 .2 L
.22762 .2 L
.22857 .2 L
.22952 .2 L
.23048 .2 L
.23143 .2 L
.23238 .2 L
.23333 .2 L
.23429 .2 L
.23524 .2 L
.23619 .2 L
.23714 .2 L
.2381 .2 L
.23905 .2 L
.24 .2 L
.24095 .2 L
.2419 .2 L
.24286 .2 L
.24381 .2 L
.24476 .2 L
.24571 .2 L
.24667 .2 L
.24762 .2 L
.24857 .2 L
.24952 .2 L
.25048 .2 L
.25143 .2 L
.25238 .2 L
.25333 .2 L
.25429 .2 L
.25524 .2 L
.25619 .2 L
.25714 .2 L
.2581 .2 L
.25905 .2 L
.26 .2 L
.26095 .2 L
Mistroke
.2619 .2 L
.26286 .2 L
.26381 .2 L
.26476 .2 L
.26571 .2 L
.26667 .2 L
.26762 .2 L
.26857 .2 L
.26952 .2 L
.27048 .2 L
.27143 .2 L
.27238 .2 L
.27333 .2 L
.27429 .2 L
.27524 .2 L
.27619 .2 L
.27714 .2 L
.2781 .2 L
.27905 .2 L
.28 .2 L
.28095 .2 L
.2819 .2 L
.28286 .2 L
.28381 .2 L
.28476 .2 L
.28571 .2 L
.28667 .2 L
.28762 .2 L
.28857 .2 L
.28952 .2 L
.29048 .2 L
.29143 .2 L
.29238 .2 L
.29333 .2 L
.29429 .2 L
.29524 .2 L
.29619 .2 L
.29714 .2 L
.2981 .2 L
.29905 .2 L
.3 .2 L
.30095 .2 L
.3019 .2 L
.30286 .2 L
.30381 .2 L
.30476 .2 L
.30571 .2 L
.30667 .2 L
.30762 .2 L
.30857 .2 L
Mistroke
.30952 .2 L
.31048 .2 L
.31143 .2 L
.31238 .2 L
.31333 .2 L
.31429 .2 L
.31524 .2 L
.31619 .2 L
.31714 .2 L
.3181 .2 L
.31905 .2 L
.32 .2 L
.32095 .2 L
.3219 .2 L
.32286 .2 L
.32381 .2 L
.32476 .2 L
.32571 .2 L
.32667 .2 L
.32762 .2 L
.32857 .2 L
.32952 .2 L
.33048 .2 L
.33143 .2 L
.33238 .2 L
.33333 .2 L
.33429 .2 L
.33524 .2 L
.33619 .2 L
.33714 .2 L
.3381 .2 L
.33905 .2 L
.34 .2 L
.34095 .2 L
.3419 .2 L
.34286 .2 L
.34381 .2 L
.34476 .2 L
.34571 .2 L
.34667 .2 L
.34762 .2 L
.34857 .2 L
.34952 .2 L
.35048 .2 L
.35143 .2 L
.35238 .2 L
.35333 .2 L
.35429 .2 L
.35524 .2 L
.35619 .2 L
Mistroke
.35714 .2 L
.3581 .2 L
.35905 .2 L
.36 .2 L
.36095 .2 L
.3619 .2 L
.36286 .2 L
.36381 .2 L
.36476 .2 L
.36571 .2 L
.36667 .2 L
.36762 .2 L
.36857 .2 L
.36952 .2 L
.37048 .2 L
.37143 .2 L
.37238 .2 L
.37333 .2 L
.37429 .2 L
.37524 .2 L
.37619 .2 L
.37714 .2 L
.3781 .2 L
.37905 .2 L
.38 .2 L
.38095 .2 L
.3819 .2 L
.38286 .2 L
.38381 .2 L
.38476 .2 L
.38571 .2 L
.38667 .2 L
.38762 .2 L
.38857 .2 L
.38952 .2 L
.39048 .2 L
.39143 .2 L
.39238 .2 L
.39333 .2 L
.39429 .2 L
.39524 .2 L
.39619 .2 L
.39714 .2 L
.3981 .2 L
.39905 .2 L
.4 .2 L
.40095 .2 L
.4019 .2 L
.40286 .2 L
.40381 .2 L
Mistroke
.40476 .2 L
.40571 .2 L
.40667 .2 L
.40762 .2 L
.40857 .2 L
.40952 .2 L
.41048 .2 L
.41143 .2 L
.41238 .2 L
.41333 .2 L
.41429 .2 L
.41524 .2 L
.41619 .2 L
.41714 .2 L
.4181 .2 L
.41905 .2 L
.42 .2 L
.42095 .2 L
.4219 .2 L
.42286 .2 L
.42381 .2 L
.42476 .2 L
.42571 .2 L
.42667 .2 L
.42762 .2 L
.42857 .2 L
.42952 .2 L
.43048 .2 L
.43143 .2 L
.43238 .2 L
.43333 .2 L
.43429 .2 L
.43524 .2 L
.43619 .2 L
.43714 .2 L
.4381 .2 L
.43905 .2 L
.44 .2 L
.44095 .2 L
.4419 .2 L
.44286 .2 L
.44381 .2 L
.44476 .2 L
.44571 .2 L
.44667 .2 L
.44762 .2 L
.44857 .2 L
.44952 .2 L
.45048 .2 L
.45143 .2 L
Mistroke
.45238 .2 L
.45333 .2 L
.45429 .2 L
.45524 .2 L
.45619 .2 L
.45714 .2 L
.4581 .2 L
.45905 .2 L
.46 .2 L
.46095 .2 L
.4619 .2 L
.46286 .2 L
.46381 .2 L
.46476 .2 L
.46571 .2 L
.46667 .2 L
.46762 .2 L
.46857 .2 L
.46952 .2 L
.47048 .2 L
.47143 .2 L
.47238 .2 L
.47333 .2 L
.47429 .2 L
.47524 .2 L
.47619 .2 L
.47714 .2 L
.4781 .2 L
.47905 .2 L
.48 .2 L
.48095 .2 L
.4819 .2 L
.48286 .2 L
.48381 .2 L
.48476 .2 L
.48571 .2 L
.48667 .2 L
.48762 .2 L
.48857 .2 L
.48952 .2 L
.49048 .2 L
.49143 .2 L
.49238 .2 L
.49333 .2 L
.49429 .2 L
.49524 .2 L
.49619 .2 L
.49714 .2 L
.4981 .2 L
.49905 .2 L
Mistroke
.5 .2 L
.50095 .2 L
.5019 .2 L
.50286 .2 L
.50381 .2 L
.50476 .2 L
.50571 .2 L
.50667 .2 L
.50762 .2 L
.50857 .2 L
.50952 .2 L
.51048 .2 L
.51143 .2 L
.51238 .2 L
.51333 .2 L
.51429 .2 L
.51524 .2 L
.51619 .2 L
.51714 .2 L
.5181 .2 L
.51905 .2 L
.52 .2 L
.52095 .2 L
.5219 .2 L
.52286 .2 L
.52381 .2 L
.52476 .2 L
.52571 .2 L
.52667 .2 L
.52762 .2 L
.52857 .2 L
.52952 .2 L
.53048 .2 L
.53143 .2 L
.53238 .2 L
.53333 .2 L
.53429 .2 L
.53524 .2 L
.53619 .2 L
.53714 .2 L
.5381 .2 L
.53905 .2 L
.54 .2 L
.54095 .2 L
.5419 .2 L
.54286 .2 L
.54381 .2 L
.54476 .2 L
.54571 .2 L
.54667 .2 L
Mistroke
.54762 .2 L
.54857 .2 L
.54952 .2 L
.55048 .2 L
.55143 .2 L
.55238 .2 L
.55333 .2 L
.55429 .2 L
.55524 .2 L
.55619 .2 L
.55714 .2 L
.5581 .2 L
.55905 .2 L
.56 .2 L
.56095 .2 L
.5619 .2 L
.56286 .2 L
.56381 .2 L
.56476 .2 L
.56571 .2 L
.56667 .2 L
.56762 .2 L
.56857 .2 L
.56952 .2 L
.57048 .2 L
.57143 .2 L
.57238 .2 L
.57333 .2 L
.57429 .2 L
.57524 .2 L
.57619 .2 L
.57714 .2 L
.5781 .2 L
.57905 .2 L
.58 .2 L
.58095 .2 L
.5819 .2 L
.58286 .2 L
.58381 .2 L
.58476 .2 L
.58571 .2 L
.58667 .2 L
.58762 .2 L
.58857 .2 L
.58952 .2 L
.59048 .2 L
.59143 .2 L
.59238 .2 L
.59333 .2 L
.59429 .2 L
Mistroke
.59524 .2 L
.59619 .2 L
.59714 .2 L
.5981 .2 L
.59905 .2 L
.6 .2 L
.60095 .2 L
.6019 .2 L
.60286 .2 L
.60381 .2 L
.60476 .2 L
.60571 .2 L
.60667 .2 L
.60762 .2 L
.60857 .2 L
.60952 .2 L
.61048 .2 L
.61143 .2 L
.61238 .2 L
.61333 .2 L
.61429 .2 L
.61524 .2 L
.61619 .2 L
.61714 .2 L
.6181 .2 L
.61905 .2 L
.62 .2 L
.62095 .2 L
.6219 .2 L
.62286 .2 L
.62381 .2 L
.62476 .2 L
.62571 .2 L
.62667 .2 L
.62762 .2 L
.62857 .2 L
.62952 .2 L
.63048 .2 L
.63143 .2 L
.63238 .2 L
.63333 .2 L
.63429 .2 L
.63524 .2 L
.63619 .2 L
.63714 .2 L
.6381 .2 L
.63905 .2 L
.64 .2 L
.64095 .2 L
.6419 .2 L
Mistroke
.64286 .2 L
.64381 .2 L
.64476 .2 L
.64571 .2 L
.64667 .2 L
.64762 .2 L
.64857 .2 L
.64952 .2 L
.65048 .2 L
.65143 .2 L
.65238 .2 L
.65333 .2 L
.65429 .2 L
.65524 .2 L
.65619 .2 L
.65714 .2 L
.6581 .2 L
.65905 .2 L
.66 .2 L
.66095 .2 L
.6619 .2 L
.66286 .2 L
.66381 .2 L
.66476 .2 L
.66571 .2 L
.66667 .2 L
.66762 .2 L
.66857 .2 L
.66952 .2 L
.67048 .2 L
.67143 .2 L
.67238 .2 L
.67333 .2 L
.67429 .2 L
.67524 .2 L
.67619 .2 L
.67714 .2 L
.6781 .2 L
.67905 .2 L
.68 .2 L
.68095 .2 L
.6819 .2 L
.68286 .2 L
.68381 .2 L
.68476 .2 L
.68571 .2 L
.68667 .2 L
.68762 .2 L
.68857 .2 L
.68952 .2 L
Mistroke
.69048 .2 L
.69143 .2 L
.69238 .2 L
.69333 .2 L
.69429 .2 L
.69524 .2 L
.69619 .2 L
.69714 .2 L
.6981 .2 L
.69905 .2 L
.7 .2 L
.70095 .2 L
.7019 .2 L
.70286 .2 L
.70381 .2 L
.70476 .2 L
.70571 .2 L
.70667 .2 L
.70762 .2 L
.70857 .2 L
.70952 .2 L
.71048 .2 L
.71143 .2 L
.71238 .2 L
.71333 .2 L
.71429 .2 L
.71524 .2 L
.71619 .2 L
.71714 .2 L
.7181 .2 L
.71905 .2 L
.72 .2 L
.72095 .2 L
.7219 .2 L
.72286 .2 L
.72381 .2 L
.72476 .2 L
.72571 .2 L
.72667 .2 L
.72762 .2 L
.72857 .2 L
.72952 .2 L
.73048 .2 L
.73143 .2 L
.73238 .2 L
.73333 .2 L
.73429 .2 L
.73524 .2 L
.73619 .2 L
.73714 .2 L
Mistroke
.7381 .2 L
.73905 .2 L
.74 .2 L
.74095 .2 L
.7419 .2 L
.74286 .2 L
.74381 .2 L
.74476 .2 L
.74571 .2 L
.74667 .2 L
.74762 .2 L
.74857 .2 L
.74952 .2 L
.75048 .2 L
.75143 .2 L
.75238 .2 L
.75333 .2 L
.75429 .2 L
.75524 .2 L
.75619 .2 L
.75714 .2 L
.7581 .2 L
.75905 .2 L
.76 .2 L
.76095 .2 L
.7619 .2 L
.76286 .2 L
.76381 .2 L
.76476 .2 L
.76571 .2 L
.76667 .2 L
.76762 .2 L
.76857 .2 L
.76952 .2 L
.77048 .2 L
.77143 .2 L
.77238 .2 L
.77333 .2 L
.77429 .2 L
.77524 .2 L
.77619 .2 L
.77714 .2 L
.7781 .2 L
.77905 .2 L
.78 .2 L
.78095 .2 L
.7819 .2 L
.78286 .2 L
.78381 .2 L
.78476 .2 L
Mistroke
.78571 .2 L
.78667 .2 L
.78762 .2 L
.78857 .2 L
.78952 .2 L
.79048 .2 L
.79143 .2 L
.79238 .2 L
.79333 .2 L
.79429 .2 L
.79524 .2 L
.79619 .2 L
.79714 .2 L
.7981 .2 L
.79905 .2 L
.8 .2 L
.80095 .2 L
.8019 .2 L
.80286 .2 L
.80381 .2 L
.80476 .2 L
.80571 .2 L
.80667 .2 L
.80762 .2 L
.80857 .2 L
.80952 .2 L
.81048 .2 L
.81143 .2 L
.81238 .2 L
.81333 .2 L
.81429 .2 L
.81524 .2 L
.81619 .2 L
.81714 .2 L
.8181 .2 L
.81905 .2 L
.82 .2 L
.82095 .2 L
.8219 .2 L
.82286 .2 L
.82381 .2 L
.82476 .2 L
.82571 .2 L
.82667 .2 L
.82762 .2 L
.82857 .2 L
.82952 .2 L
.83048 .2 L
.83143 .2 L
.83238 .2 L
Mistroke
.83333 .2 L
.83429 .2 L
.83524 .2 L
.83619 .2 L
.83714 .2 L
.8381 .2 L
.83905 .2 L
.84 .2 L
.84095 .2 L
.8419 .2 L
.84286 .2 L
.84381 .2 L
.84476 .2 L
.84571 .2 L
.84667 .2 L
.84762 .2 L
.84857 .2 L
.84952 .2 L
.85048 .2 L
.85143 .2 L
.85238 .2 L
.85333 .2 L
.85429 .2 L
.85524 .2 L
.85619 .2 L
.85714 .2 L
.8581 .2 L
.85905 .2 L
.86 .2 L
.86095 .2 L
.8619 .2 L
.86286 .2 L
.86381 .2 L
.86476 .2 L
.86571 .2 L
.86667 .2 L
.86762 .2 L
.86857 .2 L
.86952 .2 L
.87048 .2 L
.87143 .2 L
.87238 .2 L
.87333 .2 L
.87429 .2 L
.87524 .2 L
.87619 .2 L
.87714 .2 L
.8781 .2 L
.87905 .2 L
.88 .2 L
Mistroke
.88095 .2 L
.8819 .2 L
.88286 .2 L
.88381 .2 L
.88476 .2 L
.88571 .2 L
.88667 .2 L
.88762 .2 L
.88857 .2 L
.88952 .2 L
.89048 .2 L
.89143 .2 L
.89238 .2 L
.89333 .2 L
.89429 .2 L
.89524 .2 L
.89619 .2 L
.89714 .2 L
.8981 .2 L
.89905 .2 L
.9 .2 L
.90095 .2 L
.9019 .2 L
.90286 .2 L
.90381 .2 L
.90476 .2 L
.90571 .2 L
.90667 .2 L
.90762 .2 L
.90857 .2 L
.90952 .2 L
.91048 .2 L
.91143 .2 L
.91238 .2 L
.91333 .2 L
.91429 .2 L
.91524 .2 L
.91619 .2 L
.91714 .2 L
.9181 .2 L
.91905 .2 L
.92 .2 L
.92095 .2 L
.9219 .2 L
.92286 .2 L
.92381 .2 L
.92476 .2 L
.92571 .2 L
.92667 .2 L
.92762 .2 L
Mistroke
.92857 .2 L
.92952 .2 L
.93048 .2 L
.93143 .2 L
.93238 .2 L
.93333 .2 L
.93429 .2 L
.93524 .2 L
.93619 .2 L
.93714 .2 L
.9381 .2 L
.93905 .2 L
.94 .2 L
.94095 .2 L
.9419 .2 L
.94286 .2 L
.94381 .2 L
.94476 .2 L
.94571 .2 L
.94667 .2 L
.94762 .2 L
.94857 .2 L
.94952 .2 L
.95048 .2 L
.95143 .2 L
.95238 .2 L
.95333 .2 L
.95429 .2 L
.95524 .2 L
.95619 .2 L
.95714 .2 L
.9581 .2 L
.95905 .2 L
.96 .2 L
.96095 .2 L
.9619 .2 L
.96286 .2 L
.96381 .2 L
.96476 .2 L
.96571 .2 L
.96667 .2 L
.96762 .2 L
.96857 .2 L
.96952 .2 L
.97048 .2 L
.97143 .2 L
.97238 .2 L
.97333 .2 L
.97429 .2 L
.97524 .2 L
Mistroke
.97619 .2 L
Mfstroke
% End of Graphics
MathPictureEnd

:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 0; pictureWidth = 496; pictureHeight = 100]
%!
%%Creator: Mathematica
%%AspectRatio: .2 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.0952381 0.2 0.333333 [
[(2)] .21429 .2 0 2 Msboxa
[(4)] .40476 .2 0 2 Msboxa
[(6)] .59524 .2 0 2 Msboxa
[(8)] .78571 .2 0 2 Msboxa
[(10)] .97619 .2 0 2 Msboxa
[(t/ms)] 1.025 .2 -1 0 Msboxa
[(Single Channel Current)] .5 .2 0 -2 0 0 1 Mouter Mrotsboxa
[(-0.6)] .01131 0 1 0 Msboxa
[(-0.5)] .01131 .03333 1 0 Msboxa
[(-0.4)] .01131 .06667 1 0 Msboxa
[(-0.3)] .01131 .1 1 0 Msboxa
[(-0.2)] .01131 .13333 1 0 Msboxa
[(-0.1)] .01131 .16667 1 0 Msboxa
[(I/pA)] .02381 .2 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .20725 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.21429 .2 m
.21429 .20625 L
s
P
[(2)] .21429 .2 0 2 Mshowa
p
.002 w
.40476 .2 m
.40476 .20625 L
s
P
[(4)] .40476 .2 0 2 Mshowa
p
.002 w
.59524 .2 m
.59524 .20625 L
s
P
[(6)] .59524 .2 0 2 Mshowa
p
.002 w
.78571 .2 m
.78571 .20625 L
s
P
[(8)] .78571 .2 0 2 Mshowa
p
.002 w
.97619 .2 m
.97619 .20625 L
s
P
[(10)] .97619 .2 0 2 Mshowa
p
.001 w
.0619 .2 m
.0619 .20375 L
s
P
p
.001 w
.1 .2 m
.1 .20375 L
s
P
p
.001 w
.1381 .2 m
.1381 .20375 L
s
P
p
.001 w
.17619 .2 m
.17619 .20375 L
s
P
p
.001 w
.25238 .2 m
.25238 .20375 L
s
P
p
.001 w
.29048 .2 m
.29048 .20375 L
s
P
p
.001 w
.32857 .2 m
.32857 .20375 L
s
P
p
.001 w
.36667 .2 m
.36667 .20375 L
s
P
p
.001 w
.44286 .2 m
.44286 .20375 L
s
P
p
.001 w
.48095 .2 m
.48095 .20375 L
s
P
p
.001 w
.51905 .2 m
.51905 .20375 L
s
P
p
.001 w
.55714 .2 m
.55714 .20375 L
s
P
p
.001 w
.63333 .2 m
.63333 .20375 L
s
P
p
.001 w
.67143 .2 m
.67143 .20375 L
s
P
p
.001 w
.70952 .2 m
.70952 .20375 L
s
P
p
.001 w
.74762 .2 m
.74762 .20375 L
s
P
p
.001 w
.82381 .2 m
.82381 .20375 L
s
P
p
.001 w
.8619 .2 m
.8619 .20375 L
s
P
p
.001 w
.9 .2 m
.9 .20375 L
s
P
p
.001 w
.9381 .2 m
.9381 .20375 L
s
P
[(t/ms)] 1.025 .2 -1 0 Mshowa
p
.002 w
0 .2 m
1 .2 L
s
P
[(Single Channel Current)] .5 .2 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 0 m
.03006 0 L
s
P
[(-0.6)] .01131 0 1 0 Mshowa
p
.002 w
.02381 .03333 m
.03006 .03333 L
s
P
[(-0.5)] .01131 .03333 1 0 Mshowa
p
.002 w
.02381 .06667 m
.03006 .06667 L
s
P
[(-0.4)] .01131 .06667 1 0 Mshowa
p
.002 w
.02381 .1 m
.03006 .1 L
s
P
[(-0.3)] .01131 .1 1 0 Mshowa
p
.002 w
.02381 .13333 m
.03006 .13333 L
s
P
[(-0.2)] .01131 .13333 1 0 Mshowa
p
.002 w
.02381 .16667 m
.03006 .16667 L
s
P
[(-0.1)] .01131 .16667 1 0 Mshowa
p
.001 w
.02381 .00667 m
.02756 .00667 L
s
P
p
.001 w
.02381 .01333 m
.02756 .01333 L
s
P
p
.001 w
.02381 .02 m
.02756 .02 L
s
P
p
.001 w
.02381 .02667 m
.02756 .02667 L
s
P
p
.001 w
.02381 .04 m
.02756 .04 L
s
P
p
.001 w
.02381 .04667 m
.02756 .04667 L
s
P
p
.001 w
.02381 .05333 m
.02756 .05333 L
s
P
p
.001 w
.02381 .06 m
.02756 .06 L
s
P
p
.001 w
.02381 .07333 m
.02756 .07333 L
s
P
p
.001 w
.02381 .08 m
.02756 .08 L
s
P
p
.001 w
.02381 .08667 m
.02756 .08667 L
s
P
p
.001 w
.02381 .09333 m
.02756 .09333 L
s
P
p
.001 w
.02381 .10667 m
.02756 .10667 L
s
P
p
.001 w
.02381 .11333 m
.02756 .11333 L
s
P
p
.001 w
.02381 .12 m
.02756 .12 L
s
P
p
.001 w
.02381 .12667 m
.02756 .12667 L
s
P
p
.001 w
.02381 .14 m
.02756 .14 L
s
P
p
.001 w
.02381 .14667 m
.02756 .14667 L
s
P
p
.001 w
.02381 .15333 m
.02756 .15333 L
s
P
p
.001 w
.02381 .16 m
.02756 .16 L
s
P
p
.001 w
.02381 .17333 m
.02756 .17333 L
s
P
p
.001 w
.02381 .18 m
.02756 .18 L
s
P
p
.001 w
.02381 .18667 m
.02756 .18667 L
s
P
p
.001 w
.02381 .19333 m
.02756 .19333 L
s
P
[(I/pA)] .02381 .2 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .2 L
s
P
P
0 0 m
1 0 L
1 .2 L
0 .2 L
closepath
clip
newpath
.004 w
.02381 .2 m
.02476 .2 L
.02571 .2 L
.02667 .2 L
.02762 .2 L
.02857 .2 L
.02952 .2 L
.03048 .2 L
.03143 .2 L
.03238 .2 L
.03333 .2 L
.03429 .2 L
.03524 .2 L
.03619 .2 L
.03714 .2 L
.0381 .2 L
.03905 .2 L
.04 .2 L
.04095 .2 L
.0419 .2 L
.04286 .2 L
.04381 .2 L
.04476 .2 L
.04571 .2 L
.04667 .2 L
.04762 .2 L
.04857 .2 L
.04952 .2 L
.05048 .2 L
.05143 .01333 L
.05238 .01333 L
.05333 .01333 L
.05429 .01333 L
.05524 .01333 L
.05619 .01333 L
.05714 .01333 L
.0581 .01333 L
.05905 .01333 L
.06 .01333 L
.06095 .01333 L
.0619 .01333 L
.06286 .01333 L
.06381 .01333 L
.06476 .01333 L
.06571 .01333 L
.06667 .01333 L
.06762 .01333 L
.06857 .01333 L
.06952 .01333 L
.07048 .01333 L
Mistroke
.07143 .01333 L
.07238 .01333 L
.07333 .01333 L
.07429 .01333 L
.07524 .01333 L
.07619 .01333 L
.07714 .01333 L
.0781 .01333 L
.07905 .01333 L
.08 .01333 L
.08095 .01333 L
.0819 .01333 L
.08286 .01333 L
.08381 .01333 L
.08476 .01333 L
.08571 .01333 L
.08667 .01333 L
.08762 .01333 L
.08857 .01333 L
.08952 .01333 L
.09048 .01333 L
.09143 .01333 L
.09238 .01333 L
.09333 .01333 L
.09429 .01333 L
.09524 .01333 L
.09619 .01333 L
.09714 .01333 L
.0981 .01333 L
.09905 .01333 L
.1 .01333 L
.10095 .01333 L
.1019 .01333 L
.10286 .01333 L
.10381 .01333 L
.10476 .01333 L
.10571 .01333 L
.10667 .01333 L
.10762 .01333 L
.10857 .01333 L
.10952 .01333 L
.11048 .01333 L
.11143 .01333 L
.11238 .01333 L
.11333 .01333 L
.11429 .01333 L
.11524 .01333 L
.11619 .01333 L
.11714 .01333 L
.1181 .01333 L
Mistroke
.11905 .01333 L
.12 .01333 L
.12095 .01333 L
.1219 .01333 L
.12286 .01333 L
.12381 .01333 L
.12476 .2 L
.12571 .2 L
.12667 .2 L
.12762 .2 L
.12857 .2 L
.12952 .2 L
.13048 .2 L
.13143 .2 L
.13238 .2 L
.13333 .2 L
.13429 .2 L
.13524 .2 L
.13619 .2 L
.13714 .2 L
.1381 .2 L
.13905 .2 L
.14 .2 L
.14095 .2 L
.1419 .2 L
.14286 .2 L
.14381 .2 L
.14476 .2 L
.14571 .2 L
.14667 .2 L
.14762 .2 L
.14857 .2 L
.14952 .2 L
.15048 .2 L
.15143 .2 L
.15238 .2 L
.15333 .2 L
.15429 .2 L
.15524 .2 L
.15619 .2 L
.15714 .2 L
.1581 .2 L
.15905 .2 L
.16 .2 L
.16095 .2 L
.1619 .2 L
.16286 .2 L
.16381 .2 L
.16476 .2 L
.16571 .2 L
Mistroke
.16667 .2 L
.16762 .2 L
.16857 .2 L
.16952 .2 L
.17048 .2 L
.17143 .2 L
.17238 .2 L
.17333 .2 L
.17429 .2 L
.17524 .2 L
.17619 .2 L
.17714 .2 L
.1781 .2 L
.17905 .2 L
.18 .2 L
.18095 .2 L
.1819 .2 L
.18286 .2 L
.18381 .2 L
.18476 .2 L
.18571 .2 L
.18667 .2 L
.18762 .2 L
.18857 .2 L
.18952 .2 L
.19048 .2 L
.19143 .2 L
.19238 .2 L
.19333 .2 L
.19429 .2 L
.19524 .2 L
.19619 .2 L
.19714 .2 L
.1981 .2 L
.19905 .2 L
.2 .2 L
.20095 .2 L
.2019 .2 L
.20286 .2 L
.20381 .2 L
.20476 .2 L
.20571 .2 L
.20667 .2 L
.20762 .2 L
.20857 .2 L
.20952 .2 L
.21048 .2 L
.21143 .2 L
.21238 .2 L
.21333 .2 L
Mistroke
.21429 .2 L
.21524 .2 L
.21619 .2 L
.21714 .2 L
.2181 .2 L
.21905 .2 L
.22 .2 L
.22095 .2 L
.2219 .2 L
.22286 .2 L
.22381 .2 L
.22476 .2 L
.22571 .2 L
.22667 .2 L
.22762 .2 L
.22857 .2 L
.22952 .2 L
.23048 .2 L
.23143 .2 L
.23238 .2 L
.23333 .2 L
.23429 .2 L
.23524 .2 L
.23619 .2 L
.23714 .2 L
.2381 .2 L
.23905 .2 L
.24 .2 L
.24095 .2 L
.2419 .2 L
.24286 .2 L
.24381 .2 L
.24476 .2 L
.24571 .2 L
.24667 .2 L
.24762 .2 L
.24857 .2 L
.24952 .2 L
.25048 .2 L
.25143 .2 L
.25238 .2 L
.25333 .2 L
.25429 .2 L
.25524 .2 L
.25619 .2 L
.25714 .2 L
.2581 .2 L
.25905 .2 L
.26 .2 L
.26095 .2 L
Mistroke
.2619 .2 L
.26286 .2 L
.26381 .2 L
.26476 .2 L
.26571 .2 L
.26667 .2 L
.26762 .2 L
.26857 .2 L
.26952 .2 L
.27048 .2 L
.27143 .2 L
.27238 .2 L
.27333 .2 L
.27429 .2 L
.27524 .2 L
.27619 .2 L
.27714 .2 L
.2781 .2 L
.27905 .2 L
.28 .2 L
.28095 .2 L
.2819 .2 L
.28286 .2 L
.28381 .2 L
.28476 .2 L
.28571 .2 L
.28667 .2 L
.28762 .2 L
.28857 .2 L
.28952 .2 L
.29048 .2 L
.29143 .2 L
.29238 .2 L
.29333 .2 L
.29429 .2 L
.29524 .2 L
.29619 .2 L
.29714 .2 L
.2981 .2 L
.29905 .2 L
.3 .2 L
.30095 .2 L
.3019 .2 L
.30286 .2 L
.30381 .2 L
.30476 .2 L
.30571 .2 L
.30667 .2 L
.30762 .2 L
.30857 .2 L
Mistroke
.30952 .2 L
.31048 .2 L
.31143 .2 L
.31238 .2 L
.31333 .2 L
.31429 .2 L
.31524 .2 L
.31619 .2 L
.31714 .2 L
.3181 .2 L
.31905 .2 L
.32 .2 L
.32095 .2 L
.3219 .2 L
.32286 .2 L
.32381 .2 L
.32476 .2 L
.32571 .2 L
.32667 .2 L
.32762 .2 L
.32857 .2 L
.32952 .2 L
.33048 .2 L
.33143 .2 L
.33238 .2 L
.33333 .2 L
.33429 .2 L
.33524 .2 L
.33619 .2 L
.33714 .2 L
.3381 .2 L
.33905 .2 L
.34 .2 L
.34095 .2 L
.3419 .2 L
.34286 .2 L
.34381 .2 L
.34476 .2 L
.34571 .2 L
.34667 .2 L
.34762 .2 L
.34857 .2 L
.34952 .2 L
.35048 .2 L
.35143 .2 L
.35238 .2 L
.35333 .2 L
.35429 .2 L
.35524 .2 L
.35619 .2 L
Mistroke
.35714 .2 L
.3581 .2 L
.35905 .2 L
.36 .2 L
.36095 .2 L
.3619 .2 L
.36286 .2 L
.36381 .2 L
.36476 .2 L
.36571 .2 L
.36667 .2 L
.36762 .2 L
.36857 .2 L
.36952 .2 L
.37048 .2 L
.37143 .2 L
.37238 .2 L
.37333 .2 L
.37429 .2 L
.37524 .2 L
.37619 .2 L
.37714 .2 L
.3781 .2 L
.37905 .2 L
.38 .2 L
.38095 .2 L
.3819 .2 L
.38286 .2 L
.38381 .2 L
.38476 .2 L
.38571 .2 L
.38667 .2 L
.38762 .2 L
.38857 .2 L
.38952 .2 L
.39048 .2 L
.39143 .2 L
.39238 .2 L
.39333 .2 L
.39429 .2 L
.39524 .2 L
.39619 .2 L
.39714 .2 L
.3981 .2 L
.39905 .2 L
.4 .2 L
.40095 .2 L
.4019 .2 L
.40286 .2 L
.40381 .2 L
Mistroke
.40476 .2 L
.40571 .2 L
.40667 .2 L
.40762 .2 L
.40857 .2 L
.40952 .2 L
.41048 .2 L
.41143 .2 L
.41238 .2 L
.41333 .2 L
.41429 .2 L
.41524 .2 L
.41619 .2 L
.41714 .2 L
.4181 .2 L
.41905 .2 L
.42 .2 L
.42095 .2 L
.4219 .2 L
.42286 .2 L
.42381 .2 L
.42476 .2 L
.42571 .2 L
.42667 .2 L
.42762 .2 L
.42857 .2 L
.42952 .2 L
.43048 .2 L
.43143 .2 L
.43238 .2 L
.43333 .2 L
.43429 .2 L
.43524 .2 L
.43619 .2 L
.43714 .2 L
.4381 .2 L
.43905 .2 L
.44 .2 L
.44095 .2 L
.4419 .2 L
.44286 .2 L
.44381 .2 L
.44476 .2 L
.44571 .2 L
.44667 .2 L
.44762 .2 L
.44857 .2 L
.44952 .2 L
.45048 .2 L
.45143 .2 L
Mistroke
.45238 .2 L
.45333 .2 L
.45429 .2 L
.45524 .2 L
.45619 .2 L
.45714 .2 L
.4581 .2 L
.45905 .2 L
.46 .2 L
.46095 .2 L
.4619 .2 L
.46286 .2 L
.46381 .2 L
.46476 .2 L
.46571 .2 L
.46667 .2 L
.46762 .2 L
.46857 .2 L
.46952 .2 L
.47048 .2 L
.47143 .2 L
.47238 .2 L
.47333 .2 L
.47429 .2 L
.47524 .2 L
.47619 .2 L
.47714 .2 L
.4781 .2 L
.47905 .2 L
.48 .2 L
.48095 .2 L
.4819 .2 L
.48286 .2 L
.48381 .2 L
.48476 .2 L
.48571 .2 L
.48667 .2 L
.48762 .2 L
.48857 .2 L
.48952 .2 L
.49048 .2 L
.49143 .2 L
.49238 .2 L
.49333 .2 L
.49429 .2 L
.49524 .2 L
.49619 .2 L
.49714 .2 L
.4981 .2 L
.49905 .2 L
Mistroke
.5 .2 L
.50095 .2 L
.5019 .2 L
.50286 .2 L
.50381 .2 L
.50476 .2 L
.50571 .2 L
.50667 .2 L
.50762 .2 L
.50857 .2 L
.50952 .2 L
.51048 .2 L
.51143 .2 L
.51238 .2 L
.51333 .2 L
.51429 .2 L
.51524 .2 L
.51619 .2 L
.51714 .2 L
.5181 .2 L
.51905 .2 L
.52 .2 L
.52095 .2 L
.5219 .2 L
.52286 .2 L
.52381 .2 L
.52476 .2 L
.52571 .2 L
.52667 .2 L
.52762 .2 L
.52857 .2 L
.52952 .2 L
.53048 .2 L
.53143 .2 L
.53238 .2 L
.53333 .2 L
.53429 .2 L
.53524 .2 L
.53619 .2 L
.53714 .2 L
.5381 .2 L
.53905 .2 L
.54 .2 L
.54095 .2 L
.5419 .2 L
.54286 .2 L
.54381 .2 L
.54476 .2 L
.54571 .2 L
.54667 .2 L
Mistroke
.54762 .2 L
.54857 .2 L
.54952 .2 L
.55048 .2 L
.55143 .2 L
.55238 .2 L
.55333 .2 L
.55429 .2 L
.55524 .2 L
.55619 .2 L
.55714 .2 L
.5581 .2 L
.55905 .2 L
.56 .2 L
.56095 .2 L
.5619 .2 L
.56286 .2 L
.56381 .2 L
.56476 .2 L
.56571 .2 L
.56667 .2 L
.56762 .2 L
.56857 .2 L
.56952 .2 L
.57048 .2 L
.57143 .2 L
.57238 .2 L
.57333 .2 L
.57429 .2 L
.57524 .2 L
.57619 .2 L
.57714 .2 L
.5781 .2 L
.57905 .2 L
.58 .2 L
.58095 .2 L
.5819 .2 L
.58286 .2 L
.58381 .2 L
.58476 .2 L
.58571 .2 L
.58667 .2 L
.58762 .2 L
.58857 .2 L
.58952 .2 L
.59048 .2 L
.59143 .2 L
.59238 .2 L
.59333 .2 L
.59429 .2 L
Mistroke
.59524 .2 L
.59619 .2 L
.59714 .2 L
.5981 .2 L
.59905 .2 L
.6 .2 L
.60095 .2 L
.6019 .2 L
.60286 .2 L
.60381 .2 L
.60476 .2 L
.60571 .2 L
.60667 .2 L
.60762 .2 L
.60857 .2 L
.60952 .2 L
.61048 .2 L
.61143 .2 L
.61238 .2 L
.61333 .2 L
.61429 .2 L
.61524 .2 L
.61619 .2 L
.61714 .2 L
.6181 .2 L
.61905 .2 L
.62 .2 L
.62095 .2 L
.6219 .2 L
.62286 .2 L
.62381 .2 L
.62476 .2 L
.62571 .2 L
.62667 .2 L
.62762 .2 L
.62857 .2 L
.62952 .2 L
.63048 .2 L
.63143 .2 L
.63238 .2 L
.63333 .2 L
.63429 .2 L
.63524 .2 L
.63619 .2 L
.63714 .2 L
.6381 .2 L
.63905 .2 L
.64 .2 L
.64095 .2 L
.6419 .2 L
Mistroke
.64286 .2 L
.64381 .2 L
.64476 .2 L
.64571 .2 L
.64667 .2 L
.64762 .2 L
.64857 .2 L
.64952 .2 L
.65048 .2 L
.65143 .2 L
.65238 .2 L
.65333 .2 L
.65429 .2 L
.65524 .2 L
.65619 .2 L
.65714 .2 L
.6581 .2 L
.65905 .2 L
.66 .2 L
.66095 .2 L
.6619 .2 L
.66286 .2 L
.66381 .2 L
.66476 .2 L
.66571 .2 L
.66667 .2 L
.66762 .2 L
.66857 .2 L
.66952 .2 L
.67048 .2 L
.67143 .2 L
.67238 .2 L
.67333 .2 L
.67429 .2 L
.67524 .2 L
.67619 .2 L
.67714 .2 L
.6781 .2 L
.67905 .2 L
.68 .2 L
.68095 .2 L
.6819 .2 L
.68286 .2 L
.68381 .2 L
.68476 .2 L
.68571 .2 L
.68667 .2 L
.68762 .2 L
.68857 .2 L
.68952 .2 L
Mistroke
.69048 .2 L
.69143 .2 L
.69238 .2 L
.69333 .2 L
.69429 .2 L
.69524 .2 L
.69619 .2 L
.69714 .2 L
.6981 .2 L
.69905 .2 L
.7 .2 L
.70095 .2 L
.7019 .2 L
.70286 .2 L
.70381 .2 L
.70476 .2 L
.70571 .2 L
.70667 .2 L
.70762 .2 L
.70857 .2 L
.70952 .2 L
.71048 .2 L
.71143 .2 L
.71238 .2 L
.71333 .2 L
.71429 .2 L
.71524 .2 L
.71619 .2 L
.71714 .2 L
.7181 .2 L
.71905 .2 L
.72 .2 L
.72095 .2 L
.7219 .2 L
.72286 .2 L
.72381 .2 L
.72476 .2 L
.72571 .2 L
.72667 .2 L
.72762 .2 L
.72857 .2 L
.72952 .2 L
.73048 .2 L
.73143 .2 L
.73238 .2 L
.73333 .2 L
.73429 .2 L
.73524 .2 L
.73619 .2 L
.73714 .2 L
Mistroke
.7381 .2 L
.73905 .2 L
.74 .2 L
.74095 .2 L
.7419 .2 L
.74286 .2 L
.74381 .2 L
.74476 .2 L
.74571 .2 L
.74667 .2 L
.74762 .2 L
.74857 .2 L
.74952 .2 L
.75048 .2 L
.75143 .2 L
.75238 .2 L
.75333 .2 L
.75429 .2 L
.75524 .2 L
.75619 .2 L
.75714 .2 L
.7581 .2 L
.75905 .2 L
.76 .2 L
.76095 .2 L
.7619 .2 L
.76286 .2 L
.76381 .2 L
.76476 .2 L
.76571 .2 L
.76667 .2 L
.76762 .2 L
.76857 .2 L
.76952 .2 L
.77048 .2 L
.77143 .2 L
.77238 .2 L
.77333 .2 L
.77429 .2 L
.77524 .2 L
.77619 .2 L
.77714 .2 L
.7781 .2 L
.77905 .2 L
.78 .2 L
.78095 .2 L
.7819 .2 L
.78286 .2 L
.78381 .2 L
.78476 .2 L
Mistroke
.78571 .2 L
.78667 .2 L
.78762 .2 L
.78857 .2 L
.78952 .2 L
.79048 .2 L
.79143 .2 L
.79238 .2 L
.79333 .2 L
.79429 .2 L
.79524 .2 L
.79619 .2 L
.79714 .2 L
.7981 .2 L
.79905 .2 L
.8 .2 L
.80095 .2 L
.8019 .2 L
.80286 .2 L
.80381 .2 L
.80476 .2 L
.80571 .2 L
.80667 .2 L
.80762 .2 L
.80857 .2 L
.80952 .2 L
.81048 .2 L
.81143 .2 L
.81238 .2 L
.81333 .2 L
.81429 .2 L
.81524 .2 L
.81619 .2 L
.81714 .2 L
.8181 .2 L
.81905 .2 L
.82 .2 L
.82095 .2 L
.8219 .2 L
.82286 .2 L
.82381 .2 L
.82476 .2 L
.82571 .2 L
.82667 .2 L
.82762 .2 L
.82857 .2 L
.82952 .2 L
.83048 .2 L
.83143 .2 L
.83238 .2 L
Mistroke
.83333 .2 L
.83429 .2 L
.83524 .2 L
.83619 .2 L
.83714 .2 L
.8381 .2 L
.83905 .2 L
.84 .2 L
.84095 .2 L
.8419 .2 L
.84286 .2 L
.84381 .2 L
.84476 .2 L
.84571 .2 L
.84667 .2 L
.84762 .2 L
.84857 .2 L
.84952 .2 L
.85048 .2 L
.85143 .2 L
.85238 .2 L
.85333 .2 L
.85429 .2 L
.85524 .2 L
.85619 .2 L
.85714 .2 L
.8581 .2 L
.85905 .2 L
.86 .2 L
.86095 .2 L
.8619 .2 L
.86286 .2 L
.86381 .2 L
.86476 .2 L
.86571 .2 L
.86667 .2 L
.86762 .2 L
.86857 .2 L
.86952 .2 L
.87048 .2 L
.87143 .2 L
.87238 .2 L
.87333 .2 L
.87429 .2 L
.87524 .2 L
.87619 .2 L
.87714 .2 L
.8781 .2 L
.87905 .2 L
.88 .2 L
Mistroke
.88095 .2 L
.8819 .2 L
.88286 .2 L
.88381 .2 L
.88476 .2 L
.88571 .2 L
.88667 .2 L
.88762 .2 L
.88857 .2 L
.88952 .2 L
.89048 .2 L
.89143 .2 L
.89238 .2 L
.89333 .2 L
.89429 .2 L
.89524 .2 L
.89619 .2 L
.89714 .2 L
.8981 .2 L
.89905 .2 L
.9 .2 L
.90095 .2 L
.9019 .2 L
.90286 .2 L
.90381 .2 L
.90476 .2 L
.90571 .2 L
.90667 .2 L
.90762 .2 L
.90857 .2 L
.90952 .2 L
.91048 .2 L
.91143 .2 L
.91238 .2 L
.91333 .2 L
.91429 .2 L
.91524 .2 L
.91619 .2 L
.91714 .2 L
.9181 .2 L
.91905 .2 L
.92 .2 L
.92095 .2 L
.9219 .2 L
.92286 .2 L
.92381 .2 L
.92476 .2 L
.92571 .2 L
.92667 .2 L
.92762 .2 L
Mistroke
.92857 .2 L
.92952 .2 L
.93048 .2 L
.93143 .2 L
.93238 .2 L
.93333 .2 L
.93429 .2 L
.93524 .2 L
.93619 .2 L
.93714 .2 L
.9381 .2 L
.93905 .2 L
.94 .2 L
.94095 .2 L
.9419 .2 L
.94286 .2 L
.94381 .2 L
.94476 .2 L
.94571 .2 L
.94667 .2 L
.94762 .2 L
.94857 .2 L
.94952 .2 L
.95048 .2 L
.95143 .2 L
.95238 .2 L
.95333 .2 L
.95429 .2 L
.95524 .2 L
.95619 .2 L
.95714 .2 L
.9581 .2 L
.95905 .2 L
.96 .2 L
.96095 .2 L
.9619 .2 L
.96286 .2 L
.96381 .2 L
.96476 .2 L
.96571 .2 L
.96667 .2 L
.96762 .2 L
.96857 .2 L
.96952 .2 L
.97048 .2 L
.97143 .2 L
.97238 .2 L
.97333 .2 L
.97429 .2 L
.97524 .2 L
Mistroke
.97619 .2 L
Mfstroke
% End of Graphics
MathPictureEnd

:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 0; pictureWidth = 496; pictureHeight = 100; endGroup; endGroup]
%!
%%Creator: Mathematica
%%AspectRatio: .2 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.0952381 0.2 0.333333 [
[(2)] .21429 .2 0 2 Msboxa
[(4)] .40476 .2 0 2 Msboxa
[(6)] .59524 .2 0 2 Msboxa
[(8)] .78571 .2 0 2 Msboxa
[(10)] .97619 .2 0 2 Msboxa
[(t/ms)] 1.025 .2 -1 0 Msboxa
[(Single Channel Current)] .5 .2 0 -2 0 0 1 Mouter Mrotsboxa
[(-0.6)] .01131 0 1 0 Msboxa
[(-0.5)] .01131 .03333 1 0 Msboxa
[(-0.4)] .01131 .06667 1 0 Msboxa
[(-0.3)] .01131 .1 1 0 Msboxa
[(-0.2)] .01131 .13333 1 0 Msboxa
[(-0.1)] .01131 .16667 1 0 Msboxa
[(I/pA)] .02381 .2 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .20725 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.21429 .2 m
.21429 .20625 L
s
P
[(2)] .21429 .2 0 2 Mshowa
p
.002 w
.40476 .2 m
.40476 .20625 L
s
P
[(4)] .40476 .2 0 2 Mshowa
p
.002 w
.59524 .2 m
.59524 .20625 L
s
P
[(6)] .59524 .2 0 2 Mshowa
p
.002 w
.78571 .2 m
.78571 .20625 L
s
P
[(8)] .78571 .2 0 2 Mshowa
p
.002 w
.97619 .2 m
.97619 .20625 L
s
P
[(10)] .97619 .2 0 2 Mshowa
p
.001 w
.0619 .2 m
.0619 .20375 L
s
P
p
.001 w
.1 .2 m
.1 .20375 L
s
P
p
.001 w
.1381 .2 m
.1381 .20375 L
s
P
p
.001 w
.17619 .2 m
.17619 .20375 L
s
P
p
.001 w
.25238 .2 m
.25238 .20375 L
s
P
p
.001 w
.29048 .2 m
.29048 .20375 L
s
P
p
.001 w
.32857 .2 m
.32857 .20375 L
s
P
p
.001 w
.36667 .2 m
.36667 .20375 L
s
P
p
.001 w
.44286 .2 m
.44286 .20375 L
s
P
p
.001 w
.48095 .2 m
.48095 .20375 L
s
P
p
.001 w
.51905 .2 m
.51905 .20375 L
s
P
p
.001 w
.55714 .2 m
.55714 .20375 L
s
P
p
.001 w
.63333 .2 m
.63333 .20375 L
s
P
p
.001 w
.67143 .2 m
.67143 .20375 L
s
P
p
.001 w
.70952 .2 m
.70952 .20375 L
s
P
p
.001 w
.74762 .2 m
.74762 .20375 L
s
P
p
.001 w
.82381 .2 m
.82381 .20375 L
s
P
p
.001 w
.8619 .2 m
.8619 .20375 L
s
P
p
.001 w
.9 .2 m
.9 .20375 L
s
P
p
.001 w
.9381 .2 m
.9381 .20375 L
s
P
[(t/ms)] 1.025 .2 -1 0 Mshowa
p
.002 w
0 .2 m
1 .2 L
s
P
[(Single Channel Current)] .5 .2 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 0 m
.03006 0 L
s
P
[(-0.6)] .01131 0 1 0 Mshowa
p
.002 w
.02381 .03333 m
.03006 .03333 L
s
P
[(-0.5)] .01131 .03333 1 0 Mshowa
p
.002 w
.02381 .06667 m
.03006 .06667 L
s
P
[(-0.4)] .01131 .06667 1 0 Mshowa
p
.002 w
.02381 .1 m
.03006 .1 L
s
P
[(-0.3)] .01131 .1 1 0 Mshowa
p
.002 w
.02381 .13333 m
.03006 .13333 L
s
P
[(-0.2)] .01131 .13333 1 0 Mshowa
p
.002 w
.02381 .16667 m
.03006 .16667 L
s
P
[(-0.1)] .01131 .16667 1 0 Mshowa
p
.001 w
.02381 .00667 m
.02756 .00667 L
s
P
p
.001 w
.02381 .01333 m
.02756 .01333 L
s
P
p
.001 w
.02381 .02 m
.02756 .02 L
s
P
p
.001 w
.02381 .02667 m
.02756 .02667 L
s
P
p
.001 w
.02381 .04 m
.02756 .04 L
s
P
p
.001 w
.02381 .04667 m
.02756 .04667 L
s
P
p
.001 w
.02381 .05333 m
.02756 .05333 L
s
P
p
.001 w
.02381 .06 m
.02756 .06 L
s
P
p
.001 w
.02381 .07333 m
.02756 .07333 L
s
P
p
.001 w
.02381 .08 m
.02756 .08 L
s
P
p
.001 w
.02381 .08667 m
.02756 .08667 L
s
P
p
.001 w
.02381 .09333 m
.02756 .09333 L
s
P
p
.001 w
.02381 .10667 m
.02756 .10667 L
s
P
p
.001 w
.02381 .11333 m
.02756 .11333 L
s
P
p
.001 w
.02381 .12 m
.02756 .12 L
s
P
p
.001 w
.02381 .12667 m
.02756 .12667 L
s
P
p
.001 w
.02381 .14 m
.02756 .14 L
s
P
p
.001 w
.02381 .14667 m
.02756 .14667 L
s
P
p
.001 w
.02381 .15333 m
.02756 .15333 L
s
P
p
.001 w
.02381 .16 m
.02756 .16 L
s
P
p
.001 w
.02381 .17333 m
.02756 .17333 L
s
P
p
.001 w
.02381 .18 m
.02756 .18 L
s
P
p
.001 w
.02381 .18667 m
.02756 .18667 L
s
P
p
.001 w
.02381 .19333 m
.02756 .19333 L
s
P
[(I/pA)] .02381 .2 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .2 L
s
P
P
0 0 m
1 0 L
1 .2 L
0 .2 L
closepath
clip
newpath
.004 w
.02381 .2 m
.02476 .2 L
.02571 .2 L
.02667 .2 L
.02762 .2 L
.02857 .2 L
.02952 .2 L
.03048 .2 L
.03143 .2 L
.03238 .2 L
.03333 .2 L
.03429 .2 L
.03524 .2 L
.03619 .2 L
.03714 .2 L
.0381 .2 L
.03905 .2 L
.04 .2 L
.04095 .01333 L
.0419 .01333 L
.04286 .01333 L
.04381 .01333 L
.04476 .01333 L
.04571 .01333 L
.04667 .01333 L
.04762 .01333 L
.04857 .01333 L
.04952 .01333 L
.05048 .01333 L
.05143 .01333 L
.05238 .01333 L
.05333 .01333 L
.05429 .01333 L
.05524 .01333 L
.05619 .01333 L
.05714 .01333 L
.0581 .01333 L
.05905 .01333 L
.06 .01333 L
.06095 .01333 L
.0619 .01333 L
.06286 .01333 L
.06381 .01333 L
.06476 .01333 L
.06571 .01333 L
.06667 .01333 L
.06762 .01333 L
.06857 .01333 L
.06952 .01333 L
.07048 .01333 L
Mistroke
.07143 .01333 L
.07238 .01333 L
.07333 .01333 L
.07429 .01333 L
.07524 .01333 L
.07619 .01333 L
.07714 .01333 L
.0781 .01333 L
.07905 .01333 L
.08 .01333 L
.08095 .01333 L
.0819 .01333 L
.08286 .01333 L
.08381 .01333 L
.08476 .01333 L
.08571 .01333 L
.08667 .01333 L
.08762 .01333 L
.08857 .01333 L
.08952 .01333 L
.09048 .01333 L
.09143 .01333 L
.09238 .01333 L
.09333 .01333 L
.09429 .01333 L
.09524 .01333 L
.09619 .01333 L
.09714 .01333 L
.0981 .01333 L
.09905 .01333 L
.1 .01333 L
.10095 .01333 L
.1019 .01333 L
.10286 .01333 L
.10381 .01333 L
.10476 .01333 L
.10571 .01333 L
.10667 .01333 L
.10762 .01333 L
.10857 .01333 L
.10952 .01333 L
.11048 .01333 L
.11143 .01333 L
.11238 .01333 L
.11333 .01333 L
.11429 .01333 L
.11524 .01333 L
.11619 .01333 L
.11714 .01333 L
.1181 .01333 L
Mistroke
.11905 .01333 L
.12 .01333 L
.12095 .01333 L
.1219 .01333 L
.12286 .01333 L
.12381 .01333 L
.12476 .01333 L
.12571 .01333 L
.12667 .01333 L
.12762 .01333 L
.12857 .01333 L
.12952 .01333 L
.13048 .01333 L
.13143 .01333 L
.13238 .01333 L
.13333 .01333 L
.13429 .01333 L
.13524 .01333 L
.13619 .01333 L
.13714 .01333 L
.1381 .01333 L
.13905 .01333 L
.14 .01333 L
.14095 .01333 L
.1419 .01333 L
.14286 .01333 L
.14381 .01333 L
.14476 .01333 L
.14571 .01333 L
.14667 .01333 L
.14762 .01333 L
.14857 .01333 L
.14952 .01333 L
.15048 .01333 L
.15143 .01333 L
.15238 .01333 L
.15333 .01333 L
.15429 .01333 L
.15524 .01333 L
.15619 .01333 L
.15714 .01333 L
.1581 .01333 L
.15905 .01333 L
.16 .01333 L
.16095 .01333 L
.1619 .01333 L
.16286 .01333 L
.16381 .01333 L
.16476 .01333 L
.16571 .01333 L
Mistroke
.16667 .01333 L
.16762 .01333 L
.16857 .01333 L
.16952 .01333 L
.17048 .01333 L
.17143 .01333 L
.17238 .01333 L
.17333 .01333 L
.17429 .01333 L
.17524 .01333 L
.17619 .01333 L
.17714 .01333 L
.1781 .01333 L
.17905 .01333 L
.18 .01333 L
.18095 .01333 L
.1819 .01333 L
.18286 .01333 L
.18381 .01333 L
.18476 .01333 L
.18571 .01333 L
.18667 .01333 L
.18762 .01333 L
.18857 .01333 L
.18952 .01333 L
.19048 .01333 L
.19143 .01333 L
.19238 .01333 L
.19333 .01333 L
.19429 .01333 L
.19524 .01333 L
.19619 .01333 L
.19714 .01333 L
.1981 .01333 L
.19905 .01333 L
.2 .01333 L
.20095 .01333 L
.2019 .01333 L
.20286 .01333 L
.20381 .01333 L
.20476 .01333 L
.20571 .01333 L
.20667 .01333 L
.20762 .01333 L
.20857 .01333 L
.20952 .01333 L
.21048 .01333 L
.21143 .01333 L
.21238 .01333 L
.21333 .01333 L
Mistroke
.21429 .01333 L
.21524 .01333 L
.21619 .01333 L
.21714 .01333 L
.2181 .01333 L
.21905 .01333 L
.22 .01333 L
.22095 .01333 L
.2219 .01333 L
.22286 .01333 L
.22381 .01333 L
.22476 .01333 L
.22571 .01333 L
.22667 .01333 L
.22762 .01333 L
.22857 .01333 L
.22952 .01333 L
.23048 .01333 L
.23143 .01333 L
.23238 .01333 L
.23333 .01333 L
.23429 .01333 L
.23524 .01333 L
.23619 .01333 L
.23714 .01333 L
.2381 .01333 L
.23905 .01333 L
.24 .01333 L
.24095 .01333 L
.2419 .01333 L
.24286 .01333 L
.24381 .01333 L
.24476 .01333 L
.24571 .01333 L
.24667 .01333 L
.24762 .01333 L
.24857 .01333 L
.24952 .01333 L
.25048 .01333 L
.25143 .01333 L
.25238 .01333 L
.25333 .01333 L
.25429 .01333 L
.25524 .01333 L
.25619 .01333 L
.25714 .01333 L
.2581 .01333 L
.25905 .01333 L
.26 .01333 L
.26095 .01333 L
Mistroke
.2619 .01333 L
.26286 .01333 L
.26381 .01333 L
.26476 .01333 L
.26571 .01333 L
.26667 .01333 L
.26762 .01333 L
.26857 .01333 L
.26952 .01333 L
.27048 .01333 L
.27143 .01333 L
.27238 .01333 L
.27333 .01333 L
.27429 .01333 L
.27524 .01333 L
.27619 .01333 L
.27714 .01333 L
.2781 .01333 L
.27905 .01333 L
.28 .01333 L
.28095 .01333 L
.2819 .01333 L
.28286 .01333 L
.28381 .01333 L
.28476 .01333 L
.28571 .01333 L
.28667 .01333 L
.28762 .01333 L
.28857 .01333 L
.28952 .01333 L
.29048 .01333 L
.29143 .01333 L
.29238 .01333 L
.29333 .01333 L
.29429 .01333 L
.29524 .01333 L
.29619 .01333 L
.29714 .01333 L
.2981 .01333 L
.29905 .01333 L
.3 .01333 L
.30095 .01333 L
.3019 .01333 L
.30286 .01333 L
.30381 .01333 L
.30476 .01333 L
.30571 .01333 L
.30667 .01333 L
.30762 .01333 L
.30857 .01333 L
Mistroke
.30952 .01333 L
.31048 .01333 L
.31143 .01333 L
.31238 .01333 L
.31333 .01333 L
.31429 .01333 L
.31524 .01333 L
.31619 .01333 L
.31714 .01333 L
.3181 .01333 L
.31905 .01333 L
.32 .01333 L
.32095 .01333 L
.3219 .01333 L
.32286 .01333 L
.32381 .01333 L
.32476 .01333 L
.32571 .01333 L
.32667 .01333 L
.32762 .01333 L
.32857 .01333 L
.32952 .01333 L
.33048 .01333 L
.33143 .01333 L
.33238 .01333 L
.33333 .01333 L
.33429 .01333 L
.33524 .01333 L
.33619 .01333 L
.33714 .01333 L
.3381 .01333 L
.33905 .01333 L
.34 .01333 L
.34095 .01333 L
.3419 .01333 L
.34286 .01333 L
.34381 .01333 L
.34476 .01333 L
.34571 .01333 L
.34667 .01333 L
.34762 .01333 L
.34857 .01333 L
.34952 .01333 L
.35048 .01333 L
.35143 .01333 L
.35238 .01333 L
.35333 .01333 L
.35429 .01333 L
.35524 .01333 L
.35619 .01333 L
Mistroke
.35714 .01333 L
.3581 .01333 L
.35905 .01333 L
.36 .01333 L
.36095 .01333 L
.3619 .01333 L
.36286 .01333 L
.36381 .01333 L
.36476 .01333 L
.36571 .01333 L
.36667 .01333 L
.36762 .01333 L
.36857 .01333 L
.36952 .01333 L
.37048 .01333 L
.37143 .01333 L
.37238 .01333 L
.37333 .01333 L
.37429 .01333 L
.37524 .01333 L
.37619 .01333 L
.37714 .01333 L
.3781 .01333 L
.37905 .01333 L
.38 .01333 L
.38095 .01333 L
.3819 .01333 L
.38286 .01333 L
.38381 .01333 L
.38476 .01333 L
.38571 .01333 L
.38667 .01333 L
.38762 .01333 L
.38857 .01333 L
.38952 .01333 L
.39048 .01333 L
.39143 .01333 L
.39238 .01333 L
.39333 .01333 L
.39429 .01333 L
.39524 .01333 L
.39619 .01333 L
.39714 .01333 L
.3981 .01333 L
.39905 .01333 L
.4 .01333 L
.40095 .01333 L
.4019 .01333 L
.40286 .01333 L
.40381 .01333 L
Mistroke
.40476 .01333 L
.40571 .01333 L
.40667 .2 L
.40762 .2 L
.40857 .2 L
.40952 .2 L
.41048 .2 L
.41143 .2 L
.41238 .2 L
.41333 .2 L
.41429 .2 L
.41524 .2 L
.41619 .2 L
.41714 .2 L
.4181 .2 L
.41905 .2 L
.42 .2 L
.42095 .2 L
.4219 .2 L
.42286 .2 L
.42381 .2 L
.42476 .2 L
.42571 .2 L
.42667 .2 L
.42762 .2 L
.42857 .2 L
.42952 .2 L
.43048 .2 L
.43143 .2 L
.43238 .2 L
.43333 .2 L
.43429 .2 L
.43524 .2 L
.43619 .2 L
.43714 .2 L
.4381 .2 L
.43905 .2 L
.44 .2 L
.44095 .2 L
.4419 .2 L
.44286 .2 L
.44381 .2 L
.44476 .2 L
.44571 .2 L
.44667 .2 L
.44762 .2 L
.44857 .2 L
.44952 .2 L
.45048 .2 L
.45143 .2 L
Mistroke
.45238 .2 L
.45333 .2 L
.45429 .2 L
.45524 .2 L
.45619 .2 L
.45714 .2 L
.4581 .2 L
.45905 .2 L
.46 .2 L
.46095 .2 L
.4619 .2 L
.46286 .2 L
.46381 .2 L
.46476 .2 L
.46571 .2 L
.46667 .2 L
.46762 .2 L
.46857 .2 L
.46952 .2 L
.47048 .2 L
.47143 .2 L
.47238 .2 L
.47333 .2 L
.47429 .2 L
.47524 .2 L
.47619 .2 L
.47714 .2 L
.4781 .2 L
.47905 .2 L
.48 .2 L
.48095 .2 L
.4819 .2 L
.48286 .2 L
.48381 .2 L
.48476 .2 L
.48571 .2 L
.48667 .2 L
.48762 .2 L
.48857 .2 L
.48952 .2 L
.49048 .2 L
.49143 .2 L
.49238 .2 L
.49333 .2 L
.49429 .2 L
.49524 .2 L
.49619 .2 L
.49714 .2 L
.4981 .2 L
.49905 .2 L
Mistroke
.5 .2 L
.50095 .2 L
.5019 .2 L
.50286 .2 L
.50381 .2 L
.50476 .2 L
.50571 .2 L
.50667 .2 L
.50762 .2 L
.50857 .2 L
.50952 .2 L
.51048 .2 L
.51143 .2 L
.51238 .2 L
.51333 .2 L
.51429 .2 L
.51524 .2 L
.51619 .2 L
.51714 .2 L
.5181 .2 L
.51905 .2 L
.52 .2 L
.52095 .2 L
.5219 .2 L
.52286 .2 L
.52381 .2 L
.52476 .2 L
.52571 .2 L
.52667 .2 L
.52762 .2 L
.52857 .2 L
.52952 .2 L
.53048 .2 L
.53143 .2 L
.53238 .2 L
.53333 .2 L
.53429 .2 L
.53524 .2 L
.53619 .2 L
.53714 .2 L
.5381 .2 L
.53905 .2 L
.54 .2 L
.54095 .2 L
.5419 .2 L
.54286 .2 L
.54381 .2 L
.54476 .2 L
.54571 .2 L
.54667 .2 L
Mistroke
.54762 .2 L
.54857 .2 L
.54952 .2 L
.55048 .2 L
.55143 .2 L
.55238 .2 L
.55333 .2 L
.55429 .2 L
.55524 .2 L
.55619 .2 L
.55714 .2 L
.5581 .2 L
.55905 .2 L
.56 .2 L
.56095 .2 L
.5619 .2 L
.56286 .2 L
.56381 .2 L
.56476 .2 L
.56571 .2 L
.56667 .2 L
.56762 .2 L
.56857 .2 L
.56952 .2 L
.57048 .2 L
.57143 .2 L
.57238 .2 L
.57333 .2 L
.57429 .2 L
.57524 .2 L
.57619 .2 L
.57714 .2 L
.5781 .2 L
.57905 .2 L
.58 .2 L
.58095 .2 L
.5819 .2 L
.58286 .2 L
.58381 .2 L
.58476 .2 L
.58571 .2 L
.58667 .2 L
.58762 .2 L
.58857 .2 L
.58952 .2 L
.59048 .2 L
.59143 .2 L
.59238 .2 L
.59333 .2 L
.59429 .2 L
Mistroke
.59524 .2 L
.59619 .2 L
.59714 .2 L
.5981 .2 L
.59905 .2 L
.6 .2 L
.60095 .2 L
.6019 .2 L
.60286 .2 L
.60381 .2 L
.60476 .2 L
.60571 .2 L
.60667 .2 L
.60762 .2 L
.60857 .2 L
.60952 .2 L
.61048 .2 L
.61143 .2 L
.61238 .2 L
.61333 .2 L
.61429 .2 L
.61524 .2 L
.61619 .2 L
.61714 .2 L
.6181 .2 L
.61905 .2 L
.62 .2 L
.62095 .2 L
.6219 .2 L
.62286 .2 L
.62381 .2 L
.62476 .2 L
.62571 .2 L
.62667 .2 L
.62762 .2 L
.62857 .2 L
.62952 .2 L
.63048 .2 L
.63143 .2 L
.63238 .2 L
.63333 .2 L
.63429 .2 L
.63524 .2 L
.63619 .2 L
.63714 .2 L
.6381 .2 L
.63905 .2 L
.64 .2 L
.64095 .2 L
.6419 .2 L
Mistroke
.64286 .2 L
.64381 .2 L
.64476 .2 L
.64571 .2 L
.64667 .2 L
.64762 .2 L
.64857 .2 L
.64952 .2 L
.65048 .2 L
.65143 .2 L
.65238 .2 L
.65333 .2 L
.65429 .2 L
.65524 .2 L
.65619 .2 L
.65714 .2 L
.6581 .2 L
.65905 .2 L
.66 .2 L
.66095 .2 L
.6619 .2 L
.66286 .2 L
.66381 .2 L
.66476 .2 L
.66571 .2 L
.66667 .2 L
.66762 .2 L
.66857 .2 L
.66952 .2 L
.67048 .2 L
.67143 .2 L
.67238 .2 L
.67333 .2 L
.67429 .2 L
.67524 .2 L
.67619 .2 L
.67714 .2 L
.6781 .2 L
.67905 .2 L
.68 .2 L
.68095 .2 L
.6819 .2 L
.68286 .2 L
.68381 .2 L
.68476 .2 L
.68571 .2 L
.68667 .2 L
.68762 .2 L
.68857 .2 L
.68952 .2 L
Mistroke
.69048 .2 L
.69143 .2 L
.69238 .2 L
.69333 .2 L
.69429 .2 L
.69524 .2 L
.69619 .2 L
.69714 .2 L
.6981 .2 L
.69905 .2 L
.7 .2 L
.70095 .2 L
.7019 .2 L
.70286 .2 L
.70381 .2 L
.70476 .2 L
.70571 .2 L
.70667 .2 L
.70762 .2 L
.70857 .2 L
.70952 .2 L
.71048 .2 L
.71143 .2 L
.71238 .2 L
.71333 .2 L
.71429 .2 L
.71524 .2 L
.71619 .2 L
.71714 .2 L
.7181 .2 L
.71905 .2 L
.72 .2 L
.72095 .2 L
.7219 .2 L
.72286 .2 L
.72381 .2 L
.72476 .2 L
.72571 .2 L
.72667 .2 L
.72762 .2 L
.72857 .2 L
.72952 .2 L
.73048 .2 L
.73143 .2 L
.73238 .2 L
.73333 .2 L
.73429 .2 L
.73524 .2 L
.73619 .2 L
.73714 .2 L
Mistroke
.7381 .2 L
.73905 .2 L
.74 .2 L
.74095 .2 L
.7419 .2 L
.74286 .2 L
.74381 .2 L
.74476 .2 L
.74571 .2 L
.74667 .2 L
.74762 .2 L
.74857 .2 L
.74952 .2 L
.75048 .2 L
.75143 .2 L
.75238 .2 L
.75333 .2 L
.75429 .2 L
.75524 .2 L
.75619 .2 L
.75714 .2 L
.7581 .2 L
.75905 .2 L
.76 .2 L
.76095 .2 L
.7619 .2 L
.76286 .2 L
.76381 .2 L
.76476 .2 L
.76571 .2 L
.76667 .2 L
.76762 .2 L
.76857 .2 L
.76952 .2 L
.77048 .2 L
.77143 .2 L
.77238 .2 L
.77333 .2 L
.77429 .2 L
.77524 .2 L
.77619 .2 L
.77714 .2 L
.7781 .2 L
.77905 .2 L
.78 .2 L
.78095 .2 L
.7819 .2 L
.78286 .2 L
.78381 .2 L
.78476 .2 L
Mistroke
.78571 .2 L
.78667 .2 L
.78762 .2 L
.78857 .2 L
.78952 .2 L
.79048 .2 L
.79143 .2 L
.79238 .2 L
.79333 .2 L
.79429 .2 L
.79524 .2 L
.79619 .2 L
.79714 .2 L
.7981 .2 L
.79905 .2 L
.8 .2 L
.80095 .2 L
.8019 .2 L
.80286 .2 L
.80381 .2 L
.80476 .2 L
.80571 .2 L
.80667 .2 L
.80762 .2 L
.80857 .2 L
.80952 .2 L
.81048 .2 L
.81143 .2 L
.81238 .2 L
.81333 .2 L
.81429 .2 L
.81524 .2 L
.81619 .2 L
.81714 .2 L
.8181 .2 L
.81905 .2 L
.82 .2 L
.82095 .2 L
.8219 .2 L
.82286 .2 L
.82381 .2 L
.82476 .2 L
.82571 .2 L
.82667 .2 L
.82762 .2 L
.82857 .2 L
.82952 .2 L
.83048 .2 L
.83143 .2 L
.83238 .2 L
Mistroke
.83333 .2 L
.83429 .2 L
.83524 .2 L
.83619 .2 L
.83714 .2 L
.8381 .2 L
.83905 .2 L
.84 .2 L
.84095 .2 L
.8419 .2 L
.84286 .2 L
.84381 .2 L
.84476 .2 L
.84571 .2 L
.84667 .2 L
.84762 .2 L
.84857 .2 L
.84952 .2 L
.85048 .2 L
.85143 .2 L
.85238 .2 L
.85333 .2 L
.85429 .2 L
.85524 .2 L
.85619 .2 L
.85714 .2 L
.8581 .2 L
.85905 .2 L
.86 .2 L
.86095 .2 L
.8619 .2 L
.86286 .2 L
.86381 .2 L
.86476 .2 L
.86571 .2 L
.86667 .2 L
.86762 .2 L
.86857 .2 L
.86952 .2 L
.87048 .2 L
.87143 .2 L
.87238 .2 L
.87333 .2 L
.87429 .2 L
.87524 .2 L
.87619 .2 L
.87714 .2 L
.8781 .2 L
.87905 .2 L
.88 .2 L
Mistroke
.88095 .2 L
.8819 .2 L
.88286 .2 L
.88381 .2 L
.88476 .2 L
.88571 .2 L
.88667 .2 L
.88762 .2 L
.88857 .2 L
.88952 .2 L
.89048 .2 L
.89143 .2 L
.89238 .2 L
.89333 .2 L
.89429 .2 L
.89524 .2 L
.89619 .2 L
.89714 .2 L
.8981 .2 L
.89905 .2 L
.9 .2 L
.90095 .2 L
.9019 .2 L
.90286 .2 L
.90381 .2 L
.90476 .2 L
.90571 .2 L
.90667 .2 L
.90762 .2 L
.90857 .2 L
.90952 .2 L
.91048 .2 L
.91143 .2 L
.91238 .2 L
.91333 .2 L
.91429 .2 L
.91524 .2 L
.91619 .2 L
.91714 .2 L
.9181 .2 L
.91905 .2 L
.92 .2 L
.92095 .2 L
.9219 .2 L
.92286 .2 L
.92381 .2 L
.92476 .2 L
.92571 .2 L
.92667 .2 L
.92762 .2 L
Mistroke
.92857 .2 L
.92952 .2 L
.93048 .2 L
.93143 .2 L
.93238 .2 L
.93333 .2 L
.93429 .2 L
.93524 .2 L
.93619 .2 L
.93714 .2 L
.9381 .2 L
.93905 .2 L
.94 .2 L
.94095 .2 L
.9419 .2 L
.94286 .2 L
.94381 .2 L
.94476 .2 L
.94571 .2 L
.94667 .2 L
.94762 .2 L
.94857 .2 L
.94952 .2 L
.95048 .2 L
.95143 .2 L
.95238 .2 L
.95333 .2 L
.95429 .2 L
.95524 .2 L
.95619 .2 L
.95714 .2 L
.9581 .2 L
.95905 .2 L
.96 .2 L
.96095 .2 L
.9619 .2 L
.96286 .2 L
.96381 .2 L
.96476 .2 L
.96571 .2 L
.96667 .2 L
.96762 .2 L
.96857 .2 L
.96952 .2 L
.97048 .2 L
.97143 .2 L
.97238 .2 L
.97333 .2 L
.97429 .2 L
.97524 .2 L
Mistroke
.97619 .2 L
Mfstroke
% End of Graphics
MathPictureEnd

:[font = text; inactive; preserveAspect]
Simulations of the current flowing through an ensemble of channels are done by
:[font = input; preserveAspect; startGroup]
?MeanCurrent
:[font = info; inactive; preserveAspect; endGroup]
MeanCurrent[q, sclist, initstate, height, duration,
   n, u, {t, tmax, tstep}] calls a C routine that
   adds up n independent single channel current
   functions (pA) and divides the sum by n. See
   ?SingleTrace for information on the other
   arguments.
:[font = text; inactive; preserveAspect]
MeanCurrent[], as well as some other functions, take the same sequence of arguments as TraceTable[].
The following computes a mean of 200 single channel traces.
;[s]
6:0,0;13,1;87,2;99,3;126,4;130,5;160,-1;
6:1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,4,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect]
n = 200;
myMean = 
MeanCurrent[q, stateConductivityList, initialState,
            height, duration, n, u, {t, tmax, tstep}];
:[font = text; inactive; preserveAspect]
It looks like this.
:[font = input; preserveAspect; startGroup]
ListPlot[Transpose[{Range[0, tmax, tstep], myMean}],
         PlotJoined -> True, PlotRange -> All,
         AxesLabel -> {"t/ms", "I/pA"},
         PlotLabel -> "Average Current, 200 Channels"]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174]
%!
%%Creator: Mathematica
%%AspectRatio: .61803 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.0952381 0.603319 1.56877 [
[(2)] .21429 .60332 0 2 Msboxa
[(4)] .40476 .60332 0 2 Msboxa
[(6)] .59524 .60332 0 2 Msboxa
[(8)] .78571 .60332 0 2 Msboxa
[(10)] .97619 .60332 0 2 Msboxa
[(t/ms)] 1.025 .60332 -1 0 Msboxa
[(Average Current, 200 Channels)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(-0.35)] .01131 .05425 1 0 Msboxa
[(-0.3)] .01131 .13269 1 0 Msboxa
[(-0.25)] .01131 .21113 1 0 Msboxa
[(-0.2)] .01131 .28956 1 0 Msboxa
[(-0.15)] .01131 .368 1 0 Msboxa
[(-0.1)] .01131 .44644 1 0 Msboxa
[(-0.05)] .01131 .52488 1 0 Msboxa
[(I/pA)] .02381 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.21429 .60332 m
.21429 .60957 L
s
P
[(2)] .21429 .60332 0 2 Mshowa
p
.002 w
.40476 .60332 m
.40476 .60957 L
s
P
[(4)] .40476 .60332 0 2 Mshowa
p
.002 w
.59524 .60332 m
.59524 .60957 L
s
P
[(6)] .59524 .60332 0 2 Mshowa
p
.002 w
.78571 .60332 m
.78571 .60957 L
s
P
[(8)] .78571 .60332 0 2 Mshowa
p
.002 w
.97619 .60332 m
.97619 .60957 L
s
P
[(10)] .97619 .60332 0 2 Mshowa
p
.001 w
.0619 .60332 m
.0619 .60707 L
s
P
p
.001 w
.1 .60332 m
.1 .60707 L
s
P
p
.001 w
.1381 .60332 m
.1381 .60707 L
s
P
p
.001 w
.17619 .60332 m
.17619 .60707 L
s
P
p
.001 w
.25238 .60332 m
.25238 .60707 L
s
P
p
.001 w
.29048 .60332 m
.29048 .60707 L
s
P
p
.001 w
.32857 .60332 m
.32857 .60707 L
s
P
p
.001 w
.36667 .60332 m
.36667 .60707 L
s
P
p
.001 w
.44286 .60332 m
.44286 .60707 L
s
P
p
.001 w
.48095 .60332 m
.48095 .60707 L
s
P
p
.001 w
.51905 .60332 m
.51905 .60707 L
s
P
p
.001 w
.55714 .60332 m
.55714 .60707 L
s
P
p
.001 w
.63333 .60332 m
.63333 .60707 L
s
P
p
.001 w
.67143 .60332 m
.67143 .60707 L
s
P
p
.001 w
.70952 .60332 m
.70952 .60707 L
s
P
p
.001 w
.74762 .60332 m
.74762 .60707 L
s
P
p
.001 w
.82381 .60332 m
.82381 .60707 L
s
P
p
.001 w
.8619 .60332 m
.8619 .60707 L
s
P
p
.001 w
.9 .60332 m
.9 .60707 L
s
P
p
.001 w
.9381 .60332 m
.9381 .60707 L
s
P
[(t/ms)] 1.025 .60332 -1 0 Mshowa
p
.002 w
0 .60332 m
1 .60332 L
s
P
[(Average Current, 200 Channels)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .05425 m
.03006 .05425 L
s
P
[(-0.35)] .01131 .05425 1 0 Mshowa
p
.002 w
.02381 .13269 m
.03006 .13269 L
s
P
[(-0.3)] .01131 .13269 1 0 Mshowa
p
.002 w
.02381 .21113 m
.03006 .21113 L
s
P
[(-0.25)] .01131 .21113 1 0 Mshowa
p
.002 w
.02381 .28956 m
.03006 .28956 L
s
P
[(-0.2)] .01131 .28956 1 0 Mshowa
p
.002 w
.02381 .368 m
.03006 .368 L
s
P
[(-0.15)] .01131 .368 1 0 Mshowa
p
.002 w
.02381 .44644 m
.03006 .44644 L
s
P
[(-0.1)] .01131 .44644 1 0 Mshowa
p
.002 w
.02381 .52488 m
.03006 .52488 L
s
P
[(-0.05)] .01131 .52488 1 0 Mshowa
p
.001 w
.02381 .06994 m
.02756 .06994 L
s
P
p
.001 w
.02381 .08562 m
.02756 .08562 L
s
P
p
.001 w
.02381 .10131 m
.02756 .10131 L
s
P
p
.001 w
.02381 .117 m
.02756 .117 L
s
P
p
.001 w
.02381 .14837 m
.02756 .14837 L
s
P
p
.001 w
.02381 .16406 m
.02756 .16406 L
s
P
p
.001 w
.02381 .17975 m
.02756 .17975 L
s
P
p
.001 w
.02381 .19544 m
.02756 .19544 L
s
P
p
.001 w
.02381 .22681 m
.02756 .22681 L
s
P
p
.001 w
.02381 .2425 m
.02756 .2425 L
s
P
p
.001 w
.02381 .25819 m
.02756 .25819 L
s
P
p
.001 w
.02381 .27388 m
.02756 .27388 L
s
P
p
.001 w
.02381 .30525 m
.02756 .30525 L
s
P
p
.001 w
.02381 .32094 m
.02756 .32094 L
s
P
p
.001 w
.02381 .33663 m
.02756 .33663 L
s
P
p
.001 w
.02381 .35232 m
.02756 .35232 L
s
P
p
.001 w
.02381 .38369 m
.02756 .38369 L
s
P
p
.001 w
.02381 .39938 m
.02756 .39938 L
s
P
p
.001 w
.02381 .41507 m
.02756 .41507 L
s
P
p
.001 w
.02381 .43075 m
.02756 .43075 L
s
P
p
.001 w
.02381 .46213 m
.02756 .46213 L
s
P
p
.001 w
.02381 .47782 m
.02756 .47782 L
s
P
p
.001 w
.02381 .4935 m
.02756 .4935 L
s
P
p
.001 w
.02381 .50919 m
.02756 .50919 L
s
P
p
.001 w
.02381 .54057 m
.02756 .54057 L
s
P
p
.001 w
.02381 .55626 m
.02756 .55626 L
s
P
p
.001 w
.02381 .57194 m
.02756 .57194 L
s
P
p
.001 w
.02381 .58763 m
.02756 .58763 L
s
P
p
.001 w
.02381 .03856 m
.02756 .03856 L
s
P
p
.001 w
.02381 .02287 m
.02756 .02287 L
s
P
p
.001 w
.02381 .00718 m
.02756 .00718 L
s
P
[(I/pA)] .02381 .61803 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
.004 w
.02381 .60332 m
.02476 .57257 L
.02571 .51547 L
.02667 .46715 L
.02762 .41005 L
.02857 .36173 L
.02952 .3178 L
.03048 .30023 L
.03143 .28705 L
.03238 .26948 L
.03333 .23434 L
.03429 .21238 L
.03524 .2036 L
.03619 .19042 L
.03714 .15967 L
.0381 .14649 L
.03905 .14649 L
.04 .13771 L
.04095 .12453 L
.0419 .09817 L
.04286 .085 L
.04381 .07182 L
.04476 .06303 L
.04571 .05864 L
.04667 .06303 L
.04762 .04986 L
.04857 .04546 L
.04952 .04107 L
.05048 .04546 L
.05143 .04986 L
.05238 .04107 L
.05333 .03229 L
.05429 .03229 L
.05524 .03229 L
.05619 .01911 L
.05714 .0235 L
.0581 .0235 L
.05905 .0235 L
.06 .0235 L
.06095 .0235 L
.0619 .0235 L
.06286 .0235 L
.06381 .01472 L
.06476 .01472 L
.06571 .01911 L
.06667 .0235 L
.06762 .01911 L
.06857 .0235 L
.06952 .02789 L
.07048 .03229 L
Mistroke
.07143 .03668 L
.07238 .03229 L
.07333 .03668 L
.07429 .02789 L
.07524 .03229 L
.07619 .03229 L
.07714 .02789 L
.0781 .03229 L
.07905 .03229 L
.08 .03668 L
.08095 .03668 L
.0819 .03668 L
.08286 .03668 L
.08381 .03668 L
.08476 .04107 L
.08571 .03668 L
.08667 .03668 L
.08762 .03668 L
.08857 .03668 L
.08952 .02789 L
.09048 .02789 L
.09143 .02789 L
.09238 .02789 L
.09333 .0235 L
.09429 .0235 L
.09524 .0235 L
.09619 .0235 L
.09714 .03668 L
.0981 .03668 L
.09905 .03668 L
.1 .04107 L
.10095 .03668 L
.1019 .03668 L
.10286 .03668 L
.10381 .03668 L
.10476 .04107 L
.10571 .04546 L
.10667 .04546 L
.10762 .04107 L
.10857 .04107 L
.10952 .04107 L
.11048 .04107 L
.11143 .04107 L
.11238 .04546 L
.11333 .04546 L
.11429 .04546 L
.11524 .04546 L
.11619 .04986 L
.11714 .04986 L
.1181 .04986 L
Mistroke
.11905 .04546 L
.12 .04986 L
.12095 .05425 L
.1219 .05425 L
.12286 .05425 L
.12381 .05425 L
.12476 .05864 L
.12571 .05864 L
.12667 .05864 L
.12762 .05864 L
.12857 .06303 L
.12952 .06303 L
.13048 .06743 L
.13143 .07182 L
.13238 .07182 L
.13333 .07182 L
.13429 .07621 L
.13524 .0806 L
.13619 .085 L
.13714 .085 L
.1381 .085 L
.13905 .085 L
.14 .085 L
.14095 .085 L
.1419 .08939 L
.14286 .08939 L
.14381 .08939 L
.14476 .08939 L
.14571 .09378 L
.14667 .09817 L
.14762 .09817 L
.14857 .10257 L
.14952 .10696 L
.15048 .10696 L
.15143 .10696 L
.15238 .11135 L
.15333 .11574 L
.15429 .11574 L
.15524 .11574 L
.15619 .12014 L
.15714 .12014 L
.1581 .12453 L
.15905 .12892 L
.16 .13331 L
.16095 .13771 L
.1619 .13331 L
.16286 .13331 L
.16381 .13771 L
.16476 .13771 L
.16571 .1421 L
Mistroke
.16667 .1421 L
.16762 .1421 L
.16857 .1421 L
.16952 .1421 L
.17048 .14649 L
.17143 .14649 L
.17238 .14649 L
.17333 .14649 L
.17429 .14649 L
.17524 .15088 L
.17619 .15088 L
.17714 .15088 L
.1781 .15088 L
.17905 .15088 L
.18 .15967 L
.18095 .16406 L
.1819 .16406 L
.18286 .16845 L
.18381 .16845 L
.18476 .17724 L
.18571 .17285 L
.18667 .17724 L
.18762 .17724 L
.18857 .18163 L
.18952 .18163 L
.19048 .17724 L
.19143 .17724 L
.19238 .18603 L
.19333 .18603 L
.19429 .18603 L
.19524 .18603 L
.19619 .19042 L
.19714 .19481 L
.1981 .19481 L
.19905 .19481 L
.2 .19481 L
.20095 .1992 L
.2019 .2036 L
.20286 .2036 L
.20381 .20799 L
.20476 .20799 L
.20571 .21238 L
.20667 .20799 L
.20762 .20799 L
.20857 .21238 L
.20952 .22117 L
.21048 .22117 L
.21143 .22117 L
.21238 .22117 L
.21333 .22117 L
Mistroke
.21429 .23434 L
.21524 .23434 L
.21619 .23874 L
.21714 .23874 L
.2181 .23874 L
.21905 .23874 L
.22 .24313 L
.22095 .24313 L
.2219 .24313 L
.22286 .24313 L
.22381 .24313 L
.22476 .24752 L
.22571 .24752 L
.22667 .24752 L
.22762 .24752 L
.22857 .25191 L
.22952 .25631 L
.23048 .26509 L
.23143 .26509 L
.23238 .26948 L
.23333 .26948 L
.23429 .26948 L
.23524 .27388 L
.23619 .27388 L
.23714 .27388 L
.2381 .27388 L
.23905 .27827 L
.24 .27827 L
.24095 .27827 L
.2419 .27827 L
.24286 .27827 L
.24381 .27827 L
.24476 .27827 L
.24571 .27827 L
.24667 .28266 L
.24762 .28266 L
.24857 .28705 L
.24952 .28705 L
.25048 .28705 L
.25143 .28705 L
.25238 .28705 L
.25333 .29145 L
.25429 .29145 L
.25524 .29145 L
.25619 .28705 L
.25714 .29145 L
.2581 .29584 L
.25905 .29145 L
.26 .29584 L
.26095 .30023 L
Mistroke
.2619 .30462 L
.26286 .30462 L
.26381 .30462 L
.26476 .30462 L
.26571 .30462 L
.26667 .30462 L
.26762 .30462 L
.26857 .30462 L
.26952 .30902 L
.27048 .30902 L
.27143 .31341 L
.27238 .32219 L
.27333 .32659 L
.27429 .32219 L
.27524 .32219 L
.27619 .32219 L
.27714 .32219 L
.2781 .3178 L
.27905 .3178 L
.28 .32219 L
.28095 .32219 L
.2819 .32219 L
.28286 .32659 L
.28381 .32659 L
.28476 .32659 L
.28571 .32659 L
.28667 .32659 L
.28762 .32659 L
.28857 .32659 L
.28952 .32659 L
.29048 .32659 L
.29143 .32659 L
.29238 .32659 L
.29333 .32659 L
.29429 .32659 L
.29524 .33098 L
.29619 .33098 L
.29714 .33098 L
.2981 .33098 L
.29905 .33098 L
.3 .33098 L
.30095 .33537 L
.3019 .33976 L
.30286 .33537 L
.30381 .33537 L
.30476 .33537 L
.30571 .33976 L
.30667 .33976 L
.30762 .33976 L
.30857 .34416 L
Mistroke
.30952 .34855 L
.31048 .34855 L
.31143 .34855 L
.31238 .34855 L
.31333 .35294 L
.31429 .35294 L
.31524 .35734 L
.31619 .35734 L
.31714 .35734 L
.3181 .35734 L
.31905 .36173 L
.32 .36173 L
.32095 .36173 L
.3219 .36173 L
.32286 .37051 L
.32381 .37051 L
.32476 .37051 L
.32571 .37491 L
.32667 .37491 L
.32762 .37491 L
.32857 .37491 L
.32952 .3793 L
.33048 .3793 L
.33143 .3793 L
.33238 .3793 L
.33333 .38369 L
.33429 .38369 L
.33524 .38369 L
.33619 .38369 L
.33714 .38369 L
.3381 .38369 L
.33905 .38369 L
.34 .38808 L
.34095 .38808 L
.3419 .39248 L
.34286 .39248 L
.34381 .39248 L
.34476 .39248 L
.34571 .39248 L
.34667 .39687 L
.34762 .39687 L
.34857 .40126 L
.34952 .40565 L
.35048 .40565 L
.35143 .40565 L
.35238 .40565 L
.35333 .41005 L
.35429 .41005 L
.35524 .41005 L
.35619 .41005 L
Mistroke
.35714 .41005 L
.3581 .41444 L
.35905 .41883 L
.36 .41883 L
.36095 .41883 L
.3619 .41883 L
.36286 .41883 L
.36381 .41883 L
.36476 .41883 L
.36571 .41883 L
.36667 .41883 L
.36762 .41883 L
.36857 .41883 L
.36952 .42322 L
.37048 .42762 L
.37143 .42762 L
.37238 .42762 L
.37333 .42762 L
.37429 .42762 L
.37524 .42762 L
.37619 .42762 L
.37714 .42762 L
.3781 .42762 L
.37905 .42762 L
.38 .42762 L
.38095 .42762 L
.3819 .43201 L
.38286 .4364 L
.38381 .4364 L
.38476 .43201 L
.38571 .43201 L
.38667 .43201 L
.38762 .43201 L
.38857 .43201 L
.38952 .43201 L
.39048 .43201 L
.39143 .43201 L
.39238 .4364 L
.39333 .4364 L
.39429 .4364 L
.39524 .4364 L
.39619 .4364 L
.39714 .4364 L
.3981 .4364 L
.39905 .4364 L
.4 .4364 L
.40095 .4364 L
.4019 .44079 L
.40286 .44079 L
.40381 .44079 L
Mistroke
.40476 .44079 L
.40571 .44079 L
.40667 .44079 L
.40762 .44079 L
.40857 .44079 L
.40952 .44079 L
.41048 .44519 L
.41143 .44519 L
.41238 .44519 L
.41333 .44519 L
.41429 .44519 L
.41524 .44958 L
.41619 .44958 L
.41714 .44958 L
.4181 .44958 L
.41905 .44958 L
.42 .44958 L
.42095 .44958 L
.4219 .44958 L
.42286 .44958 L
.42381 .44958 L
.42476 .44958 L
.42571 .44958 L
.42667 .44958 L
.42762 .44958 L
.42857 .44958 L
.42952 .44958 L
.43048 .44958 L
.43143 .44958 L
.43238 .44958 L
.43333 .44958 L
.43429 .45397 L
.43524 .45397 L
.43619 .45397 L
.43714 .45397 L
.4381 .45397 L
.43905 .45397 L
.44 .45397 L
.44095 .45397 L
.4419 .45397 L
.44286 .45397 L
.44381 .45397 L
.44476 .45397 L
.44571 .45397 L
.44667 .45836 L
.44762 .45836 L
.44857 .46276 L
.44952 .46715 L
.45048 .46276 L
.45143 .46276 L
Mistroke
.45238 .46276 L
.45333 .46276 L
.45429 .46276 L
.45524 .46276 L
.45619 .46276 L
.45714 .46276 L
.4581 .46715 L
.45905 .46715 L
.46 .46715 L
.46095 .46715 L
.4619 .46715 L
.46286 .46715 L
.46381 .46715 L
.46476 .46715 L
.46571 .46715 L
.46667 .46715 L
.46762 .46715 L
.46857 .46715 L
.46952 .46715 L
.47048 .46715 L
.47143 .46715 L
.47238 .46715 L
.47333 .46715 L
.47429 .46715 L
.47524 .46715 L
.47619 .46715 L
.47714 .46715 L
.4781 .47154 L
.47905 .47154 L
.48 .47154 L
.48095 .47154 L
.4819 .46715 L
.48286 .46715 L
.48381 .46715 L
.48476 .46715 L
.48571 .46715 L
.48667 .46715 L
.48762 .46715 L
.48857 .46715 L
.48952 .46715 L
.49048 .46715 L
.49143 .46715 L
.49238 .46715 L
.49333 .46715 L
.49429 .47154 L
.49524 .47154 L
.49619 .47154 L
.49714 .47154 L
.4981 .47154 L
.49905 .47154 L
Mistroke
.5 .47154 L
.50095 .47593 L
.5019 .47593 L
.50286 .47593 L
.50381 .47593 L
.50476 .47593 L
.50571 .47593 L
.50667 .47593 L
.50762 .48033 L
.50857 .48033 L
.50952 .48033 L
.51048 .48472 L
.51143 .48472 L
.51238 .48911 L
.51333 .48472 L
.51429 .48472 L
.51524 .48472 L
.51619 .48472 L
.51714 .48472 L
.5181 .48472 L
.51905 .48472 L
.52 .48472 L
.52095 .48472 L
.5219 .48472 L
.52286 .48911 L
.52381 .48911 L
.52476 .48472 L
.52571 .48472 L
.52667 .48911 L
.52762 .48911 L
.52857 .48911 L
.52952 .48911 L
.53048 .48911 L
.53143 .48911 L
.53238 .48911 L
.53333 .48911 L
.53429 .48911 L
.53524 .50229 L
.53619 .50229 L
.53714 .50229 L
.5381 .50229 L
.53905 .50229 L
.54 .50229 L
.54095 .50229 L
.5419 .50668 L
.54286 .50668 L
.54381 .50668 L
.54476 .50668 L
.54571 .50668 L
.54667 .50668 L
Mistroke
.54762 .50668 L
.54857 .50668 L
.54952 .50668 L
.55048 .51108 L
.55143 .51108 L
.55238 .51108 L
.55333 .51108 L
.55429 .51108 L
.55524 .51108 L
.55619 .51108 L
.55714 .51108 L
.5581 .51108 L
.55905 .51108 L
.56 .51108 L
.56095 .51108 L
.5619 .51108 L
.56286 .51108 L
.56381 .51108 L
.56476 .51108 L
.56571 .51108 L
.56667 .51108 L
.56762 .51108 L
.56857 .51108 L
.56952 .51108 L
.57048 .51108 L
.57143 .51108 L
.57238 .51108 L
.57333 .51108 L
.57429 .51108 L
.57524 .51108 L
.57619 .51547 L
.57714 .51547 L
.5781 .51547 L
.57905 .51547 L
.58 .51986 L
.58095 .51986 L
.5819 .52425 L
.58286 .52425 L
.58381 .52425 L
.58476 .52425 L
.58571 .52865 L
.58667 .52425 L
.58762 .52425 L
.58857 .52425 L
.58952 .52425 L
.59048 .52425 L
.59143 .52425 L
.59238 .52425 L
.59333 .52425 L
.59429 .52425 L
Mistroke
.59524 .52425 L
.59619 .52425 L
.59714 .52425 L
.5981 .52425 L
.59905 .52425 L
.6 .52425 L
.60095 .52425 L
.6019 .52865 L
.60286 .52865 L
.60381 .52865 L
.60476 .52865 L
.60571 .52865 L
.60667 .52865 L
.60762 .52865 L
.60857 .52865 L
.60952 .52865 L
.61048 .52865 L
.61143 .52865 L
.61238 .52865 L
.61333 .52865 L
.61429 .52865 L
.61524 .52865 L
.61619 .52865 L
.61714 .52865 L
.6181 .52865 L
.61905 .52865 L
.62 .52865 L
.62095 .53304 L
.6219 .53304 L
.62286 .53304 L
.62381 .53304 L
.62476 .53304 L
.62571 .53304 L
.62667 .53304 L
.62762 .53304 L
.62857 .53304 L
.62952 .53304 L
.63048 .53304 L
.63143 .53304 L
.63238 .53304 L
.63333 .53304 L
.63429 .53304 L
.63524 .53304 L
.63619 .53304 L
.63714 .53743 L
.6381 .53743 L
.63905 .53743 L
.64 .53743 L
.64095 .53743 L
.6419 .53743 L
Mistroke
.64286 .53743 L
.64381 .53743 L
.64476 .53743 L
.64571 .54182 L
.64667 .54182 L
.64762 .54182 L
.64857 .54182 L
.64952 .54182 L
.65048 .54182 L
.65143 .54182 L
.65238 .54182 L
.65333 .54182 L
.65429 .54182 L
.65524 .54182 L
.65619 .54182 L
.65714 .54182 L
.6581 .54182 L
.65905 .54622 L
.66 .54622 L
.66095 .54622 L
.6619 .54622 L
.66286 .54622 L
.66381 .54622 L
.66476 .54622 L
.66571 .54622 L
.66667 .54622 L
.66762 .54622 L
.66857 .54622 L
.66952 .54622 L
.67048 .54622 L
.67143 .54622 L
.67238 .54622 L
.67333 .54622 L
.67429 .54622 L
.67524 .54622 L
.67619 .54622 L
.67714 .54622 L
.6781 .54622 L
.67905 .54622 L
.68 .54622 L
.68095 .54622 L
.6819 .54622 L
.68286 .54622 L
.68381 .54622 L
.68476 .54622 L
.68571 .54622 L
.68667 .55061 L
.68762 .55061 L
.68857 .55061 L
.68952 .55061 L
Mistroke
.69048 .55061 L
.69143 .55061 L
.69238 .55061 L
.69333 .55061 L
.69429 .55061 L
.69524 .55061 L
.69619 .55061 L
.69714 .55061 L
.6981 .55061 L
.69905 .555 L
.7 .555 L
.70095 .555 L
.7019 .555 L
.70286 .555 L
.70381 .555 L
.70476 .55939 L
.70571 .55939 L
.70667 .55939 L
.70762 .55939 L
.70857 .55939 L
.70952 .55939 L
.71048 .55939 L
.71143 .55939 L
.71238 .55939 L
.71333 .55939 L
.71429 .55939 L
.71524 .55939 L
.71619 .55939 L
.71714 .55939 L
.7181 .55939 L
.71905 .55939 L
.72 .55939 L
.72095 .55939 L
.7219 .55939 L
.72286 .55939 L
.72381 .55939 L
.72476 .55939 L
.72571 .55939 L
.72667 .55939 L
.72762 .55939 L
.72857 .55939 L
.72952 .55939 L
.73048 .56379 L
.73143 .56379 L
.73238 .56379 L
.73333 .56379 L
.73429 .56379 L
.73524 .56379 L
.73619 .56379 L
.73714 .56379 L
Mistroke
.7381 .56379 L
.73905 .56379 L
.74 .56379 L
.74095 .56379 L
.7419 .56379 L
.74286 .56379 L
.74381 .56379 L
.74476 .56379 L
.74571 .56379 L
.74667 .56379 L
.74762 .56379 L
.74857 .56379 L
.74952 .56379 L
.75048 .56379 L
.75143 .56379 L
.75238 .56379 L
.75333 .56818 L
.75429 .56818 L
.75524 .56818 L
.75619 .56818 L
.75714 .56818 L
.7581 .56818 L
.75905 .56818 L
.76 .56818 L
.76095 .56818 L
.7619 .56818 L
.76286 .56818 L
.76381 .56818 L
.76476 .56818 L
.76571 .56818 L
.76667 .56818 L
.76762 .56818 L
.76857 .56818 L
.76952 .57257 L
.77048 .57257 L
.77143 .57257 L
.77238 .57257 L
.77333 .57257 L
.77429 .57257 L
.77524 .57257 L
.77619 .57257 L
.77714 .57257 L
.7781 .57257 L
.77905 .57257 L
.78 .57696 L
.78095 .57696 L
.7819 .57696 L
.78286 .57696 L
.78381 .57696 L
.78476 .57696 L
Mistroke
.78571 .57696 L
.78667 .57696 L
.78762 .57696 L
.78857 .57696 L
.78952 .57696 L
.79048 .57696 L
.79143 .57696 L
.79238 .57696 L
.79333 .57696 L
.79429 .57696 L
.79524 .57696 L
.79619 .57696 L
.79714 .57696 L
.7981 .57696 L
.79905 .57696 L
.8 .57696 L
.80095 .57696 L
.8019 .57696 L
.80286 .57696 L
.80381 .57696 L
.80476 .57696 L
.80571 .57257 L
.80667 .57257 L
.80762 .57257 L
.80857 .57257 L
.80952 .57257 L
.81048 .57257 L
.81143 .57257 L
.81238 .57257 L
.81333 .57257 L
.81429 .57257 L
.81524 .57257 L
.81619 .57257 L
.81714 .57257 L
.8181 .57257 L
.81905 .57257 L
.82 .57257 L
.82095 .57257 L
.8219 .57257 L
.82286 .57257 L
.82381 .57257 L
.82476 .57257 L
.82571 .57257 L
.82667 .57257 L
.82762 .57257 L
.82857 .57257 L
.82952 .57257 L
.83048 .57257 L
.83143 .57257 L
.83238 .56818 L
Mistroke
.83333 .56818 L
.83429 .56818 L
.83524 .56818 L
.83619 .56818 L
.83714 .56818 L
.8381 .56818 L
.83905 .56818 L
.84 .56818 L
.84095 .57257 L
.8419 .57257 L
.84286 .57257 L
.84381 .57257 L
.84476 .57257 L
.84571 .57257 L
.84667 .57257 L
.84762 .57257 L
.84857 .57257 L
.84952 .57257 L
.85048 .57257 L
.85143 .57257 L
.85238 .57257 L
.85333 .57257 L
.85429 .57257 L
.85524 .57257 L
.85619 .57257 L
.85714 .57257 L
.8581 .57257 L
.85905 .57257 L
.86 .57257 L
.86095 .57257 L
.8619 .57257 L
.86286 .57257 L
.86381 .57257 L
.86476 .57257 L
.86571 .57257 L
.86667 .57257 L
.86762 .57257 L
.86857 .57257 L
.86952 .57257 L
.87048 .57257 L
.87143 .57257 L
.87238 .57257 L
.87333 .57257 L
.87429 .57696 L
.87524 .57696 L
.87619 .57696 L
.87714 .57696 L
.8781 .57696 L
.87905 .57696 L
.88 .57696 L
Mistroke
.88095 .57696 L
.8819 .57696 L
.88286 .57696 L
.88381 .57696 L
.88476 .57696 L
.88571 .57696 L
.88667 .58136 L
.88762 .58136 L
.88857 .58136 L
.88952 .58136 L
.89048 .58136 L
.89143 .58136 L
.89238 .58136 L
.89333 .58136 L
.89429 .58136 L
.89524 .58136 L
.89619 .58136 L
.89714 .58136 L
.8981 .58136 L
.89905 .58136 L
.9 .58136 L
.90095 .58136 L
.9019 .58575 L
.90286 .58575 L
.90381 .58575 L
.90476 .58575 L
.90571 .58575 L
.90667 .58575 L
.90762 .58575 L
.90857 .58136 L
.90952 .58136 L
.91048 .58136 L
.91143 .58136 L
.91238 .58136 L
.91333 .58136 L
.91429 .58136 L
.91524 .58136 L
.91619 .58136 L
.91714 .58136 L
.9181 .58136 L
.91905 .58136 L
.92 .58136 L
.92095 .58136 L
.9219 .58136 L
.92286 .58136 L
.92381 .58136 L
.92476 .58136 L
.92571 .58136 L
.92667 .58136 L
.92762 .58136 L
Mistroke
.92857 .58136 L
.92952 .58136 L
.93048 .58136 L
.93143 .58575 L
.93238 .58575 L
.93333 .58575 L
.93429 .58575 L
.93524 .58575 L
.93619 .58575 L
.93714 .58575 L
.9381 .58575 L
.93905 .58575 L
.94 .58575 L
.94095 .58575 L
.9419 .58575 L
.94286 .58575 L
.94381 .58575 L
.94476 .58575 L
.94571 .58575 L
.94667 .58575 L
.94762 .58575 L
.94857 .58575 L
.94952 .58575 L
.95048 .58575 L
.95143 .58575 L
.95238 .58575 L
.95333 .58575 L
.95429 .58575 L
.95524 .58575 L
.95619 .58575 L
.95714 .58575 L
.9581 .58575 L
.95905 .58575 L
.96 .58575 L
.96095 .58575 L
.9619 .58575 L
.96286 .58575 L
.96381 .58575 L
.96476 .58575 L
.96571 .58575 L
.96667 .58575 L
.96762 .58575 L
.96857 .58575 L
.96952 .58575 L
.97048 .58575 L
.97143 .58575 L
.97238 .58575 L
.97333 .58575 L
.97429 .58575 L
.97524 .58575 L
Mistroke
.97619 .58575 L
Mfstroke
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
% End of Graphics
MathPictureEnd

:[font = output; output; inactive; preserveAspect; endGroup]
Graphics["<<>>"]
;[o]
-Graphics-
:[font = text; inactive; preserveAspect]
This gives the sum of 200 single channel traces.
;[s]
3:0,0;15,1;18,2;48,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,4,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect]
n = 200;
myEPSC = 
n MeanCurrent[q, stateConductivityList, initialState,
              height, duration, n, u, {t, tmax, tstep}];
:[font = input; preserveAspect; startGroup]
ListPlot[Transpose[{Range[0, tmax, tstep], myEPSC}],
         PlotJoined -> True, PlotRange -> All,
         AxesLabel -> {"t/ms", "I/pA"},
         PlotLabel -> "EPSC, 200 Channels"]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174]
%!
%%Creator: Mathematica
%%AspectRatio: .61803 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.0952381 0.603319 0.00847644 [
[(2)] .21429 .60332 0 2 Msboxa
[(4)] .40476 .60332 0 2 Msboxa
[(6)] .59524 .60332 0 2 Msboxa
[(8)] .78571 .60332 0 2 Msboxa
[(10)] .97619 .60332 0 2 Msboxa
[(t/ms)] 1.025 .60332 -1 0 Msboxa
[(EPSC, 200 Channels)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(-70)] .01131 .00997 1 0 Msboxa
[(-60)] .01131 .09473 1 0 Msboxa
[(-50)] .01131 .1795 1 0 Msboxa
[(-40)] .01131 .26426 1 0 Msboxa
[(-30)] .01131 .34903 1 0 Msboxa
[(-20)] .01131 .43379 1 0 Msboxa
[(-10)] .01131 .51855 1 0 Msboxa
[(I/pA)] .02381 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.21429 .60332 m
.21429 .60957 L
s
P
[(2)] .21429 .60332 0 2 Mshowa
p
.002 w
.40476 .60332 m
.40476 .60957 L
s
P
[(4)] .40476 .60332 0 2 Mshowa
p
.002 w
.59524 .60332 m
.59524 .60957 L
s
P
[(6)] .59524 .60332 0 2 Mshowa
p
.002 w
.78571 .60332 m
.78571 .60957 L
s
P
[(8)] .78571 .60332 0 2 Mshowa
p
.002 w
.97619 .60332 m
.97619 .60957 L
s
P
[(10)] .97619 .60332 0 2 Mshowa
p
.001 w
.0619 .60332 m
.0619 .60707 L
s
P
p
.001 w
.1 .60332 m
.1 .60707 L
s
P
p
.001 w
.1381 .60332 m
.1381 .60707 L
s
P
p
.001 w
.17619 .60332 m
.17619 .60707 L
s
P
p
.001 w
.25238 .60332 m
.25238 .60707 L
s
P
p
.001 w
.29048 .60332 m
.29048 .60707 L
s
P
p
.001 w
.32857 .60332 m
.32857 .60707 L
s
P
p
.001 w
.36667 .60332 m
.36667 .60707 L
s
P
p
.001 w
.44286 .60332 m
.44286 .60707 L
s
P
p
.001 w
.48095 .60332 m
.48095 .60707 L
s
P
p
.001 w
.51905 .60332 m
.51905 .60707 L
s
P
p
.001 w
.55714 .60332 m
.55714 .60707 L
s
P
p
.001 w
.63333 .60332 m
.63333 .60707 L
s
P
p
.001 w
.67143 .60332 m
.67143 .60707 L
s
P
p
.001 w
.70952 .60332 m
.70952 .60707 L
s
P
p
.001 w
.74762 .60332 m
.74762 .60707 L
s
P
p
.001 w
.82381 .60332 m
.82381 .60707 L
s
P
p
.001 w
.8619 .60332 m
.8619 .60707 L
s
P
p
.001 w
.9 .60332 m
.9 .60707 L
s
P
p
.001 w
.9381 .60332 m
.9381 .60707 L
s
P
[(t/ms)] 1.025 .60332 -1 0 Mshowa
p
.002 w
0 .60332 m
1 .60332 L
s
P
[(EPSC, 200 Channels)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .00997 m
.03006 .00997 L
s
P
[(-70)] .01131 .00997 1 0 Mshowa
p
.002 w
.02381 .09473 m
.03006 .09473 L
s
P
[(-60)] .01131 .09473 1 0 Mshowa
p
.002 w
.02381 .1795 m
.03006 .1795 L
s
P
[(-50)] .01131 .1795 1 0 Mshowa
p
.002 w
.02381 .26426 m
.03006 .26426 L
s
P
[(-40)] .01131 .26426 1 0 Mshowa
p
.002 w
.02381 .34903 m
.03006 .34903 L
s
P
[(-30)] .01131 .34903 1 0 Mshowa
p
.002 w
.02381 .43379 m
.03006 .43379 L
s
P
[(-20)] .01131 .43379 1 0 Mshowa
p
.002 w
.02381 .51855 m
.03006 .51855 L
s
P
[(-10)] .01131 .51855 1 0 Mshowa
p
.001 w
.02381 .02692 m
.02756 .02692 L
s
P
p
.001 w
.02381 .04387 m
.02756 .04387 L
s
P
p
.001 w
.02381 .06083 m
.02756 .06083 L
s
P
p
.001 w
.02381 .07778 m
.02756 .07778 L
s
P
p
.001 w
.02381 .11169 m
.02756 .11169 L
s
P
p
.001 w
.02381 .12864 m
.02756 .12864 L
s
P
p
.001 w
.02381 .14559 m
.02756 .14559 L
s
P
p
.001 w
.02381 .16254 m
.02756 .16254 L
s
P
p
.001 w
.02381 .19645 m
.02756 .19645 L
s
P
p
.001 w
.02381 .2134 m
.02756 .2134 L
s
P
p
.001 w
.02381 .23036 m
.02756 .23036 L
s
P
p
.001 w
.02381 .24731 m
.02756 .24731 L
s
P
p
.001 w
.02381 .28121 m
.02756 .28121 L
s
P
p
.001 w
.02381 .29817 m
.02756 .29817 L
s
P
p
.001 w
.02381 .31512 m
.02756 .31512 L
s
P
p
.001 w
.02381 .33207 m
.02756 .33207 L
s
P
p
.001 w
.02381 .36598 m
.02756 .36598 L
s
P
p
.001 w
.02381 .38293 m
.02756 .38293 L
s
P
p
.001 w
.02381 .39988 m
.02756 .39988 L
s
P
p
.001 w
.02381 .41684 m
.02756 .41684 L
s
P
p
.001 w
.02381 .45074 m
.02756 .45074 L
s
P
p
.001 w
.02381 .4677 m
.02756 .4677 L
s
P
p
.001 w
.02381 .48465 m
.02756 .48465 L
s
P
p
.001 w
.02381 .5016 m
.02756 .5016 L
s
P
p
.001 w
.02381 .53551 m
.02756 .53551 L
s
P
p
.001 w
.02381 .55246 m
.02756 .55246 L
s
P
p
.001 w
.02381 .56941 m
.02756 .56941 L
s
P
p
.001 w
.02381 .58637 m
.02756 .58637 L
s
P
[(I/pA)] .02381 .61803 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
.004 w
.02381 .60332 m
.02476 .57958 L
.02571 .54636 L
.02667 .50364 L
.02762 .45142 L
.02857 .38971 L
.02952 .34224 L
.03048 .31851 L
.03143 .30427 L
.03238 .2663 L
.03333 .23781 L
.03429 .20459 L
.03524 .19035 L
.03619 .17136 L
.03714 .16661 L
.0381 .16661 L
.03905 .14288 L
.04 .14288 L
.04095 .13813 L
.0419 .11914 L
.04286 .10965 L
.04381 .09541 L
.04476 .09541 L
.04571 .08117 L
.04667 .06693 L
.04762 .06693 L
.04857 .05744 L
.04952 .06693 L
.05048 .05744 L
.05143 .05744 L
.05238 .05269 L
.05333 .0432 L
.05429 .02896 L
.05524 .01946 L
.05619 .01946 L
.05714 .01472 L
.0581 .01472 L
.05905 .01472 L
.06 .01472 L
.06095 .01472 L
.0619 .01472 L
.06286 .02896 L
.06381 .02896 L
.06476 .0337 L
.06571 .0337 L
.06667 .03845 L
.06762 .0432 L
.06857 .02421 L
.06952 .02896 L
.07048 .02421 L
Mistroke
.07143 .02421 L
.07238 .02421 L
.07333 .01946 L
.07429 .01472 L
.07524 .01946 L
.07619 .01472 L
.07714 .01472 L
.0781 .02421 L
.07905 .02421 L
.08 .02896 L
.08095 .02896 L
.0819 .02421 L
.08286 .02896 L
.08381 .02896 L
.08476 .02421 L
.08571 .02421 L
.08667 .02896 L
.08762 .02896 L
.08857 .02896 L
.08952 .01946 L
.09048 .02421 L
.09143 .02421 L
.09238 .0337 L
.09333 .02421 L
.09429 .02896 L
.09524 .0337 L
.09619 .0337 L
.09714 .03845 L
.0981 .03845 L
.09905 .0337 L
.1 .0337 L
.10095 .02896 L
.1019 .0337 L
.10286 .03845 L
.10381 .0337 L
.10476 .0337 L
.10571 .03845 L
.10667 .0432 L
.10762 .0432 L
.10857 .04794 L
.10952 .05269 L
.11048 .05269 L
.11143 .06218 L
.11238 .06218 L
.11333 .06218 L
.11429 .06218 L
.11524 .05744 L
.11619 .05269 L
.11714 .06218 L
.1181 .06218 L
Mistroke
.11905 .06693 L
.12 .07168 L
.12095 .08117 L
.1219 .08117 L
.12286 .07642 L
.12381 .07168 L
.12476 .07168 L
.12571 .07642 L
.12667 .08117 L
.12762 .08117 L
.12857 .08117 L
.12952 .09066 L
.13048 .09066 L
.13143 .09066 L
.13238 .09066 L
.13333 .09541 L
.13429 .09541 L
.13524 .09541 L
.13619 .09541 L
.13714 .09541 L
.1381 .09541 L
.13905 .09541 L
.14 .10016 L
.14095 .10965 L
.1419 .10965 L
.14286 .10965 L
.14381 .10965 L
.14476 .1144 L
.14571 .12389 L
.14667 .12389 L
.14762 .12389 L
.14857 .12864 L
.14952 .13339 L
.15048 .13813 L
.15143 .13813 L
.15238 .14288 L
.15333 .14763 L
.15429 .14763 L
.15524 .14763 L
.15619 .15237 L
.15714 .15237 L
.1581 .15237 L
.15905 .14763 L
.16 .14763 L
.16095 .14763 L
.1619 .14763 L
.16286 .14763 L
.16381 .14763 L
.16476 .14763 L
.16571 .14763 L
Mistroke
.16667 .14763 L
.16762 .14763 L
.16857 .14763 L
.16952 .15712 L
.17048 .16187 L
.17143 .16187 L
.17238 .16187 L
.17333 .16187 L
.17429 .17136 L
.17524 .17136 L
.17619 .17136 L
.17714 .17136 L
.1781 .17136 L
.17905 .17611 L
.18 .17611 L
.18095 .17611 L
.1819 .18085 L
.18286 .18085 L
.18381 .1856 L
.18476 .1856 L
.18571 .19509 L
.18667 .19984 L
.18762 .21408 L
.18857 .20933 L
.18952 .20933 L
.19048 .21408 L
.19143 .21408 L
.19238 .21883 L
.19333 .21883 L
.19429 .23307 L
.19524 .23781 L
.19619 .24256 L
.19714 .24256 L
.1981 .24731 L
.19905 .2568 L
.2 .2568 L
.20095 .2568 L
.2019 .2568 L
.20286 .26155 L
.20381 .26155 L
.20476 .2663 L
.20571 .2663 L
.20667 .2663 L
.20762 .27104 L
.20857 .27104 L
.20952 .27104 L
.21048 .27104 L
.21143 .27579 L
.21238 .28054 L
.21333 .28054 L
Mistroke
.21429 .28054 L
.21524 .28528 L
.21619 .28528 L
.21714 .28528 L
.2181 .29003 L
.21905 .29003 L
.22 .29003 L
.22095 .29478 L
.2219 .29478 L
.22286 .29478 L
.22381 .29003 L
.22476 .29003 L
.22571 .29478 L
.22667 .29478 L
.22762 .29952 L
.22857 .30427 L
.22952 .30902 L
.23048 .30902 L
.23143 .30902 L
.23238 .30902 L
.23333 .30902 L
.23429 .31851 L
.23524 .31851 L
.23619 .31851 L
.23714 .31376 L
.2381 .31376 L
.23905 .31851 L
.24 .32326 L
.24095 .328 L
.2419 .328 L
.24286 .328 L
.24381 .328 L
.24476 .33275 L
.24571 .33275 L
.24667 .33275 L
.24762 .328 L
.24857 .33275 L
.24952 .33275 L
.25048 .33275 L
.25143 .33275 L
.25238 .3375 L
.25333 .3375 L
.25429 .3375 L
.25524 .33275 L
.25619 .3375 L
.25714 .34224 L
.2581 .3375 L
.25905 .3375 L
.26 .34699 L
.26095 .35174 L
Mistroke
.2619 .35649 L
.26286 .35649 L
.26381 .36123 L
.26476 .36598 L
.26571 .37073 L
.26667 .37547 L
.26762 .37547 L
.26857 .37073 L
.26952 .37073 L
.27048 .37547 L
.27143 .37547 L
.27238 .37547 L
.27333 .37547 L
.27429 .37547 L
.27524 .37547 L
.27619 .37547 L
.27714 .38022 L
.2781 .38497 L
.27905 .38497 L
.28 .38497 L
.28095 .38497 L
.2819 .38971 L
.28286 .38971 L
.28381 .38971 L
.28476 .38971 L
.28571 .38971 L
.28667 .39446 L
.28762 .39921 L
.28857 .40395 L
.28952 .4087 L
.29048 .4087 L
.29143 .4087 L
.29238 .4087 L
.29333 .4087 L
.29429 .4087 L
.29524 .4087 L
.29619 .4087 L
.29714 .4087 L
.2981 .4087 L
.29905 .4087 L
.3 .4087 L
.30095 .4087 L
.3019 .4087 L
.30286 .4087 L
.30381 .4087 L
.30476 .4087 L
.30571 .4087 L
.30667 .4087 L
.30762 .41345 L
.30857 .41345 L
Mistroke
.30952 .41345 L
.31048 .41345 L
.31143 .41345 L
.31238 .41345 L
.31333 .41345 L
.31429 .41345 L
.31524 .41345 L
.31619 .41819 L
.31714 .41819 L
.3181 .41819 L
.31905 .41819 L
.32 .41819 L
.32095 .41819 L
.3219 .41819 L
.32286 .41819 L
.32381 .41819 L
.32476 .41819 L
.32571 .41819 L
.32667 .41819 L
.32762 .41819 L
.32857 .41819 L
.32952 .42294 L
.33048 .42294 L
.33143 .42769 L
.33238 .42769 L
.33333 .42294 L
.33429 .42294 L
.33524 .42769 L
.33619 .42769 L
.33714 .42769 L
.3381 .42769 L
.33905 .43243 L
.34 .43243 L
.34095 .43243 L
.3419 .43243 L
.34286 .43718 L
.34381 .43718 L
.34476 .43718 L
.34571 .43718 L
.34667 .43718 L
.34762 .43718 L
.34857 .43718 L
.34952 .44193 L
.35048 .44667 L
.35143 .44667 L
.35238 .44667 L
.35333 .44667 L
.35429 .44667 L
.35524 .44667 L
.35619 .44667 L
Mistroke
.35714 .44667 L
.3581 .44667 L
.35905 .44667 L
.36 .44667 L
.36095 .44667 L
.3619 .44667 L
.36286 .44667 L
.36381 .45617 L
.36476 .45617 L
.36571 .45617 L
.36667 .45617 L
.36762 .45617 L
.36857 .45617 L
.36952 .45617 L
.37048 .45617 L
.37143 .45617 L
.37238 .45617 L
.37333 .45617 L
.37429 .45617 L
.37524 .46566 L
.37619 .46091 L
.37714 .46091 L
.3781 .46091 L
.37905 .46091 L
.38 .46091 L
.38095 .46091 L
.3819 .46091 L
.38286 .46091 L
.38381 .46566 L
.38476 .46566 L
.38571 .46566 L
.38667 .46091 L
.38762 .46091 L
.38857 .46091 L
.38952 .46091 L
.39048 .46091 L
.39143 .46091 L
.39238 .46091 L
.39333 .46091 L
.39429 .46091 L
.39524 .46091 L
.39619 .46091 L
.39714 .46091 L
.3981 .46091 L
.39905 .46091 L
.4 .46091 L
.40095 .46091 L
.4019 .46091 L
.40286 .46091 L
.40381 .46566 L
Mistroke
.40476 .46566 L
.40571 .46566 L
.40667 .47041 L
.40762 .47041 L
.40857 .47041 L
.40952 .47041 L
.41048 .47041 L
.41143 .47041 L
.41238 .47041 L
.41333 .47041 L
.41429 .47041 L
.41524 .47041 L
.41619 .47041 L
.41714 .47041 L
.4181 .47041 L
.41905 .47516 L
.42 .47516 L
.42095 .47516 L
.4219 .47516 L
.42286 .47516 L
.42381 .47516 L
.42476 .4799 L
.42571 .4799 L
.42667 .48465 L
.42762 .48465 L
.42857 .48465 L
.42952 .4894 L
.43048 .4894 L
.43143 .4894 L
.43238 .4894 L
.43333 .4894 L
.43429 .4894 L
.43524 .4894 L
.43619 .4894 L
.43714 .4894 L
.4381 .49414 L
.43905 .49414 L
.44 .49414 L
.44095 .49889 L
.4419 .49889 L
.44286 .49889 L
.44381 .49889 L
.44476 .49889 L
.44571 .49889 L
.44667 .49889 L
.44762 .49889 L
.44857 .49889 L
.44952 .49889 L
.45048 .49889 L
.45143 .49889 L
Mistroke
.45238 .49889 L
.45333 .50364 L
.45429 .50364 L
.45524 .50364 L
.45619 .50364 L
.45714 .50364 L
.4581 .50364 L
.45905 .50838 L
.46 .50838 L
.46095 .50838 L
.4619 .50838 L
.46286 .50838 L
.46381 .50838 L
.46476 .50838 L
.46571 .51788 L
.46667 .51788 L
.46762 .51788 L
.46857 .51788 L
.46952 .51788 L
.47048 .51788 L
.47143 .51788 L
.47238 .51788 L
.47333 .51788 L
.47429 .52262 L
.47524 .52262 L
.47619 .52262 L
.47714 .52262 L
.4781 .52737 L
.47905 .52737 L
.48 .52737 L
.48095 .52737 L
.4819 .52737 L
.48286 .53212 L
.48381 .53686 L
.48476 .54161 L
.48571 .54161 L
.48667 .54161 L
.48762 .54161 L
.48857 .54161 L
.48952 .54161 L
.49048 .54161 L
.49143 .54161 L
.49238 .53686 L
.49333 .53686 L
.49429 .53686 L
.49524 .53686 L
.49619 .53686 L
.49714 .53686 L
.4981 .53686 L
.49905 .53686 L
Mistroke
.5 .53686 L
.50095 .53686 L
.5019 .53686 L
.50286 .53686 L
.50381 .53686 L
.50476 .53686 L
.50571 .53686 L
.50667 .53686 L
.50762 .54161 L
.50857 .54161 L
.50952 .54161 L
.51048 .54161 L
.51143 .54161 L
.51238 .54161 L
.51333 .54161 L
.51429 .54161 L
.51524 .54161 L
.51619 .54161 L
.51714 .54161 L
.5181 .54161 L
.51905 .54161 L
.52 .54161 L
.52095 .54161 L
.5219 .54161 L
.52286 .54161 L
.52381 .54161 L
.52476 .54161 L
.52571 .54161 L
.52667 .54161 L
.52762 .54161 L
.52857 .54161 L
.52952 .54161 L
.53048 .54161 L
.53143 .54161 L
.53238 .54161 L
.53333 .54161 L
.53429 .54161 L
.53524 .54161 L
.53619 .54161 L
.53714 .54161 L
.5381 .54161 L
.53905 .54636 L
.54 .5511 L
.54095 .54636 L
.5419 .54636 L
.54286 .54636 L
.54381 .54636 L
.54476 .54636 L
.54571 .54636 L
.54667 .54636 L
Mistroke
.54762 .54636 L
.54857 .54636 L
.54952 .54636 L
.55048 .54636 L
.55143 .54636 L
.55238 .54636 L
.55333 .54636 L
.55429 .54636 L
.55524 .54636 L
.55619 .54636 L
.55714 .54636 L
.5581 .54636 L
.55905 .54636 L
.56 .54636 L
.56095 .54636 L
.5619 .54636 L
.56286 .54636 L
.56381 .54636 L
.56476 .54636 L
.56571 .54636 L
.56667 .54636 L
.56762 .54636 L
.56857 .54636 L
.56952 .54636 L
.57048 .54636 L
.57143 .54636 L
.57238 .54636 L
.57333 .54636 L
.57429 .54636 L
.57524 .54636 L
.57619 .54636 L
.57714 .54636 L
.5781 .54636 L
.57905 .54636 L
.58 .54636 L
.58095 .54636 L
.5819 .54636 L
.58286 .54636 L
.58381 .54636 L
.58476 .54636 L
.58571 .54636 L
.58667 .54636 L
.58762 .54636 L
.58857 .54636 L
.58952 .54636 L
.59048 .54636 L
.59143 .54636 L
.59238 .54636 L
.59333 .54636 L
.59429 .54636 L
Mistroke
.59524 .54636 L
.59619 .54636 L
.59714 .54636 L
.5981 .54636 L
.59905 .54636 L
.6 .54636 L
.60095 .54636 L
.6019 .54636 L
.60286 .54636 L
.60381 .54636 L
.60476 .54636 L
.60571 .54636 L
.60667 .54636 L
.60762 .54636 L
.60857 .54636 L
.60952 .54636 L
.61048 .54636 L
.61143 .54636 L
.61238 .54636 L
.61333 .54636 L
.61429 .54636 L
.61524 .54636 L
.61619 .54636 L
.61714 .54636 L
.6181 .54636 L
.61905 .54636 L
.62 .54636 L
.62095 .54636 L
.6219 .54636 L
.62286 .54636 L
.62381 .54636 L
.62476 .54636 L
.62571 .54636 L
.62667 .54636 L
.62762 .54636 L
.62857 .54636 L
.62952 .54636 L
.63048 .54636 L
.63143 .54636 L
.63238 .54636 L
.63333 .54636 L
.63429 .54636 L
.63524 .5511 L
.63619 .5511 L
.63714 .5511 L
.6381 .5511 L
.63905 .5511 L
.64 .5511 L
.64095 .5511 L
.6419 .55585 L
Mistroke
.64286 .55585 L
.64381 .55585 L
.64476 .55585 L
.64571 .55585 L
.64667 .55585 L
.64762 .55585 L
.64857 .5606 L
.64952 .5606 L
.65048 .5606 L
.65143 .5606 L
.65238 .5606 L
.65333 .5606 L
.65429 .5606 L
.65524 .5606 L
.65619 .5606 L
.65714 .5606 L
.6581 .5606 L
.65905 .5606 L
.66 .5606 L
.66095 .5606 L
.6619 .5606 L
.66286 .5606 L
.66381 .5606 L
.66476 .5606 L
.66571 .5606 L
.66667 .5606 L
.66762 .5606 L
.66857 .5606 L
.66952 .5606 L
.67048 .5606 L
.67143 .5606 L
.67238 .5606 L
.67333 .5606 L
.67429 .5606 L
.67524 .5606 L
.67619 .5606 L
.67714 .5606 L
.6781 .5606 L
.67905 .5606 L
.68 .5606 L
.68095 .5606 L
.6819 .5606 L
.68286 .56534 L
.68381 .56534 L
.68476 .56534 L
.68571 .56534 L
.68667 .56534 L
.68762 .56534 L
.68857 .56534 L
.68952 .5606 L
Mistroke
.69048 .5606 L
.69143 .56534 L
.69238 .56534 L
.69333 .56534 L
.69429 .56534 L
.69524 .56534 L
.69619 .56534 L
.69714 .56534 L
.6981 .56534 L
.69905 .56534 L
.7 .56534 L
.70095 .56534 L
.7019 .56534 L
.70286 .56534 L
.70381 .56534 L
.70476 .56534 L
.70571 .56534 L
.70667 .56534 L
.70762 .56534 L
.70857 .56534 L
.70952 .56534 L
.71048 .56534 L
.71143 .56534 L
.71238 .56534 L
.71333 .56534 L
.71429 .56534 L
.71524 .56534 L
.71619 .56534 L
.71714 .56534 L
.7181 .56534 L
.71905 .56534 L
.72 .56534 L
.72095 .56534 L
.7219 .56534 L
.72286 .56534 L
.72381 .56534 L
.72476 .56534 L
.72571 .56534 L
.72667 .56534 L
.72762 .56534 L
.72857 .56534 L
.72952 .56534 L
.73048 .57009 L
.73143 .57009 L
.73238 .57009 L
.73333 .57009 L
.73429 .57009 L
.73524 .57009 L
.73619 .57009 L
.73714 .57009 L
Mistroke
.7381 .57009 L
.73905 .57009 L
.74 .57009 L
.74095 .57009 L
.7419 .57009 L
.74286 .57009 L
.74381 .57009 L
.74476 .57009 L
.74571 .57009 L
.74667 .57009 L
.74762 .57009 L
.74857 .57009 L
.74952 .57009 L
.75048 .57009 L
.75143 .57009 L
.75238 .57009 L
.75333 .57009 L
.75429 .57009 L
.75524 .57009 L
.75619 .57484 L
.75714 .57484 L
.7581 .57484 L
.75905 .57009 L
.76 .57009 L
.76095 .57009 L
.7619 .57009 L
.76286 .57009 L
.76381 .57009 L
.76476 .57009 L
.76571 .57009 L
.76667 .57009 L
.76762 .57009 L
.76857 .57009 L
.76952 .57009 L
.77048 .57009 L
.77143 .57009 L
.77238 .57009 L
.77333 .57009 L
.77429 .57009 L
.77524 .57009 L
.77619 .57009 L
.77714 .57009 L
.7781 .57009 L
.77905 .57009 L
.78 .57009 L
.78095 .57009 L
.7819 .57009 L
.78286 .57009 L
.78381 .57009 L
.78476 .57009 L
Mistroke
.78571 .57009 L
.78667 .57009 L
.78762 .57009 L
.78857 .57484 L
.78952 .57484 L
.79048 .57484 L
.79143 .57484 L
.79238 .57958 L
.79333 .57958 L
.79429 .57958 L
.79524 .57958 L
.79619 .57958 L
.79714 .57958 L
.7981 .57958 L
.79905 .57958 L
.8 .57958 L
.80095 .57958 L
.8019 .57958 L
.80286 .57958 L
.80381 .57958 L
.80476 .57958 L
.80571 .57958 L
.80667 .57958 L
.80762 .57958 L
.80857 .57958 L
.80952 .57958 L
.81048 .57958 L
.81143 .57958 L
.81238 .57958 L
.81333 .57958 L
.81429 .57958 L
.81524 .57958 L
.81619 .57958 L
.81714 .57958 L
.8181 .57958 L
.81905 .57958 L
.82 .58433 L
.82095 .58433 L
.8219 .58433 L
.82286 .58433 L
.82381 .58433 L
.82476 .58433 L
.82571 .58433 L
.82667 .58433 L
.82762 .58433 L
.82857 .58433 L
.82952 .58433 L
.83048 .58433 L
.83143 .58433 L
.83238 .58433 L
Mistroke
.83333 .58433 L
.83429 .58433 L
.83524 .58433 L
.83619 .58433 L
.83714 .58433 L
.8381 .58433 L
.83905 .58433 L
.84 .58433 L
.84095 .58433 L
.8419 .58433 L
.84286 .58433 L
.84381 .58433 L
.84476 .58433 L
.84571 .58433 L
.84667 .58433 L
.84762 .58433 L
.84857 .58433 L
.84952 .58433 L
.85048 .58433 L
.85143 .58433 L
.85238 .58908 L
.85333 .58908 L
.85429 .58908 L
.85524 .58908 L
.85619 .58908 L
.85714 .58908 L
.8581 .58908 L
.85905 .58908 L
.86 .58908 L
.86095 .58908 L
.8619 .58908 L
.86286 .58908 L
.86381 .58908 L
.86476 .58433 L
.86571 .58433 L
.86667 .58433 L
.86762 .58433 L
.86857 .58433 L
.86952 .58433 L
.87048 .58433 L
.87143 .58433 L
.87238 .58433 L
.87333 .58433 L
.87429 .58433 L
.87524 .58433 L
.87619 .58433 L
.87714 .58433 L
.8781 .58433 L
.87905 .58433 L
.88 .58433 L
Mistroke
.88095 .58433 L
.8819 .58433 L
.88286 .58433 L
.88381 .58433 L
.88476 .58433 L
.88571 .58433 L
.88667 .58433 L
.88762 .58433 L
.88857 .58433 L
.88952 .58433 L
.89048 .58433 L
.89143 .58433 L
.89238 .58433 L
.89333 .58433 L
.89429 .58433 L
.89524 .58433 L
.89619 .58433 L
.89714 .58433 L
.8981 .58433 L
.89905 .58433 L
.9 .58433 L
.90095 .58433 L
.9019 .58433 L
.90286 .58433 L
.90381 .58433 L
.90476 .58433 L
.90571 .58433 L
.90667 .58433 L
.90762 .58433 L
.90857 .58908 L
.90952 .58908 L
.91048 .58908 L
.91143 .58908 L
.91238 .58908 L
.91333 .58908 L
.91429 .58908 L
.91524 .58908 L
.91619 .58908 L
.91714 .58908 L
.9181 .58908 L
.91905 .58908 L
.92 .58908 L
.92095 .58908 L
.9219 .58908 L
.92286 .58908 L
.92381 .58908 L
.92476 .58908 L
.92571 .58908 L
.92667 .58908 L
.92762 .58908 L
Mistroke
.92857 .58908 L
.92952 .58908 L
.93048 .58908 L
.93143 .58908 L
.93238 .58908 L
.93333 .58908 L
.93429 .58908 L
.93524 .58908 L
.93619 .58908 L
.93714 .58908 L
.9381 .58908 L
.93905 .58908 L
.94 .58908 L
.94095 .58908 L
.9419 .58908 L
.94286 .58908 L
.94381 .59383 L
.94476 .59383 L
.94571 .59383 L
.94667 .59383 L
.94762 .59383 L
.94857 .59383 L
.94952 .59383 L
.95048 .59383 L
.95143 .59383 L
.95238 .59383 L
.95333 .59383 L
.95429 .59383 L
.95524 .59383 L
.95619 .59383 L
.95714 .59383 L
.9581 .59383 L
.95905 .59383 L
.96 .59383 L
.96095 .59383 L
.9619 .59383 L
.96286 .59383 L
.96381 .59383 L
.96476 .59383 L
.96571 .59383 L
.96667 .59383 L
.96762 .59383 L
.96857 .59383 L
.96952 .59383 L
.97048 .59383 L
.97143 .59383 L
.97238 .59383 L
.97333 .59383 L
.97429 .59383 L
.97524 .59383 L
Mistroke
.97619 .59383 L
Mfstroke
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
% End of Graphics
MathPictureEnd

:[font = output; output; inactive; preserveAspect; endGroup]
Graphics["<<>>"]
;[o]
-Graphics-
:[font = text; inactive; preserveAspect]
Write the simulated EPSC to a file, with the numbers separated by the End-Of-Line character.
:[font = input; preserveAspect]
ColumnForm[myEPSC] >> file
:[font = text; inactive; preserveAspect]
The following three functions have close analogs in the ColquhounHawkes exact solution package. We won't discuss them here, but give their help texts.
;[s]
3:0,0;56,1;71,2;150,-1;
3:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
?CurrentVariance
:[font = info; inactive; preserveAspect; endGroup]
CurrentVariance[option, q, sclist, initstate,
   height, duration, n, u, {t, tmax, tstep}] gives
   the variance function (pA^2) of n independent
   single channel current functions of t. Division
   by n-1 (rather than n) is used. The option
   EnsembleSize -> m causes m-membered channel
   ensembles to be simulated instead of single
   channels. See ?SingleTrace for information on
   the other arguments.
:[font = input; preserveAspect; startGroup]
?CoefficientOfVariation
:[font = info; inactive; preserveAspect; endGroup]
CoefficientOfVariation[option, q, sclist,
   initstate, height, duration, n, u, {t, tmax,
   tstep}] gives the "coefficient of variation"
   (i.e. standard deviation / mean) of n
   independent single channel current functions of
   t in percent. Division by n-1 (rather than n) is
   used. The option EnsembleSize -> m causes
   m-membered channel ensembles to be simulated
   instead of single channels. See ?SingleTrace for
   information on the other arguments.
:[font = input; preserveAspect; startGroup]
?CurrentThirdMoment
:[font = info; inactive; preserveAspect; endGroup]
CurrentThirdMoment[option, q, sclist, initstate,
   height, duration, n, u, {t, tmax, tstep}] gives
   the third central moment function (pA^3) of n
   independent single channel current functions of
   t. Division by n is used. The option
   EnsembleSize -> m causes m-membered channel
   ensembles to be simulated instead of single
   channels. Since the current is negative by
   convention, the third moment undergoes the same
   sign change. See ?SingleTrace for information on
   the other arguments.
:[font = text; inactive; preserveAspect]
FilterTest[] is useful for determinimg how the chosen filter acts on a simulated EPSC. You can visually check the effects of different cutoff and sampling frequencies.
;[s]
2:0,0;12,1;167,-1;
2:1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
?FilterTest
:[font = info; inactive; preserveAspect; endGroup]
FilterTest[EnsembleSize -> m, q, sclist, initstate,
   height, duration, u, {t, tmax, samplingfreq,
   fc}] plots the input and output function of a
   gaussian filter whose cutoff frequency is fc
   kilohertz. The input function is prepared by
   simulating a m-membered channel ensemble from 0
   to tmax milliseconds, sampling the current at
   samplingfreq kilohertz. See ?SingleTrace for
   information on the other arguments.
:[font = text; inactive; preserveAspect]
A good choice for samplingfreq and for the cutoff frequency fc is 40 kHz and 3 kHz, respectively.
;[s]
5:0,0;18,1;30,2;60,3;62,4;97,-1;
5:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
height = 0.001;    (* M *)
duration = 1;      (* ms *)
u = 0.07;          (* V *)
tmax = 10;         (* ms *)
samplingfreq = 40; (* kHz *)
fc = 3;            (* kHz *)

FilterTest[EnsembleSize -> 20,
           q, stateConductivityList, initialState,
           height, duration, u,
           {t, tmax, samplingfreq, fc}]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; startGroup]
%!
%%Creator: Mathematica
%%AspectRatio: .61803 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.00237501 0.618034 0.0551816 [
[(100)] .26131 .61803 0 2 Msboxa
[(200)] .49881 .61803 0 2 Msboxa
[(300)] .73631 .61803 0 2 Msboxa
[(400)] .97382 .61803 0 2 Msboxa
[(t/samples)] 1.025 .61803 -1 0 Msboxa
[(Ensemble Current Before Filtering)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(-10)] .01131 .06622 1 0 Msboxa
[(-8)] .01131 .17658 1 0 Msboxa
[(-6)] .01131 .28694 1 0 Msboxa
[(-4)] .01131 .39731 1 0 Msboxa
[(-2)] .01131 .50767 1 0 Msboxa
[(I/pA)] .02381 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .62528 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.26131 .61803 m
.26131 .62428 L
s
P
[(100)] .26131 .61803 0 2 Mshowa
p
.002 w
.49881 .61803 m
.49881 .62428 L
s
P
[(200)] .49881 .61803 0 2 Mshowa
p
.002 w
.73631 .61803 m
.73631 .62428 L
s
P
[(300)] .73631 .61803 0 2 Mshowa
p
.002 w
.97382 .61803 m
.97382 .62428 L
s
P
[(400)] .97382 .61803 0 2 Mshowa
p
.001 w
.07131 .61803 m
.07131 .62178 L
s
P
p
.001 w
.11881 .61803 m
.11881 .62178 L
s
P
p
.001 w
.16631 .61803 m
.16631 .62178 L
s
P
p
.001 w
.21381 .61803 m
.21381 .62178 L
s
P
p
.001 w
.30881 .61803 m
.30881 .62178 L
s
P
p
.001 w
.35631 .61803 m
.35631 .62178 L
s
P
p
.001 w
.40381 .61803 m
.40381 .62178 L
s
P
p
.001 w
.45131 .61803 m
.45131 .62178 L
s
P
p
.001 w
.54631 .61803 m
.54631 .62178 L
s
P
p
.001 w
.59381 .61803 m
.59381 .62178 L
s
P
p
.001 w
.64131 .61803 m
.64131 .62178 L
s
P
p
.001 w
.68881 .61803 m
.68881 .62178 L
s
P
p
.001 w
.78381 .61803 m
.78381 .62178 L
s
P
p
.001 w
.83131 .61803 m
.83131 .62178 L
s
P
p
.001 w
.87881 .61803 m
.87881 .62178 L
s
P
p
.001 w
.92632 .61803 m
.92632 .62178 L
s
P
[(t/samples)] 1.025 .61803 -1 0 Mshowa
p
.002 w
0 .61803 m
1 .61803 L
s
P
[(Ensemble Current Before Filtering)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .06622 m
.03006 .06622 L
s
P
[(-10)] .01131 .06622 1 0 Mshowa
p
.002 w
.02381 .17658 m
.03006 .17658 L
s
P
[(-8)] .01131 .17658 1 0 Mshowa
p
.002 w
.02381 .28694 m
.03006 .28694 L
s
P
[(-6)] .01131 .28694 1 0 Mshowa
p
.002 w
.02381 .39731 m
.03006 .39731 L
s
P
[(-4)] .01131 .39731 1 0 Mshowa
p
.002 w
.02381 .50767 m
.03006 .50767 L
s
P
[(-2)] .01131 .50767 1 0 Mshowa
p
.001 w
.02381 .08829 m
.02756 .08829 L
s
P
p
.001 w
.02381 .11036 m
.02756 .11036 L
s
P
p
.001 w
.02381 .13244 m
.02756 .13244 L
s
P
p
.001 w
.02381 .15451 m
.02756 .15451 L
s
P
p
.001 w
.02381 .19865 m
.02756 .19865 L
s
P
p
.001 w
.02381 .22073 m
.02756 .22073 L
s
P
p
.001 w
.02381 .2428 m
.02756 .2428 L
s
P
p
.001 w
.02381 .26487 m
.02756 .26487 L
s
P
p
.001 w
.02381 .30902 m
.02756 .30902 L
s
P
p
.001 w
.02381 .33109 m
.02756 .33109 L
s
P
p
.001 w
.02381 .35316 m
.02756 .35316 L
s
P
p
.001 w
.02381 .37523 m
.02756 .37523 L
s
P
p
.001 w
.02381 .41938 m
.02756 .41938 L
s
P
p
.001 w
.02381 .44145 m
.02756 .44145 L
s
P
p
.001 w
.02381 .46353 m
.02756 .46353 L
s
P
p
.001 w
.02381 .4856 m
.02756 .4856 L
s
P
p
.001 w
.02381 .52974 m
.02756 .52974 L
s
P
p
.001 w
.02381 .55182 m
.02756 .55182 L
s
P
p
.001 w
.02381 .57389 m
.02756 .57389 L
s
P
p
.001 w
.02381 .59596 m
.02756 .59596 L
s
P
p
.001 w
.02381 .04415 m
.02756 .04415 L
s
P
p
.001 w
.02381 .02207 m
.02756 .02207 L
s
P
p
.001 w
.02381 0 m
.02756 0 L
s
P
[(I/pA)] .02381 .61803 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
.004 w
.02618 .61803 m
.02856 .58713 L
.03093 .55623 L
.03331 .43262 L
.03568 .40172 L
.03806 .37082 L
.04043 .27812 L
.04281 .21631 L
.04518 .21631 L
.04756 .18541 L
.04993 .18541 L
.05231 .18541 L
.05468 .18541 L
.05706 .18541 L
.05943 .18541 L
.06181 .18541 L
.06418 .18541 L
.06656 .15451 L
.06893 .15451 L
.07131 .15451 L
.07368 .15451 L
.07606 .15451 L
.07843 .15451 L
.08081 .15451 L
.08318 .15451 L
.08556 .15451 L
.08793 .15451 L
.09031 .15451 L
.09268 .15451 L
.09506 .15451 L
.09743 .15451 L
.09981 .15451 L
.10219 .15451 L
.10456 .15451 L
.10694 .15451 L
.10931 .15451 L
.11169 .15451 L
.11406 .15451 L
.11644 .15451 L
.11881 .18541 L
.12119 .18541 L
.12356 .21631 L
.12594 .21631 L
.12831 .21631 L
.13069 .21631 L
.13306 .21631 L
.13544 .21631 L
.13781 .24721 L
.14019 .21631 L
.14256 .21631 L
Mistroke
.14494 .21631 L
.14731 .21631 L
.14969 .21631 L
.15206 .21631 L
.15444 .21631 L
.15681 .21631 L
.15919 .21631 L
.16156 .21631 L
.16394 .21631 L
.16631 .21631 L
.16869 .24721 L
.17106 .27812 L
.17344 .24721 L
.17581 .24721 L
.17819 .24721 L
.18056 .24721 L
.18294 .24721 L
.18531 .24721 L
.18769 .24721 L
.19006 .24721 L
.19244 .27812 L
.19481 .27812 L
.19719 .27812 L
.19956 .27812 L
.20194 .27812 L
.20431 .27812 L
.20669 .27812 L
.20906 .27812 L
.21144 .27812 L
.21381 .27812 L
.21619 .27812 L
.21856 .27812 L
.22094 .27812 L
.22331 .30902 L
.22569 .30902 L
.22806 .30902 L
.23044 .30902 L
.23281 .30902 L
.23519 .30902 L
.23756 .30902 L
.23994 .30902 L
.24231 .30902 L
.24469 .30902 L
.24706 .30902 L
.24944 .30902 L
.25181 .30902 L
.25419 .30902 L
.25656 .30902 L
.25894 .33992 L
.26131 .33992 L
Mistroke
.26369 .33992 L
.26606 .33992 L
.26844 .33992 L
.27081 .33992 L
.27319 .33992 L
.27556 .33992 L
.27794 .37082 L
.28031 .40172 L
.28269 .40172 L
.28506 .40172 L
.28744 .40172 L
.28981 .40172 L
.29219 .40172 L
.29456 .40172 L
.29694 .40172 L
.29931 .43262 L
.30169 .43262 L
.30406 .43262 L
.30644 .43262 L
.30881 .43262 L
.31119 .43262 L
.31356 .43262 L
.31594 .46353 L
.31831 .46353 L
.32069 .46353 L
.32306 .46353 L
.32544 .46353 L
.32781 .46353 L
.33019 .46353 L
.33256 .46353 L
.33494 .49443 L
.33731 .49443 L
.33969 .49443 L
.34206 .49443 L
.34444 .49443 L
.34681 .49443 L
.34919 .49443 L
.35156 .49443 L
.35394 .49443 L
.35631 .49443 L
.35869 .49443 L
.36106 .49443 L
.36344 .49443 L
.36581 .49443 L
.36819 .49443 L
.37056 .49443 L
.37294 .49443 L
.37531 .49443 L
.37769 .49443 L
.38006 .49443 L
Mistroke
.38244 .49443 L
.38481 .49443 L
.38719 .49443 L
.38956 .49443 L
.39194 .49443 L
.39431 .49443 L
.39669 .49443 L
.39906 .49443 L
.40144 .49443 L
.40381 .49443 L
.40619 .49443 L
.40856 .49443 L
.41094 .49443 L
.41331 .49443 L
.41569 .49443 L
.41806 .49443 L
.42044 .49443 L
.42281 .49443 L
.42519 .49443 L
.42756 .49443 L
.42994 .49443 L
.43231 .49443 L
.43469 .49443 L
.43706 .49443 L
.43944 .49443 L
.44181 .49443 L
.44419 .49443 L
.44656 .49443 L
.44894 .49443 L
.45131 .49443 L
.45369 .49443 L
.45606 .49443 L
.45844 .49443 L
.46081 .49443 L
.46319 .49443 L
.46556 .52533 L
.46794 .52533 L
.47031 .52533 L
.47269 .52533 L
.47506 .52533 L
.47744 .52533 L
.47981 .52533 L
.48219 .52533 L
.48456 .52533 L
.48694 .52533 L
.48931 .52533 L
.49169 .52533 L
.49406 .52533 L
.49644 .52533 L
.49881 .52533 L
Mistroke
.50119 .52533 L
.50356 .52533 L
.50594 .52533 L
.50831 .52533 L
.51069 .52533 L
.51306 .52533 L
.51544 .52533 L
.51781 .52533 L
.52019 .52533 L
.52256 .52533 L
.52494 .52533 L
.52731 .55623 L
.52969 .55623 L
.53206 .55623 L
.53444 .55623 L
.53681 .55623 L
.53919 .55623 L
.54156 .55623 L
.54394 .55623 L
.54631 .55623 L
.54869 .55623 L
.55106 .55623 L
.55344 .55623 L
.55581 .55623 L
.55819 .55623 L
.56056 .55623 L
.56294 .55623 L
.56531 .55623 L
.56769 .55623 L
.57006 .55623 L
.57244 .55623 L
.57481 .55623 L
.57719 .55623 L
.57956 .55623 L
.58194 .55623 L
.58431 .55623 L
.58669 .55623 L
.58906 .55623 L
.59144 .55623 L
.59381 .55623 L
.59619 .55623 L
.59856 .55623 L
.60094 .55623 L
.60331 .55623 L
.60569 .55623 L
.60806 .55623 L
.61044 .55623 L
.61281 .55623 L
.61519 .55623 L
.61756 .55623 L
Mistroke
.61994 .55623 L
.62231 .55623 L
.62469 .55623 L
.62706 .55623 L
.62944 .55623 L
.63181 .55623 L
.63419 .55623 L
.63656 .55623 L
.63894 .55623 L
.64131 .55623 L
.64369 .55623 L
.64606 .58713 L
.64844 .58713 L
.65081 .58713 L
.65319 .58713 L
.65556 .58713 L
.65794 .58713 L
.66031 .58713 L
.66269 .58713 L
.66506 .58713 L
.66744 .58713 L
.66981 .58713 L
.67219 .58713 L
.67456 .58713 L
.67694 .58713 L
.67931 .58713 L
.68169 .58713 L
.68406 .58713 L
.68644 .58713 L
.68881 .58713 L
.69119 .58713 L
.69356 .58713 L
.69594 .58713 L
.69831 .58713 L
.70069 .58713 L
.70306 .58713 L
.70544 .58713 L
.70781 .58713 L
.71019 .58713 L
.71256 .58713 L
.71494 .58713 L
.71731 .58713 L
.71969 .58713 L
.72206 .58713 L
.72444 .58713 L
.72681 .58713 L
.72919 .58713 L
.73156 .58713 L
.73394 .58713 L
.73631 .58713 L
Mistroke
.73869 .58713 L
.74106 .58713 L
.74344 .58713 L
.74581 .61803 L
.74819 .58713 L
.75056 .58713 L
.75294 .58713 L
.75531 .58713 L
.75769 .58713 L
.76006 .58713 L
.76244 .58713 L
.76481 .58713 L
.76719 .58713 L
.76956 .58713 L
.77194 .58713 L
.77431 .58713 L
.77669 .58713 L
.77906 .58713 L
.78144 .58713 L
.78381 .58713 L
.78619 .58713 L
.78856 .58713 L
.79094 .58713 L
.79331 .58713 L
.79569 .58713 L
.79806 .58713 L
.80044 .58713 L
.80281 .58713 L
.80519 .58713 L
.80756 .58713 L
.80994 .58713 L
.81231 .58713 L
.81469 .58713 L
.81706 .58713 L
.81944 .58713 L
.82181 .58713 L
.82419 .58713 L
.82656 .58713 L
.82894 .58713 L
.83131 .58713 L
.83369 .58713 L
.83606 .58713 L
.83844 .58713 L
.84081 .58713 L
.84319 .58713 L
.84556 .58713 L
.84794 .58713 L
.85031 .58713 L
.85269 .58713 L
.85506 .58713 L
Mistroke
.85744 .58713 L
.85981 .58713 L
.86219 .58713 L
.86456 .58713 L
.86694 .58713 L
.86931 .58713 L
.87169 .58713 L
.87406 .58713 L
.87644 .58713 L
.87881 .58713 L
.88119 .58713 L
.88356 .58713 L
.88594 .58713 L
.88831 .58713 L
.89069 .58713 L
.89306 .58713 L
.89544 .58713 L
.89781 .58713 L
.90019 .58713 L
.90257 .58713 L
.90494 .58713 L
.90732 .58713 L
.90969 .58713 L
.91207 .58713 L
.91444 .58713 L
.91682 .58713 L
.91919 .58713 L
.92157 .58713 L
.92394 .58713 L
.92632 .58713 L
.92869 .58713 L
.93107 .58713 L
.93344 .58713 L
.93582 .58713 L
.93819 .58713 L
.94057 .58713 L
.94294 .58713 L
.94532 .58713 L
.94769 .58713 L
.95007 .58713 L
.95244 .58713 L
.95482 .58713 L
.95719 .58713 L
.95957 .58713 L
.96194 .58713 L
.96432 .58713 L
.96669 .58713 L
.96907 .58713 L
.97144 .58713 L
.97382 .58713 L
Mistroke
.97619 .58713 L
Mfstroke
% End of Graphics
MathPictureEnd

:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 34; pictureWidth = 282; pictureHeight = 174; endGroup]
%!
%%Creator: Mathematica
%%AspectRatio: .61803 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0238095 0.00237501 0.618034 0.0551816 [
[(100)] .26131 .61803 0 2 Msboxa
[(200)] .49881 .61803 0 2 Msboxa
[(300)] .73631 .61803 0 2 Msboxa
[(400)] .97382 .61803 0 2 Msboxa
[(t/samples)] 1.025 .61803 -1 0 Msboxa
[(Ensemble Current After Filtering)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(-10)] .01131 .06622 1 0 Msboxa
[(-8)] .01131 .17658 1 0 Msboxa
[(-6)] .01131 .28694 1 0 Msboxa
[(-4)] .01131 .39731 1 0 Msboxa
[(-2)] .01131 .50767 1 0 Msboxa
[(I/pA)] .02381 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .62528 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.26131 .61803 m
.26131 .62428 L
s
P
[(100)] .26131 .61803 0 2 Mshowa
p
.002 w
.49881 .61803 m
.49881 .62428 L
s
P
[(200)] .49881 .61803 0 2 Mshowa
p
.002 w
.73631 .61803 m
.73631 .62428 L
s
P
[(300)] .73631 .61803 0 2 Mshowa
p
.002 w
.97382 .61803 m
.97382 .62428 L
s
P
[(400)] .97382 .61803 0 2 Mshowa
p
.001 w
.07131 .61803 m
.07131 .62178 L
s
P
p
.001 w
.11881 .61803 m
.11881 .62178 L
s
P
p
.001 w
.16631 .61803 m
.16631 .62178 L
s
P
p
.001 w
.21381 .61803 m
.21381 .62178 L
s
P
p
.001 w
.30881 .61803 m
.30881 .62178 L
s
P
p
.001 w
.35631 .61803 m
.35631 .62178 L
s
P
p
.001 w
.40381 .61803 m
.40381 .62178 L
s
P
p
.001 w
.45131 .61803 m
.45131 .62178 L
s
P
p
.001 w
.54631 .61803 m
.54631 .62178 L
s
P
p
.001 w
.59381 .61803 m
.59381 .62178 L
s
P
p
.001 w
.64131 .61803 m
.64131 .62178 L
s
P
p
.001 w
.68881 .61803 m
.68881 .62178 L
s
P
p
.001 w
.78381 .61803 m
.78381 .62178 L
s
P
p
.001 w
.83131 .61803 m
.83131 .62178 L
s
P
p
.001 w
.87881 .61803 m
.87881 .62178 L
s
P
p
.001 w
.92632 .61803 m
.92632 .62178 L
s
P
[(t/samples)] 1.025 .61803 -1 0 Mshowa
p
.002 w
0 .61803 m
1 .61803 L
s
P
[(Ensemble Current After Filtering)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.02381 .06622 m
.03006 .06622 L
s
P
[(-10)] .01131 .06622 1 0 Mshowa
p
.002 w
.02381 .17658 m
.03006 .17658 L
s
P
[(-8)] .01131 .17658 1 0 Mshowa
p
.002 w
.02381 .28694 m
.03006 .28694 L
s
P
[(-6)] .01131 .28694 1 0 Mshowa
p
.002 w
.02381 .39731 m
.03006 .39731 L
s
P
[(-4)] .01131 .39731 1 0 Mshowa
p
.002 w
.02381 .50767 m
.03006 .50767 L
s
P
[(-2)] .01131 .50767 1 0 Mshowa
p
.001 w
.02381 .08829 m
.02756 .08829 L
s
P
p
.001 w
.02381 .11036 m
.02756 .11036 L
s
P
p
.001 w
.02381 .13244 m
.02756 .13244 L
s
P
p
.001 w
.02381 .15451 m
.02756 .15451 L
s
P
p
.001 w
.02381 .19865 m
.02756 .19865 L
s
P
p
.001 w
.02381 .22073 m
.02756 .22073 L
s
P
p
.001 w
.02381 .2428 m
.02756 .2428 L
s
P
p
.001 w
.02381 .26487 m
.02756 .26487 L
s
P
p
.001 w
.02381 .30902 m
.02756 .30902 L
s
P
p
.001 w
.02381 .33109 m
.02756 .33109 L
s
P
p
.001 w
.02381 .35316 m
.02756 .35316 L
s
P
p
.001 w
.02381 .37523 m
.02756 .37523 L
s
P
p
.001 w
.02381 .41938 m
.02756 .41938 L
s
P
p
.001 w
.02381 .44145 m
.02756 .44145 L
s
P
p
.001 w
.02381 .46353 m
.02756 .46353 L
s
P
p
.001 w
.02381 .4856 m
.02756 .4856 L
s
P
p
.001 w
.02381 .52974 m
.02756 .52974 L
s
P
p
.001 w
.02381 .55182 m
.02756 .55182 L
s
P
p
.001 w
.02381 .57389 m
.02756 .57389 L
s
P
p
.001 w
.02381 .59596 m
.02756 .59596 L
s
P
p
.001 w
.02381 .04415 m
.02756 .04415 L
s
P
p
.001 w
.02381 .02207 m
.02756 .02207 L
s
P
p
.001 w
.02381 0 m
.02756 0 L
s
P
[(I/pA)] .02381 .61803 0 -4 Mshowa
p
.002 w
.02381 0 m
.02381 .61803 L
s
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
.004 w
.02618 .58978 m
.02856 .55953 L
.03093 .51563 L
.03331 .46243 L
.03568 .40594 L
.03806 .35039 L
.04043 .29903 L
.04281 .25593 L
.04518 .22434 L
.04756 .20431 L
.04993 .19329 L
.05231 .18811 L
.05468 .18601 L
.05706 .18488 L
.05943 .18309 L
.06181 .1794 L
.06418 .17345 L
.06656 .16647 L
.06893 .16052 L
.07131 .15685 L
.07368 .1552 L
.07606 .15466 L
.07843 .15453 L
.08081 .15451 L
.08318 .15451 L
.08556 .15451 L
.08793 .15451 L
.09031 .15451 L
.09268 .15451 L
.09506 .15451 L
.09743 .15451 L
.09981 .15451 L
.10219 .15451 L
.10456 .15453 L
.10694 .15466 L
.10931 .15522 L
.11169 .157 L
.11406 .16121 L
.11644 .16881 L
.11881 .17946 L
.12119 .19136 L
.12356 .20203 L
.12594 .20973 L
.12831 .21436 L
.13069 .21725 L
.13306 .21983 L
.13544 .22223 L
.13781 .22329 L
.14019 .22226 L
.14256 .21999 L
Mistroke
.14494 .21796 L
.14731 .21685 L
.14969 .21644 L
.15206 .21634 L
.15444 .21634 L
.15681 .21649 L
.15919 .21713 L
.16156 .21919 L
.16394 .22398 L
.16631 .23195 L
.16869 .2412 L
.17106 .24818 L
.17344 .25082 L
.17581 .2502 L
.17819 .24874 L
.18056 .24788 L
.18294 .24803 L
.18531 .24958 L
.18769 .25323 L
.19006 .25918 L
.19244 .26615 L
.19481 .2721 L
.19719 .27578 L
.19956 .27743 L
.20194 .27796 L
.20431 .27809 L
.20669 .27812 L
.20906 .27814 L
.21144 .27827 L
.21381 .2788 L
.21619 .28046 L
.21856 .28413 L
.22094 .29008 L
.22331 .29706 L
.22569 .303 L
.22806 .30668 L
.23044 .30833 L
.23281 .30887 L
.23519 .30899 L
.23756 .30901 L
.23994 .30902 L
.24231 .30902 L
.24469 .30904 L
.24706 .30917 L
.24944 .30971 L
.25181 .31136 L
.25419 .31503 L
.25656 .32098 L
.25894 .32796 L
.26131 .3339 L
Mistroke
.26369 .33761 L
.26606 .33941 L
.26844 .34061 L
.27081 .34292 L
.27319 .34827 L
.27556 .3579 L
.27794 .37082 L
.28031 .38374 L
.28269 .39337 L
.28506 .39872 L
.28744 .40103 L
.28981 .40224 L
.29219 .40403 L
.29456 .40774 L
.29694 .41368 L
.29931 .42066 L
.30169 .42663 L
.30406 .43044 L
.30644 .43262 L
.30881 .43481 L
.31119 .43862 L
.31356 .44458 L
.31594 .45156 L
.31831 .45751 L
.32069 .46121 L
.32306 .46299 L
.32544 .46406 L
.32781 .46584 L
.33019 .46954 L
.33256 .47549 L
.33494 .48247 L
.33731 .48841 L
.33969 .49209 L
.34206 .49374 L
.34444 .49428 L
.34681 .4944 L
.34919 .49442 L
.35156 .49443 L
.35394 .49443 L
.35631 .49443 L
.35869 .49443 L
.36106 .49443 L
.36344 .49443 L
.36581 .49443 L
.36819 .49443 L
.37056 .49443 L
.37294 .49443 L
.37531 .49443 L
.37769 .49443 L
.38006 .49443 L
Mistroke
.38244 .49443 L
.38481 .49443 L
.38719 .49443 L
.38956 .49443 L
.39194 .49443 L
.39431 .49443 L
.39669 .49443 L
.39906 .49443 L
.40144 .49443 L
.40381 .49443 L
.40619 .49443 L
.40856 .49443 L
.41094 .49443 L
.41331 .49443 L
.41569 .49443 L
.41806 .49443 L
.42044 .49443 L
.42281 .49443 L
.42519 .49443 L
.42756 .49443 L
.42994 .49443 L
.43231 .49443 L
.43469 .49443 L
.43706 .49443 L
.43944 .49443 L
.44181 .49443 L
.44419 .49443 L
.44656 .49443 L
.44894 .49443 L
.45131 .49445 L
.45369 .49458 L
.45606 .49512 L
.45844 .49677 L
.46081 .50044 L
.46319 .50639 L
.46556 .51337 L
.46794 .51931 L
.47031 .52299 L
.47269 .52464 L
.47506 .52518 L
.47744 .5253 L
.47981 .52533 L
.48219 .52533 L
.48456 .52533 L
.48694 .52533 L
.48931 .52533 L
.49169 .52533 L
.49406 .52533 L
.49644 .52533 L
.49881 .52533 L
Mistroke
.50119 .52533 L
.50356 .52533 L
.50594 .52533 L
.50831 .52533 L
.51069 .52533 L
.51306 .52535 L
.51544 .52548 L
.51781 .52602 L
.52019 .52767 L
.52256 .53135 L
.52494 .53729 L
.52731 .54427 L
.52969 .55021 L
.53206 .55389 L
.53444 .55554 L
.53681 .55608 L
.53919 .55621 L
.54156 .55623 L
.54394 .55623 L
.54631 .55623 L
.54869 .55623 L
.55106 .55623 L
.55344 .55623 L
.55581 .55623 L
.55819 .55623 L
.56056 .55623 L
.56294 .55623 L
.56531 .55623 L
.56769 .55623 L
.57006 .55623 L
.57244 .55623 L
.57481 .55623 L
.57719 .55623 L
.57956 .55623 L
.58194 .55623 L
.58431 .55623 L
.58669 .55623 L
.58906 .55623 L
.59144 .55623 L
.59381 .55623 L
.59619 .55623 L
.59856 .55623 L
.60094 .55623 L
.60331 .55623 L
.60569 .55623 L
.60806 .55623 L
.61044 .55623 L
.61281 .55623 L
.61519 .55623 L
.61756 .55623 L
Mistroke
.61994 .55623 L
.62231 .55623 L
.62469 .55623 L
.62706 .55623 L
.62944 .55623 L
.63181 .55626 L
.63419 .55638 L
.63656 .55692 L
.63894 .55857 L
.64131 .56225 L
.64369 .56819 L
.64606 .57517 L
.64844 .58112 L
.65081 .58479 L
.65319 .58644 L
.65556 .58698 L
.65794 .58711 L
.66031 .58713 L
.66269 .58713 L
.66506 .58713 L
.66744 .58713 L
.66981 .58713 L
.67219 .58713 L
.67456 .58713 L
.67694 .58713 L
.67931 .58713 L
.68169 .58713 L
.68406 .58713 L
.68644 .58713 L
.68881 .58713 L
.69119 .58713 L
.69356 .58713 L
.69594 .58713 L
.69831 .58713 L
.70069 .58713 L
.70306 .58713 L
.70544 .58713 L
.70781 .58713 L
.71019 .58713 L
.71256 .58713 L
.71494 .58713 L
.71731 .58713 L
.71969 .58713 L
.72206 .58713 L
.72444 .58713 L
.72681 .58713 L
.72919 .58714 L
.73156 .58715 L
.73394 .58726 L
.73631 .58767 L
Mistroke
.73869 .58878 L
.74106 .59081 L
.74344 .59308 L
.74581 .59411 L
.74819 .59308 L
.75056 .59081 L
.75294 .58878 L
.75531 .58767 L
.75769 .58726 L
.76006 .58715 L
.76244 .58714 L
.76481 .58713 L
.76719 .58713 L
.76956 .58713 L
.77194 .58713 L
.77431 .58713 L
.77669 .58713 L
.77906 .58713 L
.78144 .58713 L
.78381 .58713 L
.78619 .58713 L
.78856 .58713 L
.79094 .58713 L
.79331 .58713 L
.79569 .58713 L
.79806 .58713 L
.80044 .58713 L
.80281 .58713 L
.80519 .58713 L
.80756 .58713 L
.80994 .58713 L
.81231 .58713 L
.81469 .58713 L
.81706 .58713 L
.81944 .58713 L
.82181 .58713 L
.82419 .58713 L
.82656 .58713 L
.82894 .58713 L
.83131 .58713 L
.83369 .58713 L
.83606 .58713 L
.83844 .58713 L
.84081 .58713 L
.84319 .58713 L
.84556 .58713 L
.84794 .58713 L
.85031 .58713 L
.85269 .58713 L
.85506 .58713 L
Mistroke
.85744 .58713 L
.85981 .58713 L
.86219 .58713 L
.86456 .58713 L
.86694 .58713 L
.86931 .58713 L
.87169 .58713 L
.87406 .58713 L
.87644 .58713 L
.87881 .58713 L
.88119 .58713 L
.88356 .58713 L
.88594 .58713 L
.88831 .58713 L
.89069 .58713 L
.89306 .58713 L
.89544 .58713 L
.89781 .58713 L
.90019 .58713 L
.90257 .58713 L
.90494 .58713 L
.90732 .58713 L
.90969 .58713 L
.91207 .58713 L
.91444 .58713 L
.91682 .58713 L
.91919 .58713 L
.92157 .58713 L
.92394 .58713 L
.92632 .58713 L
.92869 .58713 L
.93107 .58713 L
.93344 .58713 L
.93582 .58713 L
.93819 .58713 L
.94057 .58713 L
.94294 .58713 L
.94532 .58713 L
.94769 .58713 L
.95007 .58713 L
.95244 .58713 L
.95482 .58713 L
.95719 .58713 L
.95957 .58713 L
.96194 .58713 L
.96432 .58713 L
.96669 .58713 L
.96907 .58713 L
.97144 .58713 L
.97382 .58713 L
Mistroke
.97619 .58713 L
Mfstroke
% End of Graphics
MathPictureEnd

:[font = output; output; inactive; preserveAspect; endGroup]
{Graphics["<<>>"], Graphics["<<>>"]}
;[o]
{-Graphics-, -Graphics-}
:[font = text; inactive; preserveAspect]
The construction of a histogram for the distribution of the peak EPSC amplitudes is done by
:[font = input; preserveAspect; startGroup]
?PeakEPSCAmplitudeDistribution
:[font = info; inactive; preserveAspect; endGroup]
 PeakEPSCAmplitudeDistribution[EnsembleSize -> m,
   q, sclist, initstate, height, duration, n, u,
   {t, tmax, samplingfreq, fc, tint}] gives the
   unnormalized distribution of the peak currents
   of n independently simulated m-membered channel
   ensembles. Each simulation extends from 0 to
   tmax milliseconds. The simulation results are
   sampled at samplingfreq kilohertz, filtered
   using a gaussian filter with cutoff frequency fc
   kilohertz, and integrated in an interval of tint
   milliseconds around the peak. The bin width is u
   times the maximum single channel conductivity.
   The distribution is returned in a form suitable
   for DistributionPlot[]. See ?SingleTrace for
   information on the other arguments.
:[font = text; inactive; preserveAspect]
EnsembleSize -> m defines the number of available channels, while n is the number of trials. In the following two simulations we use an integration interval of length 0.5 ms around the peak, that is, from (time_of_the_peak) - 0.25 ms to (time_of_the_peak) + 0.25 ms.
;[s]
5:0,0;17,1;66,2;67,3;92,4;266,-1;
5:1,0,0 ,Courier,5,12,0,0,0;1,0,0 ,times,4,12,0,0,0;1,0,0 ,Courier,5,12,0,0,0;1,0,0 ,times,4,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = input; preserveAspect; startGroup]
tint = 0.5;  (* ms *)

m100n200 = (* 100 available channels, 200 trials *)
PeakEPSCAmplitudeDistribution[EnsembleSize -> 100,
q, stateConductivityList, initialState,
height, duration, 200, u,
{t, tmax, samplingfreq, fc, tint}]

m200n121 = (* 200 available channels, 121 trials *)
PeakEPSCAmplitudeDistribution[EnsembleSize -> 200,
q, stateConductivityList, initialState,
height, duration, 121, u,
{t, tmax, samplingfreq, fc, tint}]

:[font = output; output; inactive; preserveAspect]
{0.56, 35.43157507254325069, 6.988099991066570415, 
 
  -8.871534657675448514, 
 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 2, 0, 3, 
 
   4, 2, 4, 12, 6, 8, 9, 11, 16, 16, 18, 20, 15, 15, 16, 
 
   7, 6, 4, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}}
;[o]
{0.56, 35.4316, 6.9881, -8.87153, 
 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 2, 0, 3, 
 
   4, 2, 4, 12, 6, 8, 9, 11, 16, 16, 18, 20, 15, 15, 16, 
 
   7, 6, 4, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0}}
:[font = output; output; inactive; preserveAspect; endGroup]
{0.56, 70.44501293745898757, 15.46011496637536604, 
 
  4.414871291470500074, 
 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   1, 0, 1, 0, 2, 2, 0, 1, 0, 6, 7, 5, 2, 6, 4, 8, 11, 7, 
 
   4, 8, 5, 4, 7, 2, 6, 3, 6, 1, 5, 1, 1, 1, 0, 3, 0, 0, 
 
   1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0}}
;[o]
{0.56, 70.445, 15.4601, 4.41487, 
 
  {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   1, 0, 1, 0, 2, 2, 0, 1, 0, 6, 7, 5, 2, 6, 4, 8, 11, 7, 
 
   4, 8, 5, 4, 7, 2, 6, 3, 6, 1, 5, 1, 1, 1, 0, 3, 0, 0, 
 
   1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 
 
   0, 0, 0}}
:[font = text; inactive; preserveAspect]
Once the distributions have been computed, you can plot them in various ways.
:[font = input; preserveAspect; startGroup]
?DistributionPlot
:[font = info; inactive; preserveAspect; endGroup]
DistributionPlot[distr] normalizes the distribution
   distr and plots it, giving the mean, variance
   etc. at the right side of the plot.
   DistributionPlot[distr1, distr2, ...] does the
   same for a superposition of the distri.
:[font = input; preserveAspect; startGroup]
DistributionPlot[m100n200]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 0; pictureWidth = 450; pictureHeight = 277]
%!
%%Creator: Mathematica
%%AspectRatio: .61803 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0376791 0.0165115 0.0147151 5.88604 [
[(10)] .20279 .01472 0 2 Msboxa
[(20)] .36791 .01472 0 2 Msboxa
[(30)] .53302 .01472 0 2 Msboxa
[(40)] .69814 .01472 0 2 Msboxa
[(50)] .86325 .01472 0 2 Msboxa
[(I/pA)] 1.025 .01472 -1 0 Msboxa
[(Peak EPSC Amplitude Distribution)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(0.02)] .02518 .13244 1 0 Msboxa
[(0.04)] .02518 .25016 1 0 Msboxa
[(0.06)] .02518 .36788 1 0 Msboxa
[(0.08)] .02518 .4856 1 0 Msboxa
[(0.1)] .02518 .60332 1 0 Msboxa
[(p)] .03768 .61803 0 -4 Msboxa
p
/Helvetica findfont 15 scalefont setfont
[(mean: 35.43 pA)] .97619 .50326 -1 0 Msboxa
P
p
/Helvetica findfont 15 scalefont setfont
[(s.d.: 2.644 pA)] .97619 .40319 -1 0 Msboxa
P
p
/Helvetica findfont 15 scalefont setfont
[(var: 6.99 pA^2)] .97619 .30902 -1 0 Msboxa
P
p
/Helvetica findfont 15 scalefont setfont
[(c.v.: 7.461 %)] .97619 .20895 -1 0 Msboxa
P
p
/Helvetica findfont 15 scalefont setfont
[(m3: -8.87 pA^3)] .97619 .10889 -1 0 Msboxa
P
[ -0.001 -0.001 0 0 ]
[ 1.001 .61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.20279 .01472 m
.20279 .02097 L
s
P
[(10)] .20279 .01472 0 2 Mshowa
p
.002 w
.36791 .01472 m
.36791 .02097 L
s
P
[(20)] .36791 .01472 0 2 Mshowa
p
.002 w
.53302 .01472 m
.53302 .02097 L
s
P
[(30)] .53302 .01472 0 2 Mshowa
p
.002 w
.69814 .01472 m
.69814 .02097 L
s
P
[(40)] .69814 .01472 0 2 Mshowa
p
.002 w
.86325 .01472 m
.86325 .02097 L
s
P
[(50)] .86325 .01472 0 2 Mshowa
p
.001 w
.0707 .01472 m
.0707 .01847 L
s
P
p
.001 w
.10372 .01472 m
.10372 .01847 L
s
P
p
.001 w
.13675 .01472 m
.13675 .01847 L
s
P
p
.001 w
.16977 .01472 m
.16977 .01847 L
s
P
p
.001 w
.23582 .01472 m
.23582 .01847 L
s
P
p
.001 w
.26884 .01472 m
.26884 .01847 L
s
P
p
.001 w
.30186 .01472 m
.30186 .01847 L
s
P
p
.001 w
.33489 .01472 m
.33489 .01847 L
s
P
p
.001 w
.40093 .01472 m
.40093 .01847 L
s
P
p
.001 w
.43395 .01472 m
.43395 .01847 L
s
P
p
.001 w
.46698 .01472 m
.46698 .01847 L
s
P
p
.001 w
.5 .01472 m
.5 .01847 L
s
P
p
.001 w
.56605 .01472 m
.56605 .01847 L
s
P
p
.001 w
.59907 .01472 m
.59907 .01847 L
s
P
p
.001 w
.63209 .01472 m
.63209 .01847 L
s
P
p
.001 w
.66511 .01472 m
.66511 .01847 L
s
P
p
.001 w
.73116 .01472 m
.73116 .01847 L
s
P
p
.001 w
.76418 .01472 m
.76418 .01847 L
s
P
p
.001 w
.79721 .01472 m
.79721 .01847 L
s
P
p
.001 w
.83023 .01472 m
.83023 .01847 L
s
P
p
.001 w
.00466 .01472 m
.00466 .01847 L
s
P
p
.001 w
.89628 .01472 m
.89628 .01847 L
s
P
p
.001 w
.9293 .01472 m
.9293 .01847 L
s
P
p
.001 w
.96232 .01472 m
.96232 .01847 L
s
P
p
.001 w
.99534 .01472 m
.99534 .01847 L
s
P
[(I/pA)] 1.025 .01472 -1 0 Mshowa
p
.002 w
0 .01472 m
1 .01472 L
s
P
[(Peak EPSC Amplitude Distribution)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.03768 .13244 m
.04393 .13244 L
s
P
[(0.02)] .02518 .13244 1 0 Mshowa
p
.002 w
.03768 .25016 m
.04393 .25016 L
s
P
[(0.04)] .02518 .25016 1 0 Mshowa
p
.002 w
.03768 .36788 m
.04393 .36788 L
s
P
[(0.06)] .02518 .36788 1 0 Mshowa
p
.002 w
.03768 .4856 m
.04393 .4856 L
s
P
[(0.08)] .02518 .4856 1 0 Mshowa
p
.002 w
.03768 .60332 m
.04393 .60332 L
s
P
[(0.1)] .02518 .60332 1 0 Mshowa
p
.001 w
.03768 .03826 m
.04143 .03826 L
s
P
p
.001 w
.03768 .0618 m
.04143 .0618 L
s
P
p
.001 w
.03768 .08535 m
.04143 .08535 L
s
P
p
.001 w
.03768 .10889 m
.04143 .10889 L
s
P
p
.001 w
.03768 .15598 m
.04143 .15598 L
s
P
p
.001 w
.03768 .17952 m
.04143 .17952 L
s
P
p
.001 w
.03768 .20307 m
.04143 .20307 L
s
P
p
.001 w
.03768 .22661 m
.04143 .22661 L
s
P
p
.001 w
.03768 .2737 m
.04143 .2737 L
s
P
p
.001 w
.03768 .29724 m
.04143 .29724 L
s
P
p
.001 w
.03768 .32079 m
.04143 .32079 L
s
P
p
.001 w
.03768 .34433 m
.04143 .34433 L
s
P
p
.001 w
.03768 .39142 m
.04143 .39142 L
s
P
p
.001 w
.03768 .41497 m
.04143 .41497 L
s
P
p
.001 w
.03768 .43851 m
.04143 .43851 L
s
P
p
.001 w
.03768 .46205 m
.04143 .46205 L
s
P
p
.001 w
.03768 .50914 m
.04143 .50914 L
s
P
p
.001 w
.03768 .53269 m
.04143 .53269 L
s
P
p
.001 w
.03768 .55623 m
.04143 .55623 L
s
P
p
.001 w
.03768 .57977 m
.04143 .57977 L
s
P
[(p)] .03768 .61803 0 -4 Mshowa
p
.002 w
.03768 0 m
.03768 .61803 L
s
P
P
p
p
p
.004 w
.02381 .01472 m
.0286 .01472 L
.03338 .01472 L
.03817 .01472 L
.04295 .01472 L
.04774 .01472 L
.05252 .01472 L
.05731 .01472 L
.0621 .01472 L
.06688 .01472 L
.07167 .01472 L
.07645 .01472 L
.08124 .01472 L
.08603 .01472 L
.09081 .01472 L
.0956 .01472 L
.10038 .01472 L
.10517 .01472 L
.10995 .01472 L
.11474 .01472 L
.11953 .01472 L
.12431 .01472 L
.1291 .01472 L
.13388 .01472 L
.13867 .01472 L
.14346 .01472 L
.14824 .01472 L
.15303 .01472 L
.15781 .01472 L
.1626 .01472 L
.16738 .01472 L
.17217 .01472 L
.17696 .01472 L
.18174 .01472 L
.18653 .01472 L
.19131 .01472 L
.1961 .01472 L
.20089 .01472 L
.20567 .01472 L
.21046 .01472 L
.21524 .01472 L
.22003 .01472 L
.22481 .01472 L
.2296 .01472 L
.23439 .01472 L
.23917 .01472 L
.24396 .01472 L
.24874 .01472 L
.25353 .01472 L
.25832 .01472 L
Mistroke
.2631 .01472 L
.26789 .01472 L
.27267 .01472 L
.27746 .01472 L
.28224 .01472 L
.28703 .01472 L
.29182 .01472 L
.2966 .01472 L
.30139 .01472 L
.30617 .01472 L
.31096 .01472 L
.31575 .01472 L
.32053 .01472 L
.32532 .01472 L
.3301 .01472 L
.33489 .01472 L
.33967 .01472 L
.34446 .01472 L
.34925 .01472 L
.35403 .01472 L
.35882 .01472 L
.3636 .01472 L
.36839 .01472 L
.37318 .01472 L
.37796 .01472 L
.38275 .01472 L
.38753 .01472 L
.39232 .01472 L
.3971 .01472 L
.40189 .01472 L
.40668 .01472 L
.41146 .01472 L
.41625 .01472 L
.42103 .01472 L
.42582 .01472 L
.43061 .01472 L
.43539 .01472 L
.44018 .01472 L
.44496 .01472 L
.44975 .01472 L
.45453 .01472 L
.45932 .01472 L
.46411 .01472 L
.46889 .01472 L
.47128 .01472 L
.47368 .01472 L
.47487 .01472 L
.47547 .01472 L
.47607 .01472 L
.47637 .01472 L
Mistroke
.47652 .01472 L
.47667 .01472 L
.47682 .01472 L
.47697 .04415 L
.47727 .04415 L
.47846 .04415 L
.48086 .04415 L
.48325 .04415 L
.48445 .04415 L
.48504 .04415 L
.48534 .04415 L
.48564 .04415 L
.48594 .04415 L
.48609 .04415 L
.48624 .01472 L
.48684 .01472 L
.48804 .01472 L
.49282 .01472 L
.49761 .01472 L
.5 .01472 L
.5012 .01472 L
.50239 .01472 L
.50299 .01472 L
.50359 .01472 L
.50389 .01472 L
.50419 .01472 L
.50434 .01472 L
.50449 .01472 L
.50464 .07358 L
.50479 .07358 L
.50508 .07358 L
.50538 .07358 L
.50598 .07358 L
.50718 .07358 L
.50957 .07358 L
.51077 .07358 L
.51196 .07358 L
.51256 .07358 L
.51316 .07358 L
.51346 .07358 L
.51361 .07358 L
.51376 .07358 L
.51391 .01472 L
.51406 .01472 L
.51436 .01472 L
.51675 .01472 L
.51914 .01472 L
.52034 .01472 L
.52154 .01472 L
.52213 .01472 L
Mistroke
.52243 .01472 L
.52273 .01472 L
.52288 .01472 L
.52303 .01472 L
.52318 .10301 L
.52333 .10301 L
.52393 .10301 L
.52632 .10301 L
.52872 .10301 L
.52991 .10301 L
.53111 .10301 L
.53171 .10301 L
.53201 .10301 L
.53215 .10301 L
.5323 .10301 L
.53245 .13244 L
.5326 .13244 L
.53275 .13244 L
.5329 .13244 L
.5335 .13244 L
.53589 .13244 L
.53829 .13244 L
.53948 .13244 L
.54008 .13244 L
.54068 .13244 L
.54098 .13244 L
.54128 .13244 L
.54143 .13244 L
.54158 .13244 L
.54173 .07358 L
.54188 .07358 L
.54218 .07358 L
.54247 .07358 L
.54307 .07358 L
.54547 .07358 L
.54786 .07358 L
.54905 .07358 L
.54965 .07358 L
.55025 .07358 L
.55055 .07358 L
.5507 .07358 L
.55085 .07358 L
.551 .13244 L
.55115 .13244 L
.55145 .13244 L
.55264 .13244 L
.55504 .13244 L
.55743 .13244 L
.55863 .13244 L
.55922 .13244 L
Mistroke
.55952 .13244 L
.55967 .13244 L
.55982 .13244 L
.55997 .13244 L
.56012 .36788 L
.56027 .36788 L
.56042 .36788 L
.56102 .36788 L
.56222 .36788 L
.56461 .36788 L
.567 .36788 L
.5676 .36788 L
.5682 .36788 L
.5685 .36788 L
.5688 .36788 L
.56895 .36788 L
.5691 .36788 L
.56925 .36788 L
.56939 .1913 L
.56969 .1913 L
.56999 .1913 L
.57059 .1913 L
.57179 .1913 L
.57418 .1913 L
.57538 .1913 L
.57657 .1913 L
.57717 .1913 L
.57777 .1913 L
.57807 .1913 L
.57822 .1913 L
.57837 .1913 L
.57852 .1913 L
.57867 .25016 L
.57897 .25016 L
.58136 .25016 L
.58375 .25016 L
.58495 .25016 L
.58615 .25016 L
.58674 .25016 L
.58704 .25016 L
.58734 .25016 L
.58764 .25016 L
.58779 .25016 L
.58794 .27959 L
.58854 .27959 L
.59093 .27959 L
.59332 .27959 L
.59452 .27959 L
.59572 .27959 L
.59631 .27959 L
Mistroke
.59661 .27959 L
.59676 .27959 L
.59691 .27959 L
.59706 .27959 L
.59721 .33845 L
.59736 .33845 L
.59751 .33845 L
.59811 .33845 L
.6005 .33845 L
.6029 .33845 L
.60409 .33845 L
.60469 .33845 L
.60529 .33845 L
.60589 .33845 L
.60604 .33845 L
.60619 .33845 L
.60634 .4856 L
.60648 .4856 L
.60678 .4856 L
.60708 .4856 L
.60768 .4856 L
.61247 .4856 L
.61725 .4856 L
.61965 .4856 L
.62204 .4856 L
.62324 .4856 L
.62383 .4856 L
.62413 .4856 L
.62443 .4856 L
.62458 .4856 L
.62473 .4856 L
.62488 .54446 L
.62503 .54446 L
.62518 .54446 L
.62533 .54446 L
.62563 .54446 L
.62682 .54446 L
.62922 .54446 L
.63161 .54446 L
.63281 .54446 L
.63341 .54446 L
.6337 .54446 L
.63385 .54446 L
.634 .54446 L
.63415 .60332 L
.6343 .60332 L
.6346 .60332 L
.6352 .60332 L
.6364 .60332 L
.63879 .60332 L
Mistroke
.63999 .60332 L
.64118 .60332 L
.64178 .60332 L
.64238 .60332 L
.64268 .60332 L
.64298 .60332 L
.64313 .60332 L
.64328 .60332 L
.64343 .45617 L
.64358 .45617 L
.64387 .45617 L
.64417 .45617 L
.64477 .45617 L
.64597 .45617 L
.65075 .45617 L
.65554 .45617 L
.65793 .45617 L
.65913 .45617 L
.66033 .45617 L
.66092 .45617 L
.66122 .45617 L
.66137 .45617 L
.66152 .45617 L
.66167 .45617 L
.66182 .4856 L
.66197 .4856 L
.66212 .4856 L
.66272 .4856 L
.66511 .4856 L
.6675 .4856 L
.6687 .4856 L
.6693 .4856 L
.6699 .4856 L
.6705 .4856 L
.67064 .4856 L
.67079 .4856 L
.67094 .4856 L
.67109 .22073 L
.67139 .22073 L
.67169 .22073 L
.67229 .22073 L
.67468 .22073 L
.67708 .22073 L
.67827 .22073 L
.67887 .22073 L
.67947 .22073 L
.67977 .22073 L
.68007 .22073 L
.68022 .22073 L
.68037 .1913 L
Mistroke
.68067 .1913 L
.68186 .1913 L
.68425 .1913 L
.68665 .1913 L
.68784 .1913 L
.68844 .1913 L
.68874 .1913 L
.68904 .1913 L
.68919 .1913 L
.68934 .1913 L
.68949 .1913 L
.68964 .13244 L
.68979 .13244 L
.68994 .13244 L
.69024 .13244 L
.69143 .13244 L
.69383 .13244 L
.69622 .13244 L
.69742 .13244 L
.69801 .13244 L
.69831 .13244 L
.69846 .13244 L
.69861 .13244 L
.69876 .13244 L
.69891 .07358 L
.69921 .07358 L
.69981 .07358 L
.70101 .07358 L
.7034 .07358 L
.70459 .07358 L
.70579 .07358 L
.70639 .07358 L
.70699 .07358 L
.70729 .07358 L
.70759 .07358 L
.70774 .07358 L
.70788 .07358 L
.70803 .07358 L
.70818 .10301 L
.70848 .10301 L
.70878 .10301 L
.70938 .10301 L
.71058 .10301 L
.71297 .10301 L
.71417 .10301 L
.71536 .10301 L
.71596 .10301 L
.71656 .10301 L
.71686 .10301 L
.71701 .10301 L
Mistroke
.71716 .10301 L
.71731 .01472 L
.71746 .01472 L
.71776 .01472 L
.72254 .01472 L
.72733 .01472 L
.73211 .01472 L
.7369 .01472 L
.74168 .01472 L
.74647 .01472 L
.75126 .01472 L
.75604 .01472 L
.76083 .01472 L
.76561 .01472 L
.7704 .01472 L
.77519 .01472 L
.77997 .01472 L
.78476 .01472 L
.78954 .01472 L
.79433 .01472 L
.79911 .01472 L
.8039 .01472 L
.80869 .01472 L
.81347 .01472 L
.81826 .01472 L
.82304 .01472 L
.82783 .01472 L
.83262 .01472 L
.8374 .01472 L
.84219 .01472 L
.84697 .01472 L
.85176 .01472 L
.85654 .01472 L
.86133 .01472 L
.86612 .01472 L
.8709 .01472 L
.87569 .01472 L
.88047 .01472 L
.88526 .01472 L
.89005 .01472 L
.89483 .01472 L
.89962 .01472 L
.9044 .01472 L
.90919 .01472 L
.91397 .01472 L
.91876 .01472 L
.92355 .01472 L
.92833 .01472 L
.93312 .01472 L
.9379 .01472 L
Mistroke
.94269 .01472 L
.94748 .01472 L
.95226 .01472 L
.95705 .01472 L
.96183 .01472 L
.96662 .01472 L
.9714 .01472 L
.97619 .01472 L
Mfstroke
P
P
p
p
/Helvetica findfont 15 scalefont setfont
[(mean: 35.43 pA)] .97619 .50326 -1 0 Mshowa
P
p
/Helvetica findfont 15 scalefont setfont
[(s.d.: 2.644 pA)] .97619 .40319 -1 0 Mshowa
P
p
/Helvetica findfont 15 scalefont setfont
[(var: 6.99 pA^2)] .97619 .30902 -1 0 Mshowa
P
p
/Helvetica findfont 15 scalefont setfont
[(c.v.: 7.461 %)] .97619 .20895 -1 0 Mshowa
P
p
/Helvetica findfont 15 scalefont setfont
[(m3: -8.87 pA^3)] .97619 .10889 -1 0 Mshowa
P
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
% End of Graphics
MathPictureEnd

:[font = output; output; inactive; preserveAspect; endGroup]
Graphics["<<>>"]
;[o]
-Graphics-
:[font = input; preserveAspect; startGroup]
DistributionPlot[m200n121]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 0; pictureWidth = 450; pictureHeight = 277]
%!
%%Creator: Mathematica
%%AspectRatio: .61803 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0308468 0.00837774 0.0147151 6.47464 [
[(20)] .1984 .01472 0 2 Msboxa
[(40)] .36596 .01472 0 2 Msboxa
[(60)] .53351 .01472 0 2 Msboxa
[(80)] .70107 .01472 0 2 Msboxa
[(100)] .86862 .01472 0 2 Msboxa
[(I/pA)] 1.025 .01472 -1 0 Msboxa
[(Peak EPSC Amplitude Distribution)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(0.02)] .01835 .14421 1 0 Msboxa
[(0.04)] .01835 .2737 1 0 Msboxa
[(0.06)] .01835 .40319 1 0 Msboxa
[(0.08)] .01835 .53269 1 0 Msboxa
[(p)] .03085 .61803 0 -4 Msboxa
p
/Helvetica findfont 15 scalefont setfont
[(mean: 70.45 pA)] .97619 .50326 -1 0 Msboxa
P
p
/Helvetica findfont 15 scalefont setfont
[(s.d.: 3.93 pA)] .97619 .40319 -1 0 Msboxa
P
p
/Helvetica findfont 15 scalefont setfont
[(var: 15.46 pA^2)] .97619 .30902 -1 0 Msboxa
P
p
/Helvetica findfont 15 scalefont setfont
[(c.v.: 5.582 %)] .97619 .20895 -1 0 Msboxa
P
p
/Helvetica findfont 15 scalefont setfont
[(m3: 4.41 pA^3)] .97619 .10889 -1 0 Msboxa
P
[ -0.001 -0.001 0 0 ]
[ 1.001 .61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.1984 .01472 m
.1984 .02097 L
s
P
[(20)] .1984 .01472 0 2 Mshowa
p
.002 w
.36596 .01472 m
.36596 .02097 L
s
P
[(40)] .36596 .01472 0 2 Mshowa
p
.002 w
.53351 .01472 m
.53351 .02097 L
s
P
[(60)] .53351 .01472 0 2 Mshowa
p
.002 w
.70107 .01472 m
.70107 .02097 L
s
P
[(80)] .70107 .01472 0 2 Mshowa
p
.002 w
.86862 .01472 m
.86862 .02097 L
s
P
[(100)] .86862 .01472 0 2 Mshowa
p
.001 w
.06436 .01472 m
.06436 .01847 L
s
P
p
.001 w
.09787 .01472 m
.09787 .01847 L
s
P
p
.001 w
.13138 .01472 m
.13138 .01847 L
s
P
p
.001 w
.16489 .01472 m
.16489 .01847 L
s
P
p
.001 w
.23191 .01472 m
.23191 .01847 L
s
P
p
.001 w
.26542 .01472 m
.26542 .01847 L
s
P
p
.001 w
.29893 .01472 m
.29893 .01847 L
s
P
p
.001 w
.33245 .01472 m
.33245 .01847 L
s
P
p
.001 w
.39947 .01472 m
.39947 .01847 L
s
P
p
.001 w
.43298 .01472 m
.43298 .01847 L
s
P
p
.001 w
.46649 .01472 m
.46649 .01847 L
s
P
p
.001 w
.5 .01472 m
.5 .01847 L
s
P
p
.001 w
.56702 .01472 m
.56702 .01847 L
s
P
p
.001 w
.60053 .01472 m
.60053 .01847 L
s
P
p
.001 w
.63404 .01472 m
.63404 .01847 L
s
P
p
.001 w
.66755 .01472 m
.66755 .01847 L
s
P
p
.001 w
.73458 .01472 m
.73458 .01847 L
s
P
p
.001 w
.76809 .01472 m
.76809 .01847 L
s
P
p
.001 w
.8016 .01472 m
.8016 .01847 L
s
P
p
.001 w
.83511 .01472 m
.83511 .01847 L
s
P
p
.001 w
.90213 .01472 m
.90213 .01847 L
s
P
p
.001 w
.93564 .01472 m
.93564 .01847 L
s
P
p
.001 w
.96915 .01472 m
.96915 .01847 L
s
P
[(I/pA)] 1.025 .01472 -1 0 Mshowa
p
.002 w
0 .01472 m
1 .01472 L
s
P
[(Peak EPSC Amplitude Distribution)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.03085 .14421 m
.0371 .14421 L
s
P
[(0.02)] .01835 .14421 1 0 Mshowa
p
.002 w
.03085 .2737 m
.0371 .2737 L
s
P
[(0.04)] .01835 .2737 1 0 Mshowa
p
.002 w
.03085 .40319 m
.0371 .40319 L
s
P
[(0.06)] .01835 .40319 1 0 Mshowa
p
.002 w
.03085 .53269 m
.0371 .53269 L
s
P
[(0.08)] .01835 .53269 1 0 Mshowa
p
.001 w
.03085 .04061 m
.0346 .04061 L
s
P
p
.001 w
.03085 .06651 m
.0346 .06651 L
s
P
p
.001 w
.03085 .09241 m
.0346 .09241 L
s
P
p
.001 w
.03085 .11831 m
.0346 .11831 L
s
P
p
.001 w
.03085 .17011 m
.0346 .17011 L
s
P
p
.001 w
.03085 .19601 m
.0346 .19601 L
s
P
p
.001 w
.03085 .2219 m
.0346 .2219 L
s
P
p
.001 w
.03085 .2478 m
.0346 .2478 L
s
P
p
.001 w
.03085 .2996 m
.0346 .2996 L
s
P
p
.001 w
.03085 .3255 m
.0346 .3255 L
s
P
p
.001 w
.03085 .3514 m
.0346 .3514 L
s
P
p
.001 w
.03085 .3773 m
.0346 .3773 L
s
P
p
.001 w
.03085 .42909 m
.0346 .42909 L
s
P
p
.001 w
.03085 .45499 m
.0346 .45499 L
s
P
p
.001 w
.03085 .48089 m
.0346 .48089 L
s
P
p
.001 w
.03085 .50679 m
.0346 .50679 L
s
P
p
.001 w
.03085 .55859 m
.0346 .55859 L
s
P
p
.001 w
.03085 .58448 m
.0346 .58448 L
s
P
p
.001 w
.03085 .61038 m
.0346 .61038 L
s
P
[(p)] .03085 .61803 0 -4 Mshowa
p
.002 w
.03085 0 m
.03085 .61803 L
s
P
P
p
p
p
.004 w
.02381 .01472 m
.02857 .01472 L
.03333 .01472 L
.0381 .01472 L
.04286 .01472 L
.04762 .01472 L
.05238 .01472 L
.05714 .01472 L
.0619 .01472 L
.06667 .01472 L
.07143 .01472 L
.07619 .01472 L
.08095 .01472 L
.08571 .01472 L
.09048 .01472 L
.09524 .01472 L
.1 .01472 L
.10476 .01472 L
.10952 .01472 L
.11429 .01472 L
.11905 .01472 L
.12381 .01472 L
.12857 .01472 L
.13333 .01472 L
.1381 .01472 L
.14286 .01472 L
.14762 .01472 L
.15238 .01472 L
.15714 .01472 L
.1619 .01472 L
.16667 .01472 L
.17143 .01472 L
.17619 .01472 L
.18095 .01472 L
.18571 .01472 L
.19048 .01472 L
.19524 .01472 L
.2 .01472 L
.20476 .01472 L
.20952 .01472 L
.21429 .01472 L
.21905 .01472 L
.22381 .01472 L
.22857 .01472 L
.23333 .01472 L
.2381 .01472 L
.24286 .01472 L
.24762 .01472 L
.25238 .01472 L
.25714 .01472 L
Mistroke
.2619 .01472 L
.26667 .01472 L
.27143 .01472 L
.27619 .01472 L
.28095 .01472 L
.28571 .01472 L
.29048 .01472 L
.29524 .01472 L
.3 .01472 L
.30476 .01472 L
.30952 .01472 L
.31429 .01472 L
.31905 .01472 L
.32381 .01472 L
.32857 .01472 L
.33333 .01472 L
.3381 .01472 L
.34286 .01472 L
.34762 .01472 L
.35238 .01472 L
.35714 .01472 L
.3619 .01472 L
.36667 .01472 L
.37143 .01472 L
.37619 .01472 L
.38095 .01472 L
.38571 .01472 L
.39048 .01472 L
.39524 .01472 L
.4 .01472 L
.40476 .01472 L
.40952 .01472 L
.41429 .01472 L
.41905 .01472 L
.42381 .01472 L
.42857 .01472 L
.43333 .01472 L
.4381 .01472 L
.44286 .01472 L
.44762 .01472 L
.45238 .01472 L
.45714 .01472 L
.4619 .01472 L
.46667 .01472 L
.47143 .01472 L
.47619 .01472 L
.48095 .01472 L
.48571 .01472 L
.49048 .01472 L
.49524 .01472 L
Mistroke
.5 .01472 L
.50476 .01472 L
.50952 .01472 L
.51429 .01472 L
.51905 .01472 L
.52381 .01472 L
.52857 .01472 L
.53095 .01472 L
.53214 .01472 L
.53333 .01472 L
.53393 .01472 L
.53452 .01472 L
.53482 .01472 L
.53497 .01472 L
.53512 .01472 L
.53527 .06822 L
.53542 .06822 L
.53571 .06822 L
.5369 .06822 L
.5381 .06822 L
.53869 .06822 L
.53899 .06822 L
.53929 .06822 L
.53943 .06822 L
.53958 .06822 L
.53973 .06822 L
.53988 .01472 L
.54018 .01472 L
.54048 .01472 L
.54167 .01472 L
.54286 .01472 L
.54345 .01472 L
.54375 .01472 L
.54405 .01472 L
.54435 .01472 L
.54449 .01472 L
.54464 .06822 L
.54524 .06822 L
.54643 .06822 L
.54762 .06822 L
.54821 .06822 L
.54851 .06822 L
.54881 .06822 L
.54896 .06822 L
.54911 .06822 L
.54926 .06822 L
.5494 .01472 L
.5497 .01472 L
.55 .01472 L
.55119 .01472 L
Mistroke
.55238 .01472 L
.55298 .01472 L
.55327 .01472 L
.55357 .01472 L
.55372 .01472 L
.55387 .01472 L
.55402 .12173 L
.55417 .12173 L
.55476 .12173 L
.55714 .12173 L
.55952 .12173 L
.56071 .12173 L
.5619 .12173 L
.5625 .12173 L
.5628 .12173 L
.56295 .12173 L
.5631 .12173 L
.56324 .12173 L
.56339 .01472 L
.56354 .01472 L
.56369 .01472 L
.56429 .01472 L
.56548 .01472 L
.56667 .01472 L
.56726 .01472 L
.56756 .01472 L
.56771 .01472 L
.56786 .01472 L
.56801 .01472 L
.56815 .06822 L
.5683 .06822 L
.56845 .06822 L
.56905 .06822 L
.57024 .06822 L
.57143 .06822 L
.57202 .06822 L
.57232 .06822 L
.57247 .06822 L
.57262 .06822 L
.57277 .01472 L
.57292 .01472 L
.57321 .01472 L
.57381 .01472 L
.575 .01472 L
.57619 .01472 L
.57679 .01472 L
.57708 .01472 L
.57723 .01472 L
.57738 .01472 L
.57753 .33577 L
Mistroke
.57768 .33577 L
.57798 .33577 L
.57857 .33577 L
.57976 .33577 L
.58036 .33577 L
.58095 .33577 L
.58155 .33577 L
.5817 .33577 L
.58185 .33577 L
.58199 .33577 L
.58214 .38928 L
.58244 .38928 L
.58274 .38928 L
.58333 .38928 L
.58452 .38928 L
.58512 .38928 L
.58571 .38928 L
.58631 .38928 L
.58646 .38928 L
.58661 .38928 L
.58676 .38928 L
.5869 .28226 L
.5872 .28226 L
.5875 .28226 L
.5881 .28226 L
.58929 .28226 L
.58988 .28226 L
.59048 .28226 L
.59107 .28226 L
.59122 .28226 L
.59137 .28226 L
.59152 .12173 L
.59167 .12173 L
.59196 .12173 L
.59226 .12173 L
.59286 .12173 L
.59405 .12173 L
.59464 .12173 L
.59524 .12173 L
.59583 .12173 L
.59598 .12173 L
.59613 .12173 L
.59628 .33577 L
.59643 .33577 L
.59673 .33577 L
.59702 .33577 L
.59762 .33577 L
.59881 .33577 L
.5994 .33577 L
.6 .33577 L
Mistroke
.6003 .33577 L
.60045 .33577 L
.6006 .33577 L
.60074 .33577 L
.60089 .22875 L
.60119 .22875 L
.60238 .22875 L
.60357 .22875 L
.60417 .22875 L
.60476 .22875 L
.60506 .22875 L
.60521 .22875 L
.60536 .22875 L
.60551 .22875 L
.60565 .44279 L
.60595 .44279 L
.60714 .44279 L
.60833 .44279 L
.60893 .44279 L
.60952 .44279 L
.60982 .44279 L
.60997 .44279 L
.61012 .44279 L
.61027 .60332 L
.61042 .60332 L
.61071 .60332 L
.6119 .60332 L
.6131 .60332 L
.61369 .60332 L
.61429 .60332 L
.61458 .60332 L
.61473 .60332 L
.61488 .60332 L
.61503 .38928 L
.61518 .38928 L
.61548 .38928 L
.61667 .38928 L
.61786 .38928 L
.61845 .38928 L
.61875 .38928 L
.61905 .38928 L
.61935 .38928 L
.61949 .38928 L
.61964 .22875 L
.62024 .22875 L
.62143 .22875 L
.62262 .22875 L
.62321 .22875 L
.62351 .22875 L
.62381 .22875 L
Mistroke
.62411 .22875 L
.62426 .22875 L
.6244 .44279 L
.625 .44279 L
.62619 .44279 L
.62738 .44279 L
.62798 .44279 L
.62827 .44279 L
.62857 .44279 L
.62872 .44279 L
.62887 .44279 L
.62902 .28226 L
.62917 .28226 L
.62976 .28226 L
.63095 .28226 L
.63214 .28226 L
.63274 .28226 L
.63304 .28226 L
.63333 .28226 L
.63348 .28226 L
.63363 .28226 L
.63378 .22875 L
.63393 .22875 L
.63452 .22875 L
.63571 .22875 L
.6369 .22875 L
.6375 .22875 L
.6378 .22875 L
.6381 .22875 L
.63824 .22875 L
.63839 .22875 L
.63854 .38928 L
.63869 .38928 L
.63929 .38928 L
.64048 .38928 L
.64167 .38928 L
.64226 .38928 L
.64256 .38928 L
.64271 .38928 L
.64286 .38928 L
.64301 .38928 L
.64315 .12173 L
.6433 .12173 L
.64345 .12173 L
.64405 .12173 L
.64524 .12173 L
.64643 .12173 L
.64702 .12173 L
.64732 .12173 L
.64747 .12173 L
Mistroke
.64762 .12173 L
.64777 .12173 L
.64792 .33577 L
.64807 .33577 L
.64821 .33577 L
.64881 .33577 L
.65 .33577 L
.65119 .33577 L
.65179 .33577 L
.65208 .33577 L
.65223 .33577 L
.65238 .33577 L
.65253 .17524 L
.65268 .17524 L
.65283 .17524 L
.65298 .17524 L
.65357 .17524 L
.65476 .17524 L
.65595 .17524 L
.65655 .17524 L
.65685 .17524 L
.65699 .17524 L
.65714 .17524 L
.65729 .33577 L
.65744 .33577 L
.65759 .33577 L
.65774 .33577 L
.65833 .33577 L
.65952 .33577 L
.66012 .33577 L
.66071 .33577 L
.66101 .33577 L
.66131 .33577 L
.66146 .33577 L
.66161 .33577 L
.66176 .33577 L
.6619 .06822 L
.6622 .06822 L
.6625 .06822 L
.6631 .06822 L
.66429 .06822 L
.66488 .06822 L
.66548 .06822 L
.66577 .06822 L
.66607 .06822 L
.66622 .06822 L
.66637 .06822 L
.66652 .06822 L
.66667 .28226 L
.66696 .28226 L
Mistroke
.66726 .28226 L
.66786 .28226 L
.66905 .28226 L
.66964 .28226 L
.67024 .28226 L
.67054 .28226 L
.67083 .28226 L
.67098 .28226 L
.67113 .28226 L
.67128 .06822 L
.67143 .06822 L
.67173 .06822 L
.67202 .06822 L
.67262 .06822 L
.67381 .06822 L
.67619 .06822 L
.67857 .06822 L
.68095 .06822 L
.68214 .06822 L
.68333 .06822 L
.68393 .06822 L
.68452 .06822 L
.68482 .06822 L
.68497 .06822 L
.68512 .06822 L
.68527 .06822 L
.68542 .01472 L
.68571 .01472 L
.6869 .01472 L
.6881 .01472 L
.68869 .01472 L
.68929 .01472 L
.68958 .01472 L
.68973 .01472 L
.68988 .01472 L
.69003 .17524 L
.69018 .17524 L
.69048 .17524 L
.69167 .17524 L
.69286 .17524 L
.69345 .17524 L
.69405 .17524 L
.69435 .17524 L
.69449 .17524 L
.69464 .17524 L
.69479 .01472 L
.69494 .01472 L
.69524 .01472 L
.69762 .01472 L
.7 .01472 L
Mistroke
.70119 .01472 L
.70238 .01472 L
.70298 .01472 L
.70327 .01472 L
.70357 .01472 L
.70372 .01472 L
.70387 .01472 L
.70402 .01472 L
.70417 .06822 L
.70446 .06822 L
.70476 .06822 L
.70595 .06822 L
.70714 .06822 L
.70774 .06822 L
.70804 .06822 L
.70833 .06822 L
.70848 .06822 L
.70863 .06822 L
.70878 .01472 L
.70893 .01472 L
.70923 .01472 L
.70952 .01472 L
.71429 .01472 L
.71905 .01472 L
.72381 .01472 L
.72857 .01472 L
.73333 .01472 L
.7381 .01472 L
.74286 .01472 L
.74762 .01472 L
.75238 .01472 L
.75714 .01472 L
.7619 .01472 L
.76667 .01472 L
.77143 .01472 L
.77619 .01472 L
.78095 .01472 L
.78571 .01472 L
.79048 .01472 L
.79524 .01472 L
.8 .01472 L
.80476 .01472 L
.80952 .01472 L
.81429 .01472 L
.81905 .01472 L
.82381 .01472 L
.82857 .01472 L
.83333 .01472 L
.8381 .01472 L
.84286 .01472 L
Mistroke
.84762 .01472 L
.85238 .01472 L
.85714 .01472 L
.8619 .01472 L
.86667 .01472 L
.87143 .01472 L
.87619 .01472 L
.88095 .01472 L
.88571 .01472 L
.89048 .01472 L
.89524 .01472 L
.9 .01472 L
.90476 .01472 L
.90952 .01472 L
.91429 .01472 L
.91905 .01472 L
.92381 .01472 L
.92857 .01472 L
.93333 .01472 L
.9381 .01472 L
.94286 .01472 L
.94762 .01472 L
.95238 .01472 L
.95714 .01472 L
.9619 .01472 L
.96667 .01472 L
.97143 .01472 L
.97619 .01472 L
Mfstroke
P
P
p
p
/Helvetica findfont 15 scalefont setfont
[(mean: 70.45 pA)] .97619 .50326 -1 0 Mshowa
P
p
/Helvetica findfont 15 scalefont setfont
[(s.d.: 3.93 pA)] .97619 .40319 -1 0 Mshowa
P
p
/Helvetica findfont 15 scalefont setfont
[(var: 15.46 pA^2)] .97619 .30902 -1 0 Mshowa
P
p
/Helvetica findfont 15 scalefont setfont
[(c.v.: 5.582 %)] .97619 .20895 -1 0 Mshowa
P
p
/Helvetica findfont 15 scalefont setfont
[(m3: 4.41 pA^3)] .97619 .10889 -1 0 Mshowa
P
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
% End of Graphics
MathPictureEnd

:[font = output; output; inactive; preserveAspect; endGroup]
Graphics["<<>>"]
;[o]
-Graphics-
:[font = input; preserveAspect; startGroup]
DistributionPlot[m100n200, m200n121]
:[font = postscript; PostScript; formatAsPostScript; output; inactive; preserveAspect; pictureLeft = 0; pictureWidth = 393; pictureHeight = 242]
%!
%%Creator: Mathematica
%%AspectRatio: .61803 
MathPictureStart
%% Graphics
/Courier findfont 10  scalefont  setfont
% Scaling calculations
0.0308468 0.00837774 0.0147151 9.44709 [
[(20)] .1984 .01472 0 2 Msboxa
[(40)] .36596 .01472 0 2 Msboxa
[(60)] .53351 .01472 0 2 Msboxa
[(80)] .70107 .01472 0 2 Msboxa
[(100)] .86862 .01472 0 2 Msboxa
[(I/pA)] 1.025 .01472 -1 0 Msboxa
[(Peak EPSC Amplitude Distribution)] .5 .61803 0 -2 0 0 1 Mouter Mrotsboxa
[(0.01)] .01835 .10919 1 0 Msboxa
[(0.02)] .01835 .20366 1 0 Msboxa
[(0.03)] .01835 .29813 1 0 Msboxa
[(0.04)] .01835 .3926 1 0 Msboxa
[(0.05)] .01835 .48707 1 0 Msboxa
[(0.06)] .01835 .58154 1 0 Msboxa
[(p)] .03085 .61803 0 -4 Msboxa
[ -0.001 -0.001 0 0 ]
[ 1.001 .61903 0 0 ]
] MathScale
% Start of Graphics
1 setlinecap
1 setlinejoin
newpath
[ ] 0 setdash
0 g
p
p
.002 w
.1984 .01472 m
.1984 .02097 L
s
P
[(20)] .1984 .01472 0 2 Mshowa
p
.002 w
.36596 .01472 m
.36596 .02097 L
s
P
[(40)] .36596 .01472 0 2 Mshowa
p
.002 w
.53351 .01472 m
.53351 .02097 L
s
P
[(60)] .53351 .01472 0 2 Mshowa
p
.002 w
.70107 .01472 m
.70107 .02097 L
s
P
[(80)] .70107 .01472 0 2 Mshowa
p
.002 w
.86862 .01472 m
.86862 .02097 L
s
P
[(100)] .86862 .01472 0 2 Mshowa
p
.001 w
.06436 .01472 m
.06436 .01847 L
s
P
p
.001 w
.09787 .01472 m
.09787 .01847 L
s
P
p
.001 w
.13138 .01472 m
.13138 .01847 L
s
P
p
.001 w
.16489 .01472 m
.16489 .01847 L
s
P
p
.001 w
.23191 .01472 m
.23191 .01847 L
s
P
p
.001 w
.26542 .01472 m
.26542 .01847 L
s
P
p
.001 w
.29893 .01472 m
.29893 .01847 L
s
P
p
.001 w
.33245 .01472 m
.33245 .01847 L
s
P
p
.001 w
.39947 .01472 m
.39947 .01847 L
s
P
p
.001 w
.43298 .01472 m
.43298 .01847 L
s
P
p
.001 w
.46649 .01472 m
.46649 .01847 L
s
P
p
.001 w
.5 .01472 m
.5 .01847 L
s
P
p
.001 w
.56702 .01472 m
.56702 .01847 L
s
P
p
.001 w
.60053 .01472 m
.60053 .01847 L
s
P
p
.001 w
.63404 .01472 m
.63404 .01847 L
s
P
p
.001 w
.66755 .01472 m
.66755 .01847 L
s
P
p
.001 w
.73458 .01472 m
.73458 .01847 L
s
P
p
.001 w
.76809 .01472 m
.76809 .01847 L
s
P
p
.001 w
.8016 .01472 m
.8016 .01847 L
s
P
p
.001 w
.83511 .01472 m
.83511 .01847 L
s
P
p
.001 w
.90213 .01472 m
.90213 .01847 L
s
P
p
.001 w
.93564 .01472 m
.93564 .01847 L
s
P
p
.001 w
.96915 .01472 m
.96915 .01847 L
s
P
[(I/pA)] 1.025 .01472 -1 0 Mshowa
p
.002 w
0 .01472 m
1 .01472 L
s
P
[(Peak EPSC Amplitude Distribution)] .5 .61803 0 -2 0 0 1 Mouter Mrotshowa
p
.002 w
.03085 .10919 m
.0371 .10919 L
s
P
[(0.01)] .01835 .10919 1 0 Mshowa
p
.002 w
.03085 .20366 m
.0371 .20366 L
s
P
[(0.02)] .01835 .20366 1 0 Mshowa
p
.002 w
.03085 .29813 m
.0371 .29813 L
s
P
[(0.03)] .01835 .29813 1 0 Mshowa
p
.002 w
.03085 .3926 m
.0371 .3926 L
s
P
[(0.04)] .01835 .3926 1 0 Mshowa
p
.002 w
.03085 .48707 m
.0371 .48707 L
s
P
[(0.05)] .01835 .48707 1 0 Mshowa
p
.002 w
.03085 .58154 m
.0371 .58154 L
s
P
[(0.06)] .01835 .58154 1 0 Mshowa
p
.001 w
.03085 .03361 m
.0346 .03361 L
s
P
p
.001 w
.03085 .0525 m
.0346 .0525 L
s
P
p
.001 w
.03085 .0714 m
.0346 .0714 L
s
P
p
.001 w
.03085 .09029 m
.0346 .09029 L
s
P
p
.001 w
.03085 .12808 m
.0346 .12808 L
s
P
p
.001 w
.03085 .14697 m
.0346 .14697 L
s
P
p
.001 w
.03085 .16587 m
.0346 .16587 L
s
P
p
.001 w
.03085 .18476 m
.0346 .18476 L
s
P
p
.001 w
.03085 .22255 m
.0346 .22255 L
s
P
p
.001 w
.03085 .24145 m
.0346 .24145 L
s
P
p
.001 w
.03085 .26034 m
.0346 .26034 L
s
P
p
.001 w
.03085 .27923 m
.0346 .27923 L
s
P
p
.001 w
.03085 .31702 m
.0346 .31702 L
s
P
p
.001 w
.03085 .33592 m
.0346 .33592 L
s
P
p
.001 w
.03085 .35481 m
.0346 .35481 L
s
P
p
.001 w
.03085 .3737 m
.0346 .3737 L
s
P
p
.001 w
.03085 .41149 m
.0346 .41149 L
s
P
p
.001 w
.03085 .43039 m
.0346 .43039 L
s
P
p
.001 w
.03085 .44928 m
.0346 .44928 L
s
P
p
.001 w
.03085 .46818 m
.0346 .46818 L
s
P
p
.001 w
.03085 .50596 m
.0346 .50596 L
s
P
p
.001 w
.03085 .52486 m
.0346 .52486 L
s
P
p
.001 w
.03085 .54375 m
.0346 .54375 L
s
P
p
.001 w
.03085 .56265 m
.0346 .56265 L
s
P
p
.001 w
.03085 .60043 m
.0346 .60043 L
s
P
[(p)] .03085 .61803 0 -4 Mshowa
p
.002 w
.03085 0 m
.03085 .61803 L
s
P
P
p
p
p
.004 w
.02381 .01472 m
.02857 .01472 L
.03333 .01472 L
.0381 .01472 L
.04286 .01472 L
.04762 .01472 L
.05238 .01472 L
.05714 .01472 L
.0619 .01472 L
.06667 .01472 L
.07143 .01472 L
.07619 .01472 L
.08095 .01472 L
.08571 .01472 L
.09048 .01472 L
.09524 .01472 L
.1 .01472 L
.10476 .01472 L
.10952 .01472 L
.11429 .01472 L
.11905 .01472 L
.12381 .01472 L
.12857 .01472 L
.13333 .01472 L
.1381 .01472 L
.14286 .01472 L
.14762 .01472 L
.15238 .01472 L
.15714 .01472 L
.1619 .01472 L
.16667 .01472 L
.17143 .01472 L
.17619 .01472 L
.18095 .01472 L
.18571 .01472 L
.19048 .01472 L
.19524 .01472 L
.2 .01472 L
.20476 .01472 L
.20952 .01472 L
.21429 .01472 L
.21905 .01472 L
.22381 .01472 L
.22857 .01472 L
.23333 .01472 L
.2381 .01472 L
.24286 .01472 L
.24762 .01472 L
.25 .01472 L
.25119 .01472 L
Mistroke
.25238 .01472 L
.25298 .01472 L
.25327 .01472 L
.25342 .01472 L
.25357 .01472 L
.25372 .04415 L
.25387 .04415 L
.25417 .04415 L
.25476 .04415 L
.25595 .04415 L
.25714 .04415 L
.25774 .04415 L
.25804 .04415 L
.25818 .04415 L
.25833 .04415 L
.25848 .01472 L
.25863 .01472 L
.25893 .01472 L
.25952 .01472 L
.2619 .01472 L
.26429 .01472 L
.26548 .01472 L
.26607 .01472 L
.26667 .01472 L
.26696 .01472 L
.26726 .01472 L
.26741 .01472 L
.26756 .01472 L
.26771 .01472 L
.26786 .07358 L
.26801 .07358 L
.26815 .07358 L
.26845 .07358 L
.26905 .07358 L
.27024 .07358 L
.27083 .07358 L
.27143 .07358 L
.27173 .07358 L
.27202 .07358 L
.27217 .07358 L
.27232 .07358 L
.27247 .01472 L
.27262 .01472 L
.27381 .01472 L
.275 .01472 L
.2756 .01472 L
.27619 .01472 L
.27649 .01472 L
.27679 .01472 L
.27693 .01472 L
Mistroke
.27708 .01472 L
.27723 .10301 L
.27738 .10301 L
.27753 .10301 L
.27768 .10301 L
.27798 .10301 L
.27857 .10301 L
.27976 .10301 L
.28036 .10301 L
.28095 .10301 L
.28125 .10301 L
.2814 .10301 L
.28155 .10301 L
.2817 .10301 L
.28185 .13244 L
.28199 .13244 L
.28214 .13244 L
.28333 .13244 L
.28452 .13244 L
.28512 .13244 L
.28571 .13244 L
.28601 .13244 L
.28616 .13244 L
.28631 .13244 L
.28646 .13244 L
.28661 .07358 L
.2869 .07358 L
.2881 .07358 L
.28929 .07358 L
.28988 .07358 L
.29048 .07358 L
.29077 .07358 L
.29092 .07358 L
.29107 .07358 L
.29122 .07358 L
.29137 .13244 L
.29152 .13244 L
.29167 .13244 L
.29286 .13244 L
.29405 .13244 L
.29464 .13244 L
.29524 .13244 L
.29554 .13244 L
.29568 .13244 L
.29583 .13244 L
.29598 .36788 L
.29613 .36788 L
.29643 .36788 L
.29762 .36788 L
.29881 .36788 L
Mistroke
.2994 .36788 L
.3 .36788 L
.3003 .36788 L
.30045 .36788 L
.3006 .36788 L
.30074 .1913 L
.30089 .1913 L
.30119 .1913 L
.30238 .1913 L
.30357 .1913 L
.30417 .1913 L
.30446 .1913 L
.30476 .1913 L
.30491 .1913 L
.30506 .1913 L
.30521 .1913 L
.30536 .25016 L
.30565 .25016 L
.30595 .25016 L
.30714 .25016 L
.30833 .25016 L
.30893 .25016 L
.30923 .25016 L
.30952 .25016 L
.30982 .25016 L
.30997 .25016 L
.31012 .27959 L
.31071 .27959 L
.3119 .27959 L
.3131 .27959 L
.31369 .27959 L
.31399 .27959 L
.31429 .27959 L
.31443 .27959 L
.31458 .27959 L
.31473 .33845 L
.31488 .33845 L
.31518 .33845 L
.31548 .33845 L
.31667 .33845 L
.31786 .33845 L
.31845 .33845 L
.31875 .33845 L
.31905 .33845 L
.3192 .33845 L
.31935 .33845 L
.31949 .4856 L
.31964 .4856 L
.32024 .4856 L
.32143 .4856 L
Mistroke
.32381 .4856 L
.32619 .4856 L
.32738 .4856 L
.32798 .4856 L
.32827 .4856 L
.32842 .4856 L
.32857 .4856 L
.32872 .4856 L
.32887 .54446 L
.32902 .54446 L
.32917 .54446 L
.32976 .54446 L
.33095 .54446 L
.33214 .54446 L
.33274 .54446 L
.33304 .54446 L
.33318 .54446 L
.33333 .54446 L
.33348 .60332 L
.33363 .60332 L
.33393 .60332 L
.33452 .60332 L
.33571 .60332 L
.3369 .60332 L
.3375 .60332 L
.3378 .60332 L
.33795 .60332 L
.3381 .60332 L
.33824 .45617 L
.33839 .45617 L
.33854 .45617 L
.33869 .45617 L
.33929 .45617 L
.34048 .45617 L
.34286 .45617 L
.34405 .45617 L
.34524 .45617 L
.34643 .45617 L
.34673 .45617 L
.34702 .45617 L
.34717 .45617 L
.34732 .45617 L
.34747 .45617 L
.34762 .4856 L
.34792 .4856 L
.34821 .4856 L
.34881 .4856 L
.35 .4856 L
.3506 .4856 L
.35119 .4856 L
Mistroke
.35179 .4856 L
.35193 .4856 L
.35208 .4856 L
.35223 .22073 L
.35238 .22073 L
.35268 .22073 L
.35298 .22073 L
.35357 .22073 L
.35476 .22073 L
.35595 .22073 L
.35625 .22073 L
.35655 .22073 L
.3567 .22073 L
.35685 .22073 L
.35699 .1913 L
.35714 .1913 L
.35744 .1913 L
.35774 .1913 L
.35833 .1913 L
.35952 .1913 L
.36012 .1913 L
.36071 .1913 L
.36101 .1913 L
.36116 .1913 L
.36131 .1913 L
.36146 .1913 L
.36161 .13244 L
.3619 .13244 L
.3631 .13244 L
.36429 .13244 L
.36548 .13244 L
.36577 .13244 L
.36592 .13244 L
.36607 .13244 L
.36622 .13244 L
.36637 .07358 L
.36667 .07358 L
.36905 .07358 L
.36964 .07358 L
.37024 .07358 L
.37054 .07358 L
.37068 .07358 L
.37083 .07358 L
.37098 .07358 L
.37113 .10301 L
.37143 .10301 L
.37262 .10301 L
.37381 .10301 L
.375 .10301 L
.3753 .10301 L
Mistroke
.37545 .10301 L
.3756 .10301 L
.37574 .01472 L
.37589 .01472 L
.37619 .01472 L
.38095 .01472 L
.38571 .01472 L
.39048 .01472 L
.39524 .01472 L
.4 .01472 L
.40476 .01472 L
.40952 .01472 L
.41429 .01472 L
.41905 .01472 L
.42381 .01472 L
.42857 .01472 L
.43333 .01472 L
.4381 .01472 L
.44286 .01472 L
.44762 .01472 L
.45238 .01472 L
.45714 .01472 L
.4619 .01472 L
.46667 .01472 L
.47143 .01472 L
.47619 .01472 L
.48095 .01472 L
.48571 .01472 L
.49048 .01472 L
.49524 .01472 L
.5 .01472 L
.50476 .01472 L
.50952 .01472 L
.51429 .01472 L
.51905 .01472 L
.52381 .01472 L
.52857 .01472 L
.53095 .01472 L
.53214 .01472 L
.53333 .01472 L
.53393 .01472 L
.53452 .01472 L
.53482 .01472 L
.53497 .01472 L
.53512 .01472 L
.53527 .04415 L
.53542 .04415 L
.53571 .04415 L
.5369 .04415 L
.5381 .04415 L
Mistroke
.53869 .04415 L
.53899 .04415 L
.53929 .04415 L
.53943 .04415 L
.53958 .04415 L
.53973 .04415 L
.53988 .01472 L
.54018 .01472 L
.54048 .01472 L
.54167 .01472 L
.54286 .01472 L
.54345 .01472 L
.54375 .01472 L
.54405 .01472 L
.54435 .01472 L
.54449 .01472 L
.54464 .04415 L
.54524 .04415 L
.54643 .04415 L
.54762 .04415 L
.54821 .04415 L
.54851 .04415 L
.54881 .04415 L
.54896 .04415 L
.54911 .04415 L
.54926 .04415 L
.5494 .01472 L
.5497 .01472 L
.55 .01472 L
.55119 .01472 L
.55238 .01472 L
.55298 .01472 L
.55327 .01472 L
.55357 .01472 L
.55372 .01472 L
.55387 .01472 L
.55402 .07358 L
.55417 .07358 L
.55476 .07358 L
.55714 .07358 L
.55952 .07358 L
.56071 .07358 L
.5619 .07358 L
.5625 .07358 L
.5628 .07358 L
.56295 .07358 L
.5631 .07358 L
.56324 .07358 L
.56339 .01472 L
.56354 .01472 L
Mistroke
.56369 .01472 L
.56429 .01472 L
.56548 .01472 L
.56667 .01472 L
.56726 .01472 L
.56756 .01472 L
.56771 .01472 L
.56786 .01472 L
.56801 .01472 L
.56815 .04415 L
.5683 .04415 L
.56845 .04415 L
.56905 .04415 L
.57024 .04415 L
.57143 .04415 L
.57202 .04415 L
.57232 .04415 L
.57247 .04415 L
.57262 .04415 L
.57277 .01472 L
.57292 .01472 L
.57321 .01472 L
.57381 .01472 L
.575 .01472 L
.57619 .01472 L
.57679 .01472 L
.57708 .01472 L
.57723 .01472 L
.57738 .01472 L
.57753 .1913 L
.57768 .1913 L
.57798 .1913 L
.57857 .1913 L
.57976 .1913 L
.58036 .1913 L
.58095 .1913 L
.58155 .1913 L
.5817 .1913 L
.58185 .1913 L
.58199 .1913 L
.58214 .22073 L
.58244 .22073 L
.58274 .22073 L
.58333 .22073 L
.58452 .22073 L
.58512 .22073 L
.58571 .22073 L
.58631 .22073 L
.58646 .22073 L
.58661 .22073 L
Mistroke
.58676 .22073 L
.5869 .16187 L
.5872 .16187 L
.5875 .16187 L
.5881 .16187 L
.58929 .16187 L
.58988 .16187 L
.59048 .16187 L
.59107 .16187 L
.59122 .16187 L
.59137 .16187 L
.59152 .07358 L
.59167 .07358 L
.59196 .07358 L
.59226 .07358 L
.59286 .07358 L
.59405 .07358 L
.59464 .07358 L
.59524 .07358 L
.59583 .07358 L
.59598 .07358 L
.59613 .07358 L
.59628 .1913 L
.59643 .1913 L
.59673 .1913 L
.59702 .1913 L
.59762 .1913 L
.59881 .1913 L
.5994 .1913 L
.6 .1913 L
.6003 .1913 L
.60045 .1913 L
.6006 .1913 L
.60074 .1913 L
.60089 .13244 L
.60119 .13244 L
.60238 .13244 L
.60357 .13244 L
.60417 .13244 L
.60476 .13244 L
.60506 .13244 L
.60521 .13244 L
.60536 .13244 L
.60551 .13244 L
.60565 .25016 L
.60595 .25016 L
.60714 .25016 L
.60833 .25016 L
.60893 .25016 L
.60952 .25016 L
Mistroke
.60982 .25016 L
.60997 .25016 L
.61012 .25016 L
.61027 .33845 L
.61042 .33845 L
.61071 .33845 L
.6119 .33845 L
.6131 .33845 L
.61369 .33845 L
.61429 .33845 L
.61458 .33845 L
.61473 .33845 L
.61488 .33845 L
.61503 .22073 L
.61518 .22073 L
.61548 .22073 L
.61667 .22073 L
.61786 .22073 L
.61845 .22073 L
.61875 .22073 L
.61905 .22073 L
.61935 .22073 L
.61949 .22073 L
.61964 .13244 L
.62024 .13244 L
.62143 .13244 L
.62262 .13244 L
.62321 .13244 L
.62351 .13244 L
.62381 .13244 L
.62411 .13244 L
.62426 .13244 L
.6244 .25016 L
.625 .25016 L
.62619 .25016 L
.62738 .25016 L
.62798 .25016 L
.62827 .25016 L
.62857 .25016 L
.62872 .25016 L
.62887 .25016 L
.62902 .16187 L
.62917 .16187 L
.62976 .16187 L
.63095 .16187 L
.63214 .16187 L
.63274 .16187 L
.63304 .16187 L
.63333 .16187 L
.63348 .16187 L
Mistroke
.63363 .16187 L
.63378 .13244 L
.63393 .13244 L
.63452 .13244 L
.63571 .13244 L
.6369 .13244 L
.6375 .13244 L
.6378 .13244 L
.6381 .13244 L
.63824 .13244 L
.63839 .13244 L
.63854 .22073 L
.63869 .22073 L
.63929 .22073 L
.64048 .22073 L
.64167 .22073 L
.64226 .22073 L
.64256 .22073 L
.64271 .22073 L
.64286 .22073 L
.64301 .22073 L
.64315 .07358 L
.6433 .07358 L
.64345 .07358 L
.64405 .07358 L
.64524 .07358 L
.64643 .07358 L
.64702 .07358 L
.64732 .07358 L
.64747 .07358 L
.64762 .07358 L
.64777 .07358 L
.64792 .1913 L
.64807 .1913 L
.64821 .1913 L
.64881 .1913 L
.65 .1913 L
.65119 .1913 L
.65179 .1913 L
.65208 .1913 L
.65223 .1913 L
.65238 .1913 L
.65253 .10301 L
.65268 .10301 L
.65283 .10301 L
.65298 .10301 L
.65357 .10301 L
.65476 .10301 L
.65595 .10301 L
.65655 .10301 L
Mistroke
.65685 .10301 L
.65699 .10301 L
.65714 .10301 L
.65729 .1913 L
.65744 .1913 L
.65759 .1913 L
.65774 .1913 L
.65833 .1913 L
.65952 .1913 L
.66012 .1913 L
.66071 .1913 L
.66101 .1913 L
.66131 .1913 L
.66146 .1913 L
.66161 .1913 L
.66176 .1913 L
.6619 .04415 L
.6622 .04415 L
.6625 .04415 L
.6631 .04415 L
.66429 .04415 L
.66488 .04415 L
.66548 .04415 L
.66577 .04415 L
.66607 .04415 L
.66622 .04415 L
.66637 .04415 L
.66652 .04415 L
.66667 .16187 L
.66696 .16187 L
.66726 .16187 L
.66786 .16187 L
.66905 .16187 L
.66964 .16187 L
.67024 .16187 L
.67054 .16187 L
.67083 .16187 L
.67098 .16187 L
.67113 .16187 L
.67128 .04415 L
.67143 .04415 L
.67173 .04415 L
.67202 .04415 L
.67262 .04415 L
.67381 .04415 L
.67619 .04415 L
.67857 .04415 L
.68095 .04415 L
.68214 .04415 L
.68333 .04415 L
Mistroke
.68393 .04415 L
.68452 .04415 L
.68482 .04415 L
.68497 .04415 L
.68512 .04415 L
.68527 .04415 L
.68542 .01472 L
.68571 .01472 L
.6869 .01472 L
.6881 .01472 L
.68869 .01472 L
.68929 .01472 L
.68958 .01472 L
.68973 .01472 L
.68988 .01472 L
.69003 .10301 L
.69018 .10301 L
.69048 .10301 L
.69167 .10301 L
.69286 .10301 L
.69345 .10301 L
.69405 .10301 L
.69435 .10301 L
.69449 .10301 L
.69464 .10301 L
.69479 .01472 L
.69494 .01472 L
.69524 .01472 L
.69762 .01472 L
.7 .01472 L
.70119 .01472 L
.70238 .01472 L
.70298 .01472 L
.70327 .01472 L
.70357 .01472 L
.70372 .01472 L
.70387 .01472 L
.70402 .01472 L
.70417 .04415 L
.70446 .04415 L
.70476 .04415 L
.70595 .04415 L
.70714 .04415 L
.70774 .04415 L
.70804 .04415 L
.70833 .04415 L
.70848 .04415 L
.70863 .04415 L
.70878 .01472 L
.70893 .01472 L
Mistroke
.70923 .01472 L
.70952 .01472 L
.71429 .01472 L
.71905 .01472 L
.72381 .01472 L
.72857 .01472 L
.73333 .01472 L
.7381 .01472 L
.74286 .01472 L
.74762 .01472 L
.75238 .01472 L
.75714 .01472 L
.7619 .01472 L
.76667 .01472 L
.77143 .01472 L
.77619 .01472 L
.78095 .01472 L
.78571 .01472 L
.79048 .01472 L
.79524 .01472 L
.8 .01472 L
.80476 .01472 L
.80952 .01472 L
.81429 .01472 L
.81905 .01472 L
.82381 .01472 L
.82857 .01472 L
.83333 .01472 L
.8381 .01472 L
.84286 .01472 L
.84762 .01472 L
.85238 .01472 L
.85714 .01472 L
.8619 .01472 L
.86667 .01472 L
.87143 .01472 L
.87619 .01472 L
.88095 .01472 L
.88571 .01472 L
.89048 .01472 L
.89524 .01472 L
.9 .01472 L
.90476 .01472 L
.90952 .01472 L
.91429 .01472 L
.91905 .01472 L
.92381 .01472 L
.92857 .01472 L
.93333 .01472 L
.9381 .01472 L
Mistroke
.94286 .01472 L
.94762 .01472 L
.95238 .01472 L
.95714 .01472 L
.9619 .01472 L
.96667 .01472 L
.97143 .01472 L
.97619 .01472 L
Mfstroke
P
P
p
P
P
0 0 m
1 0 L
1 .61803 L
0 .61803 L
closepath
clip
newpath
% End of Graphics
MathPictureEnd

:[font = output; output; inactive; preserveAspect; endGroup; endGroup]
Graphics["<<>>"]
;[o]
-Graphics-
:[font = section; inactive; Cclosed; preserveAspect; startGroup]
Conclusion
:[font = text; inactive; preserveAspect; endGroup]
It is clear that the examples shown in this manual are not exhaustive. There are many possibilities for further analysis of the simulation results. Mathematica allows you to very quickly write functions for such purposes. If some of them turn out to execute too slowly, it is always possible to put their computation-intensive parts in a C routine. That way, you avoid both unnecessary long program coding and execution times, both of which must be considered when assessing the effectiveness of a program.
;[s]
5:0,0;148,1;159,2;406,3;409,4;506,-1;
5:1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,4,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = section; inactive; Cclosed; preserveAspect; startGroup]
Appendix A: File Structure
:[font = text; inactive; preserveAspect]
ChannelKinetics consists of the following files:
;[s]
2:0,0;15,1;48,-1;
2:1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = subsection; inactive; Cclosed; preserveAspect; startGroup]
Unix (Sun)
:[font = input; preserveAspect; plain; endGroup]
/usr/local/math/Packages/ChannelKinetics/ColquhounHawkes.m
/usr/local/math/Packages/ChannelKinetics/ColquhounHawkesMC.m
/usr/local/math/Packages/ChannelKinetics/DiagramToQMatrix.m
/usr/local/math/Packages/ChannelKinetics/NeuronInterface.m
/usr/local/math/Packages/ChannelKinetics/README.txt
/usr/local/math/Packages/ChannelKinetics/chmc
/usr/local/math/Packages/ChannelKinetics/chmc.tm       
;[s]
1:0,0;392,-1;
1:1,0,0 ,courier,0,10,0,0,0;
:[font = subsection; inactive; Cclosed; preserveAspect; startGroup]
MacOS (Macintosh)
:[font = input; preserveAspect; endGroup]
:Mathematica 2.2:Packages:ChannelKinetics:
   ColquhounHawkes.m
   ColquhounHawkesMC.m
   DiagramToQMatrix.m
   NeuronInterface.m
   README.txt
   chmc
   chmc Folder:
      chmc.\pi
      chmc.tm
      chmc.tm.c
      chmc.\pi.rsrc
      chmc
;[s]
1:0,0;243,-1;
1:1,0,0 ,courier,0,10,0,0,0;
:[font = subsection; inactive; Cclosed; preserveAspect; startGroup]
Microsoft Windows (PC)
:[font = input; preserveAspect; plain; endGroup; endGroup]
C:\WNMATH22\PACKAGES\CHANNELK\COLHAW.M
C:\WNMATH22\PACKAGES\CHANNELK\COLHAWMC.M
C:\WNMATH22\PACKAGES\CHANNELK\DIAGRAMT.M
C:\WNMATH22\PACKAGES\CHANNELK\NEURONIN.M
C:\WNMATH22\PACKAGES\CHANNELK\README.TXT
C:\WNMATH22\PACKAGES\CHANNELK\CHMC.EXE
C:\WNMATH22\PACKAGES\CHANNELK\CHMC.TM
C:\WNMATH22\PACKAGES\CHANNELK\CHMCTM.C
;[s]
1:0,0;318,-1;
1:1,0,0 ,courier,0,10,0,0,0;
:[font = section; inactive; Cclosed; preserveAspect; startGroup]
Appendix B: Building chmc
;[s]
3:0,0;21,1;25,2;25,-1;
3:1,0,0 ,times,1,18,0,0,0;1,0,0 ,Courier,1,18,0,0,0;1,0,0 ,times,1,18,0,0,0;
:[font = subsection; inactive; Cclosed; preserveAspect; startGroup]
Unix (Sun)
:[font = text; inactive; preserveAspect; endGroup]
Do a cd to the Packages directory. Then simply type mcc chmc.tm -o chmc -O. See the man page on mcc for more information. MathLink on Unix workstations is very easy to use. (It is much harder to compile chmc.tm on Macintosh or even Windows systems, but this is not my fault.)
;[s]
13:0,0;5,1;7,2;15,3;23,4;52,5;74,6;96,7;99,8;122,9;130,10;203,11;210,12;275,-1;
13:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = subsection; inactive; Cclosed; preserveAspect; startGroup]
MacOS (Macintosh)
:[font = text; inactive; preserveAspect; endGroup]
See the ReadMe Notebook in your MathLink directory. It describes the process of building MathLink programs for the Macintosh. Use 32-bit integers if possible. If you are using Think C, this also requires recompiling the ANSI library using the 32-bit integers option.
;[s]
5:0,0;32,1;40,2;89,3;97,4;266,-1;
5:1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
:[font = subsection; inactive; Cclosed; preserveAspect; startGroup]
Microsoft Windows (PC)
:[font = text; inactive; preserveAspect; endGroup; endGroup; endGroup]
See the file RELNOTES.WRI that comes with your MathLink for Windows Developer's Kit. Use the "large memory model". Be sure to proceed step by step as described in RELNOTES.WRI. Unfortunately, you can't use the MathLink Developer's Kit that came with Mathematica 2.2.3 for Windows since it has a bug - you need to use a post-2.2.3 MathLink for Windows Developer's Kit.
;[s]
13:0,0;13,1;25,2;47,3;55,4;163,5;175,6;210,7;218,8;250,9;261,10;330,11;338,12;367,-1;
13:1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,Courier,1,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;1,0,0 ,times,2,12,0,0,0;1,0,0 ,times,0,12,0,0,0;
^*)