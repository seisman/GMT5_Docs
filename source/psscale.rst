.. index:: ! psscale

psscale
=======

官方文档： :ref:`psscale`

在地图上绘制灰色或彩色色标

语法
----

::

    psscale -D<xpos>/<ypos>/<length>/<width>[h] [-A[a|l|c]] [-Ccpt_file]
        [ -E[b|f][length][+n[text]] ] [ -Gzlo/zhi ] [ -I[max_intens|low_i/high_i] ]  [ -L[i][gap] ] [ -M ] [ -N[p|dpi ]]  [ -Q ] [ -S ] [ -T[+ppen][+gfill][+l|r|b|toff] ] [ -Zzfile ]

``-C``
------

要绘制的CPT文件。

``-D``
------

- ``<xpos>`` ``<ypos>`` 色标相对于绘图原点的距离，对于水平色标，是上边中间点的位置，对于垂直色标，是左边中间的位置
- ``<length>`` ``<width>`` 比例尺的长度和宽度，若为负值，则表示反转色标的方向
- ``h`` 默认是垂直色标， ``h`` 表示绘制水平色标

::

    gmt psscale -JN15c -Rg -D5c/5c/10/1 -Cbathy.cpt > test.ps
    gmt psscale -JN15c -Rg -D5c/5c/-10/1h -Cbathy.cpt > test.ps

``-B``
------

默认是根据CPT文件的每一行记录对色标进行标注，也可以使用 ``-B`` 选项自定义标注。

::

    gmt psscale -JN15c -Rg -D5c/5c/-10/1 -B1000+lbathmetry -Cbathy.cpt > test.ps

``-A``
------

指定标注和标签的放置位置。

- 水平色标：标注和标签默认放在色标下边，使用该选项则放在上边
- 垂直色标：标注和标签默认放在色标右边，使用该选项则放在左边

- ``a`` 仅将标注放在上边或左边
- ``l`` 仅将标签放在上边或左边
- ``c`` 标签垂直打印，每行一个字符

::

    gmt psscale -JN15c -Rg -D5c/5c/-10/1 -B1000+lbathmetry -Cbathy.cpt -Aa > test.ps
    gmt psscale -JN15c -Rg -D5c/5c/-10/1 -B1000+lbathmetry -Cbathy.cpt -Aac > test.ps

``-E``
------

在色标的两端加上一个三角以表示背景色和前景色。

- ``b`` 只加前景色
- ``f`` 只加背景色
- ``<length>`` 三角的高度，默认是色标宽度的一半
- ``+n<text>`` 在色标开始处绘制一个矩形，并用 ``<text>`` 标注以表示NaN对应的颜色

``-G``
------

在绘图之前先对CPT文件做截断，使得其只绘制 ``<zlow>`` 到 ``<zhigh>`` 之间的部分。

``-I``
------

为色标加上光照效果：

- ``-I<max_intens>`` 光照强度为``[-<max_intens>, +<max_intens]``，默认值为1
- ``-I<low_i>/<high_i>`` 指定非对称的光照强度范围

``-M``
------

使用YIQ变换强制单调灰度色标。

``-S``
------

Do not separate different color intervals with black grid lines.

``-T``
------

在色标后加上一个矩形框。 ``+p<pen>`` 指定矩形边框属性， ``+g<fill>`` 指定矩形内的填充。矩形框的大小默认由 ``-D`` 选项和当前的字体大小、偏移量等参数决定，可以使用 ``+l|r|b|t<offset>`` 为四个方向加上额外的空间。

``-L``
------

``-N``
------

``-Q``
------

``-Z``
------

相关
----

:doc:`makecpt` 、 :doc:`grd2cpt`



