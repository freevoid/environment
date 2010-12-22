#!/usr/bin/env python

import os
import sys
import datetime

def main():
    try:
        days = int(sys.argv[1])
    except:
        days = 0
    now = datetime.datetime.now()
    delta = datetime.timedelta(days=days)
    sys.stdout.write((now + delta).ctime())
    sys.stdout.write('\n')
    sys.exit(0)

if __name__=='__main__':
    main()
