#!/usr/bin/gnuplot
#
# Author: Gustavo Montes-Cabrera
# Year  : 2025
#
#

  set term epslatex color colortext standalone 
  set output "CoheSR_HAD0.tex"

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

# set grid ytics 
  set grid noxtics
  set label 1 '$H_0$' at graph 0.2,0.15 #rotate by -6  font ',8'

  set ylabel '{\Large $C(t)/N^{\alpha}$}'
  set xlabel '{\Large $t/N^{\alpha}$}'
  set log y

  set xr[0.00 :0.25]
  set yr[0.001:0.1 ]

  set xtics(0,0.05,0.1,0.15,0.2)

  set format '$%g$'
  set format y '$10^{%T}$'

  set key bottom left


#                                                                         HAD-0 
# =============================================================================
  @TMARGIN; @LMARGIN
  unset label 2
  set origin 0.0,0.0
  set size 0.5, 1.0

  alp = 2.0
  a12 = 12**alp
  a14 = 14**alp
  a16 = 16**alp
  a18 = 18**alp
  a20 = 20**alp

# Final set of parameters            Asymptotic Standard Error
# =======================            ==========================
# c1              = 0.00443327       +/- 2.147e-05    (0.4844%)
# c2              = 3.01816          +/- 0.02627      (0.8704%)

  f(x)  = c1*exp(-x*c2)
  c1 = 0.00443327; c2 = 3.01816

  plot '../CoherenceScaling-LongTimes/HAD/mIS00_12_0.000_24k.dat' u ($1/a12):($5/a12) w lp ls 2 t '', \
       '../CoherenceScaling-LongTimes/HAD/mIS00_14_0.000_24k.dat' u ($1/a14):($5/a14) w lp ls 3 t '', \
       '../CoherenceScaling-LongTimes/HAD/mIS00_16_0.000_24k.dat' u ($1/a16):($5/a16) w lp ls 4 t '', \
       '../CoherenceScaling-LongTimes/HAD/mIS00_18_0.000_24k.dat' u ($1/a18):($5/a18) w lp ls 5 t '', \
       '../CoherenceScaling-LongTimes/HAD/mIS00_20_0.000_24k.dat' u ($1/a20):($5/a20) w lp ls 6 t '', \
       f(x) w l lc -1 lw 4 t ''


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
  set xr[30:62]
  set yr[0:2.1]

  set ytics (0.0,1.0,2.0.0,3.0,4.0)
  set xtics (30.0,40.0,50.0,60.0)
  set ylabel '{\normalsize $C(t)$}'
  set xlabel '{\normalsize $t$}'
  set origin 0.2,0.7
  set size 0.5, 1.0
  plot '../CoherenceScaling-LongTimes/HAD/mIS00_12_0.000_24k.dat' u 1:5 w p ls 2 t '', \
       '../CoherenceScaling-LongTimes/HAD/mIS00_14_0.000_24k.dat' u 1:5 w p ls 3 t '', \
       '../CoherenceScaling-LongTimes/HAD/mIS00_16_0.000_24k.dat' u 1:5 w p ls 4 t '', \
       '../CoherenceScaling-LongTimes/HAD/mIS00_18_0.000_24k.dat' u 1:5 w p ls 5 t '', \
       '../CoherenceScaling-LongTimes/HAD/mIS00_20_0.000_24k.dat' u 1:5 w p lt 7 t ''



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
  set label 2 '$S_0$' at graph 0.2,0.15 #rotate by -11 font ',8'
# unset label 1
  unset ylabel
  set log y
  set format y ''

# set grid 
  set grid noxtics
  set xr[0.0  :0.25]
  set yr[0.001:0.1 ]

  set xtics(0,0.05,0.1,0.15,0.2,0.25)

  set xlabel '{\Large $t/N^{\alpha}$}'

  set origin 0.5,0.0
  set size 0.5, 1.0

  alp = 1.91
  a12 = 12**alp
  a14 = 14**alp
  a16 = 16**alp
  a18 = 18**alp
  a20 = 20**alp

# Final set of parameters            Asymptotic Standard Error
# =======================            ==========================
# d1              = 0.00643562       +/- 2.641e-05    (0.4104%)
# d2              = 5.23628          +/- 0.02863      (0.5468%)

  g(x)  = d1*exp(-x*d2)
  d1 = 0.00643562; d2 = 5.23628

  plot '../CoherenceScaling-LongTimes/SYH/mIS00_12_0.000_24k.dat' u ($1/a12):($5/a12) w lp ls 2 t '', \
       '../CoherenceScaling-LongTimes/SYH/mIS00_14_0.000_24k.dat' u ($1/a14):($5/a14) w lp ls 3 t '', \
       '../CoherenceScaling-LongTimes/SYH/mIS00_16_0.000_24k.dat' u ($1/a16):($5/a16) w lp ls 4 t '', \
       '../CoherenceScaling-LongTimes/SYH/mIS00_18_0.000_24k.dat' u ($1/a18):($5/a18) w lp ls 5 t '', \
       '../CoherenceScaling-LongTimes/SYH/mIS00_20_0.000_24k.dat' u ($1/a20):($5/a20) w lp ls 6 t '', \
       g(x) w l lt -1 lw 4 t ''


#                inset
# ====================
  @T2MARGIN; @R2MARGIN
  unset log
  unset grid
  unset label 2

# set format y ''
  set object rectangle from graph 0,0 to graph 1,2 behind fillcolor rgb 'white' fillstyle solid noborder
  set format y '%2.0f'
  set xr[30:62]
  set yr[0:2.1]
  set ytics (0.0,1.0,2.0)
  set xtics (30.0,40.0,50.0,60.0)
  set ylabel '$C(t)$'
  set xlabel '{\normalsize $t$}'
  set origin 0.7,0.7
  set size 0.3, 0.3
  plot '../CoherenceScaling-LongTimes/SYH/mIS00_12_0.000_24k.dat' u 1:5 w p ls 2 t '', \
       '../CoherenceScaling-LongTimes/SYH/mIS00_14_0.000_24k.dat' u 1:5 w p ls 3 t '', \
       '../CoherenceScaling-LongTimes/SYH/mIS00_16_0.000_24k.dat' u 1:5 w p ls 4 t '', \
       '../CoherenceScaling-LongTimes/SYH/mIS00_18_0.000_24k.dat' u 1:5 w p ls 5 t '', \
       '../CoherenceScaling-LongTimes/SYH/mIS00_20_0.000_24k.dat' u 1:5 w p lt 7 t ''

  unset multiplot






