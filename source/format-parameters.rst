.. index:: ! gmt.conf

FORMAT参数
==========

:ctime: 2015-05-09
:mtime: 2015-05-09

.. _FORMAT_GEO_OUT:

FORMAT_GEO_OUT
--------------

控制地理坐标数据的输出格式。格式的通用形式为\ ``[+|-]D``\ 或\ ``[+|-]ddd[:mm[:ss]][.xxx][F|G]``\ 。默认情况下，经度的输出范围为[-180,180]。GMT中的默认输出格式为\ ``D``\ 。

- ``+D``\ 或\ ``-D``\ 表示用浮点数输出，浮点数的具体格式由\ :ref:`FORMAT_FLOAT_OUT`\ 决定
- ``+D``\ ：经度的输出范围为[0,360]
- ``-D``\ ：经度的输出范围为[-360,0]
- ``ddd``\ ：固定格式的整型弧度
- ``:``\ ：分隔符
- ``mm``\ ：固定格式的整型弧分
- ``ss``\ ：固定格式的整型弧秒
- ``.xxx``\ ：前一个量的小数部分
- ``F``\ ：用WSEN后缀来表示正负号
- ``G``\ ：与F相同，但后缀前有一空格

.. _FORMAT_GEO_MAP:

FORMAT_GEO_MAP
--------------

控制绘图时地理坐标的显示格式。格式的具体定义参考\ :ref:`FORMAT_GEO_OUT`\ 。默认值为\ ``ddd.mm.ss``\ ，但具体绘制到弧度还是弧分还是弧秒，由标注的间隔决定。

除此之外，还可以在格式后面加上\ ``A``\ 以表示绘制坐标的绝对值。

.. _FORMAT_FLOAT_MAP:

FORMAT_FLOAT_MAP
----------------

以双精度浮点数形式绘制地图边框标注或等值线标注时所使用的格式。格式语法为C语言\ ``printf``\ 所使用的语法。默认的格式为\ ``%.12lg``\ 。

.. _FORMAT_FLOAT_OUT:

FORMAT_FLOAT_OUT
----------------

以双精度浮点数形式输出数据到文件时所使用的格式。对于地理坐标数据，用\ :ref:`FORMAT_GEO_OUT`\ 设置。具体的格式采用C语言\ ``printf``\ 函数的格式，默认格式为\ ``%.12lg``\ 。

若需要不同列使用不同的输出格式，可以使用\ ``cols:format``\ 形式，其中cols可以是特定的列（比如5代表数据的第六列），也可以是几列的范围（比如 3-7表示第4到8列）。不指定cols的格式将用于其他余下的列。

.. _FORMAT_DATE_MAP:

FORMAT_DATE_MAP
---------------

绘制日期字符串时所使用的格式，默认格式为\ ``yyyy-mm-dd``\ 。具体格式参考\ :ref:`FORMAT_DATE_OUT`\ 。

除此之外，在绘制月份名时的\ ``mm``\ 可以用\ ``o``\ 替代；绘制“Week ##”时的\ ``W[-]ww``\ 可以用\ ``u``\ 替代。

所有的日期文本字符串都由\ :ref:`TIME_LANGUAGE`\ 、\ :ref:`FORMAT_TIME_PRIMARY_MAP`\ 和\ :ref:`FORMAT_TIME_SECONDARY_MAP`\ 控制。

.. _FORMAT_DATE_OUT:

FORMAT_DATE_OUT
---------------

指定数据中输出日期字符串时所使用的格式，可以使用Gregorian日历格式或ISO week日历格式。

.. _FORMAT_TIME_PRIMARY_MAP:

FORMAT_TIME_PRIMARY_MAP
-----------------------

.. _FORMAT_TIME_SECONDARY_MAP:

FORMAT_TIME_SECONDARY_MAP
-------------------------

.. _FORMAT_TIME_STAMP:

FORMAT_TIME_STAMP
-----------------
