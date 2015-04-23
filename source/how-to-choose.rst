选择
====

:ctime: 2014-11-13
:mtime: 2015-04-21

GMT4 or GMT5
------------

GMT于2013年11月发布了GMT5的第一个正式版本5.1.0，自此，GMT目前存在两个并行的版本：GMT4和GMT5。GMT4目前只修订bug，不再增加新功能。

选择GMT4的理由：

- 已经发布十年有余，功能相对成熟；
- 已不再增加新功能，仅修复bug，因而bug只会越来越少；
- 网络上的中文教程及示例多采用GMT4语法，新手学习起来更方便；

选择GMT5的理由：

- GMT5相对于GMT4有很多改进，命令语法更统一；
- GMT5相对于GMT4加入了更多的新功能；
- GMT5是GMT的未来；

推荐新用户学习并使用GMT5，本文档也仅介绍GMT5。

Linux or Windows
----------------

GMT可以运行在Linux以及Windows下，当然也可以运行在Mac下，这里姑且认为Mac跟Linux是相同的。

推荐在Linux下使用GMT，原因如下：

- GMT是在Linux下开发的，后移植到Windows下。因而，Windows版本的GMT相对来说有更多的bug；
- Linux下有众多辅助工具：\ ``gawk``\ 、\ ``cut``\ 、\ ``paste``\ ；
- Windows下的命令行太难用，测试GMT命令太麻烦；
- Windows的bat脚本功能单一；
