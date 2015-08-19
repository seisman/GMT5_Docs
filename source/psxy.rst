.. index:: !psxy

psxy
====

:ctime: 2015-04-30
:mtime: 2015-08-19

psxy模块用于在绘制线段、多边形和符号

线段与多边形
------------

psxy最简单的功能就是绘制线段或多边形，此时数据输入需要两列，即x和y::

    gmt psxy -R0/10/0/10 -JX10c -B1 > test.ps << EOF
    3 5
    5 8
    7 4
    EOF

如果线段的首尾两点重合，则形成一个闭合的多边形。

某些选项，可以控制线段和多边形的绘制，列举如下：

A选项
~~~~~

在地理投影下，用psxy绘制两点之间的连线时，默认会将两点按照大圆路径连接起来。

- ``-A``\ ：会忽略当前的投影方式，直接用直线连接两点；
- ``-Am``\ ：先沿着经线画，再沿着纬线画；
- ``-Ap``\ ：先沿着纬线画，再沿着经线画；

下图中，黑色曲线为默认情况；红线为使用\ ``-A``\ 的效果；蓝线为使用\ ``-Ap``\ 的效果；黄线为使用\ ``-Am``\ 的效果：

.. figure:: /images/psxy_A.*
   :width: 500px
   :align: center

注：由于这里投影比较特别，所以沿着经线的线和沿着纬线的线，看上去都是直线，在其他投影方式下可能不会是这样。

-L选项
~~~~~~

该选项会将线段的两个端点连起来，以得到一个封闭的多边形。

绘制符号
--------

使用了-S选项，则表示要绘制符号。

-S选项
~~~~~~

-S选项的语法为**-S**\ [*symbol*][\ *size*\ [**u**]]，其中symbol指定了要使用的符号，size为符号的大小，u为size的单位。

在使用-S选项时，后面接不同的参数，所需要的输入数据的格式也不同。所有的符号至少需要给定符号的位置，即::

    X   Y

不同的符号，可能会需要不同的输入列，统一写成::

    X   Y   ...

这里，\ ``...``\ 代表某符号特有的输入列。

若使用-S<symbol>，即未指定符号大小，若该符号需要符号大小，则需要将符号大小放在输入数据的第三列，其他输入数据的列号延后，此时数据格式为::

    X   Y   size    ...

若size<=0，则跳过该记录行。

若-S选项后无符号代码，则符号代码必须位于输入文件的\ **最后一列**\ ::

    X   Y   [size]    ...     symbol

因而总结一下输入数据的格式为::

    x  y   [size]  ...   [symbol]

其中\ ``...``\ 为某些符号所要求的特殊的数据列。

先介绍几个最简单的符号：

- ``-S-``\ ：短横线，size是短横线的长度；
- ``-S+``\ ：加号，size是加号的外接圆的直径；
- ``-Sa``\ ：星号（st\ **a**\ r），size是星号的外接圆直径；
- ``-Sc``\ ：圆（\ **c**\ ircle），size为圆的直径；
- ``-Sd``\ ：钻石（\ **d**\ iamond），size为外接圆直径；
- ``-Sg``\ ：八角形（octa\ **g**\ on），size为外接圆直径；
- ``-Sh``\ ：六边形（**h**\ exagon），size为外接圆直径；
- ``-Si``\ ：倒三角（**i**\ nverted triangle），size为外接圆直径；
- ``-Sn``\ ：五角形（pe\ **n**\ tagon），size为外接圆直径；
- ``-Ss``\ ：正方形（\ **s**\ quare），size为外接圆直径；
- ``-St``\ ：三角形（\ **t**\ riangle），size为外接圆直径；
- ``-Sx``\ ：叉号（cross），size为外接圆直径；
- ``-Sy``\ ：短竖线，size为短竖线的长度；
- ``-Sp``\ ：点，不需要指定size，点的大小始终为一个像素点；

对于小写符号acdghinst，size表示外接圆直径；对于大写符号ACDGHINST，size表示符号的面积与直径为size的圆的面积相同。

下图给出了上面所给出的symbol所对应的符号：

.. figure:: /images/simple_symbols.*
   :width: 700px
   :align: center
   :alt: psxy simple symbols

除了上面介绍的symbol之外，还有一些更复杂一些的symbol。

-Sb和-SB
~~~~~~~~

-Sb用于绘制从<base>到Y位置的垂直bar，语法为\ ``-Sb[[<size>c|i|p|u]][b[<base>]]``\ 。

其中，size为bar宽度，默认的<base>为ymin，若未指定<base>，则从输入的最后一列读入。

-SB与-Sb类似，区别在于-SB绘制水平bar。

这两个选项似乎有些bug，暂时忽略。

-Se和-SE
~~~~~~~~

-Se用于绘制椭圆，对于椭圆而言，size是不需要的。此时输入数据的格式为::

    X   Y   方向   长轴长度    短轴长度

其中方向是相对于水平方向逆时针旋转的角度。

-SE选项与-Se类似，区别在于第三列为方位角，且该角度会根据所选取的地图投影变换成角度。对于地理投影而言，长轴和短轴的长度单位为千米。

-Sf
~~~

-Sf用于在线段上绘制符号以表示一个front，其语法为::

    -Sf<gap>[/<size>][+l|+r][+b+c+f+s+t][+o<offset*]

<gap>为线段上符号之间的距离，若<gap>为负值，则解释为沿着线段上的符号的个数。若省略了<size>，则默认设置<size>为<gap>的30%，若<gap>为负值，则<size>是必须的。

+l和+r分别表示将符号画在线段的左侧还是右侧，默认是绘制在线段中间。

+b、+c、+f、+s、+t分别表示符号为box、circle、fault、slip、triangle。默认值为+f，即fault。slip用于绘制左旋或右旋断层。

+o<offset>会将线段上的第一个符号相对于线段的起点偏离<offset>距离。

下面的例子分别绘制了+b、+c、+f、+s、+t所对应的符号：

.. figure:: /images/symbol_Sf.*
   :width: 500px
   :align: center
   :alt: psxy -Sf example

-Sr
~~~

-Sr用于绘制矩形，size对该符号无效，其输入格式为::

    X   Y   X轴长度   Y轴长度

-SR
~~~

-SR用于绘制圆角矩形，size对该符号无用。其输入格式为::

    X   Y   X轴长度     Y轴长度     圆角半径

-Sj和-SJ
~~~~~~~~

-Sj用于绘制旋转的矩形，其输入数据为::

    X   Y   方向    X轴长度     Y轴长度

-SJ与-Sj类似，输入的第三列是方位角，X轴和Y轴长度的单位为km。

-Sw和-SW
~~~~~~~~

``-SW``\ 和\ ``-Sw``\ 可以用于绘制楔形饼图（pie **w**\ edge），即饼图中的一个切片。后面接的\ *size*\ 是楔形饼图所对应的圆的\ **直径**\ 。

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

-Sm和-SM
~~~~~~~~

``-Sm``\ 选项可以用于绘制一段数学圆弧。\ *size*\ 为矢量箭头的长度，圆弧的线宽由\ ``-W``\ 选项设定。同时还有一些子选项可以用于控制箭头的属性。\ ``-SM``\ 选项与\ ``-Sm``\ 完全相同，只是当圆弧的夹角恰好是90度是，\ ``-SM``\ 会用直角符号来表示。

其要求的数据格式为::

    X   Y   圆弧半径    起始方向(相对于水平方向逆时针的度数)     结束方向

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

-Sv、-SV和-S=
~~~~~~~~~~~~~

-Sv用于绘制矢量，输入数据格式为::

    X   Y   方向    长度

<size>为矢量箭头的长度，矢量宽度由-W控制。

-SV与-Sv类似，区别在于第三列是方位角而不是方向。-S=与-SV类似，区域在于第四列长度的单位是千米。

-Sk
~~~

-Sk用于绘制自定义的符号，其语法为\ ``-Sk<name>/<size>``\ ，会依次在当前目录、\ ``~/.gmt``\ 、\ ``$GMT_SHAREDIR``\ 目录中寻找自定义符号的定义文件\ ``<name>.def``\ 。定义文件中的符号默认其大小为1，然后会根据<size>对其进行缩放。关于如何自定义符号，请参考官方文档。

-D选项
------

将要绘制的符号或线段在给定坐标的基础上偏移dx和dy距离。若未指定dy，则默认dy=dx。

-G选项
------

设置符号或多边形的填充色。

-T选项
------

-T选项会忽略所有的输入文件以及标准输入流，在Linux下相当于将空文件\ ``/dev/null``\ 作为输入文件。

该选项常用于只写入PS文件头或只写入PS文件尾，详情参考-K和-O选项的说明。

-N选项
------

默认情况下，位于-R范围外的符号不会被绘制的。使用该选项使得即便符号的坐标位于-R指定的范围外，也会被绘制。

需要注意的是，该选项对线段或多边形无效。


多段数据
--------

对于多段数据而言，每段数据的头段记录中都可以包含一下选项，以使得不同段数据拥有不同的属性。头段记录中的选项会覆盖命令中选项的参数：

- ``-Gfill``\ ：设置当前段数据的填充色
- ``-G-``\ ：对当前数据段关闭填充
- ``-G``\ ：恢复到默认填充色
- ``-W<pen>``\ ：设置当前段数据的画笔属性
- ``-W``\ ：恢复到默认画笔属性\ :ref:`MAP_DEFAULT_PEN <MAP_DEFAULT_PEN>`
- ``-W-``\ ：不绘制轮廓
- ``-Z<zval>``\ ：从cpt文件中查找Z值<zval>所对应的颜色作为填充色
- ``-ZNaN``\ ：从cpt文件中获取NaN颜色
