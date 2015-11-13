.. index:: !psconvert

psconvert
=========

- 官方文档： :ref:`gmt:psconvert`
- 将GMT生成的PS文件转换为其他图片格式

支持BMP、EPS、JPEG、PDF、PNG、PPM、SVG、TIFF格式。

语法
----

::

    ps2raster psfile(s)
        [-A[u][<margins>][-][+g<paint>][+p<pen>][+r][+s[m]|S<width>[<u>]/<height>[<u>]]
        [-C<gs_option>] [-D<outdir>] [-E<resolution>] [-G<ghost_path>] [-F<out_name>]
        [-I] [-L<listfile>] [-P] [-Q[g|t][1|2|4]] [-S] [-Tb|e|E|f|F|j|g|G|m|s|t]
        [-W[+g][+t<docname>][+n<layername>][+o<foldername>][+a<altmode>[<alt>]][+l<minLOD>/<maxLOD>][+f<minfade>/<maxfade>][+u<URL>]]
        [-Z]

最小示例
--------

如下命令会将PS文件转换成JPG格式::

    gmt ps2raster test.ps
    gmt ps2raster test1.ps test2.ps map*.ps

输出文件的文件名与原文件相同，仅后缀不同。

``-T``
------

指定要转换的图片格式。可以接如下值：

- ``b`` ：BMP；
- ``e`` ：EPS；
- ``E`` ：带有PageSize命令的EPS；
- ``f`` ：PDF；
- ``F`` ：多页PDF；
- ``j`` ：JPEG（默认值）;
- ``g`` ：PNG；
- ``G`` ：透明PNG；
- ``m`` ：PPM；
- ``s`` ：SVG；
- ``t`` ：TIFF；

说明：

#. ``g`` 和 ``G`` 的区别在于前者背景色为白色，后者背景色为透明；
#. 对于 ``bjgt`` ，可以在其后加 ``-`` ，则会将PS文件转换为灰度图；
#. EPS格式可以与其他格式合在一起使用。比如 ``-Tef`` 会同时生成EPS和PDF文件。除此之外，该命令一次只能转换一种格式，比如 ``-Tbf`` 则只会生成PDF格式（即以 ``-T`` 选项中的最后一个格式为准）
#. ``-TF`` 会将多个PS/PDF文件转换并合并成一个多页的PDF文件，需要使用 ``-F`` 选项指定输出的文件名

转换为PDF格式::

    gmt ps2raster -Tf test.ps

转换为JPG格式的灰度图::

    gmt ps2raster -Tj- test.ps

利用一堆PS文件生成一个多页PDF::

    gmt ps2raster -TF -Fout.pdf *.ps

``-F``
------

默认情况下，该命令会直接使用输入的PS文件名，并修改其后缀作为输出文件的文件名。比如 ``test.ps`` 转换出的图片则为 ``test.jpg`` 、  ``test.png`` 之类的。

``-F`` 选项可强制指定输出文件名，文件后缀由输出的文件格式自动决定::

    gmt ps2raster -Tf -Fout test.ps

``-E``
------

指定图片精度，值越大，图片越清晰，文件也越大。PDF格式默认值为720，其他格式默认值为300，单位为dpi。

::

    gmt ps2raster -Tj -E600 test.ps

说明：

#. EPS是矢量图片格式，-E选项对其无效
#. PDF是矢量图片格式，-E选项对其中的pattern和字体有效

``-A``
------

默认情况下，转换得到的图片的大小由PS文件的纸张尺寸决定。通常画图的时候是不会把一张A4纸画满的，所以在图片周围就会出现多余的白色部分。

``-A`` 选项会对PS文件进行裁剪，仅保留其中有绘图的部分::

    gmt ps2raster -A test.ps

``-Au`` 会先将GMT的时间戳去掉再裁剪。

默认的裁剪会把图片裁剪到尽可能小，感觉有些过了，可以加上额外的边距 ``<margins>`` 。其中 ``<margins>`` 可以取：

#. 一个数，四条边的额外边距相同，如 ``-A0.5c``
#. 两个数字，分别指定X和Y方向的额外边距，如 ``-A0.5c/1c``
#. 四个数字，分别指定上下左右四条边的边距，如 ``-A0.5c/0.5c/0.5c/0.5c``

- ``-A+sm`` set a maximum size and the new width are only imposed if the original figure width exceeds it. Append ``<new_height>`` to also impose a maximum height in addition to the width.
- ``-A+s<width>`` 指定最终生成的图片的宽度，高度自动决定。程序会对图片做插值以保证 ``-E`` 的值
- ``-A+S<scale>`` 则指定图片的缩放比例

如下命令会生成一个宽均为5厘米的图片::

    gmt ps2raster -A+s5cc test.ps

- ``-A-`` 覆盖 ``-W`` 选项中自动设置的 ``-A`` 值
- ``-A+r`` 会使得在计算边界时使用round函数而不是ceil函数，这会对裁剪造成极其微小的区别，仅当要处理非常小的图片时才需要使用。
- ``-A+g<paint>`` 为BoundingBox指定填充色
- ``-A+p<pen>`` 为BoundingBox指定边框颜色

``-P``
------

该选项会强制转换后的图片为Portrait模式。

若PS文件在绘图时使用了 ``-P`` 选项，则ps2raster的 ``-P`` 选项无效；若PS文件在绘图时未使用 ``-P`` 选项，则ps2raster的 ``-P`` 选项会将图片旋转90度。

``-D``
------

默认情况下，会在PS文件同一目录中生成其他图片文件，使用 ``-D<outdir>`` 选项可以指定输出目录， ``-D.`` 表示在当前目录输出。需注意，输出目录必须已存在。

``-G``
------

ps2raster在底层是调用ghostscript来实现PS到其他格式的转换的，因而成功转换的前提是必须能够找到ghostscript的可执行文件， ``-G`` 选项即用于显式指定ghostscript可执行文件的路径。

说明：

#. Linux下一般不需要设置ghostscript的路径，除非你自己重新编译了gs并安装到了非标准路径下
#. Windows下，一般也不需要使用该选项，程序会自动从注册表里获取路径信息
#. 如果从注册表中获取路径失败，则必须指定-G选项，例如 ``-Gc:\programs\gs\gs9.02\bin\gswin64c``

``-C``
------

该选项用于在调用ghostscrip时传给ghostscript额外的选项，若要额外给ghostscript增加多个选项，可重复使用 ``-C`` 命名。

在Windows下，若PS文件中含中文，则可能需要使用 ``-C`` 选项告诉ghostscript字体路径::

    gmt ps2raster -C-sFONTPATH=C:\Windows\Fonts chinese.ps

``-L``
------

``-L<listfile>`` 中 ``<listfile>`` 包含要转换的所有PS文件名

``-S``
------

在执行ghostscript命令后，将具体的命令打印到标准错误流中，且保留转换过程中的所有临时文件。该选项主要用于调试。

``-Z``
------

转换完成后删除输入的PS文件。若转换失败，输入的PS文件不会被删除。

.. TODO:: -I -Q

``-W``
------

.. TODO:: 具体语法未整理

To create a simple linear map with pscoast and convert it to tif with ::

    gmt pscoast -JX12cd -R-10/-4/37/43 -W1 -Di -Bg30m -P -G200 --MAP_FRAME_TYPE=inside > cara.ps
    gmt ps2raster cara.ps -Tt -W

To create a Mercator version of the above example and use GDAL to produce a true geotiff file::

    gmt pscoast -JM0/12c -R-10/-4/37/43 -W1 -Di -Bg30m -P -G200 --MAP_FRAME_TYPE=inside > cara.ps
    gdalwarp -s_srs +proj=merc cara.tif carageo.tiff

To create a Polar Stereographic geotiff file of Patagonia

   ::

    gmt pscoast -JS-55/-60/15c -R-77/-55/-57.5/-48r -Di -Gred -P -Bg2 \
    --MAP_FRAME_TYPE=inside > patagonia.ps
    gmt ps2raster patagonia.ps -Tt -W+g -V

To create a simple KMZ file for use in Google Earth, try

   ::

    gmt grdimage lonlatgrid.nc -Jx1 -Ccolors.cpt -P -B0g2 --MAP_FRAME_TYPE=inside > tile.ps
    gmt ps2raster tile.ps -Tg -W+k+t"my title"+l256/-1 -V


其他
----

#. 转换为PDF、PNG时使用DEFALTE压缩；转换为TIFF时使用LZW压缩；
#. ps2raster还可以用于其他命令生成的PS文件；

BUGS
----

#. Windows下会自动为文件名加双引号，导致无法找到要转换的PS文（v5.1.1）
#. 使用 ``-A`` 选项时， ``-C`` 选项无效，导致无法在Windows转换含中文的PS文件（v5.1.1）
#. 不能使用 ``-F`` 选项，即不能生成多页PDF（v5.1.2）
