#!/bin/bash
#   绘制震源机制分布图，震级控制震源球大小，深度控制震源球颜色
#
# GMT模块 : psxy, psbasemap, pscoast, psmeca, psscale
# Unix命令: rm
# 作者    : 王亮@GLUT
# 日期    : 2016-03-18

J=Q104/15c
R=102.5/105.5/30.5/32.5
PS=ex047.ps
CPT=meca.cpt

gmt psbasemap -J$J -R$R -B1 -BWSen -P -K > $PS
gmt pscoast -J -R -Da -Ia/0.05,black -K -O >> $PS
gmt psmeca -J -R -CP5p -Sa1.3c -Z$CPT -K -O >> $PS << EOF
# 经度 纬度 深度(km) strike dip rake 震级 newX newY ID
104.3300  31.90    39.8  32.00 64.00   85.00  7.0 0        0       A
104       31.52    27.1  22.00 53.00   57.00  6.0 0        0       B
103.6700  31.1300   6.4  86.00 32.00  -65.00  8.0 0        0       C
103.900   31.3400  43.6 194.00 84.00  179.00  4.9 104.180  30.8400 D
103.7200  31.4400  67.3  73.00 84.00 -162.00  4.9 103.120  31.6400 E
104.1200  31.7800  12.7 186.00 68.00  107.00  4.7 103.830  32.2600 F
104.2300  31.6100  62.0  86.00 63.00  -51.00  4.7 104.960  31.6900 G
EOF

gmt psscale -J -R -C$CPT -DjBL+w5c/0.5c+ml+o0.8c/0.4c -Bx+lDepth -By+lkm -L -S -K -O >> $PS
gmt psxy -J -R -T -O >> $PS
rm gmt.*
