.. _anim01:

正弦函数动态图
--------------

We wish to plot the sine
function from 0-360 and take snap shots every 20. To get a smooth curve
we must sample the function much more frequently; we settle on 10 times
more frequently than the frame spacing. We place a bright red circle at
the leading edge of the curve, and as we move forward in time (here,
angles) we dim the older circles to a dark red color. We add a label
that indicates the current angle value. Once the 18 frames are completed
we convert them to a single animated GIF file.

.. literalinclude:: ./anim01.sh
   :language: bash

.. only:: html

   .. figure:: ./anim01.*
      :width: 400 px
      :align: center

      Animation of a simple sine function.

.. only:: latex

   由于PDF文件不支持显示动图，具体效果见\ `网页版 <http://gmt5.seisman.info/examples/anim01/anim01.html>`_ 。
