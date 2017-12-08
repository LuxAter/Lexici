#!/usr/bin/python2

import math
import sys

def SumDivisible(n, m):
    p = math.floor(m / n);
    return math.floor(n * (p * (p + 1)) / 2)

def main():
    m = 999
    if len(sys.argv) > 1:
        m = int(sys.argv[1])
    s = SumDivisible(3, m) + SumDivisible(5, m) - SumDivisible(15, m)
    print "Sum of the multiples of 3 & 5 less than %d: %d" % (m + 1, s)

if __name__ == "__main__":
    main()
