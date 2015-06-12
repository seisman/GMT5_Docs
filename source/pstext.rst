.. index:: ! pstext

pstext
======

:ctime: 2015-06-12
:mtime: 2015-06-12

pstext用于在纸上写文本。

最小示例
--------

默认情况下，pstext需要的输入数据的格式为::

    x   y   text

如果数据比较少的话，可以直接在命令里将数据传给pstext::

    gmt pstext -R0/10/0/10 -JX10c/10c -B1 > text.ps << EOF
    3   4   Text1
    6   8   Text2
    EOF

如果数据比较多，一般会先把数据写到文件里，然后把数据文件传给pstext::

    gmt pstext input.dat -R0/10/0/10 -JX10c/10c -B1 > text.ps

当然，pstext也可以一次处理多个文件::

    gmt pstext input1.dat input2.dat -R0/10/0/10 -JX10c/10c -B1 > text.ps

-F选项
------

仅仅把文本写在纸上还不够，-F选项用于调整文本的角度、对齐方式、字体、字号、颜色等等。

-F选项的语法是::

    -F[+a[<angle>]][+c[<justify>]][+f[<font>]][+h|l][+j[<justify>]]

- ``+f<font>``\ 用于设置文本的字体，<font>的格式为\ ``size,fontname,color``\ 。
- ``+a<angle>``\ 用于设置文本旋转的角度；
- ``+j<justify>``\ 用于设置文本的对齐方式；

字体的设置，参考\ :doc:`text`\ 中的相关说明；对齐方式，参考\ :doc:`justification`\ 中的相关说明。

下面的命令中，统一设置了所有文本的字号为30p，4号字体，红色，文本旋转45度，且以左上角对齐::

    gmt pstext -R0/10/0/10 -JX10c/10c -B1g1 -F+f30p,4,red+a45+jTL > text.ps << EOF
    3 4 Text1
    6 8 Text2
    EOF

有时候，会希望输入数据的每一行有不同的文本属性，此时就不能在命令里直接指定文本属性了，而需要对每行分别指定属性，相应的输入数据的格式也要根据命令发生变化。例如：

``-F+f``\ 表示输入数据的每一行要有不同的字体，此时输入数据的格式为::

    x   y   font    text

``-F+f12p,Helvetica-Bold,red+j+a``\ 为所有行设置了统一的字体，但每一行需要单独指定对齐方式和角度，此时输入数据的格式为::

    x   y   justification   angle   text

``-F+f+j+a``\ 表示所有数据都需要单独指定字体、对齐方式和角度，此时输入数据的格式为::

    x   y   font    justification   font    text

``-F+a+j+f``\ 与前一个例子类似，唯一的区别在于子选项的顺序不同，而输入数据的格式要与子选项的顺序相匹配，此时输入数据的格式为::

    x   y   angle   justification   font    text

-L: 字号列表
------------

用于列出GMT所支持的所有字体名及其对应的字号::

    gmt pstext -L

-N选项
------

默认情况下，若文本超过了底图边框，则不显示该文本，即文本被裁剪掉了(clip)。使用-N选项，即便文本超出了底图边框的范围，也依然会显示。

-Q: 文本大小写
--------------

默认情况下，输入数据中文本是什么样，显示的时候就是什么样。

- ``-Ql``\ ：所有文本以小写(**l**\ ower case)显示；
- ``-Qu``\ ：所有文本以大写(**u**\ pper case)显示；
