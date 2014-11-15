#!/bin/bash
#	$Id$
#
#	Makes the octal code charts in Appendix F for ISO and Standard
#
# To show both ISOLatin1+ and Standard+ on the same figure we must
# make them separately then rasterize them and then plot those images
# since we cannot have two different character sets active in one PS.
# This script assumes GMT_App_F_stand+.sh and GMT_App_F_iso+.sh have
# both been run previously.

sh GMT_stand+.sh GMT_iso+.sh
gmt ps2raster -Te -P -A -D. GMT_stand+.ps
gmt ps2raster -Te -P -A -D. GMT_iso+.ps
gmt psimage GMT_stand+.eps -W3i -P -K > GMT_stand+_iso+.ps
gmt psimage GMT_iso+.eps -W3i -O -X3.2i >> GMT_stand+_iso+.ps
rm GMT_stand+.eps GMT_iso+.eps
