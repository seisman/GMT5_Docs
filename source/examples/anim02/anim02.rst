.. _anim02:

DEM光照变化图
-------------

Our next animation uses a gridded topography for parts of Colorado (US);
the file is distributed with the tutorial examples. Here, we want to use
:doc:`grdimage </grdimage>` to generate a shaded-relief
image sequence in which we sweep the illumination azimuth around the
entire horizon. The resulting animation illustrates how changing the
illumination azimuth can bring out subtle features (or artifacts) in the
gridded data. The red arrow points in the direction of the illumination.

.. literalinclude:: ./anim02.sh
   :language: bash

.. only:: html

   .. figure:: ./anim02.*
      :width: 400 px
      :align: center

      DEM光照变化图

.. only:: latex

   由于PDF文件不支持显示动图，具体效果见\ `网页版 <http://gmt5.seisman.info/examples/anim02/anim02.html>`_ 。
