.. index:: ! xyz2grd

xyz2grd
=======

官方文档： :ref:`gmt:xyz2grd`

将XYZ数据或Z数据转换成网格文件。

最小示例
--------

::

    xyz2grd input.dat -R0/360/-90/90 -I1 -Goutput.nc -V
