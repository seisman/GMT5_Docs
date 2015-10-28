#!/bin/bash
PS=gmtlogo.ps
gmt psxy -R0/1/0/1 -JX1c -T -K > $PS
gmtlogo 0 0 0.2 >> $PS
gmt psxy -R0/1/0/1 -JX1c -T -O >> $PS
gmt ps2raster -A -P -TG -E600 $PS
rm gmt.*
