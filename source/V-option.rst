V选项
=====

:ctime: 2015-04-17
:mtime: 2015-04-17

``-V``\ 选项使得命令进入verbose模式，即会输出进程报告到标准错误流。

verbose有6个等级，等级越高输出的信息越多，高等级会在低等级的基础上加上更多的输出信息。6个等级从低到高分别为：

- ``-Vq``\ ：quiet；不输出任何错误和警告；
- ``-Vn``\ ：nomral（默认值）；仅输出错误和警告信息；
- ``-Vc``\ ：compatibility；输出与兼容性相关的警告信息；
- ``-V``\ ：verbose；输出错误、警告以及数据处理的基本信息（如读入的文件名，读入的点数等）；
- ``-Vl``\ ：long；详细的进程报告；
- ``-Vd``\ ：debug；包含了大量调试信息；

该选项仅对当前命令有效，若希望接下来所有的命令都具有某个verbose级别，可以设置GMT参数中的\ :ref:`GMT_VERBOSE <GMT_VERBOSE>`\ 为quiet、normal、compat、verbose、long_verbose或debug。
