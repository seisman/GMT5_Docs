.. index:: ! kml2gmt

kml2gmt
=======

官方文档： :ref:`gmt:kml2gmt`

将Google Earth的KML文件转换为GMT表数据

只有包含点、线或多边形的Google Earth KML才能被转换。

语法
----

::

    kml2gmt [<kmlfiles>] [-Z]

``-Z``
------

默认只输出经纬度信息，若使用 ``-Z`` 选项，则输出坐标的高程信息作为GMT的Z值。

示例
----

::

    gmt kml2gmt google.kml -V > google.txt

也可以直接用外部命令 ``ogr2ogr`` 实现转换::

    ogr2ogr -f "GMT" somefile.gmt somefile.kml

相关
----

:doc:`img2google` 、 :doc:`gmt2kml`
