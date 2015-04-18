#!/bin/bash
#	$Id: GMT_-B_time1.sh 11490 2013-05-16 06:26:21Z pwessel $
#
gmt gmtset FORMAT_DATE_MAP=-o FONT_ANNOT_PRIMARY +9p
gmt psbasemap -R2000-4-1T/2000-5-25T/0/1 -JX5i/0.2i -Bpa7Rf1d -Bsa1O -BS -P > GMT_-B_time1.ps
