.. index:: ! gmt.conf

默认参数
########

.. index:: ! defaults

GMT配置简介
===========

简介
----

GMT的每个模块都有众多选项，除此之外，GMT还有100多个参数，用于控制图像的外观和数据的处理方式。每个参数都有一个合适的默认值，这些参数与默认值一般保存在GMT的配置文件\ ``gmt.conf``\ 中。

当执行一个GMT程序时，首先将所有的参数初始化到GMT默认值，然后去搜索\ ``gmt.conf``\ 文件。若找到该文件，则会读取该文件的内容并将参数设置为配置文件中指定的值。

``gmt.conf``\ 文件的搜索路径按优先级排序为：\ ``./gmt.conf``\ > \ ``~/.gmt/gmt.conf``\ > \ ``~/gmt.conf``\ 。即GMT程序首先会在当前目录寻找配置文件；若未找到，则到家目录的\ ``.gmt``\ 子目录下寻找；若仍为找到，则在家目录下寻找。

设计思路
--------

GMT将这100多个参数单独放置在配置文件\ ``gmt.conf``\ 中，主要是基于两方面的考虑：

#. 让每个模块的命令行语法中都涵盖如此多的参数是不实际的，这些参数有些很少或几乎不需要改变（比如地图投影过程中使用的地球椭率）
#. 针对不同的应用环境，设置不同的GMT配置文件，保存到不同的\ ``gmt.conf``\ 文件中，当需要使用一组特定的GMT配置时，可以在GMT命令行中使用\ ``+<defaultfile>``\ 来指定要使用的配置文件。比如，不同的期刊可能要求不同的字体和字号，你可以使用同样的脚本加上不同的配置文件来满足不同期刊的要求；又比如，用于出版的图件和用于PowerPoint演示的图件通常需要用不同的颜色和字号。将这些参数保存到单独的\ ``gmt.conf``\ 配置文件中，可以尽可能的避免由于环境不同而导致的图片微调。

修改GMT配置
-----------

GMT系统自带的\ ``gmt.conf``\ 文件中对每个参数都给了一个合理的默认值，但有时用户需要修改这些参数值，GMT提供了多种方法来完成修改。

#. 在单个GMT命令中使用\ ``+defaultfile``\ 的语法，来指定使用配置文件\ ``defaultfile``\ ，需要注意该方法仅对单个命令有效。

   .. code-block:: bash

      gmt psxy ... +custom_gmt.conf > test.ps


#. 在脚本开始执行之前，将要使用的配置文件\ ``gmt.conf``\ 复制到当前目录，待脚本执行完毕后，删除该配置文件。该方法要求写脚本时要非常小心，因为若脚本因为错误出现中断，会影响到配置文件的删除，进而可能导致反效果的出现。

   .. code-block:: bash

      cp ~/somewhere/gmt.conf ./gmt.conf
      gmt psxy ...
      gmt pscoast ...
      gmt psxy ...
      rm gmt.conf

#. 可以用\ :doc:`gmtset`\ 模块在脚本执行的过程中显式地修改GMT参数值

   比如，需要设置主注释的字体为12p，Times-Bold，红色

   .. code-block:: bash

      gmt gmtset FONT_ANNOT_PRIMARY 12p,Times-Bold,red

   :doc:`gmtset`\ 会修改当前目录下的\ ``gmt.conf``\ 文件中的相应参数值，进而影响到接下来其它GMT程序的执行。若当前目录没有\ ``gmt.conf``\ 文件，则\ :doc:`gmtset`\ 会先复制系统自带的\ ``gmt.conf``\ 文件，再修改之。该命令修改的参数将一直生效，直到被新值覆盖。

#. 若你需要修改某些参数值，使得其在执行单个命令时有效，而不影响其他命令的执行效果，可以考虑在该命令行上使用\ ``--PAR=value``\ 语法。

   比如，针对某个GMT命令，为了临时设置浮点数的输出格式包含更多的小数位，而不影响其他命令的浮点数输出格式，可以在该命令中加上\ ``--FORMAT_FLOAT_OUT=%.16lg``\ 。

#. GMT提供了“隔离”模式，使得仅在单个脚本执行的过程中修改配置，当脚本执行完毕后自动恢复到原始配置。

一般情况下，仅推荐使用方法三和方法四。

在使用方法三的时候，需要注意一个潜在的问题。假如一个脚本中，只有三个命令，首先执行了GMT命令A，然后使用\ :doc:`gmtset`\ 将字体由默认字体a修改为字体b，然后又执行了GMT命令B。则命令A使用的是字体a，命令B使用的是字体b，这是自己想要的效果，到此为止都是没有问题的。若再次执行该脚本，由于当前目录下已经有了上一次执行生成的\ ``gmt.conf``\ 文件，且文件中使用的是字体b，则命令A受到该参数文件的影响使用了字体b，\ :doc:`gmtset`\ 将字体b修改为字体b，命令B使用字体b。这导致了执行同一个脚本出现了不同的结果，经常会浪费很多的时间用来调试和排错。最好的做法是在脚本结束时删除当前目录下的参数文件，甚至删除其他一些中间文件。

.. code-block:: bash

   gmt psxy ...
   gmt pscoast ..
   gmt gmtset ...
   gmt grdimage ...
   gmt psxy ...

   rm gmt.conf gmt.history # 要养成删除临时文件的习惯

GMT配置示例
-----------

下面列出部分会影响到绘图效果的GMT参数。

.. figure:: /images/GMT_Defaults_1a.*
   :width: 400px
   :align: center

.. figure:: /images/GMT_Defaults_1b.*
   :width: 400px
   :align: center

.. figure:: /images/GMT_Defaults_1c.*
   :width: 400px
   :align: center

FORMAT参数
==========

.. _FORMAT_GEO_OUT:

FORMAT_GEO_OUT
--------------

控制地理坐标数据的输出格式。格式的通用形式为\ ``[+|-]D``\ 或\ ``[+|-]ddd[:mm[:ss]][.xxx][F|G]``\ 。默认情况下，经度的输出范围为[-180,180]。GMT中的默认输出格式为\ ``D``\ 。

- ``+D``\ 或\ ``-D``\ 表示用浮点数输出，浮点数的具体格式由\ :ref:`FORMAT_FLOAT_OUT`\ 决定
- ``+D``\ ：经度的输出范围为[0,360]
- ``-D``\ ：经度的输出范围为[-360,0]
- ``ddd``\ ：固定格式的整型弧度
- ``:``\ ：分隔符
- ``mm``\ ：固定格式的整型弧分
- ``ss``\ ：固定格式的整型弧秒
- ``.xxx``\ ：前一个量的小数部分
- ``F``\ ：用WSEN后缀来表示正负号
- ``G``\ ：与F相同，但后缀前有一空格

.. _FORMAT_GEO_MAP:

FORMAT_GEO_MAP
--------------

控制绘图时地理坐标的显示格式。格式的具体定义参考\ :ref:`FORMAT_GEO_OUT`\ 。默认值为\ ``ddd.mm.ss``\ ，但具体绘制到弧度还是弧分还是弧秒，由标注的间隔决定。

除此之外，还可以在格式后面加上\ ``A``\ 以表示绘制坐标的绝对值。

.. _FORMAT_FLOAT_MAP:

FORMAT_FLOAT_MAP
----------------

以双精度浮点数形式绘制地图边框标注或等值线标注时所使用的格式。格式语法为C语言\ ``printf``\ 所使用的语法。默认的格式为\ ``%.12lg``\ 。

.. _FORMAT_FLOAT_OUT:

FORMAT_FLOAT_OUT
----------------

以双精度浮点数形式输出数据到文件时所使用的格式。对于地理坐标数据，用\ :ref:`FORMAT_GEO_OUT`\ 设置。具体的格式采用C语言\ ``printf``\ 函数的格式，默认格式为\ ``%.12lg``\ 。

若需要不同列使用不同的输出格式，可以使用\ ``cols:format``\ 形式，其中cols可以是特定的列（比如5代表数据的第六列），也可以是几列的范围（比如 3-7表示第4到8列）。不指定cols的格式将用于其他余下的列。

.. _FORMAT_DATE_MAP:

FORMAT_DATE_MAP
---------------

绘制日期字符串时所使用的格式，默认格式为\ ``yyyy-mm-dd``\ 。具体格式参考\ :ref:`FORMAT_DATE_OUT`\ 。

除此之外，在绘制月份名时的\ ``mm``\ 可以用\ ``o``\ 替代；绘制“Week ##”时的\ ``W[-]ww``\ 可以用\ ``u``\ 替代。

所有的日期文本字符串都由\ :ref:`TIME_LANGUAGE`\ 、\ :ref:`FORMAT_TIME_PRIMARY_MAP`\ 和\ :ref:`FORMAT_TIME_SECONDARY_MAP`\ 控制。

.. _FORMAT_DATE_OUT:

FORMAT_DATE_OUT
---------------

指定数据中输出日期字符串时所使用的格式，可以使用Gregorian日历格式或ISO week日历格式。

.. _FORMAT_TIME_PRIMARY_MAP:

FORMAT_TIME_PRIMARY_MAP
-----------------------

.. _FORMAT_TIME_SECONDARY_MAP:

FORMAT_TIME_SECONDARY_MAP
-------------------------

.. _FORMAT_TIME_STAMP:

FORMAT_TIME_STAMP
-----------------
.. index:: ! gmt.conf

GMT参数
========

.. _GMT_VERBOSE:

GMT_VERBOSE
-----------

控制GMT命令的verbose级别，可选值包括quiet、normal、compat、verbose、long、debug，也可以直接使用每个级别的第一个字母。参考\ :doc:`V-option`\ 一节。
IO参数
======

.. _IO_N_HEADER_RECS:

IO_N_HEADER_RECS
----------------
.. index:: !gmt.conf

MAP参数
=======

.. _MAP_DEFAULT_PEN:

MAP_DEFAULT_PEN
---------------

.. _MAP_FRAME_TYPE:

MAP_FRAME_TYPE
--------------

设置底图边框类型，可选值包括\ ``inside``\ 、\ ``plain``\ 、\ ``graph``\ 、\ ``fancy``\ 以及\ ``fancy+``\ ，默认值为\ ``fancy``\。

一般情况下，\ ``fancy``\ 边框类型仅适用于投影后的X、Y方向平行于经度纬度方向的情况下，比如rectangular投影、polar投影。对于某些投影，只能使用plain底图，即便MAP_BASEMAP_TYPE被设置为fancy。

下图给出了不同的底图边框类型的效果：

.. figure:: /images/map_basemap_type.*
   :width: 600px
   :align: center

   不同的底图边框类型的效果图

.. _MAP_FRAME_PEN:

MAP_FRAME_PEN
-------------

绘制底图类型为plain时边框的画笔属性，默认值为\ ``thicker,black``\ 。

.. _MAP_FRAME_WIDTH:

MAP_FRAME_WIDTH
---------------

设置底图类型为fancy时的边框宽度，默认值为\ ``5p``\ 。

.. _MAP_ORIGIN_X:

MAP_ORIGIN_X
------------

设置新绘图在纸张上的原点的X坐标，默认情况下为\ ``1i``\。对于覆盖图来说，默认值为0。该值可以通过\ ``-X``\ 修改。

.. _MAP_ORIGIN_Y:

MAP_ORIGIN_Y
------------

设置新绘图在纸张上的原点的Y坐标，默认情况下为\ ``1i``\ 。对于覆盖图来说，默认值为0。该值可以通过\ ``-Y``\ 修改。

.. _MAP_LOGO:

MAP_LOGO
--------

设置是否在绘图的左下角绘制带有系统时间戳的GMT logo，默认值为\ ``false``\ ，还可以取\ ``true``\ 。除此之外，还可以通过\ ``-U``\ 选项指定是否绘制GMT logo，以及logo的其他属性。

.. _MAP_LOGO_POS:

MAP_LOGO_POS
------------

设置GMT logo相对于当前绘图的左下角的对齐方式与位置。默认值为\ ``BL/-54p/-54p``\ 。

.. _MAP_TITLE_OFFSET:

MAP_TITLE_OFFSET
----------------

图标题的底部与轴标注（或轴标签）的顶部之间的距离。默认值为\ ``14p``\ 。

.. _MAP_SCALE_HEIGHT:

MAP_SCALE_HEIGHT
----------------

控制地图比例尺的高度，默认值为\ ``5p``\ 。
.. index:: ! gmt.conf

投影参数
========

:ctime: 2015-03-12
:mtime: 2015-03-12

.. _PROJ_ELLIPSOID:

PROJ_ELLIPSOID
--------------

地图投影中使用的地球椭球标准。默认值为\ ``WGS-84``\ 。可取如下值（区分大小写）：

- *Airy*: Applies to Great Britain (1830)
- *Airy-Ireland*: Applies to Ireland in 1965 (1830)
- *Andrae*: Applies to Denmark and Iceland (1876)
- *APL4.9*: Appl. Physics (1965)
- *ATS77*: Average Terrestrial System, Canada Maritime provinces (1977)
- *Australian*: Applies to Australia (1965)
- *Bessel*: Applies to Central Europe, Chile, Indonesia (1841)
- *Bessel-Namibia*: Same as Bessel-Schwazeck (1841)
- *Bessel-NGO1948*: Modified Bessel for NGO 1948 (1841)
- *Bessel-Schwazeck*: Applies to Namibia (1841)
- *Clarke-1858*: Clarke's early ellipsoid (1858)
- *Clarke-1866*: Applies to North America, the Philippines (1866)
- *Clarke-1866-Michigan*: Modified Clarke-1866 for Michigan (1866)
- *Clarke-1880*: Applies to most of Africa, France (1880)
- *Clarke-1880-Arc1950*: Modified Clarke-1880 for Arc 1950 (1880)
- *Clarke-1880-IGN*: Modified Clarke-1880 for IGN (1880)
- *Clarke-1880-Jamaica*: Modified Clarke-1880 for Jamaica (1880)
- *Clarke-1880-Merchich*: Modified Clarke-1880 for Merchich (1880)
- *Clarke-1880-Palestine*: Modified Clarke-1880 for Palestine (1880)
- *CPM*: Comm. des Poids et Mesures, France (1799)
- *Delambre*: Applies to Belgium (1810)
- *Engelis*: Goddard Earth Models (1985)
- *Everest-1830*: India, Burma, Pakistan, Afghanistan, Thailand (1830)
- *Everest-1830-Kalianpur*: Modified Everest for Kalianpur (1956) (1830)
- *Everest-1830-Kertau*: Modified Everest for Kertau, Malaysia & Singapore (1830)
- *Everest-1830-Pakistan*: Modified Everest for Pakistan (1830)
- *Everest-1830-Timbalai*: Modified Everest for Timbalai, Sabah Sarawak (1830)
- *Fischer-1960*: Used by NASA for Mercury program (1960)
- *Fischer-1960-SouthAsia*: Same as Modified-Fischer-1960 (1960)
- *Fischer-1968*: Used by NASA for Mercury program (1968)
- *FlatEarth*: As Sphere, but implies fast "Flat Earth" distance calculations (1984)
- *GRS-67*: International Geodetic Reference System (1967)
- *GRS-80*: International Geodetic Reference System (1980)
- *Hayford-1909*: Same as the International 1924 (1909)
- *Helmert-1906*: Applies to Egypt (1906)
- *Hough*: Applies to the Marshall Islands (1960)
- *Hughes-1980*: Hughes Aircraft Company for DMSP SSM/I grid products (1980)
- *IAG-75*: International Association of Geodesy (1975)
- *Indonesian*: Applies to Indonesia (1974)
- *International-1924*: Worldwide use (1924)
- *International-1967*: Worldwide use (1967)
- *Kaula*: From satellite tracking (1961)
- *Krassovsky*: Used in the (now former) Soviet Union (1940)
- *Lerch*: For geoid modelling (1979)
- *Maupertius*: Really old ellipsoid used in France (1738)
- *Mercury-1960*: Same as Fischer-1960 (1960)
- *MERIT-83*: United States Naval Observatory (1983)
- *Modified-Airy*: Same as Airy-Ireland (1830)
- *Modified-Fischer-1960*: Applies to Singapore (1960)
- *Modified-Mercury-1968*: Same as Fischer-1968 (1968)
- *NWL-10D*: Naval Weapons Lab (Same as WGS-72) (1972)
- *NWL-9D*: Naval Weapons Lab (Same as WGS-66) (1966)
- *OSU86F*: Ohio State University (1986)
- *OSU91A*: Ohio State University (1991)
- *Plessis*: Old ellipsoid used in France (1817)
- *SGS-85*: Soviet Geodetic System (1985)
- *South-American*: Applies to South America (1969)
- *Sphere*: The mean radius in WGS-84 (for spherical/plate tectonics applications) (1984)
- *Struve*: Friedrich Georg Wilhelm Struve (1860)
- *TOPEX*: Used commonly for altimetry (1990)
- *Walbeck*: First least squares solution by Finnish astronomer (1819)
- *War-Office*: Developed by G. T. McCaw (1926)
- *WGS-60*: World Geodetic System (1960)
- *WGS-66*: World Geodetic System (1966)
- *WGS-72*: World Geodetic System (1972)
- *WGS-84*: World Geodetic System [Default] (1984)
- *Moon*: Moon (IAU2000) (2000)
- *Mercury*: Mercury (IAU2000) (2000)
- *Venus*: Venus (IAU2000) (2000)
- *Mars*: Mars (IAU2000) (2000)
- *Jupiter*: Jupiter (IAU2000) (2000)
- *Saturn*: Saturn (IAU2000) (2000)
- *Uranus*: Uranus (IAU2000) (2000)
- *Neptune*: Neptune (IAU2000) (2000)
- *Pluto*: Pluto (IAU2000) (2000)

需要注意，对于某些全球投影，GMT会对选中的地球椭球做球状近似，将扁率设为零，并使用其平均半径。当GMT做此类近似时，会给出警告信息。

GMT还允许用户自定义椭球，用户只需按照固定的格式对椭球命名，GMT会从椭球名字中提取半长轴（下面用\ *a*\ 表示，单位为m）以及扁率。可用的格式如下：

- ``a``\ ：球半径为a，单位为\ ``m``\ ，扁率为零。比如\ ``6378137``\ ；
- ``a,inv_f``\ ：\ ``inv_f``\ 为扁率的倒数，比如\ ``6378137,298.257223563``\ ；
- ``a,b=semi_minor``\ ：\ ``semi_minor``\ 为半短轴长度，单位为\ ``m``\ 。比如\ ``6378137,b=6356752.3142``\ ；
- ``a,f=flattening``\ ：\ ``flattening``\ 为扁率，比如\ ``6378137,f=0.0033528``\ ；

.. _PROJ_AUX_LATITUDE:

PROJ_AUX_LATITUDE
-----------------

仅当测地线被近似为等效球体的大圆路径时使用。可选值包括\ ``authalic``\ ，\ ``geocentric``\  ，\ ``conformal``\ ，\ ``meridional``\ 、\ ``parametric``\ 和\ ``none``\ 。默认值为\ ``authalic``\ 。当其值不为\ ``none``\ 时，GMT会在计算距离之前，将大圆距离计算过程中使用的的任意一个纬度作为辅助纬度。

.. _PROJ_MEAN_RADIUS:

PROJ_MEAN_RADIUS
-----------------

仅当测地线被近似为等效球体的大圆路径时或扣死啊没区域面积时使用。可选值包括\ ``mean(R_1)``\、\ ``authalic(R_2)``\ 、\ ``volumetric(R_3)``\ 、\ ``meridional``\ 或\ ``quadratic``\ 。默认值为\ ``authalic``\ 。


.. _PROJ_LENGTH_UNIT:

PROJ_LENGTH_UNIT
----------------

设置默认的长度单位，可以取\ ``c``\ 、\ ``i``\ 、\ ``p``\ 。SI单位制下默认值为\ ``c``\ ，US单位制下默认为\ ``i``\ 。

.. _PROJ_SCALE_FACTOR:

PROJ_SCALE_FACTOR
-----------------

修改某些投影的地图缩放因子以减小面积失真。

- Polar Stereographic：默认值为0.9996
- UTM：默认值为0.9996
- Transverse Mercator：默认值为1

PostScript参数
==============

:ctime: 2014-11-10
:mtime: 2015-02-07

.. _PS_CHAR_ENCODING:

PS_CHAR_ENCODING
----------------

选择GMT在处理文本中的八进制码时所使用的字符集编码方式，可选值包括：\ ``Standard``\ 、\ ``Standard+``\ 、\ ``ISOLatin1``\ 、\ ``ISOLatin1+``\ 和\ ``ISO-8859-x``\ （其中x取值为[1-10]或[13-15]）。若安装GMT时使用SI单位制，则默认值为ISOLatin1编码；否则使用Standard+编码。

.. _PS_LINE_CAP:

PS_LINE_CAP
-----------

控制线段的端点的绘制方式，可以取如下值

- *butt* ：不对端点做特殊处理（默认值）；
- *round* ：端点处为半径与线宽相等的半圆弧；
- *square* ：端点处为边长与线宽相等的半个正方形；

.. _linecap:

.. figure:: /images/linecap.*
   :width: 600 px
   :align: center

   PS_LINE_CAP

该图展示了\ ``PS_LINE_CAP``\ 取不同值时线段端点的区别。需要注意，三条线段的长度是相同的，因参数设置不同而导致实际线段长度看上去有些不一样。

.. _PS_LINE_JOIN:

PS_LINE_JOIN
------------

控制线段拐点的绘制方式，可以取如下值：

- *miter*
- *round*
- *bevel*

TBC

.. _PS_MITER_LIMIT:

PS_MITER_LIMIT
--------------

TBC

.. _PS_MEDIA:

PS_MEDIA
--------

设置当前纸张尺寸，默认值为\ ``A4``\ 或\ ``letter``\ 。

下表列出了GMT预定义的若干种纸张尺寸及其对应的宽度和高度（单位为points）。

.. _tbl-media:

   +------------+-----------+-----------+
   |    Media   |   width   |   height  |
   +============+===========+===========+
   |    A0      |   2380    |   3368    |
   +------------+-----------+-----------+
   |    A1      |   1684    |   2380    |
   +------------+-----------+-----------+
   |    A2      |   1190    |   1684    |
   +------------+-----------+-----------+
   |    A3      |    842    |   1190    |
   +------------+-----------+-----------+
   |    A4      |    595    |    842    |
   +------------+-----------+-----------+
   |    A5      |    421    |    595    |
   +------------+-----------+-----------+
   |    A6      |    297    |    421    |
   +------------+-----------+-----------+
   |    A7      |    210    |    297    |
   +------------+-----------+-----------+
   |    A8      |    148    |    210    |
   +------------+-----------+-----------+
   |    A9      |    105    |    148    |
   +------------+-----------+-----------+
   |    A10     |     74    |    105    |
   +------------+-----------+-----------+
   |    B0      |   2836    |   4008    |
   +------------+-----------+-----------+
   |    B1      |   2004    |   2836    |
   +------------+-----------+-----------+
   |    B2      |   1418    |   2004    |
   +------------+-----------+-----------+
   |    B3      |   1002    |   1418    |
   +------------+-----------+-----------+
   |    B4      |    709    |   1002    |
   +------------+-----------+-----------+
   |    B5      |    501    |    709    |
   +------------+-----------+-----------+
   |   archA    |    648    |    864    |
   +------------+-----------+-----------+
   |   archB    |    864    |   1296    |
   +------------+-----------+-----------+
   |   archC    |   1296    |   1728    |
   +------------+-----------+-----------+
   |   archD    |   1728    |   2592    |
   +------------+-----------+-----------+
   |   archE    |   2592    |   3456    |
   +------------+-----------+-----------+
   |    flsa    |    612    |    936    |
   +------------+-----------+-----------+
   | halfletter |    396    |    612    |
   +------------+-----------+-----------+
   | statement  |    396    |    612    |
   +------------+-----------+-----------+
   |    note    |    540    |    720    |
   +------------+-----------+-----------+
   |   letter   |    612    |    792    |
   +------------+-----------+-----------+
   |   legal    |    612    |   1008    |
   +------------+-----------+-----------+
   |   11x17    |    792    |   1224    |
   +------------+-----------+-----------+
   |  tabloid   |    792    |   1224    |
   +------------+-----------+-----------+
   |   ledger   |   1224    |    792    |
   +------------+-----------+-----------+

用户还可以用\ ``WxH``\ 的格式完全自定义纸张尺寸，其中\ ``W``\ 和\ ``H``\ 分别为纸张的宽度和高度，其单位可以取\ **c**\ 、\ **i**\ 或\ **p**\ ，默认值为points。比如\ ``12cx12c``\ 表示纸张为宽度和高度都为12厘米。

若某些尺寸经常使用，用户还可以在\ ``${GMT}/share/conf/gmt_custom_media.conf``\ 中添加自定义的纸张尺寸。

.. _PS_PAGE_COLOR:

PS_PAGE_COLOR
-------------

设置纸张的背景色，参见\ :doc:`colors`\ 一节。

.. _PS_PAGE_ORIENTATION:

PS_PAGE_ORIENTATION
-------------------

设置纸张的方向，可以选的值为portrait或landscape。

.. _PS_SCALE_X:

PS_SCALE_X
----------

绘图时X方向的全局比例，用于实现图像的整体缩放。默认值为1.0。

.. _PS_SCALE_Y:

PS_SCALE_Y
----------

绘图时Y方向的全局比例，用于实现图像的整体缩放。默认值为1.0。

.. _PS_TRANSPARENCY:

PS_TRANSPARENCY
---------------

设置生成PS文件所使用的透明模式。可取值包括Color、ColorBurn、ColorDodge、Darken、Difference、Exclusion、HardLight、Hue、Lighten、Luminosity、Multiply、Normal、Overlay、Saturation、SoftLight、Screen。默认值为Normal。

.. _PS_COLOR_MODEL:

PS_COLOR_MODEL
--------------

设置生成PS代码时颜色所使用的颜色模型，可以取RGB、HSV、CMYK或GRAY。若设置为HSV，其不会影响绘图过程中使用RGB指定的颜色；若设置为GRAY，则所有的颜色都将使用YIQ方法转换成灰度。

.. _PS_COMMENTS:

PS_COMMENTS
-----------

若为真，则生成的PS文件中会包含注释，用于解释文件中操作的逻辑。当你需要手动编辑PS文件时比较有用。默认情况下，其值为false，即PS文件中不会包含注释，这样会生成一个更小更干净的PS文件。

.. _PS_IMAGE_COMPRESS:

PS_IMAGE_COMPRESS
-----------------

设置PS中的图像压缩算法。可以取值为

- ``rle``\ ：Run-Length Encoding scheme
- ``lzw``\ ：Lempel-Ziv-Welch compression
- ``deflate[,level]``\ ：DEFLATE compression，\ ``level``\ 可以取1到9；
- ``none``\ ：不压缩，相当于\ ``deflate,5``\ 。

时间参数
========

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
