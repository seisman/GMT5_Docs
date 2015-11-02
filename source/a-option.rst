``-a`` 选项
===========

GMT无法识别其他地球科学常用的格式（比如shapefile等），因而需要借助与GDAL提供的 ``ogr2ogr`` 命令将其转换为GMT可识别的数据格式。

``ogr2ogr`` 在将其他格式转换为GMT可识别的数据格式的同时，保留了其他非空间元数据，这种格式称为OGR/GMT格式。可以使用 ``-a`` 选项指定

``-a`` 选项后可以接一个或多个用逗号分隔的 ``<col>=<name>`` 参数，表明要将OGR/GMT文件中的名为 ``<name>`` 的非空间属性字段作为输入数据的第 ``<col>`` 列。

``-a2=depth`` 表明将从文件中的前两列读取X、Y空间位置数据，从文件中读入字段名为 ``depth`` 的非空间数据作为第三列。也可以将 ``<col>`` 设置为 ``D`` 、 ``G`` 、 ``L`` 、 ``T`` 、 ``W`` 、 ``Z`` ，分别表示将该字段用作标签、填充色、画笔属性、查找颜色时用的Z值。

You can also make GMT table-writing tools output the OGR/GMT format
directly. Again, specify if certain GMT data columns with constant
values should be stored as aspatial metadata using the
*col=name*\ [:*type*], where you can optionally specify what data type
it should be (double, integer, string, logical, byte, or datetime)
[double is default]. As for input, you can also use the special *col*
entries of **D**, **G**, **L**, **T**, **W**, or **Z** to have values
stored as options in segment headers be used as the source for the name
aspatial field. Finally, for output you must append
+\ **g**\ *geometry*, where *geometry* can be any of
[**M**]\ **POINT**\ \|\ **LINE**\ \|\ **POLY**; the
**M** represent the multi-versions of these three geometries. Use
upper-case +\ **G** to signal that you want to split any line or polygon
features that straddle the Dateline.
