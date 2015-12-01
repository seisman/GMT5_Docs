FONT参数
========

.. _FONT:

FONT
----

设置所有 ``FONT_*`` 参数（ ``FONT_LOGO`` 除外）的默认字体

.. _FONT_ANNOT_PRIMARY:

FONT_ANNOT_PRIMARY
------------------

主标注的字体，默认值为 ``12p,Helvetica,black`` 。若在字体前加上 ``+`` ，则将字体、偏移量、刻度长度等相对于 ``FONT_ANNOT_PRIMARY`` 缩放。

.. _FONT_ANNOT_SECONDARY:

FONT_ANNOT_SECONDARY
--------------------

时间轴次标注所使用的字体，默认值为 ``14p,Helvetica,black``

.. _FONT_LABEL:

FONT_LABEL
----------

轴标签所使用的字体，默认值 ``16p,Helvetica,black``

.. _FONT_TITLE:

FONT_TITLE
----------

图上方标题所使用的字体，默认值 ``24p,Helvetica,black``

.. _FONT_LOGO:

FONT_LOGO
---------

GMT时间戳中文本所使用的字体，默认值为 ``8p,Helvetica,black`` 。仅字体ID有效，字体大小及字体颜色无效。

.. TODO BUG？从源码中看似乎是故意为之。
