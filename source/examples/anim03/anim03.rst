.. _anim03:

(3) Orbiting a static map
-------------------------

Our third animation keeps a fixed gridded data set but moves the camera
angle around the full 360. We use
:doc:`grdview </grdview>` to generate a shaded-relief
image sequence using the new enhanced **-E** option. No additional
information is plotted on the image. As before we produce an animated
GIF image and a simple HTML wrapper for it.

.. literalinclude:: ./anim03.sh
   :language: bash

.. only:: html

   .. figure:: ./anim03.gif
      :width: 400 px
      :align: center

      Orbiting a static map.

.. only:: latex

   .. figure:: ./anim03.png
      :width: 400 px
      :align: center

      Orbiting a static map.
