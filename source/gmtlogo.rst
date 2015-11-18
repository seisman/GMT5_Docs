.. index:: ! gmtlogo

gmtlogo
=======

- 官方文档： :ref:`gmt:gmtlogo`
- 说明：在图上绘制GMT的图形logo

该模块将GMT的图形logo绘制在图上。GMT的图形logo默认宽2英寸，高1英寸。

语法
----

::

    gmtlogo [-D] [-F]

``-D`` 和 ``-F``
----------------

``-D`` 设置logo的参考点和锚点， ``-F`` 设置logo的背景边框。见 :doc:`embellishments` 一节。

示例
----

单独绘制GMT logo::

    gmt logo -P -Dx0/0+w2i > logo.ps

将GMT logo作为图片的一个图层::

    gmt logo -O -K -R -J -DjTR+o0.1i/0.1i+w3i >> bigmap.ps
