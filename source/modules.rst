模块列表
########

.. toctree::
   :maxdepth: 1
   :hidden:

   backtracker
   blockmean
   blockmedian
   blockmode
   dimfilter
   filter1d
   fitcircle
   gmt
   gmt2kml
   gmt5syntax
   gmtconnect
   gmtconvert
   gmtdefaults
   gmtget
   gmtgravmag3d
   gmtinfo
   gmtlogo
   gmtmath
   gmtselect
   gmtset
   gmtsimplify
   gmtspatial
   gmtswitch
   gmtvector
   gmtwhich
   gravfft
   grd2cpt
   grd2rgb
   grd2xyz
   grdblend
   grdclip
   grdcontour
   grdcut
   grdedit
   grdfft
   grdfilter
   grdgradient
   grdgravmag3d
   grdhisteq
   grdimage
   grdinfo
   grdlandmask
   grdmask
   grdmath
   grdpaste
   grdpmodeler
   grdproject
   grdraster
   grdredpol
   grdreformat
   grdrotater
   grdsample
   grdseamount
   grdspotter
   grdtrack
   grdtrend
   grdvector
   grdview
   grdvolume
   greenspline
   gshhg
   hotspotter
   img2google
   img2grd
   isogmt
   kml2gmt
   makecpt
   mapproject
   mgd77convert
   mgd77info
   mgd77list
   mgd77magref
   mgd77manage
   mgd77path
   mgd77sniffer
   mgd77track
   nearneighbor
   originator
   project
   ps2raster
   psbasemap
   psclip
   pscoast
   pscontour
   pscoupe
   pshistogram
   psimage
   pslegend
   pslib
   psmask
   psmeca
   pspolar
   psrose
   psscale
   pssegy
   pssegyz
   pstext
   psvelo
   pswiggle
   psxy
   psxyz
   rotconverter
   sample1d
   segy2grd
   spectrum1d
   sph2grd
   sphdistance
   sphinterpolate
   sphtriangulate
   splitxyz
   surface
   trend1d
   trend2d
   triangulate
   x2sys_binlist
   x2sys_cross
   x2sys_datalist
   x2sys_get
   x2sys_init
   x2sys_list
   x2sys_merge
   x2sys_put
   x2sys_report
   x2sys_solve
   xyz2grd

据不完全统计，GMT5中目前有120多个模块，在侧边栏中，所有的命令是按照字母排序的，方便查找。

下面将所有命令按照功能分类，并用一句话简述其功能。

主程序
======

#. :doc:`gmt` ：GMT主程序
#. :doc:`gmt5syntax` ：将旧的GMT脚本修改成新的 ``gmt <module>`` 语法
#. :doc:`isogmt` ：在“隔离模式”下运行GMT命令或脚本
#. :doc:`gmtlogo` ：将GMT的logo作为一个图层加到一个打开的PS文件中

信息提取
========

#. :doc:`gmtget` ：列出单个或多个GMT参数的当前值
#. :doc:`gmtset` ：修改单个或多个GMT参数的值
#. :doc:`gmtdefaults` ：列出所有GMT参数的当前值
#. :doc:`gmtinfo` ：从表数据中提取信息

绘制1D数据
==========

#. :doc:`psbasemap` ：绘制底图
#. :doc:`pscoast` ：在地图上绘制海岸线、河流、国界线
#. :doc:`pstext` ：在图上写文本
#. :doc:`psclip` ：打开或关闭多边形裁剪路径
#. :doc:`psxy` ：在图上绘制线段、多边形和符号

数据转换或提取
==============

#. :doc:`grdpaste` ：将两个网格沿着其共同边界拼接成一个文件
#. :doc:`grdcut` ：从一个网格文件中裁剪出一个子区域
#. :doc:`grdraster` ：从二进制数据中提取子区域并保存为GMT网格文件
#. :doc:`kml2gmt` ：将Google Earth的KML文件转换为GMT表数据
#. :doc:`grd2xyz` ：将网格文件转换成表数据

格式转换工具
============

#. :doc:`ps2raster`　：将GMT生成的PS文件转换为其他图片格式

2D数据的其他操作
================

#. :doc:`grdedit` ：修改网格文件的头段或内容

待整理
======

#. :doc:`pscontour`
#. :doc:`pscoupe`
#. :doc:`pshistogram`
#. :doc:`psimage`
#. :doc:`pslegend`
#. :doc:`psmask`
#. :doc:`psmeca`
#. :doc:`pspolar`
#. :doc:`psrose`
#. :doc:`psscale`
#. :doc:`pssegy`
#. :doc:`pssegyz`
#. :doc:`psvelo`
#. :doc:`pswiggle`
#. :doc:`psxyz`

#. :doc:`grdcontour`
#. :doc:`grdimage`
#. :doc:`grdvector`
#. :doc:`grdview`

#. :doc:`grd2cpt`
#. :doc:`grd2rgb`
#. :doc:`grdblend`
#. :doc:`grdclip`
#. :doc:`grdgradient`
#. :doc:`grdgravmag3d`
#. :doc:`grdhisteq`
#. :doc:`grdlandmask`
#. :doc:`grdmask`
#. :doc:`grdmath`
#. :doc:`grdpmodeler`
#. :doc:`grdproject`
#. :doc:`grdredpol`
#. :doc:`grdreformat`
#. :doc:`grdrotater`
#. :doc:`grdsample`

#. :doc:`xyz2grd`
#. :doc:`gmt2kml`
#. :doc:`gmtconvert`
#. :doc:`grdinfo`
#. :doc:`gmtselect`

#. :doc:`blockmean`
#. :doc:`blockmedian`
#. :doc:`blockmode`
#. :doc:`filter1d`
#. :doc:`grdfilter`
#. :doc:`dimfilter`

#. :doc:`trend1d`
#. :doc:`trend2d`
#. :doc:`fitcircle`
#. :doc:`grdfft`
#. :doc:`gmtconnect`

#. :doc:`mapproject`
#. :doc:`project`

#. :doc:`surface`
#. :doc:`triangulate`
#. :doc:`nearneighbor`

#. :doc:`mgd77convert`
#. :doc:`mgd77info`
#. :doc:`mgd77list`
#. :doc:`mgd77magref`
#. :doc:`mgd77manage`
#. :doc:`mgd77path`
#. :doc:`mgd77sniffer`
#. :doc:`mgd77track`

#. :doc:`x2sys_binlist`
#. :doc:`x2sys_cross`
#. :doc:`x2sys_datalist`
#. :doc:`x2sys_get`
#. :doc:`x2sys_init`
#. :doc:`x2sys_list`
#. :doc:`x2sys_merge`
#. :doc:`x2sys_put`
#. :doc:`x2sys_report`
#. :doc:`x2sys_solve`

#. :doc:`gmtwhich`
#. :doc:`gmtswitch`
#. :doc:`pslib`
#. :doc:`gmtlogo`

#. :doc:`backtracker`
#. :doc:`gmtgravmag3d`
#. :doc:`gmtsimplify`
#. :doc:`gmtspatial`
#. :doc:`gmtvector`
#. :doc:`gravfft`
#. :doc:`grdseamount`
#. :doc:`grdspotter`
#. :doc:`grdtrack`
#. :doc:`grdtrend`
#. :doc:`grdvolume`
#. :doc:`greenspline`
#. :doc:`gshhg`
#. :doc:`hotspotter`
#. :doc:`img2google`
#. :doc:`img2grd`
#. :doc:`makecpt`
#. :doc:`originator`
#. :doc:`rotconverter`
#. :doc:`sample1d`
#. :doc:`segy2grd`
#. :doc:`spectrum1d`
#. :doc:`sph2grd`
#. :doc:`sphdistance`
#. :doc:`sphinterpolate`
#. :doc:`sphtriangulate`
#. :doc:`splitxyz`
