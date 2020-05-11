#!/usr/bin/python3

import sys

def SumDivisible(n, m):
    p = m // n;
    return n * (p * (p + 1)) // 2

def main():
    m = 999
    if len(sys.argv) > 1:
        m = int(sys.argv[1])
    s = SumDivisible(3, m) + SumDivisible(5, m) - SumDivisible(15, m)
    print(s)

if __name__ == "__main__":
    main()
