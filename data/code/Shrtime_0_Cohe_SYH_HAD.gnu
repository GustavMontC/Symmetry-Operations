#!/usr/bin/gnuplot
# Author : Gustavo Montes-Cabrera
# Date   : 2025:w
#
#
# Follow the instructions below to compile
# 
# this command creates the '.tex' file
# > gnuplot Shrtime_0_Cohe_SYH_HAD.gnu
#
# this command compile every '.tex' file in the current folder
# > for i in *.tex; do pdflatex "$i"; done
#
# this command deletes files that are no longer needed
# > rm *.aux *.eps *eps-converted-to.pdf *.log
#
# Then, you will obtain the 'CoheSR_SYH0_HAD0.pdf' figure
#
#

  set term epslatex color colortext standalone 
  set output "CoheST_SYH0_HAD0.tex"

  set style line 1 lc rgb '#0072bd' pt 5  ps 2.0 lw 3 
  set style line 2 lc rgb '#edb120' pt 7  ps 2.0 lw 3 
  set style line 3 lc rgb '#7e2f8e' pt 11 ps 2.0 lw 3 
  set style line 4 lc rgb '#77ac30' pt 13 ps 2.0 lw 3 
  set style line 5 lc rgb '#4dbeee' pt 14 ps 2.0 lw 3 
  set style line 6 lt 7                   ps 2.0 lw 3

# Enable the use of macros
  set macros

# Placement of the a,b,c,d labels in the graphs
  POS = "at graph 0.75,0.9 font ',8'"

# Margins for each row resp. column
  TMARGIN  = "set tmargin at screen 0.90; set bmargin at screen 0.15"
  BMARGIN  = "set tmargin at screen 0.55; set bmargin at screen 0.20"
  LMARGIN  = "set lmargin at screen 0.15; set rmargin at screen 0.55"
  RMARGIN  = "set lmargin at screen 0.55; set rmargin at screen 0.95"

  T2MARGIN = "set tmargin at screen 0.90; set bmargin at screen 0.60"
  L2MARGIN = "set lmargin at screen 0.35; set rmargin at screen 0.55"
  R2MARGIN = "set lmargin at screen 0.75; set rmargin at screen 0.95"

# set object 1 rectangle from screen 0,0 to screen 1,1 fillcolor rgb '#E1EEF4' fillstyle solid noborder behind

# set tics nomirror out scale 1.5 

  set multiplot
# =============================================================================

#  set grid ytics 
  set grid noxtics
  set label 1 '$H_0$' at graph 0.12,0.15 #rotate by -6  font ',8'

  set ylabel '{\Large $C(t)/N^{\lambda}$}'
  set xlabel '{\Large $t/N$}'
  set log y

  set xtics(0,1,2,3,4,5,6)

  set format '$%g$'
  set format y '$10^{%T}$'

  set key bottom left

  f(x)  = alpha*exp(-x*beta)

  alpha = 1.75236;          beta = 0.0074         # 24k realization
# a1=5.2;   a2=2.85;  a3=2.075; a4=1.57; a5=1.235 # 18k realization
            a2=2.8 ;  a3=2.05 ; a4=1.57; a5=1.235 # 24k realization
  b1=0.265; b2=2.667; b3=1.98; b4=1.538; b5=1.235
# d = 2.25;    c = 0.0169794                      # 18k realization
  d = 0.000028; c = 1.3                      # 24k realization

# b1=0.265; b2=0.375; b3=0.50; b4=0.65; b5=0.81  exponent : 4.44 \pm 0.02

#                                                                         HAD-0 
# =============================================================================
  @TMARGIN; @LMARGIN
  unset label 2
  set origin 0.0,0.0
  set size 0.5, 1.0
  set xr[0.0:5]
  set yr[0.000001:0.00004]
  plot '../CoherenceScaling-ShortTimes/data1220spins/mIS00_12_0.000_24k.dat' u ($1/12):($5/((12**4.44))) w lp ls 2 t '', \
       '../CoherenceScaling-ShortTimes/data1220spins/mIS00_14_0.000_24k.dat' u ($1/14):($5/((14**4.44))) w lp ls 3 t '', \
       '../CoherenceScaling-ShortTimes/data1220spins/mIS00_16_0.000_24k.dat' u ($1/16):($5/((16**4.44))) w lp ls 4 t '', \
       '../CoherenceScaling-ShortTimes/data1220spins/mIS00_18_0.000_24k.dat' u ($1/18):($5/((18**4.44))) w lp ls 5 t '', \
       '../CoherenceScaling-ShortTimes/data1220spins/mIS00_20_0.000_24k.dat' u ($1/20):($5/((20**4.44))) w lp ls 6 t '', \
       d*exp(-x*c) w l lt -1 lw 4 t ''

#      '../Ndata/n20_HAD_0/mIS00_20_MCS_15_50_0.000_24k.dat'  u 1:5  w lp ls 6 t '', \
#      '../Ndata/n20_HAD_0/mIS00_20_MCS_50_100_0.000_24k.dat' u 1:5  w lp ls 6 t '', \

#                inset
# ====================
  @T2MARGIN; @L2MARGIN
  unset log
  unset grid
  unset label 1
  unset label 2
# set label 3 'HAD-0' @POS
  set object rectangle from graph 0,0 to graph 1,2 behind fillcolor rgb 'white' fillstyle solid noborder
  set format y '%2.0f'
  set xr[0:15]
  set yr[0:25]
  set ytics (0.0,10.0,20.0,30.0)
  set xtics (0.0,5,0,10.0)
  set ylabel '{\normalsize $C(t)$}'
  set xlabel '{\normalsize $t$}'
  set origin 0.2,0.7
  set size 0.5, 1.0

  plot '../CoherenceScaling-ShortTimes/data1220spins/mIS00_12_0.000_24k.dat' u 1:5 w p ls 2 t '', \
       '../CoherenceScaling-ShortTimes/data1220spins/mIS00_14_0.000_24k.dat' u 1:5 w p ls 3 t '', \
       '../CoherenceScaling-ShortTimes/data1220spins/mIS00_16_0.000_24k.dat' u 1:5 w p ls 4 t '', \
       '../CoherenceScaling-ShortTimes/data1220spins/mIS00_18_0.000_24k.dat' u 1:5 w p ls 5 t '', \
       '../CoherenceScaling-ShortTimes/data1220spins/mIS00_20_0.000_24k.dat' u 1:5 w p ls 6 t ''



# =============================================================================
#                                                                         SYH-0
# =============================================================================
  reset
  set style line 1 lc rgb '#0072bd' pt 5  ps 2.0 lw 3 
  set style line 2 lc rgb '#edb120' pt 7  ps 2.0 lw 3 
  set style line 3 lc rgb '#7e2f8e' pt 11 ps 2.0 lw 3 
  set style line 4 lc rgb '#77ac30' pt 13 ps 2.0 lw 3 
  set style line 5 lc rgb '#4dbeee' pt 14 ps 2.0 lw 3 
  set style line 6 lt 7                   ps 2.0 lw 3

# Enable the use of macros
  set macros

# Placement of the a,b,c,d labels in the graphs
  POS = "at graph 0.75,0.9 font ',8'"

# Margins for each row resp. column
  TMARGIN  = "set tmargin at screen 0.90; set bmargin at screen 0.15"
  BMARGIN  = "set tmargin at screen 0.55; set bmargin at screen 0.20"
  LMARGIN  = "set lmargin at screen 0.15; set rmargin at screen 0.55"
  RMARGIN  = "set lmargin at screen 0.55; set rmargin at screen 0.95"

  T2MARGIN = "set tmargin at screen 0.90; set bmargin at screen 0.60"
  L2MARGIN = "set lmargin at screen 0.35; set rmargin at screen 0.55"
  R2MARGIN = "set lmargin at screen 0.75; set rmargin at screen 0.95"


  @TMARGIN; @RMARGIN
  set label 2 '$S_0$' at graph 0.65,0.3 #rotate by -11 font ',8'
# unset label 1
  unset ylabel
  set log y
  set format y ''

#  set grid 
  set grid noxtics
  set xr[0.0:5]
  set yr[0.000001:0.00004]

  set xtics (1,2,3,4,5)
# set ytics (1 " ",10 " ")
# set mytics 10

# set format '$%g$'
# set format y '$10^{%T}$'

  set xlabel '{\Large $t/N$}'

  set origin 0.5,0.0
  set size 0.5, 1.0

	#exponent : 4.44 \pm 0.02

  d = 0.000041; c = 2.5 

  plot '../CoherenceScaling-ShortTimes/data1220spins/SYH/mIS00_12_0.000_24k.dat' u ($1/12):($5/((12**4.44))) w lp ls 2   t '', \
       '../CoherenceScaling-ShortTimes/data1220spins/SYH/mIS00_14_0.000_24k.dat' u ($1/14):($5/((14**4.44))) w lp ls 3   t '', \
       '../CoherenceScaling-ShortTimes/data1220spins/SYH/mIS00_16_0.000_24k.dat' u ($1/16):($5/((16**4.44))) w lp ls 4   t '', \
       '../CoherenceScaling-ShortTimes/data1220spins/SYH/mIS00_18_0.000_24k.dat' u ($1/18):($5/((18**4.44))) w lp ls 5   t '', \
       '../CoherenceScaling-ShortTimes/data1220spins/SYH/mIS00_20_0.000_24k.dat' u ($1/20):($5/((20**4.44))) w lp ls 6   t '', \
       d*exp(-x*c) w l lt -1 lw 4 t ''

#                inset
# ====================
  @T2MARGIN; @R2MARGIN
  unset log
  unset grid
  unset label 2

# set label 3 'SYH-0' @POS
# set format y ''
  set object rectangle from graph 0,0 to graph 1,2 behind fillcolor rgb 'white' fillstyle solid noborder
  set format y '%2.0f'
  set xr[0:15]
  set yr[0:25]
  set ytics (0.0,10.0,20.0,30.0)
  set xtics (0.0,5,0,10.0)
  set ylabel '$C(t)$'
  set xlabel '{\normalsize $t$}'
  set origin 0.7,0.7
  set size 0.3, 0.3
  plot '../CoherenceScaling-ShortTimes/data1220spins/SYH/mIS00_12_0.000_24k.dat' u 1:5 w p ls 2 t '', \
       '../CoherenceScaling-ShortTimes/data1220spins/SYH/mIS00_14_0.000_24k.dat' u 1:5 w p ls 3 t '', \
       '../CoherenceScaling-ShortTimes/data1220spins/SYH/mIS00_16_0.000_24k.dat' u 1:5 w p ls 4 t '', \
       '../CoherenceScaling-ShortTimes/data1220spins/SYH/mIS00_18_0.000_24k.dat' u 1:5 w p ls 5 t '', \
       '../CoherenceScaling-ShortTimes/data1220spins/SYH/mIS00_20_0.000_24k.dat' u 1:5 w p ls 6 t ''

  unset multiplot






