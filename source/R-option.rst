R选项
=====

:Create Date: 2015-03-28
:Last Updated: 2015-04-18

三种方法
--------

``-R``\ 选项定义要绘制的地图区域或者数据的范围。可以用三种方式指定数据范围。

#. **-R**\ *xmin*/*xmax*/*ymin*/*ymax*

   通过给定X方向和Y方向的最大最小值来指定数据范围，例如\ ``-R0/360/-90/90``\ 。

#. **-R**\ *xlleft*/*ylleft*/*xuright*/*yuright*\ **r**

   通过给定矩形区域的左下角坐标(xlleft, ylleft)和右上角坐标(xuright, yuright)来指定数据范围，例如\ ``-R-90/20/-65/30r``\ 。通常用于倾斜的地图投影中。

#. **-R**\ *gridfile*

   从网格文件中读取范围信息。对于某些命令，不仅会从网格中读取范围信息，还会读入网格间隔和网格配准信息。

.. _gmt_region:

.. figure:: /images/GMT_-R.*
   :width: 500 px
   :align: center

   指定数据范围的其中两种方法。(a)指定每个维度的极值；(b)指定左下角和右上角的坐标。

范围格式
--------

地理坐标
~~~~~~~~

地理坐标既可以用浮点数（如-123.45417）表示，也可以用\ ``ddd:mm:ss.xxxW``\ （如\ ``-123:27:15.120W``\ ）表示，这里W表示西经，还可以用E（东经）、N（北纬）、S（南纬）。

``-Rg``\ 表示“global domain”，即\ ``-R0/360/-90/90``\ ；\ ``-Rd``\ 等效于\ ``-R-180/180/-90/90``\ 。

当将地理坐标与笛卡尔线性变换（-JX或-Jx）相结合时，可以通过如下几种方式表明正在使用的是地理坐标而不是简单的笛卡尔坐标。

#. 使用\ ``-Rg``\ 或\ ``-Rd``\ 表明是地理坐标，且是global domain；
#. 使用\ **-Rg**\ *xmin*/*xmax*/*ymin*/*ymax*\ 表明某个有限范围的地理坐标；
#. 在范围后加后缀W、E、S、N或更通用的D、G，比如\ ``-R0/360G/-90/90N``\ ；
#. 使用\ ``-fg``\ 选项表明是地理坐标；

投影后的坐标
~~~~~~~~~~~~

These are Cartesian projected coordinates compatible with the chosen
projection and are given with a leading length *unit*, (e.g.,
**k**-200/200/-300/300 for a 400 by 600 km rectangular area centered
on the projection center (0, 0). These coordinates are internally
converted to the corresponding geographic (longitude, latitude)
coordinates for the lower left and upper right corners. This form is
convenient when you want to specify a region directly in the
projected units (e.g., UTM meters).

绝对时间坐标
~~~~~~~~~~~~

时间格式为 [*date*]\ **T**\ [*clock*]。

其中\ *date*\ 的格式为

#. ``yyyy-mm-dd``\ ：年-月-日
#. ``yyyy-jjj``\ ：年-一年中的第几日
#. ``yyyy-Www-d``\ ：年-第几周-该周内第几天

clock的格式为\ ``hh:mm:ss.xxx``\ ，若未指定则认为是\ ``00:00:00``\ 。

#. 若未给定date，则假定date为今日；
#. 若给定了clock，则必须要给\ **T**\ ；

相对时间坐标
~~~~~~~~~~~~

即相对于某个给定时刻的秒数、小时数、天数或年数。

可以用\ :ref:`TIME_EPOCH <TIME_EPOCH>`\ 指定参考时刻，用\ :ref:`TIME_UNIT <TIME_UNIT>`\ 指定相对时间的单位，也可以用\ :ref:`TIME_SYSTEM <TIME_SYSTEM>`\ 同时指定这两个参数，比如\ ``j2000``\ 表示相对于2000年1月1月午夜的天数。

默认的参考时刻为1970年1月1日午夜，默认的相对时间单位为秒。

有两种方式来表明当前的数据是相对时间数据：

#. 在数据后加上小写的t，比如\ ``30t``\ 表示相对时间30，单位由TIME_UNIT决定；
#. 可以使用\ ``-ft``\ 选项表明数据是相对时间，此时不需要在数字后加t；

其他坐标
~~~~~~~~

即一般的笛卡尔坐标。可以用

#. 一般表示：xxx.xxx
#. 指数表示：xxx.xxExx，其中E可以用e、D、d替换；
