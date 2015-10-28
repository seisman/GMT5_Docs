.. index:: ! psbasemap

psbasemap
=========

用于绘制底图。

最小代码
--------

::

    gmt psbasemap -R-180/180/-70/70 -JM10c -Bx60 -By30 > test.ps

-L选项
------

-L选项用于在图上绘制比例尺，其语法为::

    -L[f][x]<lon0>/<lat0>[/<slon>]/<slat>/<length>[e|f|M|n|k|u][+l<label>][+j<just>][+p<pen>][+g<fill>][+u]

下面解释一下每一项的含义：

- <lon0>和<lat0>：比例尺的中心在图中的经纬度位置；
- ``-Lx``\ 表明<lon0>和<lat0>是比例尺中心相对于坐标原点的X和Y偏移量而不是经纬度位置；
- ``-Lf``\ 表明绘制fancy比例尺，即火车轨道图；
- <slon>和<slat>表明要绘制哪一个经纬度处的比例尺；
- <length>：要绘制的比例尺长度，默认单位为km，也可以加上其他长度单位；
- ``+l<label>``\ ：为比例尺增加label；label位于比例尺中部上方；
- ``+j<just>``\ ：修改比例尺label的对齐方式，可以取L、R、T、B；
- ``+u``\ ：默认情况下，比例尺的标注是没有单位的，该选项可以给标注加上单位；
- ``+p<pen>``\ 和\ ``+g<fill>``\ ：用于在比例尺后加一个矩形框，二者分别指定矩形框的线条属性和填充属性；

-D选项
------

在地图底图中绘制insert box::

    -D[<unit>]<xmin>/<xmax>/<ymin>/<ymax>[r]|<width>[/<height>][+c<clon>/<clat>][+p<pen>][+g<fill>]

insert box可以用三种方式指定：

- ``<xmin>/<xmax>/<ymin>/<ymax>[r]``\ 直接给定一个地理矩形区域；具体参考-R选项中的用法；
- ``u<xmin>/<xmax>/<ymin>/<ymax>``\ 给定的是投影后的坐标范围，其中u是坐标单位；
- ``[u]<width>/<height>``\ 用于指定矩形区域的高度和宽度，\ ``+c<clon>/<clat>``\ 用于指定该矩形中心的位置。

``+p<pen>``\ 和\ ``+g<fill>``\ 用于指定box的边框属性和填充属性。

-T选项
------

-T选项用于绘制方向玫瑰图，即指南针::

    -T[f|m][x]<lon0>/<lat0>/<size>[/<info>][:w,e,s,n:][+gint[/mint]]

- ``<lon0>/<lat0>``\ ：方向玫瑰图的中心所处的经纬度；
- ``-Tx``\ 表明<lon0>和<lat0>是X、Y方向的位置而不是经纬度；
- <size>是方向玫瑰图的直径；
- ``-Tf``\ 会绘制一个fancy玫瑰图；
