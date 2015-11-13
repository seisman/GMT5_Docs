.. index:: ! gmtinfo

gmtinfo
=======

- 官方文档： :ref:`gmt:gmtinfo`
- 简介：从表数据中提取信息

语法
----

::

    gmtinfo [<table>] [-Aa|f|s] [-C] [-D[<dx>[/<dy>]]] [-EL|l|H|h<col>]
        [-I[p|f|s]<dx>[/<dy>[/<dz>...]] [-S[x][y]] [-T<dz>[/<col>]] [-r]

最小示例
--------

提取文件中各列的极值::

    $ gmt info input.dat
    input.dat: N = 6    <1/2>   <1/3>   <0/3.2>

从输出中可以看到，输入文件中有6行3列，三列数据的范围分别是1到2、1到3和0到3.2。

``-C``
------

在输出每一列的最大最小值时，默认会用 ``<min/max>`` 的格式输出，不易于脚本处理。该选项会将每列的最大最小值分别输出为一列::

    $ gmt info input.dat -C
    1   2   1   3   0   3.2

该选项经常与 ``-i`` 及 ``-o`` 选项一起使用，以提取部分列的最值信息。

``-A``
------

输入数据为多段数据或多文件时的处理方式：

- ``-Aa`` ：报告所有文件的总最值
- ``-Af`` ：分别报告各个文件自己的最值
- ``-As`` ：分别报告各段数据自己的最值

``-I``
------

调整最大/小值使得其是给定的增量的最近倍数，返回的格式为 ``-Rw/e/s/n`` ::

    $ gmt info input.dat -I2/2
    -R0/2/0/4

如果设置 ``<dx>`` 的值为 ``-`` ，则表示以 ``-Rw/e/s/n`` 的格式输出真实的 ``-R`` 范围::

    $ gmt info input.dat -I-
    -R1/2/1/3

当 ``-I`` 选项和 ``-C`` 选项一起使用时，输出不再是 ``-Rw/e/s/n`` 格式::

    $ gmt info input.dat -C -I2
    0   2   0   4   0   3.2

上面的例子中， ``-I`` 选项后只接了一个增量，此时第二列数据也会使用同样的增量（出于向后兼容性考虑）。若只想要为第一列指定增量，第二列不指定，可以使用 ``-Ip`` 选项::

    $ gmt info input.dat -C -Ip2
    0   2   1   3   0   3.2

对于某些算法，比如FFT或者surface命令， ``-R`` 选项的不同取值会影响到运算的速度， ``-If`` 会输出优化后的 ``-R`` 以得到最快FFT结果， ``-Is`` 会输出优化后的 ``-R`` 以得到最快的surface结果。

``-T``
------

以 ``-Tzmin/zmax/dz`` 的形式报告第 ``<col>`` 列的最值，默认报告第1列。该选项必须 ``-I``  选项连用。

``-D``
------

对 ``-I`` 选项的结果做整体偏移，使得区域范围的中心与原数据的中心对齐。比如数据的真实范围是 ``0/3`` ，使用 ``-I2`` 选项会得到 ``0/4`` ，在此基础上使用 ``-D`` 选项，则变成 ``-0.5/3.5`` 。

``-E``
------

返回第 ``<col>`` 列最值所在的记录行。

- ``l|h`` 表示返回最小、最大值所在的记录行
- ``L|H`` 表示返回绝对值最小、最大值所在的记录行

若有多行均满足要求，则只返回第一行。若 ``<col>`` 未指定，则默认是最后一列。

``-S``
------

Add extra space for error bars. Useful together with **-I** option
and when later plotting with **psxy** **-E**. **-Sx** leaves space
for horizontal error bars using the values in third
(2) column. **-Sy** leaves space for vertical error
bars using the values in third (2) column. **-S**
or **-Sxy** leaves space for both error bars using the values in
third and fourth (2 and 3) columns.
To use another column, append /\ *col*. Only works when **-I** is
selected.

