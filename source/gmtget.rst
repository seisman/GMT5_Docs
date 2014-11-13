.. index:: ! gmtget

gmtget
======

:Create Date: 2014-11-14
:Last Updated: 2014-11-14

gmtset用于某个GMT默认参数的参数值。

必须选项
--------

PARAMETER
    一个或多个GMT参数名

    ::

        gmt gmtget PS_COMMENTS

    ::

        gmt get MAP_GRID_CROSS_SIZE_PRIMARY MAP_GRID_CROSS_SIZE_SECONDARY

可选参数
--------

**-G**\ *defaultsfile*
    要读取的默认参数文件的文件名。

**-L**
    若有多个参数名，默认情况下将所有返回值在一行输出，各值之间以空格分隔；该选项是的所有返回值分别输出在不同行。

相关
----

:doc:`gmtset`, :doc:`gmtdefaults`
