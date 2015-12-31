.. index:: ! gmtdefaults

gmtdefaults
===========

- 官方文档： :ref:`gmt:gmtdefaults`
- 简介：列出所有GMT参数的当前值

语法
----

::

    gmtdefaults [-D[u|s]]

``-D``
------

``-D`` 选项用于打印系统默认参数。

- ``-D`` ：列出 ``${GMT}/share/conf/gmt.conf`` 中的参数值
- ``-Du`` ：列出 ``${GMT}/share/conf/gmt_US.conf`` 中的参数值
- ``-Ds`` ：列出 ``${GMT}/share/conf/gmt_SI.conf`` 中的参数值

BUG
----

- ``-D`` 选项无效（v5.1.2）

相关
----

:doc:`gmtset` 、 :doc:`gmtget`
