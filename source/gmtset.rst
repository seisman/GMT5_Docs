.. index:: !gmtset

gmtset
======

:ctime: 2014-11-13
:mtime: 2014-11-13

gmtset用于调整当前目录下的\ ``gmt.conf``\ 文件中的个别GMT默认设置，若该文件不存在，则先创建该文件再修改。由于该命令会修改当前目录下的\ ``gmt.conf``\ 文件，因而该命令修改默认参数将一直对接下来的命令有效果，直到默认参数再次被修改。

必须参数
--------

PARAMETER *value*
    必须参数为\ ``参数名``\ 和\ ``参数值``\ ，二者必须成对存在，该命令可以接一对或多对。


下例修改默认的注释字体为Helvetica，字号为12p，设置网格交叉线的尺寸为0.2厘米::

   gmt gmtset FONT_ANNOT_PRIMARY 12p,Helvetica MAP_GRID_CROSS_SIZE_PRIMARY 0.2c

也可以用等号将参数名和参数值连接起来::

   gmt gmtset FONT_ANNOT_PRIMARY=12p,Helvetica MAP_GRID_CROSS_SIZE_PRIMARY=0.2c


可选参数
--------

**-C**
    将GMT4创建的参数文件\ ``.gmtdefaults4``\ 转换为GMT5所使用的\ ``gmt.conf``\ 文件，并保留GMT4配置文件::

        gmt gmtset -C

**-D**\ [**s**\ \|\ **u**]
    基于模板参数文件来修改GMT默认参数。

    - **-Du**\ ：使用US单位制下的默认参数文件，即\ ``${GMT}/share/conf/gmt_US.conf``\
    - **-Ds**\ ：使用SI单位制下的默认参数文件，即\ ``${GMT}/share/conf/gmt_SI.conf``\
    - **-D**\ ：使用GMT编译过程中指定的默认参数文件，即\ ``${GMT}/share/conf/gmt.conf``\

**-G**\ *defaultsfile*
    要修改的GMT默认参数文件，其中\ *defaultsfile*\ 为参数文件的文件名；

**-**\ [**BJRXxYycp**]\ *value*

    修改通用选项的默认值::

        gmt gmtset -JX5c/5c

    该命令会在当前目录生成\ ``gmt.history``\ 文件，并保持J选项的值为\ ``X5c/5c``\ ，这样，接下来的GMT命令中若J选项未指定参数，则使用\ ``gmt.history``\ 中J选项的值。

相关
----

:doc:`gmtget`, :doc:`gmtdefaults`
