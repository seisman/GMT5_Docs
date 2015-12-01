FORMAT参数
==========

.. _FORMAT_CLOCK_IN:

FORMAT_CLOCK_IN
---------------

输入数据中时间数据的格式。默认使用24小时制 ``hh:mm:ss`` ，也可以使用12小时制 ``hh:mm:ssAM``

.. _FORMAT_CLOCK_MAP:

FORMAT_CLOCK_MAP
----------------

图上绘制时间字符串时所使用的格式，默认值为 ``hh:mm:ss``

.. _FORMAT_CLOCK_OUT:

FORMAT_CLOCK_OUT
----------------

输出时间字符串时所使用的格式，默认值为 ``hh:mm:ss`` 。若要使用12小时制，可以在字符串的最后加上 ``am`` 、 ``AM`` 、 ``a.m.`` 、 ``A.M.`` 。

比如 ``hh:mm:ss.xxx`` 、 ``hh:mm`` 、 ``hh:mm.xxx`` 、 ``hha.m.`` 等等。

若时间格式模板以 ``-`` 开头，则输出时间字符串时不会输出前置0。若时间格式模板为 ``-`` ，则在输出日期时间时不输出时间字符串。

.. _FORMAT_DATE_IN:

FORMAT_DATE_IN
--------------

输入数据中日期字符串的格式模板。可以将如下几个模板做任意组合：

- ``yyyy`` ：四位年份
- ``yy`` ：两位年份
- ``mm`` ：两位月份
- ``o`` ：月份的名称简写
- ``dd`` ：两位日期
- ``jjj`` ：一年中的第几天

比如 ``ddmmyyy`` 、 ``yy-mm-dd`` 、 ``dd-o-yyyy`` 、 ``yyyy/dd/mm`` 、 ``yyyy-jjj`` 等。

也可以用 ``yyyy[-]W[-]ww[-]d`` 模板。

.. _FORMAT_DATE_MAP:

FORMAT_DATE_MAP
---------------

绘制日期字符串时所使用的格式，默认格式为 ``yyyy-mm-dd`` 。具体格式参考 :ref:`FORMAT_DATE_OUT` 。

除此之外，在绘制月份名时的 ``mm`` 可以用 ``o`` 替代；绘制“Week ##”时的 ``W[-]ww`` 可以用 ``u`` 替代。

所有的日期文本字符串都由 :ref:`GMT_LANGUAGE` 、 :ref:`FORMAT_TIME_PRIMARY_MAP` 和 :ref:`FORMAT_TIME_SECONDARY_MAP` 控制。

.. _FORMAT_DATE_OUT:

FORMAT_DATE_OUT
---------------

指定数据中输出日期字符串时所使用的格式，参考 :ref:`FORMAT_DATE_IN` 的相关说明。

.. _FORMAT_GEO_OUT:

FORMAT_GEO_OUT
--------------

控制地理坐标数据的输出格式。格式的通用形式为 ``[+|-]D`` 或 ``[+|-]ddd[:mm[:ss]][.xxx][F|G]`` 。默认情况下，经度的输出范围为 ``[-180,180]`` 。GMT中的默认输出格式为 ``D`` 。

- ``+D`` 或 ``-D`` 表示用浮点数输出，浮点数的具体格式由 :ref:`FORMAT_FLOAT_OUT` 决定
- ``+D`` ：经度的输出范围为 ``[0,360]``
- ``-D`` ：经度的输出范围为 ``[-360,0]``
- ``ddd`` ：固定格式的整型弧度
- ``:`` ：分隔符
- ``mm`` ：固定格式的整型弧分
- ``ss`` ：固定格式的整型弧秒
- ``.xxx`` ：前一个量的小数部分
- ``F`` ：用WSEN后缀来表示正负号
- ``G`` ：与F相同，但后缀前有一空格

.. _FORMAT_GEO_MAP:

FORMAT_GEO_MAP
--------------

控制绘图时地理坐标的显示格式。格式的具体定义参考 :ref:`FORMAT_GEO_OUT` 。默认值为 ``ddd.mm.ss`` ，但具体绘制到弧度还是弧分还是弧秒，由标注的间隔决定。

除此之外，还可以在格式后面加上 ``A`` 以表示绘制坐标的绝对值。

.. _FORMAT_FLOAT_MAP:

FORMAT_FLOAT_MAP
----------------

以双精度浮点数形式绘制地图边框标注或等值线标注时所使用的格式。格式语法为C语言 ``printf`` 所使用的语法。默认的格式为 ``%.12lg`` 。

.. _FORMAT_FLOAT_OUT:

FORMAT_FLOAT_OUT
----------------

以双精度浮点数形式输出数据到文件时所使用的格式。对于地理坐标数据，用 :ref:`FORMAT_GEO_OUT` 设置。具体的格式采用C语言 ``printf`` 函数的格式，默认格式为 ``%.12lg`` 。

若需要不同列使用不同的输出格式，可以使用 ``cols:format`` 形式，其中 ``cols`` 可以是特定的列（比如5代表数据的第六列），也可以是几列的范围（比如3-7表示第4到8列）。不指定 ``cols`` 的格式将用于其他余下的列。

.. _FORMAT_TIME_PRIMARY_MAP:

FORMAT_TIME_PRIMARY_MAP
-----------------------

控制主标注中月份、周名的格式，可以取 ``full`` 、 ``abbreviate`` 或 ``character`` ，分别表示显示全称、简称或单个字符。比如一月的全称是January、简称是Jan、单字符为J。

还可以使用 ``Full`` 、 ``Abbreviate`` 、 ``Character`` 表示所有名字均大写。

.. _FORMAT_TIME_SECONDARY_MAP:

FORMAT_TIME_SECONDARY_MAP
-------------------------

控制次级标注的月份、周名的格式，见 :ref:`FORMAT_TIME_PRIMARY_MAP` 中的相关说明。

.. _FORMAT_TIME_STAMP:

FORMAT_TIME_STAMP
-----------------

设置GMT logo中时间信息的显示格式，默认值为 ``%Y %b %d %H:%M:%S`` 。该选项的值用C函数 `strftime <https://www-s.acm.illinois.edu/webmonkeys/book/c_guide/2.15.html#strftime>`_ 解析，故而理论上可以包含任意文本。
