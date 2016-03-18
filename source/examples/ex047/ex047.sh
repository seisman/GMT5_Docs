#!/bin/bash
#   绘制震源机制分布图，震级控制震源球大小，深度控制震源球颜色
#
# GMT模块 : psxy, psbasemap, pscoast, psmeca, psscale
# Unix命令: rm
# 作者：王亮@GLUT

J=Q104/15c
R=102.5/105.5/30/33
PS=ex047.ps
CPT="meca.cpt"

cat > $CPT << EOF
# COLOR_MODEL = hsv
 0   0-1-1   20   0-1-1
20  60-1-1   40  60-1-1
40 120-1-1   60 120-1-1
60 240-1-1  100 240-1-1
B 0-0-0
F 0-0-0
N 0-0-0
EOF

gmt psxy -J$J -R$R -P -T -K > $PS

gmt psbasemap -J -R -B1 -BWSen -K -O >> $PS
gmt pscoast -J -R -A0/0/4 -Da -EAS -Ia/0.05,blue -W1/0.15p,blue, -K -O >> $PS
gmt psmeca -J -R -C -Sa1.3c -Z$CPT -K -O >> $PS << EOF
104.3300  31.90  39.8  32.00 64.00   85.00  7 0 0 A
104  31.52  27.1  22.00 53.00   57.00  6 0 0 B
103.6700  31.1300  6.4  86.00 32.00  -65.00  8 0 0 C
103.900  31.3400  43.6 194.00 84.00  179.00  4.9 104.180  30.8400 D
103.7200  31.4400  67.3  73.00 84.00 -162.00  4.9 103.1200  31.6400 E
104.1200  31.7800  12.7 186.00 68.00  107.00  4.7 103.8300  32.2600 F
104.2300  31.6100  62.0  86.00 63.00  -51.00  4.7 104.9600  31.6900 G
EOF

gmt psxy -J -R -Sc0.25c -W1p,black,solid -K -O >> $PS << EOF
103.9000  31.3400
103.7200  31.4400
104.1200  31.7800
104.2300  31.6100
EOF
gmt psxy -J -R -Sc0.05c -Gblack -W0.5p,black,solid -K -O >> $PS << EOF
103.9000  31.3400
103.7200  31.4400
104.1200  31.7800
104.2300  31.6100
EOF

gmt psscale -C$CPT -Dx12.7c/5.5c+w5c/0.5c+jTC -Bx+l"Depth" -By+lkm -S -K -O >> $PS
gmt psxy -J -R -T -O >> $PS
rm gmt.* $CPT
