#!/usr/bin/python3

import sys
import math

def main():
    limit = 100
    if len(sys.argv) > 1:
        limit = int(sys.argv[1])
    sum = limit * (limit + 1) // 2
    sum_sq = (2 * limit + 1) * (limit + 1) * limit // 6
    diff = math.pow(sum, 2) - sum_sq
    print(int(diff))

if __name__ == "__main__":
    main()
