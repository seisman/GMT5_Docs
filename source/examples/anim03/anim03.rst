.. _anim03:

Orbiting a static map
----------------------

Our third animation keeps a fixed gridded data set but moves the camera
angle around the full 360. We use
:doc:`grdview </grdview>` to generate a shaded-relief
image sequence using the new enhanced **-E** option. No additional
information is plotted on the image. As before we produce an animated
GIF image.

.. literalinclude:: ./anim03.sh
   :language: bash


.. only:: html

   .. figure:: ./anim03.*
      :width: 400 px
      :align: center

      Orbiting a static map.

.. only:: latex

   由于PDF文件不支持显示动图，具体效果见\ `网页版 <http://gmt5.seisman.info/examples/anim03/anim03.html>`_ 。
