J选项
=====

:Create Date: 2015-04-18
:Last Updated: 2015-04-18

J选项用于指定坐标变换或地图投影的方式。一般有两种形式：

- **-J**\ :math:`\delta`\ [*parameters*/]\ *scale*

  :math:`\delta`\ 是某种投影方式所对应的字母的小写。\ *parameters*\ 零个或多个斜杠分隔的投影参数，具体的数目由投影方式决定。\ *scale*\ 是地图比例尺，可以是1度所对应的距离单位或1:xxx。

- **-J**\ :math:`\Delta`\ [*parameters*/]\ *width*

  :math:`\Delta`\ 是某种投影方式对应的字母的大写。\ *parameters*\ 零个或多个斜杠分隔的投影参数，具体的数目由投影方式决定。\ *width*\ 是地图宽度。大多数投影方式下地图的高度由-J选项给出的宽度和-R给出的范围自动决定。-JX线性投影方式可以自由指定宽度和高度。

GMT支持的投影方式如下图所示。

.. _gmt_projections:

.. figure:: /images/GMT_-J.*
   :width: 500 px
   :align: center

   GMT支持的地图投影及坐标变换
