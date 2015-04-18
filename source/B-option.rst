B选项
=====

:Create Date: 2015-03-28
:Last Updated: 2015-04-18

-B选项用于控制底图的边框以及轴的显示。针对边框以及轴，-B选项拥有不同的语法，所以在一个命令中可能会多次出现-B选项。

-B选项的用法写起来有些难度，多试试就理解了。

边框设置
--------

**-B**\ [*axes*][**+b**][**+g**\ *fill*][**+o**\ *lon/lat*][**+t**\ *title*]

axes
~~~~

*axes*\ 控制要绘制哪些轴以及这些轴是否有标注。对于一般的图而言，有四条边，分别用W、E、S、N表示地图左右上下四条边。每条边可以有三种状态：

#. 用大写字母表示：绘制这条边，且该边有刻度、有标注
#. 用小写字母表示：绘制这条边，但该边只有刻度
#. 不出现该字母表示：不绘制这条边

下面给出一些具体的示例，解释一下\ *axes*\ 取不同值的效果：

#. ``WSEN``\ ：绘制四条边，且每条边都有刻度和标注
#. ``WSn``\ ：绘制左、下、上三条边，不绘制右边。其中左边和下边有刻度和标注，上边无标注；

对于3D绘图来说，还可以加上一个Z。同理，大写的Z表示有刻度和标注，小写的z表示无标注。默认情况下，只会绘制一条垂直的边，可以使用\ ``1234``\ 的任意组合来表示要绘制哪些垂直边。其中1表示左下角的垂直边，其他垂直边按逆时针顺序编号。加上\ ``+b``\ 子选项，会绘制一个由-R选项决定的box，并且会在xz和yz平面内显示网格线。

+g
~~

\ 用于对边框内部进行填充，默认情况下是不填充的。

+o
~~

默认情况下，网格线是以北极点作为参考的，如果你想要以另一个点作为参考绘制倾斜的网格线，则可以使用\ ``+o``\ 子选项。

+t
~~

图标题，位于边框的上方。

轴设置
------

每对边的属性可以用如下语法控制：

**-B**\ [**p**\|\ **s**][**x**\|\ **y**\|\ **z**]\ *intervals*\ [\ **+l**\ *label*][**+p**\ *prefix*][**+u**\ *unit*]

为了更加清晰，以上的语法也可以被分为如下两句：

- **-B**\ [**p**\|\ **s**][**x**\|\ **y**\|\ **z**][**+l**\ *label*][**+p**\ *prefix*][*     *+u**\ *unit*]
- **-B**\ [**p**\|\ **s**][**x**\|\ **y**\|\ **z**]\ *intervals*

p|s
~~~

对于每个轴来说，都有两级注释、两级刻度以及两级网格，分别称之为p（Primary）和s（Secondary）。Primary是指比较靠近轴的注释，而secondary是离轴稍远的注释。对于地理坐标来说，通常只需要默认的轴，即Primary轴。Secondary主要用于坐标轴为时间轴的情况下，此时可以用p和s分别指定不同尺度的时间间隔。

x|y|z
~~~~~

要设置哪些边的信息，默认值为xy，即同时设置X轴和Y轴的信息。可以指定单个轴（比如只有x），也可以同时指定多个轴（比如xy和xyz）。如果想要不同轴有不同的设置，则需要多次使用-B选项，每个指定不同的轴。

+l
~~

给选中的轴加标签

+p
~~

给选中的轴的标注加前缀

+u
~~

给选中的轴的标注加单位。对于地图而言，标注的单位为度，该符号是自动添加的，由\ :ref:`FORMAT_GEO_MAP <FORMAT_GEO_MAP>`\ 控制。

interval
~~~~~~~~

interval控制了注释、刻度以及网格线的间隔，是一个或若干个[**t**]\ *stride*\ [*phase*][**u**]的组合。

其中t可以取a（注释）、f（刻度）、g（网格线），表明了要设置轴的哪部分的间隔，stride设置了间隔，phase可以用于空竹注释、刻度或网格线的起算点。u是间隔的单位。

``-Bafg``\ 会根据当前的区域大小等信息自动计算合适的间隔，\ ``-Bafg/afg``\ 则会对X轴和Y轴分别计算合适的间隔。

地理底图
--------

地理底图与一般的坐标轴不同，其可以使用fancy形式。

:ref:`MAP_FRAME_TYPE <MAP_FRAME_TYPE>`\ 、:ref:`FORAMT_GEO_MAP <FORMAT_GEO_MAP>`\ 、\ :ref:`MAP_DEGREE_SYMBOL <MAP_DEGREE_SYMBOL>`\ 等可以用于修改地理底图的外观。

.. _basemap_border:

.. figure:: /images/GMT_-B_geo_1.*
   :width: 500 px
   :align: center

   地理底图

下图同时使用了p注释和s注释，p注释用于显示度，s注释用于显示弧分。

.. _complex_basemap:

.. figure:: /images/GMT_-B_geo_2.*
   :width: 500 px
   :align: center

   同时使用P注释和S注释的地理底图

笛卡尔线性轴
------------

对于一般的线性轴而言，注释的格式由:ref:`FORMAT_FLOAT_OUT <FORMAT_FLOAT_OUT>`\ 决定，其默认值为“%g”，即根据数据的大小决定用一般表示还是指数表示，小数位的数目会根据\ *stride*\ 自动决定。若设置:ref:`FORMAT_FLOAT_OUT <FORMAT_FLOAT_OUT>`\ 为其他值，则会严格使用其定义的格式，比如“%.2f”表示显示两位小数。

.. _axis_label_basemap:

.. figure:: /images/GMT_-B_linear.*
   :width: 500 px
   :align: center

   笛卡尔线性轴。
   ``-R0/12/0/0.95 -JX3i/0.3i -Ba4f2g1+lFrequency+u" %" -BS``

笛卡尔log\ :sub:`10`\ 轴
------------------------

Due to the logarithmic nature of annotation spacings, the *stride*
parameter takes on specific meanings. The following concerns are
specific to log axes (see Figure :ref:`Logarithmic projection axis
<Log_projection>`):

*  *stride* must be 1, 2, 3, or a negative integer -n.
   Annotations/ticks will then occur at 1, 1-2-5, or 1,2,3,4,...,9,
   respectively, for each magnitude range. For *-n* the
   annotations will take place every *n*\ 'th magnitude.

*  Append **l** to *stride*. Then, log\ :sub:`10` of the annotation
   is plotted at every integer log\ :sub:`10` value (e.g.,
   *x = 100* will be annotated as "2") [Default annotates *x* as is].

*  Append **p** to *stride*. Then, annotations appear as 10 raised to
   log\ :sub:`10` of the value (e.g., 10\ :sup:`-5`).

.. _Log_projection:

.. figure:: /images/GMT_-B_log.*
   :width: 500 px
   :align: center

   Logarithmic projection axis using separate values for annotation,
   frame, and grid intervals.  (top) Here, we have chosen to annotate the actual
   values.  Interval = 1 means every whole power of 10, 2 means 1, 2, 5 times
   powers of 10, and 3 means every 0.1 times powers of 10.  We used
   -R1/1000/0/1 -JX3il/0.25i -Ba1f2g3. (middle) Here, we have chosen to
   annotate :math:`\log_{10}` of the actual values, with -Ba1f2g3l.
   (bottom) We annotate every power of 10 using :math:`\log_{10}` of the actual
   values as exponents, with -Ba1f2g3p.

笛卡尔指数轴
------------

Normally, *stride* will be used to create equidistant (in the user's
unit) annotations or ticks, but because of the exponential nature of the
axis, such annotations may converge on each other at one end of the
axis. To avoid this problem, you can append **p** to *stride*, and the
annotation interval is expected to be in transformed units, yet the
annotation itself will be plotted as un-transformed units (see Figure
:ref:`Power projection axis <Pow_projection>`). E.g., if
*stride* = 1 and power = 0.5 (i.e., sqrt), then equidistant annotations
labeled 1, 4, 9, ... will appear.

.. _Pow_projection:

.. figure:: /images/GMT_-B_pow.*
   :width: 500 px
   :align: center

   Exponential or power projection axis. (top) Using an exponent of 0.5
   yields a :math:`sqrt(x)` axis.  Here, intervals refer to actual data values,
   in -R0/100/0/0.9 -JX3ip0.5/0.25i -Ba20f10g5.
   (bottom) Here, intervals refer to projected values, although the annotation
   uses the corresponding unprojected values, as in -Ba3f2g1p.

笛卡尔时间轴
------------

What sets time axis apart from the other kinds of plot axes is the
numerous ways in which we may want to tick and annotate the axis. Not
only do we have both primary and secondary annotation items but we also
have interval annotations versus tickmark annotations, numerous time
units, and several ways in which to modify the plot. We will demonstrate
this flexibility with a series of examples. While all our examples will
only show a single *x*\ -axis (south, selected via **-BS**), time-axis
annotations are supported for all axes.

Our first example shows a time period of almost two months in Spring
2000. We want to annotate the month intervals as well as the date at the start of each week:

   ::

     gmt set FORMAT_DATE_MAP=-o FONT_ANNOT_PRIMARY +9p
     gmt psbasemap -R2000-4-1T/2000-5-25T/0/1 -JX5i/0.2i -Bpa7Rf1d -Bsa1O -BS -P > GMT_-B_time1.ps

These commands result in Figure :ref:`Cartesian time axis <cartesian_axis1>`.
Note the leading hyphen in the :ref:`FORMAT_DATE_MAP <FORMAT_DATE_MAP>`
removes leading zeros from calendar items (e.g., 02 becomes 2).

.. _cartesian_axis1:

.. figure:: /images/GMT_-B_time1.*
   :width: 500 px
   :align: center

   Cartesian time axis, example 1

The next example shows two different ways to annotate an axis portraying 2 days in July 1969:

   ::

     gmt set FORMAT_DATE_MAP "o dd" FORMAT_CLOCK_MAP hh:mm FONT_ANNOT_PRIMARY +9p
     gmt psbasemap -R1969-7-21T/1969-7-23T/0/1 -JX5i/0.2i -Bpa6Hf1h -Bsa1K -BS -P -K > GMT_-B_time2.ps
     gmt psbasemap -R -J -Bpa6Hf1h -Bsa1D -BS -O -Y0.65i >> GMT_-B_time2.ps

The lower example (Figure :ref:`cartesian_axis2`) chooses to annotate the weekdays (by
specifying **a**\ 1\ **K**) while the upper example choses dates (by
specifying **a**\ 1\ **D**). Note how the clock format only selects
hours and minutes (no seconds) and the date format selects a month name,
followed by one space and a two-digit day-of-month number.

.. _cartesian_axis2:

.. figure:: /images/GMT_-B_time2.*
   :width: 500 px
   :align: center

   Cartesian time axis, example 2

The third example (Figure :ref:`cartesian_axis3`) presents two years, annotating
both the years and every 3rd month.

   ::

     gmt set FORMAT_DATE_MAP o FORMAT_TIME_PRIMARY_MAP Character FONT_ANNOT_PRIMARY +9p
     gmt psbasemap -R1997T/1999T/0/1 -JX5i/0.2i -Bpa3Of1o -Bsa1Y -BS -P > GMT_-B_time3.ps

Note that while the year annotation is centered on the 1-year interval,
the month annotations must be centered on the corresponding month and
*not* the 3-month interval. The :ref:`FORMAT_DATE_MAP <FORMAT_DATE_MAP>` selects month name
only and :ref:`FORMAT_TIME_PRIMARY_MAP <FORMAT_TIME_PRIMARY_MAP>` selects the 1-character, upper
case abbreviation of month names using the current language (selected by
:ref:`TIME_LANGUAGE <TIME_LANGUAGE>`).

.. _cartesian_axis3:

.. figure:: /images/GMT_-B_time3.*
   :width: 500 px
   :align: center

   Cartesian time axis, example 3

The fourth example (Figure :ref:`cartesian_axis4`) only shows a few hours of a day, using
relative time by specifying **t** in the **-R** option while the
:ref:`TIME_UNIT <TIME_UNIT>` is **d** (for days). We select both primary and secondary
annotations, ask for a 12-hour clock, and let time go from right to left:

   ::

     gmt set FORMAT_CLOCK_MAP=-hham FONT_ANNOT_PRIMARY +9p
     gmt psbasemap -R0.2t/0.35t/0/1 -JX-5i/0.2i -Bpa15mf5m -Bsa1H -BS -P > GMT_-B_time4.ps

.. _cartesian_axis4:

.. figure:: /images/GMT_-B_time4.*
   :width: 500 px
   :align: center

   Cartesian time axis, example 4

The fifth example shows a few weeks of time (Figure :ref:`cartesian_axis5`). The lower axis
shows ISO weeks with week numbers and abbreviated names of the weekdays.
The upper uses Gregorian weeks (which start at the day chosen by
:ref:`TIME_WEEK_START <TIME_WEEK_START>`); they do not have numbers.

   ::

    gmt set FORMAT_DATE_MAP u FORMAT_TIME_PRIMARY_MAP Character \
           FORMAT_TIME_SECONDARY_MAP full FONT_ANNOT_PRIMARY +9p
    gmt psbasemap -R1969-7-21T/1969-8-9T/0/1 -JX5i/0.2i -Bpa1K -Bsa1U -BS -P -K > GMT_-B_time5.ps
    gmt set FORMAT_DATE_MAP o TIME_WEEK_START Sunday FORMAT_TIME_SECONDARY_MAP Chararacter
    gmt psbasemap -R -J -Bpa3Kf1k -Bsa1r -BS -O -Y0.65i >> GMT_-B_time5.ps

.. _cartesian_axis5:

.. figure:: /images/GMT_-B_time5.*
   :width: 500 px
   :align: center

   Cartesian time axis, example 5

Our sixth example (Figure :ref:`cartesian_axis6`) shows the first five months of
1996, and we have annotated each month with an abbreviated, upper case name and
2-digit year. Only the primary axes information is specified.

   ::

    gmt set FORMAT_DATE_MAP "o yy" FORMAT_TIME_PRIMARY_MAP Abbreviated
    gmt psbasemap -R1996T/1996-6T/0/1 -JX5i/0.2i -Ba1Of1d -BS -P > GMT_-B_time6.ps

.. _cartesian_axis6:

.. figure:: /images/GMT_-B_time6.*
   :width: 500 px
   :align: center

   Cartesian time axis, example 6

Our seventh and final example (Figure :ref:`cartesian_axis7`) illustrates
annotation of year-days. Unless we specify the formatting with a leading hyphen
in :ref:`FORMAT_DATE_MAP <FORMAT_DATE_MAP>` we get 3-digit integer days. Note that
in order to have the two years annotated we need to allow for the annotation of
small fractional intervals; normally such truncated interval must be at
least half of a full interval.

   ::

    gmt set FORMAT_DATE_MAP jjj TIME_INTERVAL_FRACTION 0.05 FONT_ANNOT_PRIMARY +9p
    gmt psbasemap -R2000-12-15T/2001-1-15T/0/1 -JX5i/0.2i -Bpa5Df1d -Bsa1Y -BS -P > GMT_-B_time7.ps

.. _cartesian_axis7:

.. figure:: /images/GMT_-B_time7.*
   :width: 500 px
   :align: center

   Cartesian time axis, example 7

自定义轴
--------

Irregularly spaced annotations or annotations based on
look-up tables can be implemented using the *custom* annotation
mechanism. Here, we given the **c** (custom) type to the **-B** option
followed by a filename that contains the annotations (and
tick/grid-lines specifications) for one axis. The file can contain any
number of comments (lines starting with #) and any number of records of
the format

| *coord* *type* [*label*]

The *coord* is the location of the desired annotation, tick, or
grid-line, whereas *type* is a string composed of letters from **a**
(annotation), **i** interval annotation, **f** frame tick, and **g**
gridline. You must use either **a** or **i** within one file; no mixing
is allowed. The coordinates should be arranged in increasing order. If
*label* is given it replaces the normal annotation based on the *coord*
value. Our last example (Figure :ref:`Custom and irregular annotations
<Custom_annotations>`) shows such a custom basemap with an interval
annotations on the *x*-axis and irregular annotations on the *y*-axis.

   ::

    cat << EOF > xannots.txt
    416.0 ig Devonian
    443.7 ig Silurian
    488.3 ig Ordovician
    542 ig Cambrian
    EOF
    cat << EOF > yannots.txt
    0 a
    1 a
    2 f
    2.71828 ag e
    3 f
    3.1415926 ag @~p@~
    4 f
    5 f
    6 f
    6.2831852 ag 2@~p@~
    EOF
    gmt psbasemap -R416/542/0/6.2831852 -JX-5i/2.5i -Bpx25f5g25+u" Ma" -Bpycyannots.txt \
                  -BWS+glightblue -P -K > GMT_-B_custom.ps
    gmt psbasemap -R416/542/0/6.2831852 -JX-5i/2.5i -Bsxcxannots.txt -BWS -O \
                  --MAP_ANNOT_OFFSET_SECONDARY=10p --MAP_GRID_PEN_SECONDARY=2p >> GMT_-B_custom.ps
    rm -f [xy]annots.txt

.. _Custom_annotations:

.. figure:: /images/GMT_-B_custom.*
   :width: 500 px
   :align: center

   Custom and irregular annotations, tick-marks, and gridlines.
