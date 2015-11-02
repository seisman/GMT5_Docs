DIR参数
=======

.. _DIR_DCW:

DIR_DCW
-------

DCW数据文件的路径，默认值为空。

.. _DIR_GSHHG:

DIR_GSHHG
---------

海岸线数据gshhg的所在的路径，默认值为 ``$GMT_SHAREDIR/coast``

DIR_DATA
--------

对于GMT命令中的文件名，默认会在当前目录下寻找，若找不到，则会在参数 ``DIR_DATA`` 或环境变量 ``${GMT_DATADIR}`` 所指定的目录中寻找。 ``DIR_DATA`` 的值会覆盖环境变量 ``${GMT_DATADIR}`` 的值。
