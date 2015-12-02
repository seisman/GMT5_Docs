MAP参数
=======

.. _MAP_DEFAULT_PEN:

MAP_DEFAULT_PEN
---------------

.. _MAP_FRAME_AXES:

MAP_FRAME_AXES
--------------

设置要绘制/标注的轴，可以认为是 ``-B`` 选项的默认值，默认值为 ``WSEN``

.. _MAP_FRAME_TYPE:

MAP_FRAME_TYPE
--------------

设置底图边框类型，可选值包括 ``inside|plain|graph|fancy|fancy+`` ，默认值为 ``fancy`` 。

一般情况下， ``fancy`` 边框类型仅适用于投影后的X、Y方向平行于经度纬度方向的情况下，比如rectangular投影、polar投影。对于某些投影，只能使用plain底图，即便MAP_BASEMAP_TYPE被设置为fancy。

下图给出了不同的底图边框类型的效果：

.. figure:: /images/map_basemap_type.*
   :width: 600px
   :align: center

   不同的底图边框类型的效果图

.. _MAP_FRAME_PEN:

MAP_FRAME_PEN
-------------

绘制底图类型为plain时边框的画笔属性，默认值为 ``thicker,black`` 。

.. _MAP_FRAME_WIDTH:

MAP_FRAME_WIDTH
---------------

设置底图类型为fancy时的边框宽度，默认值为 ``5p`` 。

.. _MAP_ORIGIN_X:

MAP_ORIGIN_X
------------

设置新绘图在纸张上的原点的X坐标，默认情况下为 ``1i`` 。对于覆盖图来说，默认值为0。该值可以通过 ``-X`` 修改。

.. _MAP_ORIGIN_Y:

MAP_ORIGIN_Y
------------

设置新绘图在纸张上的原点的Y坐标，默认情况下为 ``1i`` 。对于覆盖图来说，默认值为0。该值可以通过 ``-Y`` 修改。

.. _MAP_LOGO:

MAP_LOGO
--------

设置是否在左下角绘制带有系统时间戳的GMT logo，默认值为 ``false`` ，还可以取 ``true`` 。该参数与在命令行中使用 ``-U`` 选项等效。

.. _MAP_LOGO_POS:

MAP_LOGO_POS
------------

设置GMT logo相对于当前绘图原点的对齐方式与位置。默认值为 ``BL/-54p/-54p`` 。

.. _MAP_TITLE_OFFSET:

MAP_TITLE_OFFSET
----------------

图标题的底部与轴标注（或轴标签）的顶部之间的距离。默认值为 ``14p`` 。

.. _MAP_SCALE_HEIGHT:

MAP_SCALE_HEIGHT
----------------

控制地图比例尺的高度，默认值为 ``5p`` 。

.. _MAP_TICK_PEN_PRIMARY:
.. _MAP_TICK_PEN_SECONDARY:

MAP_TICK_PEN_PRIMARY | MAP_TICK_PEN_SECONDARY
---------------------------------------------

主刻度和次刻度的画笔属性，默认值为 ``thinner,black``

.. _MAP_TICK_LENGTH_PRIMARY:
.. _MAP_TICK_LENGTH_SECONDARY:

MAP_TICK_LENGTH_PRIMARY | MAP_TICK_LENGTH_SECONDARY
---------------------------------------------------

每条边有两级刻度：primary和secondary，每级刻度再分为两级：major和minor。这两个参数分别设置primary刻度和secondary刻度的刻度长度。

primary刻度的major和minor刻度长度为 ``5p/2.5p`` ，secondary刻度的major和minor刻度长度为 ``15p/3.75p`` 。若只给出了第一个值，则默认第二个值是前一个的50%。

.. _MAP_LINE_STEP:

MAP_LINE_STEP
-------------

.. _MAP_GRID_PEN_PRIMARY:
.. _MAP_GRID_PEN_SECONDARY:

MAP_GRID_PEN_PRIMARY | MAP_GRID_PEN_SECONDARY
---------------------------------------------

设置主和次网格线的线条属性，默认值分别为 ``default,black`` 和 ``thinner,black``

.. _MAP_GRID_CROSS_SIZE_PRIMARY:
.. _MAP_GRID_CROSS_SIZE_SECONDARY:

MAP_GRID_CROSS_SIZE_PRIMARY | MAP_GRID_CROSS_SIZE_SECONDARY
-----------------------------------------------------------

网格交叉线的大小，0表示绘制连续的网格线。默认值为 ``0p``

.. _MAP_ANNOT_OFFSET_PRIMARY:

MAP_ANNOT_OFFSET_PRIMARY
-------------------------

primary标注的开始位置与刻度尾端间的距离，默认值为 ``5p``

.. _MAP_ANNOT_OFFSET_SECONDARY:

MAP_ANNOT_OFFSET_SECONDARY
--------------------------

primary标注的底部与secondary标注的顶部之间的距离，默认值为 ``5p``

.. _MAP_ANNOT_ORTHO:

MAP_ANNOT_ORTHO
---------------

.. _MAP_LABEL_OFFSET:

MAP_LABEL_OFFSET
----------------

轴标注底部与轴标签顶部间的距离，默认值为 ``8p``

.. _MAP_DEGREE_SYMBOL:

MAP_DEGREE_SYMBOL
-----------------

指定在地图上绘制“度”时所使用的符号，可以取 ``ring|degree|colon|none`` ，默认值为 ``ring``

.. _MAP_VECTOR_SHAPE:

MAP_VECTOR_SHAPE
----------------

矢量头的形状，取值范围为-2到2。0表示矢量头为三角形，1表示箭头形状，2表示打开的V字。其他的中间值代表了两种形状的中间值。
