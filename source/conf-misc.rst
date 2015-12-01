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

.. _GMT_LANGUAGE:

GMT_LANGUAGE
------------

绘制日期时所使用的语言。

#. CN1：Simplified Chinese
#. CN2：Traditional Chinese
#. DE： German
#. DK：Danish
#. EH：Basque
#. ES：Spanish
#. FI：Finnish
#. FR：French
#. GR：Greek
#. HI：Hawaiian
#. HU：Hungarian
#. IE：Irish
#. IL：Hebrew
#. IS：Icelandic
#. IT：Italian
#. JP：Japanese
#. KR：Korean
#. NL：Dutch
#. NO：Norwegian
#. PL：Polish
#. PT：Portuguese
#. RU：Russian
#. SE：Swedish
#. SG：Scottish Gaelic
#. TO：Tongan
#. TR：Turkish
#. UK：British English
#. US：US English

.. _GMT_HISTORY:

GMT_HISTORY
-----------

GMT在执行命令时，若某些选项的参数没有指定，则可以从 ``gmt.history`` 文件中读取相应的参数。该参数可以取 ``true|readonly|false`` ，分别代表GMT对历史文件的处理方式：可以读写、只能读不能写或者完全不使用该文件。

.. _GMT_INTERPOLANT:

GMT_INTERPOLANT
---------------

程序中一维插值所使用的算法，可以取

#. ``linear`` ：线性插值
#. ``akima`` ：akima's spline
#. ``cubic`` ：natural cubic spline
#. ``none`` ：不插值

.. _GMT_EXPORT_TYPE:

GMT_EXPORT_TYPE
---------------

该参数仅被外部接口使用，其控制了表数据的数据类型，可以取：

#. ``double``
#. ``single``
#. ``[u]long``
#. ``[u]int`` ： ``int`` 表示有符号整型， ``uint`` 表示无符号整型
#. ``[u]short``
#. ``[u]char``

.. _GMT_EXTRAPOLATE_VAL:

GMT_EXTRAPOLATE_VAL
-------------------

控制数据区域外做外插时如何操作。可选值包括：

#. ``NaN`` ：区域范围外的值一律为ＮａＮ
#. ``extrap`` ：使用指定的外插算法计算区域外的值
#. ``extrapval,val`` ：设置区域外的值为 ``val``

.. _GMT_CUSTOM_LIBS:

GMT_CUSTOM_LIBS
---------------

GMT支持自定义模块，用户可以根据GMT的要求自己写一个模块，并将其编译成GMT兼容的动态函数库，以扩充GMT的功能。

该参数用于指定自定义模块的路径，多个路径之间用逗号分隔。路径可以是共享库文件的绝对路径，也可以是其所在的目录。若路径是一个目录名，该目录必须需斜杠结尾，表明使用该目录下的全部共享库文件。若目录名是 ``/`` ，则在 ``${GMTHOME}/bin/gmt_plugins`` 目录下寻找库文件。

.. _GMT_FFT:

GMT_FFT
-------

决定要使用的FFT算法，可以取：

#. ``auto`` ：自动选择合适的算法
#. ``fftw[,planner]`` ：FFTW算法，其中 ``planner`` 可以取 ``measure|patient|exhaustive``
#. ``accelerate`` OS X下使用Accelerate Framework
#. ``kiss`` ：kiss FFT
#. ``brenner`` ：Brenner Legacy FFT
