.. index:: !psxy

psxy
====

:ctime: 2015-04-30
:mtime: 2015-04-30

楔形饼图
--------

``-SW``\ 和\ ``-Sw``\ 可以用于绘制楔形饼图（pie **w**\ edge），即饼图中的一个切片。
后面接的\ *size*\ 是楔形饼图所对应的圆的\ **直径**\ 。

其所需要的输入数据格式为::

    X   Y   start_direction     stop_direcrion

其中第三四列是切片的开始方向和结束方向。若使用\ ``-Sw``\ ，则方向定义为相对于X轴
正方向（即东向）逆时针旋转的角度；若使用\ ``-SW``\ ，则方向定义为方位角，即相对于
北向顺时针旋转的角度。

另外一个不同在于，\ ``-SW``\ 指定的方位角会根据地图投影方式wil be mapped into
angles，而\ ``-Sw``\ 指定的方向则会保存不变。

下面的示例分别用\ ``-SW``\ 和\ ``-Sw``\ 画了两个不同大小的楔形饼图：

.. code-block:: bash

   #!/bin/bash
   R=0/10/0/5
   J=x1c
   PS=psxy_pie_wedge.ps

   gmt psxy -R$R -J$J -T -K > $PS
   gmt psbasemap -R$R -J$J -Ba1g1 -K -O >> $PS
   gmt psxy -R$R -J$J -Sw2c -Glightblue -K -O >> $PS << EOF
   2 2 0 45
   EOF

   gmt psxy -R$R -J$J -SW3c -Glightblue -K -O >> $PS << EOF
   6 2 0 45
   EOF
   gmt psxy -R$R -J$J -T -O >> $PS

   rm gmt.*

.. figure:: /images/psxy_pie_wedge.*
   :width: 500px
   :align: center
   :alt: psxy pie wedge

   左边-Sw，右边-SW；图中1格表示1cm。

圆弧
----

``-Sm``\ 选项可以用于绘制一段数学圆弧。\ *size*\ 为矢量箭头的长度，圆弧的线宽由\ ``-W``\ 选项设定。同时还有一些子选项可以用于控制箭头的属性。\ ``-SM``\ 选项与\ ``-Sm``\ 完全相同，只是当圆弧的夹角恰好是90度是，\ ``-SM``\ 会用直角符号来表示。

其要求的数据格式为::

    X   Y   圆弧半径    起始方向(相对于水平方向逆时针的度数) 结束方向

.. code-block:: bash

   #!/bin/bash
   R=0/4/0/3
   J=x2c
   PS=psxy_angle_arc.ps

   gmt psxy -R$R -J$J -T -K > $PS
   gmt psbasemap -R$R -J$J -Ba1g1 -BWSen -K -O >> $PS
   gmt psxy -R$R -J$J -Sc0.15c -Gblack -K -O >> $PS << EOF
   1 1
   3 1
   EOF
   gmt psxy -R$R -J$J -Sm0.2c+b+e+g -Gblack -W0.5p,red -K -O >> $PS << EOF
   1 1 1 10 60
   EOF
   gmt psxy -R$R -J$J -Sm0.2c+b+l -Gblack -W0.5p,blue -K -O >> $PS << EOF
   3 1 1 10 150
   EOF
   gmt psxy -R$R -J$J -T -O >> $PS

   rm gmt.*

.. figure:: /images/psxy_angle_arc.*
   :width: 500px
   :align: center
   :alt: psxy angle arc
