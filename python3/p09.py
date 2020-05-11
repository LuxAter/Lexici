#!/usr/bin/python3

import sys
import math

def main():
    sum = 1000
    if len(sys.argv) > 1:
        sum = int(sys.argv[1])
    prod = 0
    for a in range(3, (sum - 3) // 3):
        for b in range(a + 1, (sum - 1 - a) // 2):
            c = sum - a - b
            if c * c == a * a + b * b:
                prod = a * b * c
                break
        else:
            continue
        break
    print(int(prod))


if __name__ == "__main__":
    main()
