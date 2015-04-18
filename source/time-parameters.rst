.. index:: ! gmt.conf

时间参数
========

:Create Date: 2015-03-12
:Last Updated: 2015-03-12

.. _TIME_EPOCH:

TIME_EPOCH
----------

指定所有相对时间的参考时刻。其格式为yyyy-mm-ddThh:mm:ss或yyyy-Www-ddTThh:mm:ss。

默认值为1970-01-01T00:00:00，即UNIX系统的默认参考时间。

.. _TIME_UNIT:

TIME_UNIT
---------

指定相对时间数据相对于参考时间的单位。可以取：

#. y：年；假定一年365.2425天；
#. o：月；假定所有月是等长的；
#. d：天；
#. h：时；
#. m：分钟；
#. s：秒；

.. _TIME_SYSTEM:

TIME_SYSTEM
-----------

TIME_EPOCH和TIME_UNIT的合并版，即指定TIME_SYSTEM相当于同时指定了TIME_EPOCH和TIME_UNIT。可取如下值：

#. ``JD``\ ：等效于-4713-11-25T12:00:00 d
#. ``MJD``\ ：等效于1858-11-17T00:00:00 d
#. ``J2000``\ ：等效于2000-01-01T12:00:00 d
#. ``S1985``\ ：等效于1985-01-01T00:00:00 s
#. ``UNIX``\ ： 等效于1970-01-01T00:00:00 s
#. ``RD0001``\ ：等效于0001-01-01T00:00:00 s
#. ``RATA``\ ：等效于0000-12-31T00:00:00 d

该参数并不存在于gmt.conf中，当指定该参数时，其会被自动转换为TIME_EPOCH和TIME_UNIT对应的值。

.. _TIME_WEEK_START:

TIME_WEEK_START
---------------

指定周几是一周的第一天，可取值为Monday或Sunday。

.. _TIME_Y2K_OFFSET_YEAR:

TIME_Y2K_OFFSET_YEAR
--------------------

当用两位数字表示四位数字的年份时，TIME_Y2K_OFFSET_YEAR给定了100年序列的第一年。

比如，若TIME_Y2K_OFFSET_YEAR=1729，则数字29到99分别表示1729到1799，而数字00到28则表示1800到1828。

默认值为1950，即00到99表示的年份范围为1950到2049。

.. _TIME_LANGUAGE:

TIME_LANGUAGE
-------------

绘制时间项时所使用的语言。

#. BR：Brazilian Portuguese
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
