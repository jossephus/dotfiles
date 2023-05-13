#!/usr/bin/python3
"""
On Linux [[and others?]]

when it sorts files that start with numbers
the number 10 comes before 2 and 3 and 4 and 5...
which is really disappointing when u ls files and see this
    1. a
    10. d
    11. e
    12. f
    2. b
    3. c
FIX: renaming filenames that start with numbers less than 10
from 1-9 to 01-09 solves this problem
"""
import os
import re

for f in os.listdir("."):
    reg = re.match("\d+", f)
    if reg:

        matched = f[reg.start(): reg.end()]

        # check if filename starts with 1...10 not 01..09
        if int(matched) < 10 and len(matched) < 2:
            os.rename(f, "0" + f)
