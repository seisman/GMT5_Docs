-Jx：笛卡尔变换
===============

GMT中笛卡尔坐标变换分为三类：

- 线性坐标变换
- Log\ :math:`_{10}` 坐标变换
- 指数坐标变换

在开始之前，先用 :doc:`gmtmath` 命令生成两个数据以供接下来示例使用::

    gmt gmtmath -T0/100/1  T SQRT = sqrt.d
    gmt gmtmath -T0/100/10 T SQRT = sqrt.d10

笛卡尔线性变换
--------------

笛卡尔线性变换的使用场景可以分为三类：

#. 常规的浮点数坐标
#. 地理坐标
#. 日期时间坐标

常规浮点数坐标
~~~~~~~~~~~~~~

对于常规的浮点型数据而言，选择笛卡尔线性坐标意味着对输入坐标做简单的线性变换 ``u'=au+b`` ，将输入坐标 ``u`` 投影到纸张坐标 ``u'`` 。

线性投影可以通过四种方式指定：

- ``-Jx<scale>`` X轴和Y轴拥有相同的比例尺 ``<scale>``
- ``-JX<width>`` X轴和Y轴拥有相同的长度 ``<width>``
- ``-Jx<xscale>/<yscale>`` 分别为X轴和Y轴指定不同的比例尺
- ``-JX<width>/<height>`` 分别为X轴和Y轴指定不同的长度

下面的命令用线性投影将函数 :math:`y=\sqrt{x}` 用笛卡尔线性变换画在图上::

    gmt psxy -R0/100/0/10 -JX3i/1.5i -Bag -BWSne+gsnow -Wthick,blue,- -P -K sqrt.d > GMT_linear.ps
    gmt psxy -R -J -St0.1i -N -Gred -Wfaint -O sqrt.d10 >> GMT_linear.ps

绘图效果如下图所示：

.. figure:: /images/GMT_linear.*
   :width: 400 px
   :align: center

   笛卡尔坐标的线性变换

说明：

- 正常情况下，X轴向右递增，Y轴向上递增。有些时候可能需要X轴向左递增或者Y轴向下递增（比如Y轴是深度时），只要将轴的比例尺或者轴长度设置为负值即可。
- 若指定X轴的长度，并设置Y轴的长度为0，则会根据X轴的长度和范围计算出X轴的比例尺，并对Y轴使用相同的比例尺，进而计算出Y轴的长度，即 ``-JX10c/0c`` ， ``-JX0c/10c`` 同理。

地理坐标
~~~~~~~~

理论上地理坐标应该用地理投影画，而不应该用线性投影，但是有时候可能的确需要使用线性投影。用线性投影绘制地理坐标时会碰到一个问题，即经度有一个360度的周期性。因而在使用线性投影时需要通知GMT数据实际上是地理坐标。有三种办法：

#. 在 ``-R`` 后、数据范围前加上 ``g`` 或 ``d`` ，比如 ``-Rg-55/305/-90/90``
#. 在 ``-Jx`` 或 ``-JX`` 选项的最后加上 ``g`` 或 ``d`` ，比如 ``-JX10c/6cd``
#. 使用 ``-fg`` 选项

下面的例子用线性投影绘制了一个中心位于125ºE的世界地图::

    gmt set MAP_GRID_CROSS_SIZE_PRIMARY 0.1i MAP_FRAME_TYPE FANCY FORMAT_GEO_MAP ddd:mm:ssF
    gmt pscoast -Rg-55/305/-90/90 -Jx0.014i -Bagf -BWSen -Dc -A1000 -Glightbrown -Wthinnest \
            -P -Slightblue > GMT_linear_d.ps

.. _GMT_linear_d:

.. figure:: /images/GMT_linear_d.*
   :width: 500 px
   :align: center

   地理坐标的线性变换

日期时间坐标
~~~~~~~~~~~~

时间日期坐标也可以用线性投影绘制，此时需要告诉GMT输入坐标是绝对时间还是相对时间。

可以通过在 ``-Jx`` 或 ``-JX`` 的最后加上 ``T`` 或 ``t`` ，不过实际上 ``-R`` 选择中已经指定了时间范围，所以没有必要在 ``-J`` 和 ``-R`` 选项中都指定。当 ``-R`` 和 ``-J`` 选项给出的坐标类型相冲突时，GMT会给出警告，并以 ``-JX`` 选项为准。

::

    gmt set FORMAT_DATE_MAP o TIME_WEEK_START Sunday FORMAT_CLOCK_MAP=-hham \
            FORMAT_TIME_PRIMARY_MAP full
    gmt psbasemap -R2001-9-24T/2001-9-29T/T07:0/T15:0 -JX4i/-2i -Bxa1Kf1kg1d \
                  -Bya1Hg1h -BWsNe+glightyellow -P > GMT_linear_cal.ps

.. _GMT_linear_cal:

.. figure:: /images/GMT_linear_cal.*
   :width: 400 px
   :align: center

   日期时间坐标的线性变换

笛卡尔对数投影
--------------

对数变换 :math:`\log_{10}` 的数学表示是 :math:`u' = a \log_{10}(u) + b` ，可以通过在比例尺或轴长度后加上 ``l`` 指定。

下面的命令绘制了一个X轴为对数轴Y轴为线性轴的图::

    gmt psxy -R1/100/0/10 -Jx1.5il/0.15i -Bx2g3 -Bya2f1g2 -BWSne+gbisque \
             -Wthick,blue,- -P -K -h sqrt.d > GMT_log.ps
    gmt psxy -R -J -Ss0.1i -N -Gred -W -O -h sqrt.d10 >> GMT_log.ps

.. _GMT_log:

.. figure:: /images/GMT_log.*
   :width: 400 px
   :align: center

   对数投影

注意：若想要X轴和Y轴都使用对数投影，且X轴和Y轴比例尺不同，则必须在指定每个轴的比例尺时分别加上 ``l`` ，例如 ``-JX10cl/6cl``  。

笛卡尔指数投影
--------------

指数投影的函数表示是 :math:`u' = a u^b + c` ，使得用户可以绘制类似 :math:`x^p` vs :math:`y^q` 这样的函数关系。如果选 ``p=0.5`` 、 ``q=1`` 则相对于绘制 ``x`` 与 :math:`\sqrt{x}` 的函数曲线。

要使用指数投影，需要在比例尺或轴长度后加上 ``p<exp>`` ，其中 ``<exp>`` 是要使用的指数。例如::

    gmt psxy -R0/100/0/10 -Jx0.3ip0.5/0.15i -Bxa1p -Bya2f1 -BWSne+givory \
             -Wthick -P -K sqrt.d > GMT_pow.ps
    gmt psxy -R -J -Sc0.075i -Ggreen -W -O sqrt.d10 >> GMT_pow.ps

.. _GMT_pow:

.. figure:: /images/GMT_pow.*
   :width: 400 px
   :align: center

   指数变换
