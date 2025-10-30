#!/usr/bin/gnuplot 
#
# Adapted from: https://www.sciencetronics.com/greenphotons/?p=570
#
# Move the script 'Observables-12S.gnu' to '/data/Observables/fig/'  
# To create the pdf file use the following commands in your linux term
# $ gnuplot Observables-12S.gnu
# $ pdflatex Observables-12S.tex
#

mpl_top    = 0.3 #inch  outer top margin, title goes here
mpl_bot    = 0.6 #inch  outer bottom margin, x label goes here
mpl_left   = 0.7 #inch  outer left margin, y label goes here
mpl_right  = 1.8 #inch  outer right margin, y2 label goes here
mpl_height = 1.5 #inch  height of individual plots
mpl_width  = 2.4 #inch  width of individual plots
mpl_dx     = 0.7 #inch  inter-plot horizontal spacing
mpl_dy     = 0.4 #inch  inter-plot vertical spacing
mpl_ny     = 2   #number of rows
mpl_nx     = 2   #number of columns

# calculate full dimensions
# =============================================================================
xsize = mpl_left + mpl_right + (mpl_width  * mpl_nx) + (mpl_nx-1) * mpl_dx
ysize = mpl_top  + mpl_bot   + (mpl_height * mpl_ny) + (mpl_ny-1) * mpl_dy

# placement functions
# =============================================================================
#   rows are numbered from bottom to top
# -----------------------------------------------------------------------------
bot(n) =     ( mpl_bot + (n-1)*mpl_height + (n-1)*mpl_dy )   / ysize
top(n) = 1 - ( (mpl_top + (mpl_ny-n)*(mpl_height + mpl_dy) ) / ysize )

#   columns are numbered from left to right
# -----------------------------------------------------------------------------
left (n) =     ( mpl_left + (n-1)*mpl_width + (n-1)*mpl_dx )    / xsize
right(n) = 1 - ( (mpl_right + (mpl_nx-n)*(mpl_width + mpl_dx) ) / xsize )


# Output file
# =============================================================================
  set terminal epslatex color colortext size xsize,ysize standalone header \
  '\usepackage{dsfont}'.\
  '\usepackage{amsmath}'.\
  '\usepackage{bbold}'.\
  '\newcommand{\hl}[1]{\setlength{\fboxsep}{0.75pt}\colorbox{white}{#1}}'
# set encoding iso_8859_1
  set tics scale 1.5
  
  set output 'Observables-12S.tex' 

# =============================================================================
  set offsets
  set autoscale fix
  set size 1,1
  set nokey

# set border 3
# set tics nomirror out

# load data files 
# -----------------------------------------------------------------------------
  F00 = '../Observables/id_H/IS_mixture_nqb_12.dat'
  F01 = '../Observables/id_Hx/IS_mixture_nqb_12.dat'
  F04 = '../Observables/sx_H/IS_mixture_nqb_12.dat'
  F05 = '../Observables/sx_Hx/IS_mixture_nqb_12.dat'
  F08 = '../Observables/isy_H/IS_mixture_nqb_12.dat'
  F09 = '../Observables/isy_Hx/IS_mixture_nqb_12.dat'
  F12 = '../Observables/sz_H/IS_mixture_nqb_12.dat'
  F13 = '../Observables/sz_Hx/IS_mixture_nqb_12.dat'

  F16 = '../Observables/H_H/IS_mixture_nqb_12.dat'
  F17 = '../Observables/H_Hx/IS_mixture_nqb_12.dat'
  F20 = '../Observables/Hx_H/IS_mixture_nqb_12.dat'
  F21 = '../Observables/Hx_Hx/IS_mixture_nqb_12.dat'
  F24 = '../Observables/xH_H/IS_mixture_nqb_12.dat'
  F25 = '../Observables/xH_Hx/IS_mixture_nqb_12.dat'
  F28 = '../Observables/xHx_H/IS_mixture_nqb_12.dat'
  F29 = '../Observables/xHx_Hx/IS_mixture_nqb_12.dat'

  F32 = '../Observables/GRVR/IS_mixture_nqb_12.dat'


  Nsp = 12 # number of spins

#                                                       start multiplot section
  set multiplot # =============================================================

# First row
# subplot 2-1
# -----------------------------------------------------------------------------
# set horizontal margins for first column (left)
  set lmargin at screen left (1)
  set rmargin at screen right(1)

# set horizontal margins for third row (top)
  set tmargin at screen top(2)
  set bmargin at screen bot(2)

  set label 1 at graph 0.05, graph 0.9  '(a)'

  set ylabel 'Probability of equilibrium'
  set xlabel ''

  set xrange[0:40]
  set yrange[0:1]


  plot F00 u ($1/Nsp):6 w l      lc 1 lw 4          t '',\
       F04 u ($1/Nsp):6 w l      lc 2 lw 2          t '',\
       F08 u ($1/Nsp):6 w l      lc 3 lw 2          t '',\
       F12 u ($1/Nsp):6 w l      lc 4 lw 2          t '',\
       F16 u ($1/Nsp):6 w l      lc 5 lw 2          t '',\
       F24 u ($1/Nsp):6 w l      lc 7 lw 2          t '',\
       F32 u ($1/Nsp):6 every 12 w p pt 7 lc 5 lw 1 t '',\
       F25 u ($1/Nsp):6 w l dt 3 lc 7 lw 3          t '',\
       F17 u ($1/Nsp):6 w l dt 5 lc 5 lw 3          t '',\
       F13 u ($1/Nsp):6 w l dt 2 lc 4 lw 3          t '',\
       F09 u ($1/Nsp):6 w l dt 3 lc 3 lw 3          t '',\
       F05 u ($1/Nsp):6 w l dt 4 lc 2 lw 3          t '',\
       F01 u ($1/Nsp):6 w l dt 5 lc 1 lw 4          t ''
 


# subplot 2-2
# -----------------------------------------------------------------------------
# set horizontal margins for first column (left)
  set lmargin at screen left (2)
  set rmargin at screen right(2)

# set horizontal margins for third row (top)
  set tmargin at screen top(2)
  set bmargin at screen bot(2)


  set label 1 at graph 0.05, graph 0.9  '(c)'

  set ylabel 'Purity'

  set yrange[0:0.5]

  set key at screen 0.99, 0.745

  plot F00 u ($1/Nsp):4 w l      lc 1 lw 4          t '$\mathbb{1}\otimes H$',\
       F04 u ($1/Nsp):4 w l      lc 2 lw 2          t '$\sigma_x\otimes H$',\
       F08 u ($1/Nsp):4 w l      lc 3 lw 2          t '$i\sigma_y\otimes H$',\
       F12 u ($1/Nsp):4 w l      lc 4 lw 2          t '$\sigma_z\otimes H$',\
       F16 u ($1/Nsp):4 w l      lc 5 lw 2          t '$H\otimes H$',\
       F24 u ($1/Nsp):4 w l      lc 7 lw 2          t '$\sigma_xH\otimes H$',\
       F32 u ($1/Nsp):4 every 12 w p pt 7 lc 5 lw 1 t 'Classical',\
       F25 u ($1/Nsp):4 w l dt 3 lc 7 lw 3          t '',\
       F17 u ($1/Nsp):4 w l dt 5 lc 5 lw 3          t '',\
       F13 u ($1/Nsp):4 w l dt 2 lc 4 lw 3          t '',\
       F09 u ($1/Nsp):4 w l dt 3 lc 3 lw 3          t '',\
       F05 u ($1/Nsp):4 w l dt 4 lc 2 lw 3          t '',\
       F01 u ($1/Nsp):4 w l dt 5 lc 1 lw 4          t ''
 


# Second row
# subplot 1-1
# -----------------------------------------------------------------------------
# set horizontal margins for first column (left)
  set lmargin at screen left (1)
  set rmargin at screen right(1)

# set horizontal margins for third row (top)
  set tmargin at screen top(1)
  set bmargin at screen bot(1)

  set log
  set xrange[1:40]
  set yrange[0.1:4]
 
  set label 1 at graph 0.05, graph 0.8  '(b)'

  set ylabel 'Average of domain walls'
  set xlabel '$t$ [MCS]'

  unset key

  plot F00 u ($1/Nsp):3 w l      lc 1 lw 4          t '',\
       F04 u ($1/Nsp):3 w l      lc 2 lw 2          t '',\
       F08 u ($1/Nsp):3 w l      lc 3 lw 2          t '',\
       F12 u ($1/Nsp):3 w l      lc 4 lw 2          t '',\
       F16 u ($1/Nsp):3 w l      lc 5 lw 2          t '',\
       F24 u ($1/Nsp):3 w l      lc 7 lw 2          t '',\
       F32 u ($1/Nsp):3 every 12 w p pt 7 lc 5 lw 1 t '',\
       F25 u ($1/Nsp):3 w l dt 3 lc 7 lw 3          t '',\
       F17 u ($1/Nsp):3 w l dt 5 lc 5 lw 3          t '',\
       F13 u ($1/Nsp):3 w l dt 2 lc 4 lw 3          t '',\
       F09 u ($1/Nsp):3 w l dt 3 lc 3 lw 3          t '',\
       F05 u ($1/Nsp):3 w l dt 4 lc 2 lw 3          t '',\
       F01 u ($1/Nsp):3 w l dt 5 lc 1 lw 4          t ''
 


# First row
# subplot 1-2
# -----------------------------------------------------------------------------
# set horizontal margins for first column (left)
  set lmargin at screen left (2)
  set rmargin at screen right(2)

# set horizontal margins for third row (top)
  set tmargin at screen top(1)
  set bmargin at screen bot(1)

  set label 1 at graph 0.05, graph 0.9  '(d)'

  set ylabel 'Coherence'

  unset log

  set key outside  right 

  set xrange[0:40]
  set yrange[0:0.8]

  plot F00 u ($1/Nsp):5 w l      lc 1 lw 4          t '',\
       F04 u ($1/Nsp):5 w l      lc 2 lw 2          t '',\
       F08 u ($1/Nsp):5 w l      lc 3 lw 2          t '',\
       F12 u ($1/Nsp):5 w l      lc 4 lw 2          t '',\
       F16 u ($1/Nsp):5 w l      lc 5 lw 2          t '',\
       F24 u ($1/Nsp):5 w l      lc 7 lw 2          t '',\
       F32 u ($1/Nsp):5 every 12 w p pt 7 lc 5 lw 1 t '',\
       F25 u ($1/Nsp):5 w l dt 3 lc 7 lw 3          t '$\sigma_xH\otimes H\sigma_x$',\
       F17 u ($1/Nsp):5 w l dt 5 lc 5 lw 3          t '$H\otimes H\sigma_x$',\
       F13 u ($1/Nsp):5 w l dt 2 lc 4 lw 3          t '$\sigma_z\otimes H\sigma_x$',\
       F09 u ($1/Nsp):5 w l dt 3 lc 3 lw 3          t '$i\sigma_y\otimes H\sigma_x$',\
       F05 u ($1/Nsp):5 w l dt 4 lc 2 lw 3          t '$\sigma_x\otimes H\sigma_x$',\
       F01 u ($1/Nsp):5 w l dt 5 lc 1 lw 4          t '$\mathbb{1}\otimes H\sigma_x$'
 



#####
#####
  unset multiplot
