#!/bin/bash
#	$Id: GMT_-B_time4.sh 11490 2013-05-16 06:26:21Z pwessel $
#
gmt gmtset FORMAT_CLOCK_MAP=-hham FONT_ANNOT_PRIMARY +9p TIME_UNIT d
gmt psbasemap -R0.2t/0.35t/0/1 -JX-5i/0.2i -Bpa15mf5m -Bsa1H -BS -P > GMT_-B_time4.ps
