#!/bin/bash
PS=GMT_pens.ps
R=-0.25/16/-0.5/1.5
J=X15c/2c
line=lines.txt

cat << EOF > $line
0       0
10       0
EOF

gmt psxy -R$R -J$J -P -K -T > $PS

for pen in -W0.5p -Wgreen -Wthin,red,- -Wfat,. -W0.1c,120-1-1 -Wfaint,0/0/255,..- -W4p,red,9_4_2_4:2p
do
    gmt psxy $line -R -J -K -O -Y0.5c $pen >> $PS
    echo 10.5 0 $pen | gmt pstext -R -J -F+jML+f12p,8 -K -O >> $PS
done
gmt psxy -R -J -O -T >> $PS

rm lines.txt gmt.history
