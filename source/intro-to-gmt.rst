简介
====

:Create Date: 2015-01-23
:Last Updated: 2015-02-01

GMT是什么
---------

GMT，即Generic Mapping Tools，中文一般译为“通用制图工具”。从全称中的“mapping”这个单词就可以猜出，这个软件是跟地图的绘制有关的。

GMT的历史
---------

#. 1988年，Lamont-Doherty Earth Observatory of Columbia University的两个研究生Paul Wessel和Walter H.F. Smith开发了GMT的最原始版本，GMT 1.0，并非正式地在L-DEO内部发布，后来逐渐扩散到美国、加拿大、欧洲和日本的各大机构。
#. 1991年8月10日，GMT 2.0发布；
#. 1998年11月8日，GMT 3.x的第一个正式版本发布；
#. 2005年10月1日，GMT 4.x的第一个正式版发布；目前最新版本为GMT 4.5.13（20150101）；
#. 2013年11月5日，GMT 5.x的第一个正式版发布；目前最新版本为GMT 5.1.1（20140301）

GMT版本号
---------

GMT的版本号的格式为::

    major.minor.build

其中major为主版本号，minor为次版本号，build为更小的版本号。

一般而言，当有极大的更新时，会增加major的版号；当有大的更新，但不至于更新major时，会更新minor版号；若更新比较小，主要是修复错误，则会更新build的版本号。

因而，GMT 5.x.x相对于GMT 4.x.x而言，是有很大区别的，两个版本之间是不兼容的。GMT 4.5.x和GMT4.4.x，部分命令的语法和用法可能有一点区别。而GMT 4.5.13和GMT 4.5.12之间，则主要是修复了bug。

相关引用
--------

若发表的文章要包含了使用GMT获得的结果或图件，可以考虑引用GMT在EOS上的文章：

- Wessel, P., W. H. F. Smith, R. Scharroo, J. Luis, and F. Wobbe,
  Generic Mapping Tools: Improved Version Released, *EOS Trans. AGU*, 94(45),
  p. 409-410, 2013. `doi:10.1002/2013EO450001 <http://dx.doi.org/10.1002/2013EO450001>`_.

- Wessel, P., and W. H. F. Smith, New, improved version of Generic
  Mapping Tools released, *EOS Trans. AGU*, 79(47),
  p. 579, 1998. `doi:10.1029/98EO00426 <http://dx.doi.org/10.1029/98EO00426>`_.

- Wessel, P., and W. H. F. Smith, New version of the Generic Mapping
  Tools released, *EOS Trans. AGU*, 76(33), 329, 1995. `doi:10.1029/95EO00198 <http://dx.doi.org/10.1029/95EO00198>`_.

- Wessel, P., and W. H. F. Smith, Free software helps map and display
  data, *EOS Trans. AGU*, 72(41), 445--446, 1991. `doi:10.1029/90EO00319 <http://dx.doi.org/10.1029/90EO00319>`_.

GMT中的某些命令中包含了他们自己实现和发表的算法，这些文章包括：

-  Kim, S.-S., and P. Wessel, Directional median filtering for
   regional-residual separation of bathymetry, *Geochem. Geophys.
   Geosyst.*, 9, Q03005, 2008. `doi:10.1029/2007GC001850 <http://dx.doi.org/10.1029/2007GC001850>`_.
   [:doc:`dimfilter <supplements/misc/dimfilter>`, **misc** supplement]

-  Luis, J. F. and J. M. Miranda, Reevaluation of magnetic chrons in the
   North Atlantic between 35ºN and 47ºN: Implications for the formation of the
   Azores Triple Junction and associated plateau,
   *J. Geophys. Res.*, 113, B10105, 2008. `doi:10.1029/2007JB005573 <http://dx.doi.org/10.1029/2007JB005573>`_.
   [:doc:`grdredpol <supplements/potential/grdredpol>`, **potential** supplement]

-  Smith, W. H. F., and P. Wessel, Gridding with continuous curvature
   splines in tension, *Geophysics*, 55(3), 293--305, 1990. `doi:10.1190/1.1442837 <http://dx.doi.org/10.1190/1.1442837>`_.
   [:doc:`surface`]

-  Wessel, P., Tools for analyzing intersecting tracks: The x2sys
   package, *Computers & Geosciences*, 36, 348--354, 2010. `doi:10.1016/j.cageo.2009.05.009 <http://dx.doi.org/10.1016/j.cageo.2009.05.009>`_.
   [:doc:`x2sys <supplements/x2sys/x2sys_init>` supplement]

-  Wessel, P., A General-purpose Green's function-based interpolator,
   *Computers & Geosciences*, 35, 1247--1254, 2009. `doi:10.1016/j.cageo.2008.08.012 <http://dx.doi.org/10.1016/j.cageo.2008.08.012>`_.
   [:doc:`greenspline`]

-  Wessel, P. and J. M. Becker, Interpolation using a generalized
   Green's function for a spherical surface spline in tension, *Geophys.
   J. Int.*, 174, 21--28, 2008. `doi:10.1111/j.1365-246X.2008.03829.x <http://dx.doi.org/10.1111/j.1365-246X.2008.03829.x>`_.
   [:doc:`greenspline`]
