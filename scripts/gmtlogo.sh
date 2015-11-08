#!/bin/bash
PS=gmtlogo.ps
gmt psxy -R0/1/0/1 -JX1c -T -K > $PS
gmtlogo 0 0 0.2 >> $PS
gmt psxy -R0/1/0/1 -JX1c -T -O >> $PS
rm gmt.*
