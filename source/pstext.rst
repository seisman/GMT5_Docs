.. index:: ! pstext

pstext
======

官方文档： :ref:`gmt:pstext`

在图上写文本

可以自定义文本的大小、颜色、字体、角度。文本支持希腊字母、上下标等，见 :doc:`text` 一节。

语法
----

::

    pstext [<textfiles>]
        [-F[+a[<angle>]][+c[<justify>]][+f[<font>]][+h][+j[<justify>]][+l]]
        [-D[j|J]<dx>[/<dy>][v[<pen>]]] [-A] [-G<color>] [-L] [-M] [-N]
        [-Ql|u] [-To|O|c|C] [-W<pen>] [-Z]

``<textfiles>``
---------------

默认情况下，该命令所需要的输入数据的格式为::

    x   y   text

如果要写的文本记录比较少的话，可以直接从标准输入流将数据传给命令::

    gmt pstext -R0/10/0/10 -JX10c/10c -B1 > text.ps << EOF
    3   4   Text1
    6   8   Text2
    EOF

如果文本记录比较多，一般会先把数据写到文件里，然后把文件名传给命令::

    gmt pstext input.dat -R0/10/0/10 -JX10c/10c -B1 > text.ps

当然，该命令也可以一次处理多个文件::

    gmt pstext input1.dat input2.dat -R0/10/0/10 -JX10c/10c -B1 > text.ps

``-F``
------

``-F`` 选项用于调整文本的字体、字号、颜色、角度、对齐方式等。

- ``+f<font>`` 设置文本的字体， ``<font>`` 的格式为 ``size,fontname,color`` ，见 :doc:`text`
- ``+a<angle>`` 文本相对于水平方向逆时针旋转的角度
- ``+j<justify>`` 文本对齐方式，见 :doc:`justification`

下面的命令中，统一设置了所有文本的字号为30p，4号字体，红色，文本旋转45度，且以左上角对齐::

    gmt pstext -R0/10/0/10 -JX10c/10c -B1g1 -F+f30p,4,red+a45+jTL > text.ps << EOF
    3 4 Text1
    6 8 Text2
    EOF

若使用了 ``+f`` 子选项，但是未给定 ``<font>`` ，则意味着输入数据的每一行需要自定义本行的字体属性，因为输入数据的格式要发生变化。例如 ``-F+f`` 选项要求的输入数据的格式为::

    x   y   font    text

对于 ``+a`` 和 ``+j`` 同理。若 ``+f`` 、 ``+a`` 、 ``+j`` 中有两个以上未在命令行中指定参数，则输入数据中要增加多列，每列的顺序由这三个子选项的相对顺序决定。

比如 ``-F+f+a`` 的输入数据格式是::

    x   y   font   angle  text

``-F+a+f`` 的输入数据格式为::

    x   y   angle  font   text

``-F+f+j+a`` 表示所有数据都需要单独指定字体、对齐方式和角度，此时输入数据的格式为::

    x   y   font    justification   angle    text

``-F+a+j+f`` 与前一个例子类似，唯一的区别在于子选项的顺序不同，而输入数据的格式要与子选项的顺序相匹配，此时输入数据的格式为::

    x   y   angle   justification   font    text

``-F+f12p,Helvetica-Bold,red+j+a`` 为所有行设置了统一的字体，但每一行需要单独指定对齐方式和角度，此时输入数据的格式为::

    x   y   justification   angle   text

使用 ``+c<justify>`` 选项，则输入数据中不需要XY坐标，只需要文本即可，该选项直接从 ``-R`` 选项中提取出范围信息，并由对齐方式决定文本的坐标位置。比如 ``-F+cTL`` 表示将文本放在底图的左上角。例如::

    gmt pstext -R0/10/0/10 -JX10c/10c -B1 -F+cTL > text.ps << EOF
    TEXT
    EOF

``+h`` 会直接从多段数据的段头记录中提取文本::

    gmt pstext -R0/10/0/10 -JX10c/10c -B1 -F+h > text.ps << EOF
    > TEXT1
    2  2
    > TEXT2
    5  5

``+l`` 会直接从多段数据的段头记录里的 ``-L<label>`` 中提取信息::

    gmt pstext -R0/10/0/10 -JX10c/10c -B1 -F+h > text.ps << EOF
    > -LTEXT1
    2  2
    > -LTEXT2
    5  5

``-D``
------

该选项是使得文本在指定位置的基础偏移 ``<dx>/<dy>`` ，默认值为 ``0/0`` ，即不偏移。

使用pstext经常遇到的情况是在台站处标记台站名，此时传递给pstext的位置参数通常是台站坐标，因而pstext会将文本置于台站坐标处，该选择用于将文本稍稍偏离台站坐标位置以避免文本挡住台站处的符号。

若不指定 ``<dy>`` ，则默认 ``dy=dx`` 。

偏移量后加上 ``v<pen>`` 表示绘制一条连接初始位置与偏移后位置的直线， ``<pen>`` 控制连线的画笔属性。

``-Dj`` 和 ``-DJ`` 含义尚不明确。
.. TODO -Dj和-DJ含义尚不明确。


``-L``
------

用于列出GMT所支持的所有字体名及其对应的字号::

    gmt pstext -L

``-N``
------

默认情况下，若文本超过了底图边框，则不显示该文本，即文本被裁剪掉了。使用 ``-N`` 选项，即便文本超出了底图边框的范围，也依然会显示。

``-Q``
------

默认情况下，输入数据中文本是什么样，显示的时候就是什么样。

- ``-Ql`` ：所有文本以小写显示
- ``-Qu`` ：所有文本以大写显示

``-A``
------

默认情况下，文本的角度是指沿水平方向逆时针旋转的角度， ``-A`` 选项表明给定的角度是方位角，即相对于北向顺时针旋转的角度。

``-Z``
------

仅用于3D投影中，需要在数据的第三列指定文本的Z位置，数据格式为::

    X   Y   Z   Text

此时强制使用 ``-N`` 选项。

``-W`` ``-G`` ``-T`` ``-C``
---------------------------

每一个文本都可以加上一个文本框，文本框的属性由如下几个选项控制：

- ``-W<pen>`` ：文本框的边框属性，默认值为 ``default,black,solid``
- ``-G<fill>`` ：文本框的填充色，默认不填充
- ``-T`` ：文本框的形状
  - ``-To`` ：直角矩形
  - ``-TO`` ：圆角矩形
  - ``-Tc`` ：凹矩形（与 ``-M`` 选项一起使用）
  - ``-TC`` ：凸矩形（与 ``-M`` 选项一起使用）
- ``-C`` ：设置文本框与文本之间的空白区域，默认值为字体大小的15%，其后可以接具体的距离值也可以接 ``%`` 表示空白与当前字号的百分比。例如 ``-C1c/1c`` 或 ``-C20%/30%`` 。

下面的例子中设置文本框的相关属性：蓝色边框、淡蓝填充色、圆角矩形，空白为 ``100%/100%`` ::

    gmt pstext -R0/10/0/5 -JX10c/5c -B1 -Wblue -Glightblue -TO -C100%/100% > text.ps << EOF
    3   1   Text1
    6   3   Text2
    EOF

``-G`` 选项还有两个高级用法，即 ``-Gc`` 和 ``-GC`` 。其中， ``-Gc`` 表示先绘制文本，然后将文本框裁剪出来，并打开裁剪选项，之后的绘图命令都不会覆盖文本所在区域，最后需要使用 :doc:`psclip` 的 ``-C`` 选项关闭裁剪。若不想要绘制文本只想要激活裁剪选项，可以使用 ``-GC`` 选项。

``-M``
------

段落模式，用于输入大量文本。文件必须是多段数据。

段头记录要满足：

#. 第一个字符是段头标识符，默认为 ``>``
#. 从第三列开始，包含了本段文本的设置信息，其格式为::

        X Y [font angle justify] linespace parwidth parjust

相对于一般的文本文件多了几项：

- ``linespace`` 行间距
- ``parwidth`` 段落宽度
- ``parjust`` 段落对齐方式，可以取为 ``l`` （左对齐）、 ``c`` （居中对齐）、 ``r`` （右对齐）、 ``j`` （分散对齐）

段头记录后即为要显示在图上的文本，每段数据之间用空行分隔。

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

相关
----

:doc:`psxy` 、 :doc:`pslegend`
