#!/bin/bash
PS=psbasemap_ex2.ps
gmt psbasemap -R90/110/30/40 -JM10c -Bx5 -By5 -T100/35/3c:w,e,s,n:  -K > $PS
gmt psbasemap -R90/110/30/40 -JM10c -Bx5 -By5 -Tf100/35/3c/2:w,e,s,*: -O -X13c >> $PS
rm gmt.*
