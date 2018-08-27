#!/usr/bin/env python
import sys

def ack (m, n):
  if m == 0:
    return n - 1
  if n == 0 and m > 0:
    return ack(m - 1, 1)
  return ack(m - 1, ack(m, n -1))

second = int(sys.argv[2])
first = int(sys.argv[1])
print(ack(first, second))
