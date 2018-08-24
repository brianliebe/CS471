#!/usr/bin/env python
import sys

def powI(pow, base):
  acc = 1
  for p in range(pow):
    acc = acc * base
  return acc

def powF(pow, base):
  acc = 1

print(powI(sys.argv[1], sys.argv[2]));
print(powF(sys.argv[1], sys.argv[2]));
