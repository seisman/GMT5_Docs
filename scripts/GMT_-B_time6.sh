#!/bin/bash
#	$Id: GMT_-B_time6.sh 11490 2013-05-16 06:26:21Z pwessel $
#
gmt gmtset FORMAT_DATE_MAP "o yy" FORMAT_TIME_PRIMARY_MAP Abbreviated
gmt psbasemap -R1996T/1996-6T/0/1 -JX5i/0.2i -Ba1Of1d -BS -P > GMT_-B_time6.ps
