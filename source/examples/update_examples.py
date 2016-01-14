#!/usr/bin/env python
# -*- coding: utf8 -*-

import os
import glob

flag = 0
for dir in glob.glob("ex*"):
    print(dir)
    os.chdir(dir)
    script = dir + ".sh"
    ps = dir + ".ps"
    png = dir + ".png"
    pdf = dir + ".pdf"
    if not (os.path.exists(png) and os.path.exists(pdf)):
        flag = 1
    else:
        script_time = os.path.getmtime(script)
        png_time = os.path.getmtime(png)
        pdf_time = os.path.getmtime(pdf)
        if (script_time>png_time or script_time>pdf_time):
            flag = 1

    if flag == 1:
        os.system("bash " + script)
        os.system("gmt psconvert -A -P -Tg " + ps)
        os.system("gmt psconvert -A -P -Tf " + ps)
        for file in glob.glob("*.ps"):
            os.unlink(file)

    os.chdir("..")
