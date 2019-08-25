#!/usr/bin/python

import sys
from netaddr import IPNetwork

for ip in IPNetwork(sys.argv[1]):
    print '%s' % ip
