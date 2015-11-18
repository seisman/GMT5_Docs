.. index:: ! pscoast

pscoast
=======

- 官方文档： :ref:`gmt:pscoast`
- 简介：在地图上绘制海岸线、河流、国界线

语法
----

::

    pscoast
        [-Aarea]
        [-C[l|r/]<fill>]
        [-D<resolution>[+]]
        [-W[<level>/]<pen>]
        [-N<border>[/<pen>]]
        [-I<river>[/<pen>] ]
        [-G<fill>|c] [-S<fill>|c]
        [-Lruler] [-Trose] [-Tmag_rose]
        [-Edcw] [-Fbox]
        [-M]
        [-Q]

``-D``
------

绘制海岸线、国界以及河流，就需要边界数据，GMT自带的海岸线数据位于 ``${GMTHOME}/share/coast`` 下，包括：

- ``binned_border_x.nc`` ：国界、省界数据
- ``binned_GSHHS_x.nc`` ：海岸线数据
- ``binned_river_x.nc`` ：河流、湖泊

每个数据都有5个版本，代表不同的精度，从高到低依次为：full、high、intermediate、low和crude。 ``<resolution>`` 可以取为 ``f`` 、 ``h`` 、 ``i`` 、 ``l`` 、 ``c`` ，分别代表使用不同精度的数据。

在不使用 ``-D`` 选项的情况下，GMT默认的数据精度为低精度（ ``l`` ）。在精度后加上一个 ``+`` 则命令在找不到当前指定的精度数据时，自动寻找更低精度的数据。

``-W``
------

绘制shoreline。shore指水与陆地交界的“岸”（如：海岸、湖岸、河岸等），是一个较为笼统的说法。

GMT将shoreline分成四个等级（ ``<level>`` 取1-4）：

#. coastline：海岸线
#. lakeshore：湖泊与陆地的岸线
#. island-in-lake shore：首先要有陆地，陆地中有个湖，湖里有个岛。即岛的岸线
#. lake-in-island-in-lake shore：首先有陆地，陆地中有个湖，湖中有个岛，岛里又有个湖。这里指的是湖的岸线

使用时需要注意：

#. 不使用 ``-W`` 选项，则不绘制任何shore
#. 使用 ``-W`` ，给定画笔属性 ``<pen>`` ，但不给出 ``<level>`` ，则绘制四个level的shore
#. 可以用 ``-W<level>/<pen>`` 的方式指定要绘制哪一个level的shore，并指定线条属性，在同一个命令中可以多次使用 ``-W`` ，以指定不同level的shore的画笔属性
#. ``-W`` 选项中 ``<level>`` 是可选的，而 ``<pen>`` 是必须的！因而 ``-W2`` 会被解释为所有level的画笔属性，而不是level 2。

``-N``
------

该选项用于绘制政治边界。边界类型 ``<border>`` 可以取：

- ``1`` ：国界
- ``2`` ：州界；（目前只有美国、加拿大、澳大利亚以及南美各国的数据）
- ``3`` ：Marine boundaries
- ``a`` ：1-3的全部边界；

.. TODO 3 是什么边界？

注意：

#. ``<border>`` 是必须值， ``<pen>`` 是可选值
#. 可以多次重复使用 ``-N`` 选项，指定不同级别的边界
#. ``<pen>`` 的默认值是 ``default,black,solid``

``-I``
------

绘制河流。河流 ``<river>`` 可以取：

- 0 = Double-lined rivers (river-lakes)
- 1 = Permanent major rivers
- 2 = Additional major rivers
- 3 = Additional rivers
- 4 = Minor rivers
- 5 = Intermittent rivers - major
- 6 = Intermittent rivers - additional
- 7 = Intermittent rivers - minor
- 8 = Major canals
- 9 = Minor canals
- 10 = Irrigation canals
- a = All rivers and canals (0-10)
- A = All rivers and canals except river-lakes (1-10)
- r = All permanent rivers (0-4)
- R = All permanent rivers except river-lakes (1-4)
- i = All intermittent rivers (5-7)
- c = All canals (8-10)

``<pen>`` 的默认值为 ``default,black,solid`` ， ``-I`` 选项可以重复使用多次。

``-G``
------

- ``-G<fill>`` 设置干区域（一般指陆地）填充颜色
- ``-Gc`` 将干区域裁剪出来

``-S``
------

- ``-S<fill>`` 设置湿区域（一般指海洋和湖泊）填充颜色
- ``-Sc`` 将湿区域裁剪出来

``-C``
------

默认情况下，湖泊被当成湿区域，直接使用 ``-S`` 指定的颜色。该选项为湖泊单独指定颜色。

- ``-G<fill>`` 指定湖泊颜色
- ``-Gl<fill>`` 指定湖泊颜色
- ``-Gr<fill>`` 指定河流湖颜色

``-L``  ``-T`` ``-F``
---------------------

绘制比例尺和玫瑰图，见 :doc:`psbasemap` 里对该选项的介绍。

``-A``
-------

该选项的语法是::

    -A<min_area>[/<min_level>/<max_level>][+ag|i|s|S][+r|l][+p<percent>]

面积小于 ``<min_area>`` 平方千米或者level不在 ``[min_level,max_level]`` 范围的shore不会被绘制。默认值为 ``0/0/4`` ，即绘制全部特征。 ``<min_area>`` 限制了要绘制的多边形的最小面积，这样做使得小面积的湖泊不会干扰整个地图的美观。

对于level 2，即湖岸线，包括常规的湖以及很宽的河流。加上 ``+r`` 则只绘制河流湖，加上 ``+l`` 则只绘制常规湖。

对于南极洲而言，海岸线有多种处理方式：

- ``+ai`` 用ice shell boundary作为南极洲的海岸线，默认值
- ``+ag`` 以ice grounding line作为海岸线
- ``+as`` 跳过南纬60度以南的海岸线，这样用户即可使用 ``psxy`` 绘制自己的南极洲海岸线
- ``+aS`` 跳过南纬60度以北的海岸线

``+p<precent>`` ：一个多边形，降低精度后，边数减少，面积变化，当面积变化过大时再绘制这个多边形就不合适了，该子选项用于去除那些面积与最高精度面积之比小于 ``<percent>`` 的多边形。

``-M``
------

将要绘制的多边形以多段ASCII表的格式写出到标准输出，用于从GMT中提取海岸线、边界等数据。

``-Q``
------

使用 ``-Gc`` 和 ``-Sc`` 可以分别裁剪出陆地区域和海洋区域，接下来的其他绘图命令中只有在裁剪区域内的部分才会被绘制。在绘图结束后，需要关闭裁剪，就需要再次调用 ``pscoast`` ，并加上 ``-Q`` 选项。


``-E``
------

GMT5中自带了DCW（Digital Chart of World）数据，即全球的行政区划数据。DCW数据位于 ``${GMTHOME}/share/dcw`` 目录下，包含了全球各国的国界和各国的省界数据。该选项的语法为::

    -E<code1>,<code2>,...[+l|L][+gfill][+ppen][+r|R[incs]]

- ``<code>`` 是要绘制或提取的边界数据的代码，具体代码需要从dcw目录下的文档中查找，代码有如下几种形式

   - 洲代码前加上 ``=`` 则绘制整个洲的边界，比如 ``=AS``
   - 使用国界代码，则绘制国界边界，比如 ``US``
   - 使用 ``国家代码.州代码`` ，则绘制州（省）边界，比如 ``US.TX``

- ``+l`` 列出所有国家及其对应代码
- ``+L`` 列出所有州及其对应代码
- ``+r`` 获取多边形所对应的区域范围，可以加上 ``<xinc>`` 、 ``<xinc>/<yinc>`` 、 ``<winc>/<einc>/<sinc>/<ninc>`` 调整区域范围使得范围是这些步长的整数倍
- ``+R`` 与 ``+r`` 类似，只是之后的 ``<xinc>`` 等参数被解释为区域范围向外扩展的增量
- ``+p<pen>`` 绘制多边形的轮廓
- ``+g<fill>`` 对多边形进行填充







示例
----

::

    gmt pscoast -R-30/30/-40/40 -Jm0.1i -B5 -I1/1p,blue -N1/0.25p,- -I2/0.25p,blue -W0.25p,white -Ggreen -Sblue -P > africa.ps

::

    gmt pscoast -R-30/-10/60/65 -Jm1c -B5 -Gp100/28 > iceland.ps

::

    gmt pscoast  -R-30/30/-40/40 -Jm0.1i -B5 -Gc -P -K > africa.ps
    gmt grdimage -Jm0.1i etopo5.nc -Ccolors.cpt -O -K >> africa.ps
    gmt pscoast  -Q -O >> africa.ps

::

    gmt pscoast  -JM6i -P -Baf -EGB,IT,FR+gblue+p0.25p,red+r -EES,PT,GR+gyellow > map.ps

::

    gmt pscoast -R-26/-12/62/68 -Dh -W -M > iceland.txt

相关
----

:doc:`psbasemap` 、 :doc:`grdlandmask`
