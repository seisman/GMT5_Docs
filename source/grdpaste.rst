.. index:: ! grdpaste

grdpaste
========

:ctime: 2015-06-07
:mtime: 2015-06-07

`man grdpaste <http://gmt.soest.hawaii.edu/doc/latest/grdpaste.html>`_

grdpaste用于将两个有共同边界的网格文件拼接成一个文件。

要合并的两个网格文件必须拥有相同的dx、dy以及一条共同的边。若不满足，则需要使用grdcut、grdsample选项对网格数据做处理再拼接。

最小示例
--------

::

    $ gmt grdpaste file_a.nc file_b.nc -Goutfile.nc

若file_a.nc的范围是(150E,180E),(0,30N)，而file_b.nc的范围是(150E,180E),(-30S,0)，可以将这两个文件拼接成一个(150E,180E),(-30S,30N)的网格文件::

    $ gmt grdpaste file_a.nc file_b.nc -Goutfile.nc -V -fg
