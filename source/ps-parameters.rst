.. index:: ! gmt.conf

PostScript参数
==============

:Create Date: 2014-11-10
:Last Updated: 2014-11-15

.. _PS_CHAR_ENCODING:

PS_CHAR_ENCODING
----------------

选择GMT在处理文本中的八进制码时所使用的字符集编码方式，可选值包括：\ ``Standard``\ 、\ ``Standard+``\ 、\ ``ISOLatin1``\ 、\ ``ISOLatin1+``\ 和\ ``ISO-8859-x``\ （其中x取值为[1-10]或[13-15]）。若安装GMT时使用SI单位制，则默认值为ISOLatin1编码；否则使用Standard+编码。详情参见\ :doc:`ps-parameters`\ 。

.. _PS_LINE_CAP:

PS_LINE_CAP
-----------

控制线段的端点的绘制方式，可以取如下值

- *butt* ：不对端点做特殊处理（默认值）；
- *round* ：端点处为半径与线宽相等的半圆弧；
- *square* ：端点处为边长与线宽相等的半个正方形；

.. _linecap:

.. figure:: /images/linecap.*
   :width: 600 px
   :align: center

   PS_LINE_CAP

该图展示了\ ``PS_LINE_CAP``\ 取不同值时线段端点的区别。需要注意，三条线段的长度是相同的，因参数设置不同而导致实际线段长度看上去有些不一样。

.. _PS_LINE_JOIN:

PS_LINE_JOIN
------------

控制线段拐点的绘制方式，可以取如下值：

- *miter*
- *round*
- *bevel*

TBC

.. _PS_MITER_LIMIT:

PS_MITER_LIMIT
--------------

TBC
