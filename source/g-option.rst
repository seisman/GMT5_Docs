``-g`` 选项
===========

GMT has several mechanisms that can determine line
segmentation. Typically, data segments are separated by multiple segment
header records. However, if key data columns contain a
NaN we may also use that information to break lines into multiple
segments. This behavior is modified by the parameter
**IO_NAN_RECORDS** which by default is set to *skip*, meaning such
records are considered bad and simply skipped. If you wish such records
to indicate a segment boundary then set this parameter to *pass*.
Finally, you may wish to indicate gaps based on the data values
themselves. The **-g** option is used to detect gaps based on one or
more criteria (use **-g+** if *all* the criteria must be met; otherwise
only one of the specified criteria needs to be met to signify a data
gap). Gaps can be based on excessive jumps in the *x*- or
*y*-coordinates (**-gx** or **-gy**), or on the distance between points
(**-gd**). Append the *gap* distance and optionally a unit for actual
distances. For geographic data the optional unit may be arc
**d**\ egree, **m**\ inute, and **s**\ econd, or m\ **e**\ ter
[Default], **f**\ eet, **k**\ ilometer, **M**\ iles, or **n**\ autical
miles. For programs that map data to map coordinates you can optionally
specify these criteria to apply to the projected coordinates (by using
upper-case **-gX**, **-gY** or **-gD**). In that case, choose from
**c**\ entimeter, **i**\ nch or **p**\ oint [Default unit is controlled
by **PROJ_LENGTH_UNIT**]. Note: For **-gx** or **-gy** with time data
the unit is instead controlled by :ref:`TIME_UNIT <TIME_UNIT>`.
