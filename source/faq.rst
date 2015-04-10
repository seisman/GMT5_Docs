FAQ
===

#. 使用ps2raster时出现如下错误::

     GMT PS format detected but file is not finalized. Maybe a -K in excess? No output created.

   出现这种错误的最常见原因是最后一个绘图命令里多了一个\ ``-K``\ ，即本该只使用\ ``-O``\ 选项关闭PS文件的，但却使用了\ ``-K -O``\ 选项。

#. 使用pscoast时出现如下错误::

    pscoast: low resolution shoreline data base not installed.

   出现该错误的原因是未安装gshhg数据， 或安装方式/路径不正确。
