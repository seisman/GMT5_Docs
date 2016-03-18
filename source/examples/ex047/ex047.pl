#!/usr/bin/env perl
use strict;
use warnings;

my $J = 'Q104/15c';
my $R = 'g102.5/105.5/30/33';
my $file = 'meca.ps';
my $title = 'MECA';
# 删除临时文件
unlink glob("gmt.*");
# 生成临时配色文件
my $color = 'gmt.meca.cpt';
open(CPT,"> $color");
print CPT "# COLOR_MODEL = hsv\n";
print CPT "0 0-1-1 20 0-1-1\n20 60-1-1 40 60-1-1\n40 120-1-1 60 120-1-1\n60 240-1-1 100 240-1-1\n";
print CPT "B 0-0-0\nF 0-0-0\nN 0-0-0";
close(CPT);
# 文件头
system "gmt psxy -J$J -R$R -P -T -K > $file";
# 底图
system "gmt psbasemap -J -R -X0.8c -Y6c -B1 -BWSen -K -O >> $file";
# 岸线
system "gmt pscoast -J -R -A0/0/4 -Da -EAS -Ia/0.05,blue -W1/0.15p,blue, -K -O >> $file";
# 机制球
open (GMT, "|gmt psmeca -J -R -C -Sa1.3c -Z$color -K -O >> $file");
print GMT " 104.3300  31.90  39.8  32.00 64.00   85.00  7 0 0 A\n";
print GMT " 104  31.52  27.1  22.00 53.00   57.00  6 0 0 B\n";
print GMT " 103.6700  31.1300  6.4  86.00 32.00  -65.00  8 0 0 C\n";
print GMT " 103.900  31.3400  43.6 194.00 84.00  179.00  4.9 104.180  30.8400 D\n";
print GMT " 103.7200  31.4400  67.3  73.00 84.00 -162.00  4.9 103.1200  31.6400 E\n";
print GMT " 104.1200  31.7800  12.7 186.00 68.00  107.00  4.7 103.8300  32.2600 F\n";
print GMT " 104.2300  31.6100  62.0  86.00 63.00  -51.00  4.7 104.9600  31.6900 G\n";
close(GMT);
my $circle =" | gmt psxy -J -R -Sc0.25c -W1p,black,solid -K -O >> $file";
open(GMT,$circle);
print GMT "103.9000  31.3400\n";
print GMT "103.7200  31.4400\n";
print GMT "104.1200  31.7800\n";
print GMT "104.2300  31.6100\n";
close(GMT);
$circle =" | gmt psxy -J -R -Sc0.05c -Gblack -W0.5p,black,solid -K -O >> $file";
open(GMT,$circle);
print GMT "103.9000  31.3400\n";
print GMT "103.7200  31.4400\n";
print GMT "104.1200  31.7800\n";
print GMT "104.2300  31.6100\n";
close(GMT);
# 色条
system "gmt psscale -C$color -Dx12.7c/5.5c+w5c/0.5c+jTC -Bx+l\"Depth\" -By+lkm -S -K -O >> $file";
# 文件尾
system "gmt psxy -J -R -T -O >> $file";
# 改题名
system "sed -i 's/^%%Title:.*/%%Title: '\"$title/\" $file";
# 删除临时文件
unlink glob("gmt.*");