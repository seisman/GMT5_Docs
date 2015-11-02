PS=psbasemap_ex3.ps
gmt psbasemap -R90/110/30/40 -JM25c -Bx5 -By5 -Tm100/35/6c/60/-:w,e,s,*: > $PS
rm gmt.*
