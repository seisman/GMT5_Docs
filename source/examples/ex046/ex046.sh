#!/bin/bash
#
PS=ex046.ps
gmt gmtset GMT_COMPATIBILITY=5 MAP_FRAME_TYPE=plain
#
#  f(x,y,z) = sin(x+y)*e(-(x+y)*(3 - (z/1e4)))
#
# create base grid (z = 0)
#
gmt grdmath -R-75/-60/-50/-40 -I0.005 X D2R Y D2R ADD STO@xySum SIN @xySum \
    3 MUL NEG EXP MUL = base.nc
#
# create slice grid (lon = -67.5) (-47.5 <= lat <= 42.5)  (0 <= z <= 999)
#
gmt grdmath -R-47.5/-42.5/0/999 -I0.005/0.5 X D2R -67.5 D2R ADD STO@xySum SIN @xySum \
    3 Y 1E4 DIV SUB MUL NEG EXP MUL = slice.nc
#
# dump slice grid and reproject X
#
gmt grd2xyz slice.nc | awk '{print -67.5,$0}' | gmt mapproject -R-75/-60/-50/-40 -JM-67.5/-45/16 | \
    awk '{print $2,$3,$4}'> points.d
#
# calculate projected region X-limits
#
lMin=`echo '-67.5 -47.5' | gmt mapproject -R-75/-60/-50/-40 -JM-67.5/-45/16 | awk '{print $2}'`
lMax=`echo '-67.5 -42.5' | gmt mapproject -R-75/-60/-50/-40 -JM-67.5/-45/16 | awk '{print $2}'`
#
# re-grid slice
#
gmt surface points.d -Gslice_cut.nc -R$lMin/$lMax/0/999 -I1500+/2000+ -C0.1 -T0.25
#
# create CPT file
#
deltaZ=`gmt grdinfo -T10 slice_cut.nc base.nc`
gmt makecpt -Cseis -I $deltaZ -Z > colors.cpt
#
# make basemap (this is not necessary but...)
#
gmt psbasemap -R-75/-60/-50/-40/0/999 -JM-67.5/-45/16 -JZ8 -Bxa2f1 -Bya1f1 -Bza250f50g250+l"Km" \
    -BwESn+b -pz135/30+v10/5 -K > $PS
#
# plot base grid (z = 0)
#
gmt grdimage base.nc -R -JM -JZ -Bxa2f1 -Bya1f1 -Bza250f50g250+l"Km" -BwESn+b \
    -Ccolors.cpt -p -O -K >> $PS
#
# plot map (coast, country borders). Grid plotted to check slice location
#
gmt pscoast -R -JM -JZ -Bxa2f1g0.5 -Bya1f1g0.5 -Bza250f50g250+l"Km" -BwESn+b -Df -A0/0/1 \
    -N1/0.5p,black,-..- -W0.5p,black -p -O -K >> $PS
#
# calculate max X projected
#
xMax=`echo '-60 -40' | gmt mapproject -R-75/-60/-50/-40 -JM-67.5/-45/16 | awk '{print $2}'`
#
# plot slice
#
gmt grdimage slice_cut.nc -R0/$xMax/0/999 -JX15.0922064999/8 -Bxa0f0 -Bya250f50+l"Km" -Ccolors.cpt \
    -px135/30+v12.59/0.96 -O -K --MAP_FRAME_AXES='' >> $PS
#
# plot slice box
#
gmt psxy -R -JX -W1p,black -px135/30+v12.59/0.96 -O -K -L >> $PS << EOF
$lMin 0
$lMin 999
$lMax 999
$lMax 0
EOF
#
# add missing Z-box lines overwritten by slice plot
#
gmt psxyz -R-75/-60/-50/-40/0/999 -JM-67.5/-45/16 -JZ8 -W1p,black -pz135/30+v10/5 -O >> $PS << EOF
-75 -50 999
-75 -40 999
-60 -40 999
-60 -50 999
-75 -50 999
>
-60 -50 0
-60 -50 999
EOF
#
rm -f base.nc points.d slice.nc slice_cut.nc gmt.history gmt.conf
