CPT文件
#######

在使用2D网格数据绘制彩图或灰度图时，需要指定每个Z值或Z值范围绘图时所使用的颜色。CPT文件的作用就是定义了某个Z值或Z值范围所对应的颜色。CPT全称是color palette table，也称谓调色板或色标文件。

CPT文件可以在 :doc:`grdimage` 、 :doc:`psxy` 、 :doc:`psxyz` 等命令中使用。

分类CPT文件
===========

分类CPT文件常用于那些有明确分类的数据，常规的数值操作对这些数据是未定义的。

比如，将陆地分成不同的类型，沙漠、森林、冰川等等，定义沙漠对应的值是1，森林对应的值是2，冰川定义的值是3。显然值取1.5是没有意义的。

对于这种需要分类的情形，需要给每个分类指定一个唯一的 ``<key>`` ，颜色或图案，以及一个可选的标签（标签以分号开头）。


分类CPT文件的格式为::

    <key1>      <fill1>     [;<label1>]
    <key2>      <fill2>     [;<label2>]
    ...
    <keyn>      <filln>     [;<labeln>]

其中， ``<key>`` 必须单调递增但不必连续。 ``<fill>`` 的用法见 :doc:`fill` 一节。

``<key>`` 可以取几个特殊的值：

- ``B`` ：小于 ``<key1>`` 的值的颜色，即背景色
- ``F`` ：大于 ``<keyn>`` 的值的颜色，即前景色
- ``N`` ：值为 ``NaN`` 所对应的颜色

常规CPT文件
===========

对于连续变化的数据而言，可以通过指定几个特定值的颜色，其他值的颜色则通过插值计算得到。此时可以使用常规CPT文件。其格式为::

    <z0>   <color_min>  <z1>   <color_max>    [<A>]    [;<label>]
    <z1>   <color_min>  <z2>   <color_max>    [<A>]    [;<label>]
    ...
    <z1>   <color_min>  <z2>   <color_max>    [<A>]    [;<label>]

该CPT文件表示，从 ``<z0>`` 到 ``<z1>`` ，颜色从 ``<color_min>`` 线性渐变到 ``<color_max>`` 。若 ``<color_min>=<color_max>`` ，则 ``<z0>`` 到 ``<z1>`` 范围内颜色为常数。若 ``<color_min>`` 使用了图案而不是颜色，则 ``<color_max>`` 必须为 ``-`` 。若 ``<color_min>`` 和 ``<color_max>`` 都被设置成 ``-`` ，则忽略这段Z切片。

``<A>`` 是可选的，用于表明在使用 :doc:`psscale` 命令绘制色标时是否要写上标注。 ``<A>`` 可以取 ``L`` 、 ``U`` 、 ``B`` 表示选择每个Z切片的下限、上限或者上下限作为标注。 ``;<lable>`` 使得 :doc:`psscale` 在与 ``-L`` 选项连用时会在标注时用 ``<label>`` 替代Z值。

对于常规CPT文件，也可以设置前景色、背景色和NaN色::

    B   <fill_back>
    F   <fill_fore>
    N   <fill_NaN>

这几个语句需要放在CPT的文件开头或结尾。

CPT文件中的Z值可以通过 ``+u|+U<unit>`` 机制进行缩放。通过在文件名后加 ``+u<unit>`` 可以将Z值从 ``<unit>`` 变换为以米为单位；文件名后加 ``+U<unit>`` 可以将Z值从以米为单位变换成 ``<unit>`` 。

GMT自带CPT
==========

GMT内置了35个CPT文件，位于 ``${GMTHOME}/share/cpt`` 目录中。

GMT中的 :doc:`makecpt` 和 :doc:`grd2cpt` 可以以这些内置CPT文件为基础，针对数据制作专门的CPT文件。比如某个内置CPT文件定义了从0到1颜色从蓝色变成红色，用 :doc:`makecpt` 可以制作一个从1000到3000颜色从蓝色变成红色的CPT文件。

下面给出了GMT内置的36个CPT文件，每个子图的上边为原始CPT，下边是用 ``makecpt -T-1/1/0.25`` 生成的8个离散颜色的CPT。

.. figure:: /images/GMT_App_M_1a.*
   :width: 700 px
   :align: center

.. figure:: /images/GMT_App_M_1b.*
   :width: 700 px
   :align: center

CPT图例示例
===========

.. figure:: /images/GMT_App_M_2.*
   :width: 700 px
   :align: center

其他CPT
=======

更多的CPT可以访问： http://soliton.vm.bytemark.co.uk/pub/cpt-city/
