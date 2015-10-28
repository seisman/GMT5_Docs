.. index:: ! gmtdefaults

gmtdefaults
===========

gmtdefaults用于列出GMT的当前默认参数。

该命令会按照前面介绍的搜索顺序寻找\ ``gmt.conf``\ 文件，并列出参数值::

    gmt gmtdefaults

可选选项
--------

**-D**
    - **-D**\ ：列出\ ``${GMT}/share/conf/gmt.conf``\ 中的参数值；
    - **-Du**\ ：列出\ ``${GMT}/share/conf/gmt_US.conf``\ 中的参数值；
    - **-Ds**\ ：列出\ ``${GMT}/share/conf/gmt_SI.conf``\ 中的参数值；


该命令可以获取GMT系统设置的一份拷贝::

    gmt gmtdefaults -D > gmt.conf

相关
----

:doc:`gmtset`, :doc:`gmtget`
