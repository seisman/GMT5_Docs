.. index:: ! psbasemap

psbasemap
=========

官方文档： :ref:`gmt:psbasemap`

绘制底图

语法
----

::

    psbasemap [-D[<unit>]<xmin>/<xmax>/<ymin>/<ymax>[r]|<width>[/<height>][+c<clon>/<clat>][+p<pen>][+g<fill>]]
        [-L[f][x]<lon0>/<lat0>[/<slon>]/<slat>/<length>[e|f|k|M|n|u][+l<label>][+j<just>][+p<pen>][+g<fill>][+u]]
        [-T[f|m][x]<lon0>/<lat0>/<size>[/<info>][:<w>,<e>,<s>,<n>:][+g<int>[/<mint>]]]

简单示例
--------

::

    gmt psbasemap -R-180/180/-70/70 -JM10c -Bx60 -By30 > test.ps

``-D``
------

该选项用于在底图中绘制图中图（insert box）。insert box的范围可以用三种方法指定：

#. 用类似 ``-R`` 选项的语法 ``<xmin>/<xmax>/<ymin>/<ymax>[r]`` 指定一个地理矩形
#. 投影后的坐标范围 ``<unit><xmin>/<xmax>/<ymin>/<ymax>`` ， ``<unit>`` 为投影后的坐标单位
#. ``[<unit>]<width>[/<height>][+c<clon>/<clat>]`` 指定矩形的宽度和高度，并通过 ``+c`` 指定矩形中心的经度 ``<clon>`` 和纬度 ``<clat>``

.. TODO 第2和3种方式都没有试出结果，不确定是不是bug

指定insert box的信息之后，还需要指定insert box的边框画笔属性 ``+p<pen>`` 或box的颜色填充 ``+g<fill>`` 。

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
   gmt psbasemap -R$Rg -J$Jg -D$R+p2p,blue -K -O >> $PS

   # 结束GMT绘图
   gmt psxy -R$R -J$J -T -O >> $PS

.. figure:: /images/psbasemap_ex1.*
   :width: 600px
   :align: center

   用psbasemap命令-D选项绘制图中图

``-L``
------

该选项用于在图上绘制比例尺。

    -L[f][x]<lon0>/<lat0>[/<slon>]/<slat>/<length>[e|f|M|n|k|u][+l<label>][+j<just>][+p<pen>][+g<fill>][+u]

下面解释一下每一项的含义：

- ``<lon0>`` 和 ``<lat0>`` ：比例尺的中心在图中的经纬度位置
- ``-Lx`` 表明 ``<lon0>`` 和 ``<lat0>`` 是比例尺中心相对于绘图原点的X和Y偏移量而不是经纬度位置
- ``-Lf`` 表明绘制fancy比例尺，即火车轨道图
- ``<slon>`` 和 ``<slat>`` 表明要绘制哪一个经纬度处的比例尺
- ``<length>[e|f|M|n|k|u]`` ：比例尺的长度，默认单位为km，也可使用其他长度单位
- ``+l<label>`` ：为比例尺加个标签，若不指定 ``<label>`` ，默认的标签是比例尺长度所使用的单位
- ``+j<just>`` ：修改比例尺标签的位置，默认位于比例尺上方中文，可以取 ``l`` 、 ``r`` 、 ``t``` 、 ``b`` 分别代表左右上下
- ``+u`` ：比例尺的标注默认只有值没有单位，该选项会给标注加上单位
- ``+p<pen>`` 和 ``+g<fill>`` ：在比例尺后加一个矩形框，分别指定矩形框的线条属性和填充属性

GMT参数 :ref:`FONT_LABEL` 控制标签字体， :ref:`FONT_ANNOT_PRIMARY` 控制标签的标注字体， :ref:`MAP_SCALE_HEIGHT` 控制比例尺的高度。

示例::

    gmt psbasemap -R90/110/30/40 -JM10c -Bx5 -By5 -Lf95/32/35/800k+lscale+u+pblue+glightblue > test.ps

``-T``
------

该选项会在地图上绘制一个方向玫瑰图。

- ``<lon0>/<lat0>`` ：玫瑰图的中心所处的经纬度
- ``-Tx`` 表明 ``<lon0>/<lat0>`` 是X、Y方向的位置而不是经纬度
- ``<size>`` 是玫瑰图的直径
- ``:<w>,<e>,<s>,<n>:`` 为四个方向分别指定标签，默认标签是W、E、S、N， ``::`` 表示压制所有标签，若 ``<n>`` 为 ``*`` ，则会在北方向绘制北极星。
- ``-Tf`` 绘制一个fancy玫瑰图
- fancy玫瑰图中， ``<info>`` 可以取1、2、3，分别表示绘制4个方向、8个方向、16个方向。
- ``-Tm`` 绘制一个地磁指南针玫瑰图
- 地磁指南针中， ``<info>`` 的格式为 ``<dec>/<dlabel>`` ， ``<dec>`` 是磁倾角， ``<dlabel>`` 是指针的标签。若 ``<dlable>`` 取为 ``-`` ，则label即为磁倾角角度。
- 地理玫瑰图和地磁玫瑰图的标注和两级刻度间隔默认值为 ``30/5/1`` ，可以通过 ``+<gints>[/<mints>]`` 分别指定地理和地磁的间隔。

相关参数：

- :ref:`COLOR_BACKGROUND` ：玫瑰图颜色
- :ref:`MAP_TICK_PEN` ：玫瑰图的画笔属性
- :ref:`FONT_TITLE` ：四个主方向的标签字体属性
- :ref:`FONT_LABEL` ：其余次方向的标签字体属性

下面的命令绘制了一个简单的玫瑰图和一个地理玫瑰图::

    gmt psbasemap -R90/110/30/40 -JM10c -Bx5 -By5 -T100/35/3c:w,e,s,n: > simple.ps
    gmt psbasemap -R90/110/30/40 -JM10c -Bx5 -By5 -Tf100/35/3c/2:w,e,s,*: > fancy.ps

.. figure:: /images/psbasemap_ex2.*
   :width: 600px
   :align: center

   简单玫瑰图和地理玫瑰图

下面的命令绘制地磁玫瑰图::

    gmt psbasemap -R90/110/30/40 -JM25c -Bx5 -By5 -Tm100/35/6c/60/-:w,e,s,*: > compass.ps

.. figure:: /images/psbasemap_ex3.*
   :width: 600px
   :align: center

   地磁玫瑰图
