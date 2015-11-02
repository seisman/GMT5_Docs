.. index:: ! gmtlogo

gmtlogo
=======

官方文档： :ref:`gmt:gmtlogo`

将GMT的logo作为一个图层加到一个打开的PS文件中。

GMT的logo默认宽2英寸，高1英寸。

语法
----

::

    gmtlogo <dx> <dy> <scale> [-G<fill>] [-W<pen>] >> plot.ps

``<dx>`` ``<dy>`` ``<scale>``
-----------------------------

logo的左下角相对于当前原点的偏移量。

``-G<fill>``
------------

logo的图框中的填充色或图案，默认不填充。

``-W<pen>``
-----------

图框轮廓的画笔属性，默认不绘制边框。

示例
----

::

    gmt psbasemap -JX10c/5c -R0/10/0/5 -Bx2 -By1 -K > test.ps
    gmtlogo 1c 1c 0.5 -Glightblue -Wyellow >> test.ps
    gmt psxy -J -R -T -O >> test.ps




