.. index:: ! psscale

psscale
=======

- 官方文档： :ref:`gmt:psscale`
- 简介：在地图上绘制灰色或彩色色标

语法
----

::

    psscale -Drefpoint [-Ccpt] [-Fbox] [-Gzlo/zhi]
            [-I[max_intens|low_i/high_i]]
            [-L[i][gap]] [-M] [-N[p|dpi]] [-Q] [-S] [-Zzfils]

``-C``
------

要绘制的CPT文件。

``-D``
------

``-D`` 选项用于指定色标的尺寸和位置，其语法为::

    -D[g|j|J|n|x]<refpoint>+w<length>/<width>[+e[b|f][<length>]][+h][+j<justify>][+m[a|c|l|u]][+n[<txt>]][+o<dx>[/<dy>]]

- ``+w<length>/<width>`` 指定色标的长度和宽度，若长度为负值则会反转色标
- ``+h`` 绘制水平色标，默认为垂直色标
- ``[g|j|J|n|x]<refpoint>`` 指定参考位置， ``+j<justify>`` 指定色标上的锚点，默认锚点是 ``BL`` 。见 :doc:`embellishments` 一节。
- ``+e`` 选项为前景色和背景色加一个三角形， ``+ef`` 表示只加前景色三角形， ``+eb`` 表示只加背景色三角形。 ``<length>`` 是三角的高度，默认为色标宽度的一半。
- ``+m[a|c|l|u]`` 将标注、标签和单位放在色标的另一边， ``a`` 代表标注， ``l`` 代表标签， ``u`` 代表单位。 ``c`` 表示将标签以单列字符垂直打印。
- ``+n<text>`` 在色标开始处绘制一个矩形，并用NaN的颜色填充。

``-F``
------

为色标加上背景边框，见 :doc:`embellishments` 一节。

``-B``
------

默认是根据CPT文件的每一行记录对色标进行标注，也可以使用 ``-B`` 选项自定义标注。

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
