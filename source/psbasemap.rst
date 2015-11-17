.. index:: ! psbasemap

psbasemap
=========

- 官方文档： :ref:`gmt:psbasemap`
- 简介：绘制底图

语法
----

::

    psbasemap [-A<file>]
              [-D<insert_box>]
              [-F<box>]
              [-L<ruler>]
              [-T<rose>]
              [-T<mag_rose>]

简单示例
--------

::

    gmt psbasemap -R-180/180/-70/70 -JM10c -Bx60 -By30 > test.ps

``-A``
------

不绘制图形，仅仅将底图的边框坐标输出到文件或标准输出中。必须指定 ``-J`` 和 ``-R`` ，且不能使用其他选项。边框的采样间隔由 :ref:`MAP_LINE_STEP` 决定。

``-F``
------

该选项用于控制insert box、比例尺、玫瑰图的边框属性，其语法为::

    -F[d|l|t][+c<clearances>][+g<fill>][+i[[<gap>/]<pen>]][+p[<pen>]][+r[<radius>]][+s[[<dx>/<dy>/][<shade>]]]

- ``-F`` 绘制insert map、比例尺或map rose的矩形边框，使用 :ref:`MAP_FRAME_PEN` 作为画笔属性
- ``d|l|t`` 表示 ``-F`` 选项定义的属性仅与适用于 ``-D`` 、 ``-L`` 或 ``-T``

``-D``
------

该选项用于在底图中绘制图中图（insert box），需要与 ``-F`` 选项一起使用。其语法为::

    -D[<unit>]<xmin>/<xmax>/<ymin>/<ymax>[r][+s<file>]
    -D[g|j|J|n|x]<refpoint>+w<width>[/<height>][+j<justify>][+o<dx>[/<dy>]][+s<file>]

insert box可以用三种方式指定。

#. 用类似 ``-R`` 选项的语法 ``<xmin>/<xmax>/<ymin>/<ymax>[r]`` 指定一个地理矩形
#. 投影后的坐标范围 ``<unit><xmin>/<xmax>/<ymin>/<ymax>`` ， ``<unit>`` 为投影后的坐标单位
#. 使用 ``[g|j|J|n|x]<refpoint>`` 语法指定参考点， ``+w<width>[/<height>]`` 指定矩形的宽度和高度， ``+j<justify>`` 指定锚点位置， ``+o<dx>/<dy>`` 用于指定参考点的额外偏移量。关于参考点、锚点和偏移量，见 :doc:`embellishments` 一节。使用 ``+s<file>`` 选项会将insert  box的左下角以及其在地图单位下的长度写到文件中。

.. code-block:: bash

   #!/bin/bash
   R=115/123/35/40             # 小区域地图的范围-R
   J=M20c                      # 小区域的投影方式-J
   PS=map.ps

   # 打开GMT
   gmt psxy -R$R -J$J -T -K > $PS

   # 绘制小区域的地图
   gmt pscoast -R$R -J$J -B1 -Df -W2p -I2p -N1/2p -A1000 -K -O >> $PS
   # ...
   # 此处可以任意添加其他绘图命令
   # ...

   # 开始绘制insert map
   Rg=72/135/16/55     # 大区域地图的范围-R
   Jg=M7c              # 大区域地图的投影方式-J
   # 绘制大区域地图的海岸线及边框
   gmt pscoast -R$Rg -J$Jg -B0 -B+gwhite -Df -N1 -W -A5000 -K -O --MAP_FRAME_TYPE=plain >> $PS
   # 在大区域地图内绘制小区域所在的方框
   gmt psbasemap -R$Rg -J$Jg -D$R -F+p2p,blue -K -O >> $PS

   # 结束GMT绘图
   gmt psxy -R$R -J$J -T -O >> $PS

.. figure:: /images/psbasemap_ex1.*
   :width: 600px
   :align: center

   用psbasemap命令-D选项绘制图中图

``-L``
------

该选项用于在图上绘制比例尺::

    -L[g|j|J|n|x]<refpoint>+c[<slon>/]<slat>+w<length>[e|f|k|M|n|u][+a<align>][+f][+l[<label>]][+u]

下面解释一下每一项的含义：

- ``[g|j|J|n|x]<refpoint>`` 用于指定比例尺的参考位置，比例尺的锚点位于比例尺的中心，见 :doc:`embellishments` 一节
- ``+c<slon>/<slat>`` 要绘制哪一个点的比例尺
- ``+w<length>[e|f|M|n|k|u]`` ：比例尺的长度，默认单位为km，也可使用其他长度单位
- ``+a<align>`` ：修改比例尺标签的位置，默认位于比例尺上方中文，可以取 ``l`` 、 ``r`` 、 ``t``` 、 ``b`` 分别代表左右上下
- ``+l<label>`` ：为比例尺加个标签，若不指定 ``<label>`` ，默认的标签是比例尺长度所使用的单位
- ``+u`` ：比例尺的标注默认只有值没有单位，该选项会给标注加上单位
- ``+f`` ：fancy比例尺，即火车轨道比例尺，默认为plain比例尺

GMT参数 :ref:`FONT_LABEL` 控制标签字体， :ref:`FONT_ANNOT_PRIMARY` 控制标签的标注字体， :ref:`MAP_SCALE_HEIGHT` 控制比例尺的高度。

示例::

    gmt psbasemap -R90/110/30/40 -JM10c -Bx5 -By5 -Lg95/35+c35+w800k+lscale+u+f > test.ps

``-Td``
-------

``-Td`` 选项用于绘制方向玫瑰图，其语法为::

    -Td[g|j|J|n|x]<refpoint>+w<width>[+f[<level>]][+j<justify>][+l<w,e,s,n>][+o<dx>[/<dy>]]

- ``[g|j|J|n|x]<refpoint>`` 用于定义参考点， ``+j<justify>`` 用于定义玫瑰图上的锚点（默认锚点是 ``MC`` ）， ``+o<dx>/<dy>`` 指定参考点的偏移量。见 :doc:`embellishments` 一节。
- ``+w<width>`` 玫瑰图的宽度
- ``+f`` 绘制fancy玫瑰图， ``<level>`` 指定了fancy玫瑰图的不同类型， ``<level>`` 可以取：
  - ``1`` 绘制E-W和N-S四个方向
  - ``2`` 绘制8个方向
  - ``3`` 绘制16个方向

- ``+l<w>,<e>,<s>,<n>`` 为四个方向分别指定标签，默认标签是W、E、S、N，四个方向的标签之间用逗号分隔

``-Tm``
-------

``-Tm`` 选项用于绘制磁场玫瑰图，其语法为::

    -Tm[g|j|J|n|x]<refpoint>+w<width>[+d<dec>[/<dlabel>]]][+i<pen>][+j<justify>][+l<w>,<e>,<s>,<n>][+p<pen>][+t<ints>][+o<dx>[/<dy>]]

- ``[g|j|J|n|x]<refpoint>`` 用于定义参考点， ``+j<justify>`` 用于定义玫瑰图上的锚点（默认锚点是 ``MC`` ）， ``+o<dx>/<dy>`` 指定参考点的偏移量。见 :doc:`embellishments` 一节
- ``+w<width>`` 玫瑰图的宽度
- ``+d<dec>/<dlabel>`` 设置磁倾角以及罗盘指针上的磁倾角标签，若 ``<dlabel>`` 为空，则根据 ``<dec>`` 的值自动确定标签，也可以使用 ``-`` bypass labeling。当使用 ``+d`` 子选项时，会同时绘制地理方向和磁场方向。
- ``+l<w>,<e>,<s>,<n>`` 为四个方向的标签，默认值为W、E、S、N，若 ``<n>`` 取值为 ``*`` ，则会在北方向标签处绘制星代表北极星。
- 标注、地理和磁场的两级刻度的间隔默认值为 ``30/5/1`` ，可以使用 ``+t<ints>`` 选项给定6个数值分别自动6个间隔
