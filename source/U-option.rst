U选项
=====

``-U``\ 选项会在纸上绘制一个带有UNIX系统时间戳的GMT logo。其语法为：

**-U**\ [*just*/*dx*/*dy*/][**c**\ \|\ *label*]

当\ ``-U``\ 单独使用会在当前图的左下角添加一个带时间戳的logo。\ ``-U``\ 选项后加上\ *just/dx/dy*\ 可以调整logo的对齐方式以及相对于绘图左下角的位置，比如\ ``-UBL/0/0``\ 会将logo的左下角与绘图的左下角对齐。同时，\ ``-U``\ 后接任意字符串，会在时间戳附近打印该字符串，比如\ ``-UBL/0/0/"This is a plot"``\ ，也可以使用\ ``-Uc``\ 将当前绘图命令打印在logo后。

GMT参数中有一些与logo相关的参数：

- :ref:`MAP_LOGO <MAP_LOGO>`\ 可以控制是否绘制时间戳，与\ ``-U``\ 选项的功能类似；
- :ref:`MAP_LOGO_POS <MAP_LOGO_POS>`\ 用于控制时间戳的位置；
- :ref:`FORMAT_TIME_STAMP <FORMAT_TIME_STAMP>`\ 用于控制时间戳的显示格式；

.. _U_option:

.. figure:: /images/GMT_-U.*
   :width: 500px
   :align: center

   U选项效果图
