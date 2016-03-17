#!/bin/bash
#               GMT ANIMATION 02
#               $Id$
#
# Purpose:      Make web page with simple animated GIF of a DEM grid
# GMT progs:    gmt gmtset, gmt gmtmath, gmt grdgradient, gmt makecpt, gmt grdimage gmt psxy, gmt psconvert
# Unix progs:   awk, mkdir, rm, mv, echo, convert, cat
# Note:         Run with any argument to build movie; otherwise 1st frame is plotted only.
#
# 1. Initialization
# 1a) Assign movie parameters
. gmt_shell_functions.sh
width=3.5i
height=4.15i
dpi=72
n_frames=36
name=anim02
ps=${name}.ps
# 1b) setup
del_angle=`gmt gmtmath -Q 360 ${n_frames} DIV =`
gmt makecpt -Crainbow -T500/4500/5000 -Z > $$.cpt
# 2. Main loop
mkdir -p $$
frame=0
while [ ${frame} -lt ${n_frames} ]; do
	# Create file name using a name_##.tif format
	file=`gmt_set_framename ${name} ${frame}`
	angle=`gmt gmtmath -Q ${frame} ${del_angle} MUL =`
	dir=`gmt gmtmath -Q ${angle} 180 ADD =`
	gmt grdgradient us.nc -A${angle} -Nt2 -fg -G$$.us_int.nc
	gmt grdimage us.nc -I$$.us_int.nc -JM3i -P -K -C$$.cpt -BWSne -B1 -X0.35i -Y0.3i \
	--PS_MEDIA=${width}x${height} --FONT_ANNOT_PRIMARY=9p > $$.ps
	gmt psxy -Rus.nc -J -O -K -Sc0.8i -Gwhite -Wthin >> $$.ps <<< "256.25 35.6"
	gmt psxy -Rus.nc -J -O -Sv0.1i+e -Gred -Wthick >> $$.ps <<< "256.25 35.6 ${dir} 0.37"
	[[ ${frame} -eq 0 ]] && cp $$.ps ${ps}
	if [ $# -eq 0 ]; then
		gmt_cleanup .gmt
		gmt_abort "${0}: First frame plotted to ${name}.ps"
	fi
#	RIP to TIFF at specified dpi
	gmt psconvert -E${dpi} -Tt $$.ps
	mv -f $$.tif $$/${file}.tif
	echo "Frame ${file} completed"
	frame=`gmt_set_framenext ${frame}`
done
# 3. Create animated GIF file
convert -delay 10 -loop 0 $$/${name_}*.tif ${name}.gif

# 4. Clean up temporary files
gmt_cleanup .gmt
