netCDF网格格式
==============

GMT的2D网格文件，可以是netCDF格式也可以是GMT自定义的二进制格式。

GMT所支持的网格文件格式在下表列出，每种格式用一个两字符的ID表示。

.. table::

   +--------+-------------------------------------------------------------+
   | ID     | 说明                                                        |
   +========+=============================================================+
   |        | *GMT 4 netCDF standard formats*                             |
   +--------+-------------------------------------------------------------+
   | ``nb`` | GMT netCDF format (8-bit integer, COARDS, CF-1.5)           |
   +--------+-------------------------------------------------------------+
   | ``ns`` | GMT netCDF format (16-bit integer, COARDS, CF-1.5)          |
   +--------+-------------------------------------------------------------+
   | ``ni`` | GMT netCDF format (32-bit integer, COARDS, CF-1.5)          |
   +--------+-------------------------------------------------------------+
   | ``nf`` | GMT netCDF format (32-bit float, COARDS, CF-1.5)            |
   +--------+-------------------------------------------------------------+
   | ``nd`` | GMT netCDF format (64-bit float, COARDS, CF-1.5)            |
   +--------+-------------------------------------------------------------+
   |        | *GMT 3 netCDF legacy formats*                               |
   +--------+-------------------------------------------------------------+
   | ``cb`` | GMT netCDF format (8-bit integer, depreciated)              |
   +--------+-------------------------------------------------------------+
   | ``cs`` | GMT netCDF format (16-bit integer, depreciated)             |
   +--------+-------------------------------------------------------------+
   | ``ci`` | GMT netCDF format (32-bit integer, depreciated)             |
   +--------+-------------------------------------------------------------+
   | ``cf`` | GMT netCDF format (32-bit float, depreciated)               |
   +--------+-------------------------------------------------------------+
   | ``cd`` | GMT netCDF format (64-bit float, depreciated)               |
   +--------+-------------------------------------------------------------+
   |        | *GMT native binary formats*                                 |
   +--------+-------------------------------------------------------------+
   | ``bm`` | GMT native, C-binary format (bit-mask)                      |
   +--------+-------------------------------------------------------------+
   | ``bb`` | GMT native, C-binary format (8-bit integer)                 |
   +--------+-------------------------------------------------------------+
   | ``bs`` | GMT native, C-binary format (16-bit integer)                |
   +--------+-------------------------------------------------------------+
   | ``bi`` | GMT native, C-binary format (32-bit integer)                |
   +--------+-------------------------------------------------------------+
   | ``bf`` | GMT native, C-binary format (32-bit float)                  |
   +--------+-------------------------------------------------------------+
   | ``bd`` | GMT native, C-binary format (32-bit float)                  |
   +--------+-------------------------------------------------------------+
   |        | *Miscellaneous grid formats*                                |
   +--------+-------------------------------------------------------------+
   | ``rb`` | SUN raster file format (8-bit standard)                     |
   +--------+-------------------------------------------------------------+
   | ``rf`` | GEODAS grid format GRD98 (NGDC)                             |
   +--------+-------------------------------------------------------------+
   | ``sf`` | Golden Software Surfer format 6 (32-bit float)              |
   +--------+-------------------------------------------------------------+
   | ``sd`` | Golden Software Surfer format 7 (64-bit float)              |
   +--------+-------------------------------------------------------------+
   | ``af`` | Atlantic Geoscience Center AGC (32-bit float)               |
   +--------+-------------------------------------------------------------+
   | ``ei`` | ESRI Arc/Info ASCII Grid Interchange format (ASCII integer) |
   +--------+-------------------------------------------------------------+
   | ``ef`` | ESRI Arc/Info ASCII Grid Interchange format (ASCII float)   |
   +--------+-------------------------------------------------------------+
   | ``gd`` | Import/export via GDAL                                      |
   +--------+-------------------------------------------------------------+

GMT在读网格数据时，可以自动检测文件格式，所以不用担心；在写网格数据时，默认使用 ``nf`` 格式，可以在网格文件名后加上 ``=<ID>`` 参数强制指定要写入的网格文件的格式。更完整的语法是::

    <name>[=<ID>[/<scale>/<offset>][/<nan>]]


其中 ``<name>`` 是网格文件名， ``<ID>`` 是要使用的网格文件格式， ``<scale>`` 和 ``<offset>`` 是网格数据要乘以的因子和要加上的偏移量， ``<nan>`` 表明将文件中值为 ``<nan>`` 认为是NaN。 ``<scale>`` 和 ``<offset>`` 都可以取为 ``a`` ，表明由程序自动决定因子和偏移量的值。读数据时，先乘以 ``<scale>`` 再加上 ``<offset>`` ，在写数据时，先加上 ``<offset>`` 再乘以 ``<scale>`` 。

举几个例子：

#. 写一个二进制浮点型网格文件，可以用 ``file.f4=bf``
#. 读一个二进制短整型网格文件，并将数据乘以10再加上32000，但首先将所有等于32767的值设置为NaN，可以用 ``myfile.i2=bs/10/32000/32767``
#. 读入Golden软件公司的surfer软件生成的网格文件，直接用 ``file.grd``
#. 将一个二进制短整数网格文件减去32000再除以10，然后写到标准输出，可以用 ``=bs/0.1/-3200``
#. 写一个8字节整型netCDF网格文件，偏移距由GMT自动决定，可以用 ``=ns//a``

GMT也可以自定义，将某个文件后缀与文件格式关联在一起。这样GMT即可从文件后缀中自动识别出网格文件的格式来，就像Windows下，系统知道 ``docx`` 要用MS Word打开一样。

.. _custom_grid_io:

要实现这一功能，可以在当前目录、 ``${HOME}`` 目录或 ``~/.gmt`` 目录中添加文件 ``gmt.io`` ，该文件的内容如下::

    # suffix format_id scale offset NaNxxxComments # GMT i/o shorthand file
    # It can have any number of comment lines like this one anywhere
    # suffix format_id scale offset  NaN   Comments
    grd        nf        -     -      -    Default format
    b          bf        -     -      -    Native binary floats
    i2         bs        -     -    32767  2-byte integers with NaN value
    ras        rb        -     -      -    Sun raster files
    byte       bb        -     -     255   Native binary 1-byte grids
    bit        bm        -     -      -    Native binary 0 or 1 grids
    mask       bm        -     -      0    Native binary 1 or NaN masks
    faa        bs       0.1    -    32767  Native binary gravity in 0.1 mGal
    ns         ns        a     a      -    16-bit integer netCDF grid with auto-scale and auto-offset

要使用这一特性，需要将参数 :ref:`IO_GRIDFILE_SHORTHAND` 设置为 ``true`` 。此时，文件名 ``file.i2`` 等效于 ``file.i2=bs///32767`` ， ``wet.mask`` 等效于 ``wet.mask=bm/1/0/0`` 。
