.. index:: ! pstext

pstext
======

:ctime: 2015-06-12
:mtime: 2015-07-22

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

仅仅把文本写在纸上还不够，-F选项可以调整文本的角度、对齐方式、字体、字号、颜色等等。

-F选项的语法是::

    -F[+a[<angle>]][+j[<justify>]][+f[<font>]][+c[<justify>]][+l][+h]

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

    x   y   font    justification   angle    text

``-F+a+j+f``\ 与前一个例子类似，唯一的区别在于子选项的顺序不同，而输入数据的格式要与子选项的顺序相匹配，此时输入数据的格式为::

    x   y   angle   justification   font    text

除此之外，+c、+h、+l选项的用法尚不明确。

-D选项
------

使得文本在指定位置的基础上偏移\ ``dx/dy``\ ，默认值为\ ``0/0``\ ，即不偏移。

使用pstext经常遇到的情况是在台站处标记台站名，此时传递给pstext的位置参数通常是台站坐标，因而pstext会将文本置于台站坐标处，该选择用于将文本稍稍偏离台站坐标位置。

若不指定dy，则默认dy=dx。

选项后加上\ **v**\ 表示会添加一条初始位置与偏移后的位置的连线，\ **v**\ 后加画笔属性可以控制连线的属性。

另外，-Dj和-DJ含义尚不明确。

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

-A选项
------

默认情况下，文本的角度是指沿水平方向逆时针旋转的角度，-A选项表明给定的角度是方位角，即相对于北向顺时针旋转的角度。

-Z选项
------

仅用于3D投影中，需要在数据的第三列指定文本的Z位置，数据格式为::

    X   Y   Z   Text

此时强制使用-N选项。

文本框及其相关选项
------------------

每一个文本都可以加上一个文本框，文本框的属性由如下几个选项控制：

- ``-W``\ ：文本框的边框属性，默认值为\ ``default,black,solid``\ ；
- ``-G``\ ：文本框的填充色，默认不填充；
- ``-T``\ ：文本框的形状；
  - ``-To``\ ：直角矩形
  - ``-TO``\ ：圆角矩形
  - ``-Tc``\ ：凹矩形（与-M选项一起使用）
  - ``-TC``\ ：凸矩形（与-M选项一起使用）
- ``-C``\ ：设置文本框与文本之间的空白区域，默认值为字体大小的15%，其后可以接具体的距离值也可以接\ ``%``\ 表示空白与当前字号的百分比。例如\ ``-C1c/1c``\ 或\ ``-C20%/30%``\ 。

下面的例子中设置文本框的相关属性：蓝色边框、淡蓝填充色、圆角矩形，空白为\ ``100%/100%``\ ::

    gmt pstext -R0/10/0/5 -JX10c/5c -B1 -Wblue -Glightblue -TO -C100%/100% > text.ps << EOF
    3   1   Text1
    6   3   Text2
    EOF

-G选项还有两个高级用法，即-Gc和-GC。其中，-Gc表示先绘制文本，然后将文本框裁剪出来，并打开clipping选项，之后的绘图命令都不会不会再覆盖文本，最后记得使用psclip的-C选项将clipping关闭。如果不想要绘制文本只想要激活clipping选项，可以使用-GC选项。

-M选项
------

段落模式。文件必须是多段数据，每段之间需要用特殊的记录行分隔。

特殊的记录行要满足：

#. 第一个字符必须是标识符，默认为“>”
#. 标识符后接文本段落的设置信息，其格式为::

        X Y [font angle justify] linespace parwidth parjust

其中，X、Y为文本位置，linespace为行间距，parwidth为段落宽度，parjust为段落对齐方式，可以取为l（左对齐）、c（居中对齐）、r（右对齐）、j（分散对齐）。

.. code-block:: bash

   #!/bin/bash
   gmt pstext -R0/3/0/5 -JX3i -F+f+a+j -B1 -M -N -Y4c << EOF > pstext_paragraph_mode.ps
   > 0 -0.5 12p,black 0 LT 13p 3i j
   @%5%Figure 1.@%% This illustration shows nothing useful, but it still needs
   a figure caption. Highlighted in @;255/0/0;red@;; you can see the locations
   of cities where it is @_impossible@_ to get any good Thai food; these are to be avoided.
   EOF

   rm gmt.*

.. figure:: /images/pstext_paragraph_mode.*
   :width: 600px
   :align: center

   段落模式示意图
