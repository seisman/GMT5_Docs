模块列表
########

据不完全统计，GMT5中目前有120多个模块，在侧边栏中，所有的命令是按照字母排序的，方便查找。

下面将所有命令按照功能分类，并用一句话简述其功能。

- 主程序/脚本

  #. :doc:`gmt` ：GMT主程序
  #. :doc:`isogmt` ：在“隔离模式”下运行GMT命令或脚本
  #. :doc:`gmt5syntax` ：将旧的GMT脚本修改成新的 ``gmt <module>`` 语法

- 绘制1D和2D数据

  #. :doc:`psbasemap` ：绘制底图
  #. :doc:`pscoast` ：在地图上绘制海岸线、河流、国界线
  #. :doc:`psxy` ：在图上绘制线段、多边形和符号
  #. :doc:`pstext` ：在图上写文本
  #. :doc:`psscale` ：在图上绘制灰色或彩色色标
  #. :doc:`psclip` ：打开或关闭多边形裁剪路径
  #. :doc:`psimage` ：将图片图片或EPS文件放在地图上
  #. :doc:`gmtlogo` ：在图上绘制GMT图形logo
  #. :doc:`grdimage` ：在图上绘制网格数据
  #. :doc:`pslegend` ：在图上绘制图例
  #. :doc:`pshistogram` ：统计并绘制直方图

- 信息提取

  #. :doc:`gmtget` ：列出单个或多个GMT参数的当前值
  #. :doc:`gmtset` ：修改单个或多个GMT参数的值
  #. :doc:`gmtdefaults` ：列出所有GMT参数的当前值
  #. :doc:`gmtinfo` ：从表数据中提取信息
  #. :doc:`grdinfo` ：从网格文件中提取基本信息
  #. :doc:`gmtselect` ：根据多个准则筛选数据
  #. :doc:`gmtwhich` ：返回指定文件的完整路径
  #. :doc:`fitcircle` ：拟合球面上数据点的平均位置及圆弧

- 2D数据处理

  #. :doc:`grdcut` ：从一个网格文件中裁剪出一个子区域
  #. :doc:`grdpaste` ：将两个网格沿着其共同边界拼接成一个文件
  #. :doc:`grdraster` ：从二进制数据中提取子区域并保存为GMT网格文件
  #. :doc:`grdclip` ：对网格文件的Z值做裁剪

- 格式转换

  #. :doc:`kml2gmt` ：将Google Earth的KML文件转换为GMT表数据
  #. :doc:`psconvert` ：将GMT生成的PS文件转换为其他图片格式
  #. :doc:`grd2xyz` ：将网格文件转换成表数据
  #. :doc:`xyz2grd` ：将XYZ数据或Z数据转换成网格文件

- meca补充包

  #. :doc:`psmeca` ：在地图上绘制震源机制解
  #. :doc:`pspolar` ：在震源球上绘制台站极性
  #. :doc:`psvelo` ：在地图上绘制速度矢量、十字线、楔形图
  #. :doc:`pscoupe` ：绘制震源机制解的剖面图

- 未来会整理的命令

  #. :doc:`grdedit`
  #. :doc:`psmask`
  #. :doc:`psrose`
  #. :doc:`psxyz`
  #. :doc:`grdvector`
  #. :doc:`grdview`
  #. :doc:`grd2cpt`
  #. :doc:`grd2rgb`
  #. :doc:`grdblend`
  #. :doc:`grdgradient`
  #. :doc:`grdlandmask`
  #. :doc:`grdmask`
  #. :doc:`grdmath`
  #. :doc:`grdproject`
  #. :doc:`grdsample`
  #. :doc:`grdconvert`
  #. :doc:`gmt2kml`
  #. :doc:`gmtconvert`
  #. :doc:`trend1d`
  #. :doc:`trend2d`
  #. :doc:`mapproject`
  #. :doc:`project`
  #. :doc:`surface`
  #. :doc:`sample1d`
  #. :doc:`grdtrack`
  #. :doc:`grdtrend`
  #. :doc:`makecpt`

- 没有整理计划的命令

  #. :doc:`pscontour`
  #. :doc:`pssegy`
  #. :doc:`pssegyz`
  #. :doc:`pswiggle`
  #. :doc:`grdcontour`
  #. :doc:`grdgravmag3d`
  #. :doc:`grdhisteq`
  #. :doc:`grdpmodeler`
  #. :doc:`grdredpol`
  #. :doc:`grdrotater`
  #. :doc:`blockmean`
  #. :doc:`blockmedian`
  #. :doc:`blockmode`
  #. :doc:`filter1d`
  #. :doc:`grdfilter`
  #. :doc:`dimfilter`
  #. :doc:`grdfft`
  #. :doc:`gmtconnect`
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

  #. :doc:`gmtswitch`

  #. :doc:`backtracker`
  #. :doc:`gmtgravmag3d`
  #. :doc:`gmtsimplify`
  #. :doc:`gmtspatial`
  #. :doc:`gmtvector`
  #. :doc:`gravfft`
  #. :doc:`grdseamount`
  #. :doc:`grdspotter`
  #. :doc:`grdvolume`
  #. :doc:`greenspline`
  #. :doc:`gshhg`
  #. :doc:`hotspotter`
  #. :doc:`img2google`
  #. :doc:`img2grd`
  #. :doc:`originator`
  #. :doc:`rotconverter`
  #. :doc:`segy2grd`
  #. :doc:`spectrum1d`
  #. :doc:`sph2grd`
  #. :doc:`sphdistance`
  #. :doc:`sphinterpolate`
  #. :doc:`sphtriangulate`
  #. :doc:`splitxyz`

.. raw:: latex

   \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
   \setcounter{secnumdepth}{1}

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
   gmtflexure
   gmtget
   gmtgravmag3d
   gmtinfo
   gmtlogo
   gmtmath
   gmtregress
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
   grdflexure
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
   grdconvert
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
   psconvert
   psbasemap
   psclip
   pscoast
   pscontour
   pscoupe
   pshistogram
   psimage
   pslegend
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
   talwani2d
   talwani3d
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

