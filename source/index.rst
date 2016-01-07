阅读须知
########

本项目是GMT5的中文参考手册。

本项目源码用 `reStructuredText <http://docutils.sourceforge.net/rst.html>`_ 写成，利用 `Sphinx <http://sphinx-doc.org/>`_ 制作成网页，源码托管在 `GitHub <https://github.com/seisman/GMT5_Docs>`_ 上，网页渲染及托管由 `Read the Docs <http://readthedocs.org/projects/gmt5-docs/>`_ 提供。

- 项目源码：https://github.com/seisman/GMT5_Docs
- 项目主页：http://gmt5.seisman.info/
- PDF版本： `GMT5.2.1-dev <http://home.ustc.edu.cn/~dongzhi/GMT5_Docs.pdf>`_
- 我的博客：http://seisman.info

对本文档的若干说明：

#. 仅介绍GMT5，不涉及GMT4
#. 参考了GMT官方文档，但不是GMT官方文档的中文翻译
#. 是一个完整的参考手册，尽量系统地介绍GMT5的各个方面
#. 不适合于快速入门GMT，只适合于系统学习GMT或日常查询
#. 目前以网页版为主，虽提供PDF版，但无法保证排版效果
#. 所有示例及代码仅在Linux下测试通过，其他平台下可能需要略作修改

读者可以通过如下方法支持本文档：

#. 提意见和建议。不管是错别字、语句不通，还是概念不清，欢迎指出
#. GitHub用户可以直接Fork项目源码，完善文档并提交Pull Request
#. 给我\ `捐赠 <http://seisman.info/donations.html>`_

文档约定：

- 介绍模块的语法时，只列出该模块专有的选项，不列出通用选项
- 中括号 ``[ ]`` 括起来的项表明该项是可选项
- 尖括号 ``< >`` 括起来的项表明实际使用时需要用具体的数值替代
- 用 ``|`` 分隔的项表明各项之间是可选的
- 用 ``...`` 表示省略，即当前命令仅用于演示某些功能，命令本身是不完整的，无法直接执行
- ``#`` 之后的内容为注释

比如， ``-A[a|c|d]<scale>[/<dist>]`` ：

- ``<scale>`` 是必须的，使用时需要用具体数字代替
- ``[a|c|d]`` 是可选的，实际使用时只能使用 ``a`` 或 ``c`` 或 ``d``
- ``[/<dist>]`` 是可选的，使用时需要用具体数字代替

.. toctree::
   :maxdepth: 3
   :hidden:

   introduction
   basics
   advances
   options
   configuration
   projections
   modules
   examples
   appendix
   faq

快捷链接
========

* `GMT主页 <http://gmt.soest.hawaii.edu>`_
* `GMT官方文档 <http://gmt.soest.hawaii.edu/doc/5.2.1/index.html>`_
* :ref:`genindex`
