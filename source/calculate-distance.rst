距离的计算
----------

距离的计算依赖于地球椭率的选取（\ :ref:`PROJ_ELLIPSOID <PROJ_ELLIPSOID>`\ ）以及具体的计算方法。GMT提供了三种计算方法，在精度和计算效率上各有权衡。

Flat Earth距离
^^^^^^^^^^^^^^

地球上任意两点A和B的距离可以通过如下公式近似计算得到：

.. math::

     d_f = R \sqrt{(\theta_A - \theta_B)^2 + \cos \left [ \frac{\theta_A +
     \theta_B}{2} \right ] \Delta \lambda^2}, \label{eq:flatearth}

其中R是地球的平均半径，\ :math:`\theta`\ 是纬度，经度差\ :math:`\Delta \lambda = \lambda_A - \lambda_B`\ 。式中，地理坐标的单位是弧度。

该方法适用于纬度相差不大并且对计算效率要求比较高的情况。在距离前加上前缀\ **-**\ 即表示此距离用Flat Earth方法计算。在某些情况下，只需要指定距离的单位而不指定具体的距离值，则可以在距离单位前加上前缀\ **-**\ 表示该距离用Flat Earth方法计算。

比如，\ ``-S-50M``\ 表示设定搜索半径为50海里，其中距离用Flat Earth方法计算。

大圆路径距离
^^^^^^^^^^^^

这是默认的计算距离的方法，球面上两点A和B的距离用Haversine公式计算：

.. math::

     d_g = 2R \sin^{-1}  {\sqrt{\sin^2\frac{\theta_A - \theta_B}{2} + \cos
     \theta_A \cos \theta_B \sin^2 \frac{\lambda_A - \lambda_B}{2}} },
     \label{eq:greatcircle}

该方法将地球近似为一个半径为\ **R**\ 的球，适用于大多数的情况。比如，\ ``-S5000f``\ 设定了用该方法计算搜索半径5000英寸。

注意：GMT默认参数中有两个参数可以控制距离的计算。

- :ref:`PROJ_MEAN_RADIUS <PROJ_MEAN_RADIUS>`\ ：平均半径；
- :ref:`PROJ_AUX_LATITUDE <PROJ_AUX_LATITUDE>`\ ：将大地测量纬度转换为多个适合球近似的辅助纬度。

大地测量距离
^^^^^^^^^^^^

使用Vincenty的完全椭球公式计算最精确的距离。可以通过在距离或距离单位前加上前缀\ ``+``\ 来指定用该方法计算距离。比如，\ ``-S+20k``\ 表示用该方法计算的20千米的距离。
