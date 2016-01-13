.. index:: ! pslegend

pslegend
==========

- 官方文档： :ref:`gmt:pslegend`
- 简介：在图上添加图例

``-D``
------

``-D`` 选项用于指定图例的尺寸和位置，其语法为::

    -D[g|j|J|n|x]<refpoint>+w<length>/<width>[+j<justify>][+l<spacing>][+odx[/dy]]

- ``[g|j|J|n|x]<refpoint>`` 指定参考位置， ``+j<justify>`` 指定图例上的锚点，默认锚点是 ``BL`` ，见 :doc:`embellishments` 一节。
- ``+w<length>/<width>`` 用于指定图例框的尺寸，若 ``<height>`` 未指定或取0，则GMT会自动估算所需的高度
- ``+l<spacing>`` 行距因子，默认值为1.1，则当前字体大小的1.1倍

``-C``
------

语法为::

    -C<dx>/<dy>

设置图例边框与内部图例之间的空白，默认值为 ``4p/4p``

``-F``
------

见 :doc:`embellishments` 一节

图例文件格式
------------

图例文件用于控制图例中各项的布局。图例文件中的每个记录对应图例中的一项，图例中每项的顺序由记录的先后顺序决定。每个记录的第一个字符决定了当前记录的图例类型。GMT中共有14种图例类型，列举如下：

#. ``# comment`` : 以#开头的行或空行都会被跳过
#. ``A cptname`` : 指定CPT文件，使得某些记录可以通过指定Z值来设定颜色，可以多次使用该记录以指定不同的CPT文件
#. ``B cptname offset height [optional arguments]`` : 绘制水平色条， ``offset`` 是色条相对于图例框左边界的距离， ``height`` 是色条高度，色条还可以加上额外的子选项 ``+e[b|f][<length>]][+h][+ma|c|l|u][+n[<txt>]`` ，可选参数包括-B、-I、-L、-M、-N、-S、-Z、-p等选项，详情见psscale命令。
#. ``C textcolor``: 接下来的所有文本所使用的颜色，可以是GMT中的颜色，也可以用 ``z=<val>`` 指定Z值，以从CPT文件中查找相应的颜色（CPT文件由A记录指定），若 ``textcolor`` 为 ``-`` ，则使用默认颜色
#. ``D [offset] pen [-|+|=]`` 绘制一条水平线， ``pen`` 为线条属性，线条上下各留出四分之一的行间距。线条左右顶端与图例边框的距离由 ``offset`` 决定，默认值为0。若未指定pen，则使用 :ref:`MAP_GRID_PEN_PRIMARY <MAP_GRID_PEN_PRIMARY>` ，若pen设置为 ``-`` ，则绘制一条不可见的线。 ``-|+|=`` 分别表示线条上方无间距、线条下方无间距和线条上下均无空白。

#. ``F fill1 fill2 ... filln``: 指定单元的填充色，可以直接指定颜色，也可使用 ``z=<value>`` 形式指定从CPT文件中查找颜色。若只给定了 ``fill1`` ，则整行都使用相同的填充色，否则依次为当前行的每列应用不同的 ``fill`` ，若 ``fill`` 为 ``-`` ，则不填充。

#. ``G gap``: 给定一个垂直空白，空白的高度由 ``gap`` 决定， ``gap`` 可以用 ``i|c|p`` 单位，也可以用 ``l`` 作为单位表示多少行空白， ``gap`` 也可以取负值，表示将当前行上移。

#. ``H fontsize|- font|- header``: 为图例指定一个居中的标题。 ``header`` 为标题， ``fontsize`` 为字号， ``font`` 为字体号。 ``-`` 表示使用默认的文字大小以及默认字体 :ref:`FONT_TITLE <FONT_TITLE>`

#. ``I imagefile width justification`` 将EPS文件放在图例中， ``width`` 为图片宽度， ``justification`` 为图片的对齐方式
#. ``L fontsize|- font|- justification label``: 在图例中绘制标签。 ``justification`` 为对齐方式，可以取 ``L|C|R``
#. ``M slon|- slat length [+f][+l[label]][+u] [-Fparam] [-Rw/e/s/n -Jparam]``: 在图例中绘制比例尺，在 :doc:`psbasemap` 命令中有详细介绍

#. ``N ncolumns`` 或 ``N relwidth1 relwidth2 ... relwidthn``: 修改图例中的列数，默认只有一列，该记录仅对S和L记录有效，该记录指定的列数会一直有效直到再次使用N记录。 ``ncolumns`` 用于指定若干个等宽的列， ``relwidth1 relwidth2 ... relwidthn`` 用于指定每列所占的相对宽度，所有宽度的和应等于 ``-D`` 选项所设置的宽度相等。

#. ``P paragraph-mode-header-for-pstext``: 在图例中添加段落，参考 :doc:`pstext` 命令中的段落模式

#. ``S [dx1 symbol size fill pen] [dx2 text]``: 在图例中绘制符号，参考 :doc:`psxy` 命令， ``symbol`` 指定了符号类型， ``dx1`` 是符号中心与左边界的距离， ``dx2`` 是 ``text`` 与左边界的距离， ``text`` 的字体由 :ref:`FONT_ANNOT_PRIMARY <FONT_ANNOT_PRIMARY>` 控制。 ``fill`` 和 ``pen`` 控制符号的填充和轮廓颜色，设置为 ``-`` 则表示不填充或无轮廓颜色。 ``fill`` 还可以使用 ``z=<val>`` 的形式，从CPT文件中查找颜色。 ``dx1`` 除了可以指定距离，还可以使用 ``L|C|R`` 表示符号在当前列的对齐方式。若S记录中无其他参数，则直接调至下一列。若 ``symbol`` 取为f、q或v，则可以在symbol后加上额外的子选项。符号 ``-`` 可以用于绘制线段。某些符号可能需要指定多个size，将多个size用逗号分隔作为size即可。

#. ``T paragraph-text`` 用 :ref:`FONT_ANNOT_PRIMARY <FONT_ANNOT_PRIMARY>` 打印一段文本
#. ``V [offset] pen``: 在两列之间绘制垂直的线条。

示例
----

::

    gmt pslegend -R-10/10/-10/10 -JM6i -F+gazure1 -Dx0.5i/0.5i+w5i/3.3i+jBL+l1.2 \
    -C0.1i/0.1i -B5f1 << EOF >> map.ps
    # Legend test for pslegend
    # G is vertical gap, V is vertical line, N sets # of columns, D draws horizontal line.
    # H is header, L is label, S is symbol, T is paragraph text, M is map scale.
    #
    G -0.1i
    H 24 Times-Roman My Map Legend
    D 0.2i 1p
    N 2
    V 0 1p
    S 0.1i c 0.15i p300/12 0.25p 0.3i This circle is hachured
    S 0.1i e 0.15i yellow 0.25p 0.3i This ellipse is yellow
    S 0.1i w 0.15i green 0.25p 0.3i This wedge is green
    S 0.1i f0.1i+l+t 0.25i blue 0.25p 0.3i This is a fault
    S 0.1i - 0.15i - 0.25p,- 0.3i A dashed contour
    S 0.1i v0.1i+a40+e 0.25i magenta 0.25p 0.3i This is a vector
    S 0.1i i 0.15i cyan 0.25p 0.3i This triangle is boring
    V 0 1p
    D 0.2i 1p
    N 1
    M 5 5 600+u f
    G 0.05i
    I SOEST_logo.ras 3i CT
    G 0.05i
    B colors.cpt 0.2i 0.2i
    G 0.05i L 9 4 R Smith et al., @%5%J. Geophys. Res., 99@%%, 2000
    G 0.1i
    P
    T Let us just try some simple text that can go on a few lines.
    T There is no easy way to predetermine how many lines will be required,
    T so we may have to adjust the box height to get the right size box.
    EOF
