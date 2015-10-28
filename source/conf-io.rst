IO参数
======

.. _IO_N_HEADER_RECS:

IO_N_HEADER_RECS
----------------

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

.. _IO_NC4_CHUNK_SIZE:

IO_NC4_CHUNK_SIZE
-----------------

.. _IO_GRIDFILE_SHORTHAND:

IO_GRIDFILE_SHORTHAND
---------------------

见 :ref:`自定义文件后缀 <custom_grid_io>` 一节。若设置为 ``true`` ，则会检测每个网格文件的后缀是否在用户自定义文件后缀中；若为 ``false`` ，则不检测用户自定义文件后缀。
