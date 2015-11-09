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
