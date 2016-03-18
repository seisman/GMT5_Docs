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
  #. :doc:`pslegend` ：在图上绘制图例
  #. :doc:`pshistogram` ：统计并绘制直方图
  #. :doc:`psrose` ：绘制极坐标下的直方图（sector图、rose图或windrose图）
  #. :doc:`grdvector` ：根据两个网格文件绘制矢量场
  #. :doc:`grdimage` ：在图上绘制网格数据
  #. :doc:`gmtlogo` ：在图上绘制GMT图形logo

- 信息提取

  #. :doc:`gmtget` ：列出单个或多个GMT参数的当前值
  #. :doc:`gmtset` ：修改单个或多个GMT参数的值
  #. :doc:`gmtdefaults` ：列出所有GMT参数的当前值
  #. :doc:`gmtinfo` ：从表数据中提取信息
  #. :doc:`grdinfo` ：从网格文件中提取基本信息
  #. :doc:`gmtselect` ：根据多个准则筛选数据
  #. :doc:`gmtwhich` ：返回指定文件的完整路径
  #. :doc:`fitcircle` ：拟合球面上数据点的平均位置及圆弧

- 1D数据处理

  #. :doc:`filter1d` ：对1D表数据做时间域滤波
  #. :doc:`gmtsimplify` ：使用Douglas-Peucker算法对线段做简化
  #. :doc:`gmtconnect` ：将端点接近的线段连接起来
  #. :doc:`sample1d` ：对1D表数据进行重采样
  #. :doc:`project` ：将数据点投影到线或大圆路径上，生成测线，坐标转换

- 2D数据处理

  #. :doc:`grdedit` ：修改网格文件的头段或内容
  #. :doc:`grdcut` ：从一个网格文件中裁剪出一个子区域
  #. :doc:`grdblend` ：将多个部分重叠的网格文件合并成一个网格文件
  #. :doc:`grdpaste` ：将两个网格沿着其共同边界拼接成一个文件
  #. :doc:`grdraster` ：从二进制数据中提取子区域并保存为GMT网格文件
  #. :doc:`grdclip` ：对网格文件的Z值做裁剪
  #. :doc:`grdlandmask` ：根据海岸线数据创建陆地-海洋的mask网格文件
  #. :doc:`grdtrend` ：拟合网格的趋势面并计算残差
  #. :doc:`grdsample` ：对网格文件做重采样
  #. :doc:`grdvolume` ：计算网格数据中某个等值线所包围的表面积和体积
  #. :doc:`grdproject` ：对网格数据做地图变换和逆变换
  #. :doc:`grdmask` ：根据多边形数据或点数据创建mask网格文件
  #. :doc:`grdconvert` ：在不同的网格格式之间互相转换

- 格式转换

  #. :doc:`kml2gmt` ：将Google Earth的KML文件转换为GMT表数据
  #. :doc:`psconvert` ：将GMT生成的PS文件转换为其他图片格式
  #. :doc:`grd2xyz` ：将网格文件转换成表数据
  #. :doc:`xyz2grd` ：将XYZ数据或Z数据转换成网格文件
  #. :doc:`grd2rgb` ：将网格文件、原始RGB文件、SUN光栅文件转换成R/G/B三个网格文件

- meca补充包

  #. :doc:`psmeca` ：在地图上绘制震源机制解
  #. :doc:`pspolar` ：在震源球上绘制台站极性
  #. :doc:`psvelo` ：在地图上绘制速度矢量、十字线、楔形图
  #. :doc:`pscoupe` ：绘制震源机制解的剖面图

- 计划整理的命令（按优先级排序，欢迎提交PR）

  #. grdtrack
  #. makecpt
  #. grd2cpt
  #. gmtconvert
  #. trend1d
  #. grdcontour

  #. psmask
  #. grdview
  #. grdgradient
  #. grdmath
  #. gmt2kml
  #. trend2d
  #. mapproject
  #. surface
  #. grdfilter
  #. grdfft
  #. splitxyz

- 没有整理计划的命令

  #. blockmean
  #. blockmedian
  #. blockmode
  #. psxyz
  #. pscontour
  #. pssegy
  #. pssegyz
  #. pswiggle
  #. grdgravmag3d
  #. grdhisteq
  #. grdpmodeler
  #. grdredpol
  #. grdrotater
  #. dimfilter
  #. triangulate
  #. nearneighbor

  #. mgd77convert
  #. mgd77info
  #. mgd77list
  #. mgd77magref
  #. mgd77manage
  #. mgd77path
  #. mgd77sniffer
  #. mgd77track

  #. x2sys_binlist
  #. x2sys_cross
  #. x2sys_datalist
  #. x2sys_get
  #. x2sys_init
  #. x2sys_list
  #. x2sys_merge
  #. x2sys_put
  #. x2sys_report
  #. x2sys_solve

  #. gmtswitch

  #. backtracker
  #. gmtgravmag3d
  #. gmtspatial
  #. gmtvector
  #. gravfft
  #. grdseamount
  #. grdspotter
  #. greenspline
  #. gshhg
  #. hotspotter
  #. img2google
  #. img2grd
  #. originator
  #. rotconverter
  #. segy2grd
  #. spectrum1d
  #. sph2grd
  #. sphdistance
  #. sphinterpolate
  #. sphtriangulate

.. raw:: latex

   \addtocontents{toc}{\protect\setcounter{tocdepth}{1}}
   \setcounter{secnumdepth}{0}

.. toctree::
   :maxdepth: 1
   :hidden:

   filter1d
   fitcircle
   gmt
   gmt5syntax
   gmtconnect
   gmtdefaults
   gmtget
   gmtinfo
   gmtlogo
   gmtselect
   gmtset
   gmtsimplify
   grd2rgb
   grd2xyz
   grdblend
   grdclip
   grdcut
   grdedit
   grdimage
   grdinfo
   grdlandmask
   grdmask
   grdpaste
   grdproject
   grdraster
   grdconvert
   grdsample
   grdtrack
   grdtrend
   grdvector
   grdvolume
   isogmt
   kml2gmt
   makecpt
   mapproject
   project
   psconvert
   psbasemap
   psclip
   pscoast
   pscoupe
   pshistogram
   psimage
   pslegend
   psmeca
   pspolar
   psrose
   psscale
   pstext
   psvelo
   psxy
   sample1d
   xyz2grd

.. backtracker
.. blockmean
.. blockmedian
.. blockmode
.. dimfilter
.. gmt2kml
.. gmtconvert
.. gmtflexure
.. gmtgravmag3d
.. gmtmath
.. gmtregress
.. gmtspatial
.. gmtswitch
.. gmtvector
.. gmtwhich
.. grd2cpt
.. grdcontour
.. grdfft
.. grdgradient
.. grdredpol
.. grdrotater
.. grdseamount
.. grdspotter
.. grdmath
.. grdpmodeler
.. grdview
.. gravfft
.. grdfilter
.. grdflexure
.. grdgravmag3d
.. grdhisteq
.. greenspline
.. gshhg
.. hotspotter
.. img2google
.. img2grd
.. mgd77convert
.. mgd77info
.. mgd77list
.. mgd77magref
.. mgd77manage
.. mgd77path
.. mgd77sniffer
.. mgd77track
.. nearneighbor
.. originator
.. pscontour
.. psmask
.. pssegy
.. pssegyz
.. pswiggle
.. psxyz
.. rotconverter
.. segy2grd
.. spectrum1d
.. sph2grd
.. sphdistance
.. sphinterpolate
.. sphtriangulate
.. splitxyz
.. surface
.. talwani2d
.. talwani3d
.. trend1d
.. trend2d
.. triangulate
.. x2sys_binlist
.. x2sys_cross
.. x2sys_datalist
.. x2sys_get
.. x2sys_init
.. x2sys_list
.. x2sys_merge
.. x2sys_put
.. x2sys_report
.. x2sys_solve
