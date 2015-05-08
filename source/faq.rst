FAQ
===

:ctime: 2015-04-01
:mtime: 2015-04-25

Q1
--

使用ps2raster时出现如下错误::

    GMT PS format detected but file is not finalized. Maybe a -K in excess? No output created.

出现这种错误的最常见原因是最后一个绘图命令里多了一个\ ``-K``\ ，即本该只使用\ ``-O``\ 选项关闭PS文件的，但却使用了\ ``-K -O``\ 选项。

Q2
--

使用pscoast时出现如下错误::

    pscoast: low resolution shoreline data base not installed.

出现该错误的原因是未安装gshhg数据， 或安装方式/路径不正确。

Q3
--

使用psxy或其他类似命令时，出现::

    psxy: Mismatch between actual (1) and expected (2) fields near line 10 (skipped)

出现该错误的原因是当前命令需要两列数据，而在第10行左右数据只有一列。此时需要人工检查一下第10行附近的数据。需要注意，这里的第10行不一定是准备数字。

Q4
--

在使用地图投影时，为何无法给坐标轴加label？命令如下::

    gmt psbasemap -R0/10/0/10 -JX10c -B1 -Bx+l"Latitude" -By+"Longtitude" > a.ps

从绘图效果中可以看出，“Latitude”和“Longtitude”是没有加进去的。这不是Bug，而是一个Feature。因为对于使用地图投影绘制的地图，从“火车道”边框或标注上的“度”符号都可以直观的知道这是一个地图投影而不是笛卡尔投影。而对于地图投影来说，X方向是经度、Y方向是纬度，是基本常识，给坐标轴加label反而是多此一举，故而对于地图投影来说，坐标轴是不能加label的。

如果执意要给坐标轴加label，只能用pstext手动添加。
