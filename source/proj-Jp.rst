-Jp：Linear projection with polar coordinates
=============================================

.. _GMT_polar:

.. figure:: /images/GMT_polar.*
   :width: 400 px
   :align: center

   Polar (Cylindrical) transformation of (:math:`\theta, r`) coordinates.


This transformation converts polar coordinates (angle :math:`\theta` and
radius *r*) to positions on a plot. Now :math:`x' = f(\theta,r)`
and :math:`y' = g(\theta,r)`, hence it is similar to a regular map
projection because *x* and *y* are coupled and *x*
(i.e., :math:`\theta`) has a 360º periodicity. With input and output
points both in the plane it is a **two-dimensional** projection. The
transformation comes in two flavors:

#. Normally, :math:`\theta` is understood to be directions
   counter-clockwise from the horizontal axis, but we may choose to
   specify an angular offset [whose default value is zero]. We will call
   this offset :math:`\theta_0`. Then,
   :math:`x' = f(\theta, r) = ar \cos (\theta-\theta_0) + b` and
   :math:`y' = g(\theta, r) = ar \sin (\theta-\theta_0) + c`.

#. Alternatively, :math:`\theta` can be interpreted to be azimuths
   clockwise from the vertical axis, yet we may again choose to specify
   the angular offset [whose default value is zero]. Then,
   :math:`x' = f(\theta, r) = ar \cos (90 - (\theta-\theta_0)) + b` and
   :math:`y' = g(\theta, r) = ar \sin (90 - (\theta-\theta_0)) + c`.

Consequently, the polar transformation is defined by providing

-  scale in inches/unit (**-Jp**) or full width of plot in inches (**-JP**)

-  Optionally, insert **a** after **p\ \| \ P** to indicate CW
   azimuths rather than CCW directions

-  Optionally, append /\ *origin* in degrees to indicate an angular offset [0]

-  Optionally, append **r** to reverse the radial direction (here,
   *south* and *north* must be elevations in 0--90 range).

-  Optionally, append **z** to annotate depths rather than radius.

As an example of this projection we will create a gridded data set in
polar coordinates :math:`z(\theta, r) = r^2 \cdot \cos{4\theta}` using
:doc:`grdmath`, a RPN calculator that
operates on or creates grid files.

   ::

    gmt grdmath -R0/360/2/4 -I6/0.1 X 4 MUL PI MUL 180 DIV COS Y 2 POW MUL = tt.nc
    gmt grdcontour tt.nc -JP3i -B30 -BNs+ghoneydew -P -C2 -S4 --FORMAT_GEO_MAP=+ddd > GMT_polar.ps

We used :doc:`grdcontour` to make a
contour map of this data. Because the data file only contains values
with :math:`2 \leq r \leq 4`, a donut shaped plot appears in
Figure :ref:`Polar transformation <GMT_polar>`.
