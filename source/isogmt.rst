.. index:: ! isogmt

isogmt
======

- 官方文档： :ref:`gmt:isogmt`
- 简介：在隔离模式下运行GMT命令或脚本

该命令本质上是一个Bash脚本，其脚本内容为::

    export GMT_TMPDIR=`mktemp -d ${TMPDIR:-/tmp}/gmt.XXXXXX`
    gmt "$@"
    rm -rf $GMT_TMPDIR
    unset GMT_TMPDIR

脚本的作用是定义环境变量 ``${GMT_TMPDIR}`` ，该目录是GMT的临时目录，接下来所有GMT命令生成的临时文件均在该目录下生成。命令执行完毕后，删除临时目录和环境变量。

语法
----

::

    isogmt command

示例
----

单独运行一个GMT命令::

    isogmt psbasemap -R0/10/0/10 -JX10c/10c -B1 > test.ps

运行一个脚本::

    isogmt sh run.sh
