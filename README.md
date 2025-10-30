# Symmetry-Operations
Data files for "Symmetry operations and Critical Behaviour in Classical to Quantum Stochastic Processes" https://arxiv.org/pdf/2409.09277

# Info
This repository includes the data files (*.txt) and gnuplot scripts (*.gnu) to reproduce the figures presented in the paper “Symmetry Operations and Critical Behaviour in Classical to Quantum Stochastic Processes.”

# Instruccions
Download `/data` directory and open your favorite `term` in `/data/code` then type the following commands
```bash
gnuplot Observables-12S.gnu
gnuplot MIS00_0_Cohe_HAD.gnu
gnuplot Shrtime_0_Cohe_SYH_HAD.gnu
```
this process creates the `.tex` files. Now you can compile with the standard `pdflatex` 
```bash
for i in *.tex; do pdflatex "$i"; done
```
Finally you can remove the unnecessary files
```bash
rm *.tex *-to.pdf *.eps *.aux *.log
```

Tasted using `Ubuntu 24.04` `GNUPLOT 6.0 patchlevel 0` and `Tex Live version 2023` .


# LICENSE
The data files in this repository (all files in the /data directory) are dedicated to the public domain under the Creative Commons Zero (CC0 1.0) Public Domain Dedication. The user is expected to cite the associated journal article [[https://arxiv.org/pdf/2409.09277]] as a matter of scientific best practice.

# CODE_LICENSE
All source code and scripts in this repository (all files in the /code directory) are released under the MIT License.
