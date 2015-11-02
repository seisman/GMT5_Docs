.. index:: !psxy

psxy
====

官方文档： :ref:`gmt:psxy`

在图上绘制线段、多边形和符号

该命令既可以用于画线段（多边形可以认为是闭合的线段）也可以用于画符号，唯一的区别在于是否使用了 ``-S`` 选项。在不使用 ``-S`` 选项的情况下，默认会将所有的数据点连成线，使用 ``-S`` 选项则仅在数据点所在位置绘制符号。

语法
----

::

    psxy [table] [-A[m|p]] [-C<cptfile>] [-D<dx>/<dy>] [-E[x|y|X|Y][n][<cap>][/[-|+]<pen>]]
        [-G<fill>] [-I<intens>] [-L] [-N] [-S[<symbol>][<size>[u]] [-W[-|+][pen]]

绘制线段
--------

psxy最简单的功能就是绘制线段或多边形，此时数据输入需要两列，即X和Y::

    gmt psxy -R0/10/0/10 -JX10c -B1 > test.ps << EOF
    3 5
    5 8
    7 4
    EOF

``-A``
------

在地理投影下，用psxy绘制两点之间的连线时，默认会将两点按照大圆路径连接起来。

- ``-A`` ：忽略当前的投影方式，直接用直线连接两点
- ``-Am`` ：先沿着经线画，再沿着纬线画
- ``-Ap`` ：先沿着纬线画，再沿着经线画

下图中，黑色曲线为默认情况；红线为使用 ``-A`` 的效果；蓝线为使用 ``-Ap`` 的效果；黄线为使用 ``-Am`` 的效果：

.. figure:: /images/psxy_A.*
   :width: 500px
   :align: center

注：由于这里投影比较特别，所以沿着经线的线和沿着纬线的线，看上去都是直线，在其他投影方式下可能不会是这样。

``-L``
------

该选项会将线段的首尾连起来，以得到一个封闭的多边形。

``-T``
------

该选项会忽略所有的输入文件以及标准输入流，在Linux下相当于将空文件 ``/dev/null`` 作为输入文件。

该选项常用于只写入PS文件头或只写入PS文件尾，见 :doc:`KO-option` 一节。

``-S`` 简介
-----------

使用了 ``-S`` 选项，则表示要绘制符号。 ``-S`` 选项的基本语法是::

    -S[<symbol>][<size>[<u>]]

其中 ``<symbol>`` 指定了符号类型， ``<size>`` 为符号的大小， ``<u>`` 为 ``<size>`` 的单位。

``-S`` 选项相对复杂，与不同的选项连用，或者后面接不同的参数，所需要的输入数据的格式也不同。

不管是什么符号，至少都需要给定符号的位置，即X和Y是必须的::

    X   Y

不同的符号，可能还需要额外的信息，统一写成::

    X   Y   ...

这里， ``...`` 代表某符号特有的输入列。

若 ``-S`` 指定了符号类型但未指定大小，即 ``-S<symbol>`` ，若该符号类型需要指定大小，则需要将符号大小放在输入数据的\ **第三列**\ ，其他输入数据的列号延后，此时数据格式为::

    X   Y   size    ...

若size<=0，则跳过该记录行。

若 ``-S`` 选项后未指定符号代码，则符号代码必须位于输入文件的\ **最后一列**\ ::

    X   Y   ...   symbol

若使用了 ``-C`` 和 ``-S`` 选项，则符号的填充色由数据的第三列决定，其他字段依次后移::

    X   Y  Z   ...  symbol

因而总结一下输入数据的格式为::

    x  y  [Z]  [size]  ...   [symbol]

其中 ``...`` 为某些符号所要求的特殊的数据列， ``symbol`` 是未指定符号时必须的输入列， ``size`` 是未指定大小时的输入列。

``-S`` 的简单符号
-----------------

先介绍几个最简单的符号：

- ``-S-`` ：短横线，size是短横线的长度；
- ``-S+`` ：加号，size是加号的外接圆的直径；
- ``-Sa`` ：星号（st\ **a**\ r），size是星号的外接圆直径；
- ``-Sc`` ：圆（\ **c**\ ircle），size为圆的直径；
- ``-Sd`` ：钻石（\ **d**\ iamond），size为外接圆直径；
- ``-Sg`` ：八角形（octa\ **g**\ on），size为外接圆直径；
- ``-Sh`` ：六边形（**h**\ exagon），size为外接圆直径；
- ``-Si`` ：倒三角（**i**\ nverted triangle），size为外接圆直径；
- ``-Sn`` ：五角形（pe\ **n**\ tagon），size为外接圆直径；
- ``-Ss`` ：正方形（\ **s**\ quare），size为外接圆直径；
- ``-St`` ：三角形（\ **t**\ riangle），size为外接圆直径；
- ``-Sx`` ：叉号（cross），size为外接圆直径；
- ``-Sy`` ：短竖线，size为短竖线的长度；
- ``-Sp`` ：点，不需要指定size，点的大小始终为一个像素点；

对于小写符号 ``acdghinst`` ， ``<size>`` 表示外接圆直径；对于大写符号 ``ACDGHINST``， ``<size>`` 表示符号的面积与直径为 ``<size>`` 的圆的面积相同。

下图给出了上面所给出的symbol所对应的符号：

.. figure:: /images/simple_symbols.*
   :width: 700px
   :align: center
   :alt: psxy simple symbols

除了上面介绍的symbol之外，还有一些更复杂一些的symbol。

``-Sb|B``
---------

``-Sb`` 对应的语法为::

    -Sb[[<size>c|i|p|u]][b[<base>]]

用于在X坐标处绘制一个从 ``<base>`` 到Y位置的垂直bar。

- ``<size>`` 为bar宽度
- 默认的 ``<base>`` 为ymin
- 若未指定 ``<base>`` ，则从输入的最后一列读入
- ``-SB`` 与 ``-Sb`` 类似，区别在于 ``-SB`` 绘制水平bar

.. TODO　若-S未指定符号，且文件中指定符号为b，那么是符号在最后一列还是base在最后一列

::

    gmt psxy -R0/10/0/10 -JX10c/10c -B1 -Sb1cb0 > test.ps << EOF
    2 3
    4 5
    8 6
    EOF

``-Se|E``
---------

``-Se`` 用于绘制椭圆，对于椭圆而言， ``<size>`` 是不需要的。此时输入数据的格式为::

    X   Y   方向   长轴长度    短轴长度

其中方向是相对于水平方向逆时针旋转的角度，两个轴的长度都使用单独单位，即厘米。

``-SE`` 选项与 ``-Se`` 类似，区别在于：

- 第三列为方位角，且该角度会根据所选取的地图投影变换成角度
- 对于线性投影，长短轴的长度单位为数据单位
- 对于地理投影，长轴和短轴的长度单位为千米

用长度单位指定一个椭圆::

    echo 180 0 45 5c 3c | gmt psxy -R0/360/-90/90 -JN15c -B60 -Se > test.ps

线性投影下 ``-SE`` 的长短轴的单位为数据单位::

    echo 180 0 45 300 100 | gmt psxy -R0/360/-90/90 -JX10c -B60 -SE > test.ps

地理投影下 ``-SE`` 的长短轴的单位是千米::

    echo 80 0 45 22200 11100 | gmt psxy -R0/360/-90/90 -JN15c -B60 -SE > test.ps

长短轴长度相同的椭圆退化成圆，可以用于绘制用千米指定直径的圆，从而解决了 ``-Sc`` 只能用长度单位指定圆的不足，这一特性可以用于绘制等震中距线。由于这个很常用，GMT提供了 ``-SE-`` 选项，此时不需要给定方向和长短轴，直接给定直径即可。比如60度等震中距线可以用如下命令绘制::

    echo 80 0 6660 | gmt psxy -R0/360/-90/90 -JN15c -B60 -SE- > test.ps

-Sf
---

``-Sf`` 用于在线段上加上符号表示断层等front，其语法为::

    -Sf<gap>[/<size>][+l|+r][+b+c+f+s+t][+o<offset>]

- ``<gap>`` 为线段上符号之间的距离，若 ``<gap>`` 为负值，则解释为线段上的符号的个数
- ``<size>`` 为符号大小，若省略了 ``<size>`` ，则默认设置 ``<size>`` 为 ``<gap>`` 的30%，若 ``<gap>`` 为负值，则 ``<size>`` 是必须的
- ``+l`` 和 ``+r`` 分别表示将符号画在线段的左侧还是右侧，默认是绘制在线段中间
- ``+b`` 、 ``+c`` 、 ``+f`` 、 ``+s`` 、 ``+t`` 分别表示符号为box、circle、fault、slip、triangle。默认值为 ``+f`` ，即fault。 ```slip`` 用于绘制左旋或右旋断层。
- ``+o<offset>`` 会将线段上的第一个符号相对于线段的起点偏离 ``<offset>`` 距离

下面的例子分别绘制了 ``+b`` 、 ``+c`` 、 ``+f`` 、 ``+s`` 、 ``+t`` 所对应的符号：

.. code-block:: bash

   #!/bin/bash
   R=150/200/20/50
   J=M15c
   PS=symbol_Sf.ps
   gmt psbasemap -R$R -J$J -B10 -K > $PS
   gmt psxy -R$R -J$J -Sf2c/0.1i+l+b -Gblack -W -K -O >> $PS << EOF
   155 30
   160 40
   EOF
   gmt psxy -R$R -J$J -Sf2c/0.1i+l+c -Gblue -W -K -O >> $PS << EOF
   165 30
   170 40
   EOF
   gmt psxy -R$R -J$J -Sf2c/0.1i+l+f -Gred -W -K -O >> $PS << EOF
   175 30
   180 40
   EOF
   gmt psxy -R$R -J$J -Sf2c/0.3i+l+s+o1 -Gyellow -W -K -O >> $PS << EOF
   185 30
   190 40
   EOF
   gmt psxy -R$R -J$J -Sf1c/0.1i+l+t -Gwhite -W -B10 -K -O >> $PS << EOF
   195 30
   200 40
   EOF
   gmt psxy -R$R -J$J -T -O >> $PS
   rm gmt.*

.. figure:: /images/symbol_Sf.*
   :width: 500px
   :align: center
   :alt: psxy -Sf example

-Sr
---

``-Sr`` 用于绘制矩形， ``<size>`` 对该符号无效，其输入格式为::

    X   Y   X轴长度   Y轴长度

-SR
---

``-SR`` 用于绘制圆角矩形， ``<size>`` 对该符号无用。其输入格式为::

    X   Y   X轴长度     Y轴长度     圆角半径

``-Sj|J``
---------

``-Sj`` 用于绘制旋转的矩形，其输入数据为::

    X   Y   方向    X轴长度     Y轴长度

``-SJ`` 与 ``-Sj`` 类似，输入的第三列是方位角，X轴和Y轴长度的单位为千米。

``-Sw|W``
---------

``-SW`` 和 ``-Sw`` 可以用于绘制楔形饼图（pie **w**\ edge），即饼图中的一个切片。 ``<size>`` 是楔形饼图所对应的圆的 **直径** 。

其所需要的输入数据格式为::

    X   Y   start_direction     stop_direcrion

其中第三、四列是切片的开始方向和结束方向。若使用 ``-Sw`` ，则方向定义为相对于X轴正方向（即东向）逆时针旋转的角度；若使用 ``-SW`` ，则方向定义为方位角，即相对于北向顺时针旋转的角度。

下面的示例分别用 ``-SW`` 和 ``-Sw`` 画了两个不同大小的楔形饼图：

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

``-Sm|M``
---------

``-Sm`` 选项可以用于绘制一段数学圆弧。 ``<size>`` 为矢量箭头的长度，圆弧的线宽由 ``-W`` 选项设定。 ``-SM`` 选项与 ``-Sm`` 完全相同，只是当圆弧的夹角恰好是90度是， ``-SM`` 会用直角符号来表示。圆弧上的箭头，在后面会介绍。

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

``-Sv|V|=``
-----------

``-Sv`` 用于绘制矢量，输入数据格式为::

    X   Y   方向    长度

``<size>`` 为矢量箭头的长度，矢量宽度由 ``-W`` 控制。

``-SV`` 与 ``-Sv`` 类似，区别在于第三列是方位角而不是方向。 ``-S=`` 与 ``-SV`` 类似，区别在于第四列长度的单位是千米。

::

    echo 2 2 45 5c | gmt psxy -R0/10/0/10 -JX10c/10c -B1 -Sv1c+e -W2p > test.ps

关于箭头属性，见后面的内容。

``-Sk``
-------

``-Sk`` 用于绘制自定义的符号，其语法为::

    -Sk<name>/<size>

会依次在当前目录、 ``~/.gmt`` 、 ``$GMT_SHAREDIR/custom`` 目录中寻找自定义符号的定义文件 ``<name>.def`` 。定义文件中的符号默认其大小为1，然后会根据 ``<size>`` 对其进行缩放。关于如何自定义符号，请参考官方文档。

``-Sl``
-------

``-Sl`` 用于绘制文本字符串，其语法为::

    -Sl<size>+t<string>+j<justify>

与 :doc:`pstext` 类似，不知道设计这个干嘛的。

``-Sq``
-------

``-S`` 用于绘制带标注的线段，比如等值线、带断层名的断层线等。其语法为::

    -Sq[d|D|f|l|L|n|x|X]<info>[:<labelinfo>]

- ``d<dist>[<u>]`` 标签在线上的距离，单位 ``<u>`` 可以取 ``c|i|p``
- ``D<dist>[<u>]`` 标签在线上的距离，单位 ``<u>`` 可以取 ``e|f|k|M|n|u|d|m|s``

未完成。

.. TODO -Sq选项未完成

``-C``
------

``-C`` 选项后跟一个cpt文件。若使用了 ``-S`` 选项，则符号的填充色由数据的第三列Z值决定，其他数据列依次后移一列（比如size移到第四列）。若未指定 ``-S`` 选项，则用户需要在多段数据的头段中指定 ``-Z<val>`` ，然后从cpt文件中查找 ``<val>`` 所对应的颜色，以控制线段或多边形的线条颜色。

``-I``
------

``-I<intens>`` ，其中 ``<intens>`` 的取值范围为-1到1，用于对填充色做微调以模拟光照效果。正值表示亮色，负值表示暗色，零表示原色。

``-D``
------

将要绘制的符号或线段在给定坐标的基础上偏移 ``<dx>/<dy>`` 距离。若未指定 ``<dy>`` ，则默认 ``dy=dx`` 。

``-G``
------

设置符号或多边形的填充色。

``-N``
------

默认情况下，位于 ``-R`` 范围外的符号不会被绘制的。使用该选项使得即便符号的坐标位于 ``-R`` 指定的范围外，也会被绘制。

需要注意的是，该选项对线段或多边形无效。

``-W``
------

线段或符号的轮廓的线条属性。 ``-W+`` 表示通过 ``-C`` 选项的CPT文件同时查找填充色和轮廓色。 ``-W-`` 表示通过 ``-C`` 选项的CPT文件查找轮廓的颜色并关闭符号的填充。

``-E``
------

``-E`` 选项用于绘制误差棒，其语法为::

    -E[x|y|X|Y][n][<cap>][/[-|+]<pen>]

- ``x`` 和 ``y`` ：X方向和/或Y方向误差棒
- ``<cap>`` 是误差棒顶端一横的长度
- ``<pen>`` 是误差棒的线条属性， ``+|-`` 的含义与 ``-W`` 选项相同

输入数据格式为::

    X  Y   [size]    [X_error]  [Y_error]

X方向误差为1::

    echo 5 5 1 | gmt psxy -R0/10/0/10 -JX10c/10c -B1 -Sc0.1c -Ex -W2p > test.ps

X方向误差为1，Y方向误差为0.5::

    echo 5 5 1 0.5 | gmt psxy -R0/10/0/10 -JX10c/10c -B1 -Sc0.1c -Exy -W2p > test.ps

使用 ``X`` 和 ``Y`` 则绘制box-and-whisker（即stem-and-leaf）符号。以 ``-EX`` 为例，此时数据数据格式为::

    X中位数  Y  0%位数 25%位数 75%位数 100%位数

::

    echo 5 5 4 4.25 5.4 7 | gmt psxy -R0/10/0/10 -JX10c/10c -B1 -Sc0.1c -EX -W2p > test.ps

如果是同时绘制X和Y方向的，就需要指定10个输入了。若在X或Y后加上了 ``n`` ，则需要在额外的第5列数据指定中位数的不确定性。。。

多段数据
--------

对于多段数据而言，每段数据的头段记录中都可以包含一些选项，以使得不同段数据拥有不同的属性。头段记录中的选项会覆盖命令中选项的参数：

- ``-Gfill`` ：设置当前段数据的填充色
- ``-G-`` ：对当前数据段关闭填充
- ``-G`` ：恢复到默认填充色
- ``-W<pen>`` ：设置当前段数据的画笔属性
- ``-W`` ：恢复到默认画笔属性\ :ref:`MAP_DEFAULT_PEN <MAP_DEFAULT_PEN>`
- ``-W-`` ：不绘制轮廓
- ``-Z<zval>`` ：从cpt文件中查找Z值<zval>所对应的颜色作为填充色
- ``-ZNaN`` ：从cpt文件中获取NaN颜色

箭头属性
--------

在使用与箭头有关的符号时，比如 ``-SV`` 、 ``-Sm`` 等，可以指定额外的子选项，以设置箭头的相关属性。

- ``+a<angle>`` 箭头的尖端的角度，默认值为30
- ``+b[l|r]`` 、 ``+e[l|r]`` ：将箭头放在矢量的首端或尾端， ``l`` 和 ``r`` 表示绘制左半、右半箭头
- ``+g<fill>`` 箭头的填充色，若为 ``-`` 则不填充
- ``+l`` 、 ``+r`` 只绘制左半、右半箭头
- ``+n<norm>`` scales down vector attributes (pen thickness, head size) with decreasing length, where vectors shorter than *norm* will have their a  ttributes scaled by length/\ *norm* [arrow attributes remains invariant to length].
- ``+o<plon>/<plat>`` specifies the oblique pole for the great or small circles.  Only needed for great circles if **+q** is given.
- ``+p[<pen>]`` 设置箭头轮廓的画笔属性，若 ``<pen>`` 取为``-`` 则不绘制轮廓
- ``+q`` means the input *angle*, *length* data instead represent the *start* and *stop*
    opening angles of the arc segment relative to the given point.
- ``+j<just>`` determines how the input *x*,\ *y* point relates to the
    vector. Choose from **b**\ eginning [default], **e**\ nd, or **c**\ enter.
- ``+s`` means the input *angle*, *length* is instead the *x*, *y*
    coordinates of the vector end point.
