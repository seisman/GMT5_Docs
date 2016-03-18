#!/bin/bash
PS=gmtlogo.ps
gmt logo -Dx0/0+w5.458i -P -X0 -Y0 > $PS
rm gmt.*
