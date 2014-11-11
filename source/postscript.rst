.. index:: ! postscript

PS文件
======

:Create Date: 2014-11-10
:Last Updated: 2014-11-11

画图的第一步，是要准备好纸张。PostScript就是GMT所使用的纸张。

PostScript是什么
----------------

PostScript是一种用于描述\ **矢量图形**\ 的页面描述语言。简单的说，PostScript是一种图形格式，一般文件后缀用\ ``ps``\ ，简称为PS文件。

说到格式，大多数人都会有有一种陌生感，比如\ ``doc``\ 或者\ ``jpg``\ ，必须用专门的软件才能查看该格式的文件。说白了，格式不过是一种定义，定义了将信息以何种方式保存到文件中，而那些可以打开这种格式的软件，只不过是恰好了解这种定义，并且根据定义将文件中的信息提取出来，然后呈现给用户，仅此而已。

下面教你怎样从零创建一个PS文件，以消除对PS格式的陌生感。

#. 首先打开你最常用的一款\ **文本编辑器**\ （比如vi、gedit或notepad），新建一个空白文件；
#. 将如下内容复制到该空白文件中:

   .. code-block:: postscript

      %! PS-Adobe-3.0
      /Helvetica findfont 20 scalefont setfont
      150 400 moveto
      (PostScript is not that hard!) show

      showpage
      %%Trailer
      %%EOF

#. 将该文件保存为\ ``simple.ps``\ ；
#. Linux下用命令\ ``gs simple.ps``\ 查看该文件；Windows下应该直接双击就可以看到 ；

解释一下这个文件:

- ``%! PS-Adobe-3.0``\ 表明该文件是PostScript格式，且是PS3.0版；
- ``Helvetica``\ 是PS常见的一种字体，该命令用于寻找、缩放、设置字体；
- ``150 400 moveto``\ 将坐标原点移动到某位置；
- ``(text) show``\ 用于显示文字；
- ``showpage``\ 表示显示该页；

这就是一个最简单的PS文件。

PostScript的优点
----------------

不管当初GMT是以什么理由选择PostScript作为图像格式的，就今天来看，PS文件具有如下优势：

1. 矢量图形格式

   PostScript是矢量图形格式，即用点、直线或多边形等数学方程的几何元素来表示图像。因而可以任意旋转与缩放而不是出现图像失真。

2. 易于转换为其他格式

   GMT提供了\ :doc:`ps2raster`\ 模块，可以很方便地将PS文件转换为jpeg、png、eps、pdf等图片格式，以满足不同情形下的需求。


PS解释器
--------

PS解释器，或称PS阅读器，是用于查看PS文件的软件。

- Linux：\ ``ghostscript``\
- Windows：\ ``ghostscript``\ + \ ``gsview``\
