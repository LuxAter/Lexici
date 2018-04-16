#!/usr/bin/python3

import sys
import math

def main():
    limit = 2000000
    if len(sys.argv) > 1:
        limit = int(sys.argv[1])
    cross_limit = math.floor(math.sqrt(limit))
    sieve = [False] * limit
    for n in range(4, limit, 2):
        sieve[n] = True
    for n in range(3, cross_limit + 1, 2):
        if not sieve[n]:
            for m in range(n*n, limit, 2*n):
                sieve[m] = True
    sum = 0
    for n in range(2, limit):
        if not sieve[n]:
            sum += n
    print(int(sum))

if __name__ == "__main__":
    main()
