.. index:: ! pscoast

pscoast
=======

pscoast用于绘制海岸线、河流、国界线等。

-D 数据选择
-----------

::

    -D<resolution>[+]

pscoast可以绘制海岸线、国界以及河流。既然要画，就一定需要数据。

默认情况下，这些数据位于\ ``${GMTHOME}/share/coast``\ 下，包括：

- ``binned_border_x.nc``\ ：国界、省界数据；
- ``binned_GSHHS_x.nc``\ ：海岸线数据；
- `binned_river_x.nc``\ ：河流、湖泊；

每个数据都有5个版本，代表不同的精度，从高到低依次为\ **f**\ ull、\ **h**\ igh、\ **i**\ ntermediate、\ **l**\ ow、\ **c**\ rude。

resolution可以取为f、h、i、l、c。在不使用-D选项的情况下，GMT默认的数据精度为低精度（l）。在精度后加上一个“+”使得命令在找不到当前指定的精度数据时，自动寻找更低精度的数据。

以当前计算机的性能来说，即便是全球区域使用full精度的数据画图也基本不会消耗几秒钟。因而推荐使用\ ``-Df``\ 。

究竟要画什么？
--------------

数据包含了海岸线、国界以及河流湖泊的信息。选好数据精度之后，还有告诉GMT究竟要画哪些部分？下面的六个选项，分别根据数据绘制不同的部分，6个选项至少要选择一个，该命令才会执行。

所有的海岸线数据以及其他，从本质上来说就是多边形。对于一个多边形来说，可以只绘制其所有的边，也可以只给多边形涂色，当然也可以既画边也涂色。

先说说画边的3个选项：

绘制shorelines -W
-----------------

::

    -W[level/]pen

先说说shore这个单词吧。shore指水与陆地交界的“岸”（如：海岸、湖岸、河岸等），是一个较为笼统的说法。

GMT将shoreline分成四个等级（level取1-4）：

#. coastline：真正意义上的海岸线；
#. lakeshore：湖泊与陆地的岸线；
#. island-in-lake shore：首先要有陆地，陆地中有个湖，湖里有个岛。即岛的岸线；
#. lake-in-island-in-lake shore：首先有陆地，陆地中有个湖，湖中有个岛，岛里又有个湖。这里指的是湖的岸线；

不使用-W选项，则不绘制任何shore。如果使用-W，给定画笔属性pen，但是不给出level，则绘制四个level的shore。可以用-Wlevel/pen的方式指定要绘制哪一类shore，并指定pen，且在同一个命令中可以多次使用-W，以指定不同level的shore的画笔属性。

**注意：**-W选项中level是可选的，而pen是必须的！因而若使用``-W2``\ ，2将被解释为所有level的pen属性，而不是level 2。

lakeshore的一些细节 -A
+++++++++++++++++++++++

::

    -Amin_area[/min_level/max_level][+r|l][ppercent]

面积小于min_area或者level不在[min_level,max_level]的shore不会不绘制。min_level和max_level限制哪些level的shore会被绘制，与-W的功能有部分重复。min_area限制了要绘制的多边形的最小面积，这样做使得小面积的湖泊不会干扰整个地图的美观。

对于level 2，即湖岸线，这里的湖包括了常规的湖以及很宽的河流。加上“+r”则只绘制河流湖，加上“+l”则只绘制常规湖。（试验没成功，出现段错误。。。）

一个多边形，降低精度后，边数减少，面积变化，当面积变化过大时再绘制这个多边形就不合适了，可以加上\ **p**\ percent以去除那些面积与全精度面积之比小于percent的多边形。

绘制政治边界 -N
---------------

::

    -N<border>[/<pen>]

注意这里border是必须值，pen是可选值。pen的默认值为width = 0.25p, color = black, texture = solid。

border指定不同的边界类型，可以取值如下：

- 1：国界；
- 2：州界；（目前只有美国、加拿大、澳大利亚以及南美各国的数据）
- 3：Marine boundaries（没看懂到底是什么边界）
- a：1-3的全部边界；

可以多次使用-N选项，以绘制多种政治边界。

绘制河流 -I
-----------

::

    -I<river>[/<pen>]

pen的默认值为width = 0.25p, color = black, texture = solid。

river可以分为如下几类：

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

不清楚这些英语单词的具体区别。一般-Ia或者-Ir就好。

给陆地涂色 -G
-------------

::

    -G<fill>|c

指定所有的dry区域的涂色。可以使用灰度、彩色或者图案。\ ``-Gc``\ 表示裁剪出该区域。

给海洋涂色 -S
-------------

::

    -S<fill>|c

指定所有的wet区域的涂色。可以使用灰度、彩色或者图案。\ ``-Sc``\ 表示裁剪出该区域。

给湖泊涂色 -C
-------------

::

    -C[l|r/]fill

默认情况下，湖泊被当成wet区域，其直接使用-S指定的颜色。这里可以单独指定湖泊的颜色。如果想要对常规湖泊和河流湖分别涂色，则需指定l或r。

小结
----

六个选项，至少需要指定其中一个，也可以指定多个或全部选项。当指定-G而不指定-S时，海洋区域为透明色，即不会覆盖原先已绘的图案；同理，当指定-S而不指定-G时，陆地区域为透明色。

还可以画什么？
---------------

绘制比例尺 -L
++++++++++++++

::

    -L[f][x]lon0/lat0[/slon]/slat/length[m|n|k][+llabel][+jjust][+ppen][+ffill][+u] ]

可以使用psscale命令绘制比例尺，但是对于这种简单的比例尺，pscoast自己就可以搞定。

-  lon0/lat0指定了比例尺中心的经纬度位置。如果使用-Lx，则lon0/lat0被解释为相对原点的x、y距离。
-  不同的经纬度，其比例尺不同，因而需要指定是要哪个地方的比例尺，slat指定纬度，对于倾斜投影也可以指定slon。
-  length为比例尺的长度，单位为km，也可以使用英里（m）或海里（n）。默认比例尺为plain样式，可以使用-Lf得到fancy样式的比例尺。
-  对于fancy样式的比例尺，加上“+l”将在比例尺上方加上当前比例尺的单位（km），也可以加上“+llabel”自定义label，该label的具体属性由\ ``LABEL_FONT``\ 、\ ``LABEL_FONT_SIZE``\ 和\ ``LABEL_OFFSET``\ 控制。label的位置可以使用“+jjust”进行调节，其中just可以取b（bottom）、t（top）、l（left）和r（right）。
-  对于fancy样式的比例尺，加上“+u”可以在比例尺上所有注释处加上单位。
-  +p和+f可以给比例尺的背景处加上边框并涂色。

绘制指向标 -T
+++++++++++++

::

    -T[f|m][x]lon0/lat0/size[/info][:w,e,s,n:][+gint[/mint]]

-  lon0/lat0指定了比例尺中心的经纬度位置。如果使用-Tx，则lon0/lat0被解释为相对原点的x、y距离。
-  size为指向标的直径；
-  可以使用-Tf指定为fancy样式；对于fancy样式，info可以取1、2、3，具体效果看图。
-  也可以使用-Tm指定为罗盘样式，此时info的格式dec/dlabel，dec为磁偏角，dlabel为罗盘指针的label（可以使用“-”使用默认label）。
-  :w,e,s,n:指定了各个方向的名字，可以用任意字符串指定方向名，若n=\*，则在北方向标签处绘制一个星。
-  gints/mints设置了地理方向和地磁方向的注释以及两个tick间隔，默认值为10/5/1和30/5/1。

特殊用法
--------

数据提取
++++++++

如果使用了-m选项，pscoast则不绘图，而将数据写入到标准输出中，因而可以很容易地从GMT中提取出我们需要的海岸线、边界等数据。使用该选项必须指定-J和-R，对于-W、-I和-N，可以需指定其中的至少一个。输出的文本文件为GMT多段数据，但是具体每段数据对应哪一个边界，还得再细细分析。

Clip模式
++++++++

GMT有个命令叫做psclip，其读取一个xy文件，得到一个闭合的多边形，然后clip该区域。接下来所有的绘图命令（无论是线段还是颜色或者文字），只有在该区域才会被绘制，不再该区域则不会被绘制。

pscoast可是使用-Gc剪切出陆地区域，接下来的绘图命令中只有位于陆地区域的部分才会被绘制。

也可以使用-Sc剪切出海洋区域，接下来的绘图命令中只有位于海洋区域的部分才会被绘制。（一个可能的例子：已有etopo数据，包含了全球地形和海水深度数据，若研究区域在海洋，只想绘制海水深度，而不想将陆地的地形也绘制出来，则可以使用-Sc将海洋区域clip出来，然后再使用grdimage绘图）。

在clip结束之后，都需要再次调用pscoast，并加上-Q选项。
