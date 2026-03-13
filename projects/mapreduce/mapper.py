#!/usr/bin/env python3
import sys

for line in sys.stdin:
    line = line.strip()
    parts = line.split(",")

    if parts[0] != "CustomerID":
        print(parts[0] + "\t" + parts[2])


