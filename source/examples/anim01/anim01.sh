#!/bin/bash
#               GMT ANIMATION 01
#
# Purpose:      Make web page with simple animated GIF of sine function
# GMT progs:    gmt gmtset, gmt gmtmath, gmt psbasemap, gmt pstext, gmt psxy, gmt psconvert
# Unix progs:   printf, mkdir, rm, mv, echo, convert, cat
# Note:         Run with any argument to build movie; otherwise 1st frame is plotted only.
#
# 1. Initialization
# 1a) Assign movie parameters
. gmt_shell_functions.sh
width=4i
height=2i
dpi=125
n_frames=18
name=anim01
ps=${name}.ps
# 1b) Do frame-independent calculations and setup
angle_step=`gmt gmtmath -Q 360 ${n_frames} DIV =`
angle_inc=`gmt gmtmath -Q ${angle_step} 10 DIV =`
gmt psbasemap -R0/360/-1.2/1.6 -JX3.5i/1.65i -P -K -X0.35i -Y0.25i \
	-BWSne+glightgreen -Bxa90g90f30+u\\312 -Bya0.5f0.1g1 \
	--PS_MEDIA=${width}x${height} --FONT_ANNOT_PRIMARY=9p > $$.map.ps
# 2. Main frame loop
mkdir -p $$
frame=0
while [ ${frame} -le ${n_frames} ]; do
	# Create file name using a name_##.tif format
	file=`gmt_set_framename ${name} ${frame}`
	cp -f $$.map.ps $$.ps
	angle=`gmt gmtmath -Q ${frame} ${angle_step} MUL =`
	if [ ${frame} -gt 0 ]; then	# First plot has no curves
#		Plot smooth blue curve and dark red dots at all angle steps so far
		gmt gmtmath -T0/${angle}/${angle_inc} T SIND = $$.sin.d
		gmt psxy -R -J -O -K -W1p,blue $$.sin.d >> $$.ps
		gmt gmtmath -T0/${angle}/${angle_step} T SIND = $$.sin.d
		gmt psxy -R -J -O -K -Sc0.1i -Gdarkred $$.sin.d >> $$.ps
	fi
	#	Plot red dot at current angle and annotate
	sin=`gmt gmtmath -Q ${angle} SIND =`
	gmt psxy -R -J -O -K -Sc0.1i -Gred >> $$.ps <<< "${angle} ${sin}"
	printf "0 1.6 a = %03d" ${angle} | gmt pstext -R -J -F+f14p,Helvetica-Bold+jTL -O -K \
		-N -Dj0.1i/0.05i >> $$.ps
	gmt psxy -R -J -O -T >> $$.ps
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
convert -delay 20 -loop 0 $$/${name}_*.tif ${name}.gif

# 4. Clean up temporary files
gmt_cleanup .gmt
