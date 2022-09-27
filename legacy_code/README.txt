Tue Dec  6 15:01:41 MET 1994
README.txt

Author: Arnd Roth
        Abteilung Zellphysiologie
        Max-Planck-Institut fuer Medizinische Forschung
        Postfach 10 38 20, D-69028 Heidelberg, Germany
        roth@sunny.mpimf-heidelberg.mpg.de

The Mathematica Packages in this directory implement parts of
"Relaxation and fluctuations of membrane currents that flow through
drug-operated channels" by D. Colquhoun & A.G. Hawkes,
Proc. R. Soc. Lond. B 199, 231-262 (1977). Assuming a discrete state,
continuous time Markov model for the behavior of ligand-gated
ion channels, and given the transition rate constants between these
states, the time evolution of their occupancy can be computed. This
occupancy is then used to predict observables like the mean trans-
membrane current and its coefficient of variation.


"README.txt": this file.


"DiagramToQMatrix.m" builds the Q-matrix from a transition diagram,
prompting for nonzero transition rate constants. It automatically
checks cyclic diagrams for microscopical reversibility.


"ColquhounHawkes.m" contains various functions for

- computing the occupancy of the different states of a channel using
  the Runge-Kutta algorithm, which allows for arbitrary transmitter
  concentration functions of time,

- for plotting the mean current as a function of time,
- its variance and third central moment,
- and for computing the 20%/80% risetime of the current.


"ColquhounHawkesMC.m" is an analog of "ColquhounHawkes.m" based on
Monte Carlo simulation of the channel state transitions. It is
restricted to square pulse transmitter concentration functions.

Additionally, it contains a function that simulates experiments for
determinimg the peak EPSC amplitude distribution for an ensemble of
channels. This includes the effects of gaussian lowpass filtering
and averaging over a certain interval of time during the peak.

The most recent version of ColquhounHawkesMC, version 1.2, installs
and uses some C routines collected in the file "chmc". This file is
assumed to reside in the same directory as ColquhounHawkesMC, as
specified in Appendix A of the manual. If this is not possible on
certain computer systems, you can install "chmc" manually before
you load the package.
Alternatively, you might want to change the Package's Mathematica
code portion that is responsible for installing the C routines. It is
located directly below the definition of the error messages for the
exported functions.
For information on how to build "chmc" from "chmc.tm", please see
Appendix B of the "Manual.ma" Notebook. The file "chmc.tm" has been
updated to be MathLink compatible on Unix, Macintosh and Microsoft
Windows.


"NeuronInterface.m" provides two functions, WriteNeuronForm[]
and WriteDoubleForm[]. They constitute an interface for transferring
tabulated functions from Mathematica to Neuron and Double. Neuron is
described in "A program for simulation of nerve equations with
branching geometries" by M. Hines, Int. J. of Biomed. Computing 24,
55-68 (1989).


For more information please see the manual Notebook, "Manual.ma".


Further reading:
1) B. Hille, Ionic Channels of Excitable Membranes, 2nd ed., Sinauer,
Sunderland, Mass., 1992.
2) B. Sakmann and E. Neher, Eds. Single-Channel Recording, Plenum,
New York, 1983.
3) D. Johnston and S. M.-S. Wu, Foundations of Cellular Neurophysiology,
MIT Press, Cambridge, Mass., 1995.
