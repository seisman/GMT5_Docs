其他参数
========

.. _GMT_VERBOSE:

GMT_VERBOSE
-----------

控制GMT命令的verbose级别，可选值包括 ``quiet`` 、 ``normal`` 、 ``compat`` 、 ``verbose`` 、 ``long`` 、 ``debug`` ，也可以直接使用每个级别的第一个字母。参考 :doc:`V-option` 一节。

.. _GMT_COMPATIBILITY:

GMT_COMPATIBILITY
-----------------

是否开启兼容模式。若值为4，则表示就兼容GMT4语法并给出警告；若值为5，则表示不兼容GMT4语法，严格遵守GMT5语法。

.. _GMT_TRIANGULATE:

GMT_TRIANGULATE
---------------

:doc:`triangulate` 命令有两个版本的源码， ``Watson`` 的版本遵循GPL， ``Shewchuk`` 的版本不遵循GPL。该选项用于控制要使用哪个版本。默认值是 ``Watson`` ，但 ``Shewchuk`` 版本拥有更多功能。
