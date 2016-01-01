IO参数
======

.. _IO_HEADER:

IO_HEADER
---------

指定输入/输出的ASCII文件中是否有头记录，默认值为 ``false`` ，若值为 ``true`` ，则相当于使用了 ``-h`` 选项。

.. _IO_LONLAT_TOGGLE:

IO_LONLAT_TOGGLE
----------------

该参数的作用与 ``-:`` 选项相同。其可以取如下值：

#. ``false`` 默认值，输入/输出数据均为 (x, y)
#. ``true`` 输入/输出数据均为 (y, x)
#. ``IN`` 仅输入数据为 (y, x)
#. ``OUT`` 仅输出数据为 (y, x)

.. _IO_N_HEADER_RECS:

IO_N_HEADER_RECS
----------------

指定在使用 ``-h`` 选项时，默认的头记录的数目，默认值为0。

.. _IO_NAN_RECORDS:

IO_NAN_RECORDS
--------------

控制当读入的记录中的X、Y或Z包含 ``NaN`` 记录时的处理方式。可以取如下值：

- ``skip`` ：直接跳过 ``NaN`` 记录，并报告NaN记录的数目
- ``pass`` ：将所有记录传递给程序，默认值

.. _IO_COL_SEPARATOR:

IO_COL_SEPARATOR
----------------

GMT输出ASCII表数据时列与列之间的分隔符，可以取 ``tab`` 、 ``space`` 、 ``comma`` 和 ``none`` ，默认值为 ``tab`` 。

.. _IO_SEGMENT_MARKER:

IO_SEGMENT_MARKER
-----------------

多段数据中每段数据开始的标识符，默认值为 ``>`` 。若希望输入和输出数据中使用不同的数据段标识符，则可以使用逗号分隔输入和输出数据的段标识符，比如 ``>,:`` 。

有两个特殊的标识符：

#. ``B`` 表示将空行作为数据段开始的标识符
#. ``N`` 表示将一个NaN记录作为数据段开始的标识符

.. TODO To use B or N as regular segment markers you must escape them with a leading backslash.

.. _IO_NC4_CHUNK_SIZE:

IO_NC4_CHUNK_SIZE
-----------------

该参数控制了读写netCDF数据的效率，详情见官方文档。

.. _IO_NC4_DEFLATION_LEVEL:

IO_NC4_DEFLATION_LEVEL
----------------------

输出netCDF4格式的数据时所使用的压缩等级。可以取0到9的整数，0表示不压缩，9表示最大压缩。低压缩率可以提高性能并减少文件尺寸，而高压缩率虽然可以进一步减小文件尺寸，但却需要更多的处理时间。

.. _IO_SEGMENT_BINARY:

IO_SEGMENT_BINARY
-----------------

.. TODO

.. _IO_GRIDFILE_SHORTHAND:

IO_GRIDFILE_SHORTHAND
---------------------

见 :doc:`grid-suffix` 一节。若设置为 ``true`` ，则会检测每个网格文件的后缀是否在用户自定义文件后缀中；若为 ``false`` ，则不检测用户自定义文件后缀。

.. _IO_GRIDFILE_FORMAT:

IO_GRIDFILE_FORMAT
------------------

GMT默认使用的网格文件格式，该参数的值的格式为::

    <ff>/<scale>/<offset>/<invalid>

``<ff>`` 是两个字符的文件格式代码，见 :ref:`grid-format` 一节的介绍。
