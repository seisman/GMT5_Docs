#!/usr/bin/env python
# -*- coding: utf8 -*-

import os
import glob

for dir in os.listdir():
    if os.path.isdir(dir):
        print(dir)
        script = dir + ".sh"
        ps = dir + ".ps"
        png = dir + ".png"

        os.chdir(dir)
        if not os.path.exists(png):
            os.system("bash " + script)
            os.system("gmt psconvert -A -P -Tg " + ps)
            for file in glob.glob("*.ps"):
                os.unlink(file)
        else:
            script_time = os.path.getmtime(script)
            png_time = os.path.getmtime(png)
            if script_time > png_time:
                os.system("bash " + script)
                os.system("gmt psconvert -A -P -Tg -E100 " + ps)
                for file in glob.glob("*.ps"):
                    os.unlink(file)
        os.chdir("..")

