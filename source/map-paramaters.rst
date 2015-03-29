.. index:: !gmt.conf

MAP参数
=======

:Create Date: 2015-03-28
:Last Updated: 2015-03-29

MAP_FRAME_TYPE
--------------

设置底图边框类型，可选值包括\ ``inside``\ 、\ ``plain``\ 、\ ``graph``\ 、\ ``fancy``\ 以及\ ``fancy+``\ ，默认值为\ ``fancy``\。

一般情况下，\ ``fancy``\ 边框类型仅适用于投影后的X、Y方向平行于经度纬度方向的情况下，比如rectangular投影、polar投影。对于某些投影，只能使用plain底图，即便MAP_BASEMAP_TYPE被设置为fancy。

下图给出了不同的底图边框类型的效果：

.. figure:: /images/map_basemap_type.*
   :width: 600px
   :align: center

   不同的底图边框类型的效果图

.. _MAP_FRAME_PEN:

MAP_FRAME_PEN
-------------

绘制底图类型为plain时边框的画笔属性，默认值为\ ``thicker,black``\ 。

.. _MAP_FRAME_WIDTH:

MAP_FRAME_WIDTH
---------------

设置底图类型为fancy时的边框宽度，默认值为\ ``5p``\ 。

.. _MAP_ORIGIN_X:

MAP_ORIGIN_X
------------

设置新绘图在纸张上的原点的X坐标，默认情况下为2cm。对于覆盖图来说，默认值为0。该值可以通过\ ``-X``\ 修改。

.. _MAP_ORIGIN_Y:

MAP_ORIGIN_Y
------------

设置新绘图在纸张上的原点的Y坐标，默认情况下为2cm。对于覆盖图来说，默认值为0。该值可以通过\ ``-Y``\ 修改。

.. _MAP_LOGO:

MAP_LOGO
--------

设置是否在绘图的左下角绘制带有系统时间戳的GMT logo，默认值为\ ``false``\ ，还可以取\ ``true``\ 。除此之外，还可以通过\ ``-U``\ 选项指定是否绘制GMT logo，以及logo的其他属性。

.. _MAP_LOGO_POS:

MAP_LOGO_POS
------------

设置GMT logo相对于当前绘图的左下角的对齐方式与位置。默认值为\ ``BL/-54p/-54p``\ 。

.. _MAP_FRAME_TYPE:

