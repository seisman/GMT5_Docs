目录结构
========

:ctime: 2015-04-23
:mtime: 2015-04-23

``$GMTHOME``\ 表示GMT的安装路径，在Linux下一般是\ ``/usr/local/GMT5``\ 或\ ``/opt/GMT5``\ ，在Windows下一般是\ ``C:\programs\gmt5``\ 。

``$GMTHOME``\ 中包含了GMT的全部文件。下面列出了\ ``$GMTHOME``\ 的目录结构，并对其中重要的文件及目录做简单解释。GMT在Linux和Windows下的目录结构稍有不同，这里以Linux为准::

    .
    |-- bin
    |-- include
    |-- lib64
    `-- share

bin目录
-------

bin目录的文件结构如下::


    bin
    |-- gmt                         # GMT主程序
    |-- isogmt                      # GMT主程序（隔离模式）
    |-- gmt-config                  # GMT安装信息获取工具
    |-- gmtlogo                     # 绘制GMT Logo
    |-- gmt_shell_functions.sh      # bash辅助脚本
    `-- gmtswitch                   # GMT版本切换工具

几点注意事项：

#. Linux下，除了上面说到的几个可执行文件外，可能还有很多类似\ ``psxy``\ 、\ ``grdimage``\ 这样的文件，其本质上是指向二进制文件\ ``gmt``\ 的软链接，这样设计的目的是为了部分兼容GMT4的语法，但建议在使用GMT5时严格遵循GMT5的语法，因而建议删除bin目录下除上面列出的6个可执行文件以外的所有其他文件。
#. Windows下，除了上面说到的几个可执行文件外，还有一堆其他exe文件，以及一些dll文件。这些多余的exe文件是为了兼容GMT4语法而存在的，建议删除。可以将所有文件按照文件大小排序，然后删除所有大小为6KB的exe文件。
#. 上述6个可执行文件中，可以认为只有\ ``gmt``\ 是真正需要且有用的。

include目录
------------

inlcude目录下有gmt子目录，gmt子目录中包含了GMT的头文件::

    include
    `-- gmt

仅当自己写程序调用GMT函数库时需要使用这些头文件。

lib目录
-------

32位系统下为\ ``lib``\ ，64位系统下为\ ``lib64``\ 。lib目录下包含了GMT的库文件::

    lib64
    |-- gmt
    |   `-- plugins
    |       `-- supplements.so          # GMT扩展函数库
    |-- libgmt.so                       # GMT主函数库
    `-- libpsl.so                       # PSL绘图函数库

仅当自己写代码调用GMT函数库时才需要使用。

share目录
---------

share目录中包含了GMT运行所需的众多辅助文件::

    share
    |-- VERSION                     # GMT版本号
    |-- coast                       # 含海岸线数据
    |-- conf                        # 含GMT的配置文件
    |   |-- gmt.conf                    # 全局配置文件
    |   |-- gmt_SI.conf                 # 全局配置文件（SI单位制）
    |   |-- gmt_US.conf                 # 全局配置文件（US单位制）
    |   |-- gmt_cpt.conf                # 全局CPT文件列表
    |   |-- gmt_custom_media.conf       # 自定义纸张尺寸
    |   `-- gmt_custom_symbols.conf     # 自定义特殊符号
    |-- cpt                         # 含全局CPT文件
    |-- custom                      # 自定义特殊符号的定义文件
    |-- dbase                       # 含grdraster命令所使用的数据库（默认无数据）
    |-- dcw                         # 含国界、省界数据
    |-- doc                         # 官方文档
    |   |-- examples                    # 官方示例
    |   |-- html                        # 官方文档网页版
    |   |-- pdf                         # 官方文档PDF版
    |   `-- supplements                 # 补充包的说明文档
    |-- man                         # Man格式文档
    |-- pattern                     # 自带的图案文件
    |-- pslib                       # PS所需要的文件
    |   |-- CUSTOM_font_info.d      # 自定义字体
    |   `-- PS_font_info.d          # PS自带字体的定义
    |-- time                        # 不同语言的时间定义
    |-- tools                       # 其他工具
    |-- mgd77                       # ?
    |-- mgg                         # ?
    `-- x2sys                       # ?
