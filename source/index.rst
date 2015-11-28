阅读须知
########

这是介绍GMT5的语法及用法的中文手册。

本项目源码用 `reStructuredText <http://docutils.sourceforge.net/rst.html>`_ 写成，利用 `Sphinx <http://sphinx-doc.org/>`_ 制作成网页，源码托管在 `GitHub <https://github.com/seisman/GMT5_Docs>`_ 上，网页渲染及托管由 `Read the Docs <http://readthedocs.org/projects/gmt5-docs/>`_ 提供。

- 项目源码：https://github.com/seisman/GMT5_Docs
- 项目主页：http://gmt5.seisman.info/
- PDF版本：http://readthedocs.org/projects/gmt5-docs/downloads/pdf/latest/
- 我的博客：http://seisman.info

关于本文档，需要说明如下几点：

#. 仅介绍GMT5，不涉及GMT4
#. 参考了GMT官方文档，但不是GMT官方文档的翻译版
#. 希望是一个完整的参考文档，尽量系统地介绍GMT5的各个方面
#. 本项目完全是个人兴趣。工作量无法估计，工作进度无法估计，无法保证最终能否完成
#. 目前以网页版为主，不保证PDF版本的排版质量
#. 仅介绍GMT在Linux下的使用，不涉及Windows

对于读者，可以通过如下方法支持本文档：

#. 提意见和建议。不管是错别字、语句不通，还是概念不清，欢迎指出
#. 对于GitHub用户，可以直接 `fork <https://github.com/seisman/GMT5_Docs>`_ 项目源码，完善文档并提交PR
#. 给我 `捐赠 <http://seisman.info/donations.html>`_

文档中做如下约定：

- 中括号 ``[ ]`` 括起来的项表明该项是可选项
- 尖括号 ``< >`` 括起来的项表明实际使用时需要用具体的数值替代
- 用 ``|`` 分隔的项表明各项之间是可选的
- 用 ``...`` 表示省略，即当前命令仅用于演示某些功能，命令本身是不完整的，无法直接执行
- ``#`` 之后的内容为注释
- 介绍语法时只列出该模块的特殊选项，不列出标准选项

比如， ``-A[a|c|d]<scale>[/<dist>]`` ：

- ``<scale>`` 是必须的，使用时需要用具体数字代替
- ``[a|c|d]`` 是可选的，实际使用时只能三选一
- ``[/<dist>]`` 是可选的，使用时需要用具体数字代替

.. toctree::
   :maxdepth: 3
   :hidden:

   introduction
   basics
   advances
   options
   configuration
   cpt
   grid
   projections
   modules
   appendix
   faq

快捷链接
========

* `GMT主页 <http://gmt.soest.hawaii.edu>`_
* `GMT官方文档 <http://gmt.soest.hawaii.edu/doc/latest/index.html>`_
* :ref:`genindex`
