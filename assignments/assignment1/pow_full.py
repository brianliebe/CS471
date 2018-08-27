#!/usr/bin/env python
import sys

def powI(base, power):
  total = 1
  if base:
    for p in range(power):
      total = total * base
  return total

def powF(base, power):
  if power == 0:
    return 1
  else:
    if power == 1:
      return base
    else:
      return base * powF(base, power - 1);


argv_power = int(sys.argv[2])
argv_base = int(sys.argv[1])
print(powI(argv_base, argv_power))
print(powF(argv_base, argv_power))
