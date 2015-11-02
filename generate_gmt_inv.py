#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#
# Python Script to generate inventory file for GMT official documentation
#
# Reference = """ http://pvbookmarks.readthedocs.org/en/master/devel/documentation/doc_generators/sphinx/rest_sphinx/hyperlinks.html """
#

import zlib
inventory_header = '''\
# Sphinx inventory version 2
# Project: GMT
# Version: 5.1.2
# The remainder of this file is compressed with zlib.
'''.encode('utf-8')

modules = ['pscoast', 'gmt', 'gmtget', 'gmtset', 'gmtdefaults', 'gmtlogo',
           'gmt5syntax', 'isogmt', 'psbasemap', 'pscoast', 'grdpaste',
           'grdcut', 'pstext', 'ps2raster', 'grdraster', 'grdedit', 'psclip',
           'psxy', 'kml2gmt', 'gmtinfo', 'grd2xyz'
           ]

inventory_payload = ''.join(['{0} std:label -1 {0}.html {0}\n'.format(i) for i in modules]).encode('utf-8')

#inventory_payload = '''\
#pscoast std:label -1 pscoast.html pscoast
#psxy std:label -1 psxy.html psxy
#gmt std:label -1 gmt.html gmt
#'''.encode('utf-8')
#print(inventory_payload)

# inventory_payload lines spec:
#   name domainname:type priority uri dispname
#
# * `name`     -- fully qualified name
# * `dispname` -- name to display when searching/linking
# * `type`     -- object type, a key in ``self.object_types``
# * `docname`  -- the document where it is to be found
# * `anchor`   -- the anchor name for the object
# * `priority` -- how "important" the object is
#                       (determines placement in search results)
#
#   - 1: default priority (placed before full-text matches)
#   - 0: object is important (placed before default-priority objects)
#   - 2: object is unimportant (placed after full-text matches)
#   - -1: object should not show up in search at all
#

inventory = inventory_header + zlib.compress(inventory_payload)
open('source/gmt.inv', 'wb').write(inventory)
