``-p`` 选项
===========

在一张纸上画一个方方正正的矩形，当从不同的方向去看这个矩形时，可以看到不同的形态。 ``-p`` 选项可以用于选择从怎样的视角去看一张图。该选项的语法为::

    -p[x|y|z]<azim>/<elev>[/<zlevel>][+w<lon0>/<lat0>][/<z0>]][+v<x0>/<y0>]

``<azim>`` 和 ``<elev>`` 指定视角的方位角和海拔，默认值是 ``180/90`` ，即视角在正上方。此处方位角是相对于北方向顺时针旋转的角度， ``<evel>`` 是相对于纸张平面旋转的角度，向上为正向下为负。

若在使用 ``-JZ`` 或 ``-Jz`` 的同时使用 ``-p`` 选项，则可以加上 ``<zlevel>`` 以指定在Z轴上 ``<zlevel>`` 处绘制2D的边框，默认是在Z轴的底部绘制。

Use ``-px`` 或 ``-py`` to plot against the "wall" x = level or y =  level (default is on the horizontal plane, which is the same as using ``-pz``).

For frames used for animation, you may want to append ``+`` to fix the center of your data domain (or specify a particular world coordinate point with ``+w<lon0>/<lat>[/<z>]`` ) which will project to the center of your page size (or specify the coordinates of the projected view point with ``+v<x0>/<y0>`` . When ``-p`` is used without any further arguments, the values from the last use of ``-p`` in a previous GMT command will be used.)
