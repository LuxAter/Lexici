#!/usr/bin/python2

import sys
import math

def main():
    n = 600851475143
    m = n
    if len(sys.argv) > 1:
        n = int(sys.argv[1])
        m = n
    last_factor = 1
    if n % 2 == 0:
        last_factor = 2
        n /= 2
        while n % 2 == 0:
            n /= 2
    factor = 3
    max_factor = math.sqrt(n)
    while n > 1 and factor <= max_factor:
        if n % factor == 0:
            n /= factor
            last_factor = factor
            while n % factor == 0:
                n /= factor
            max_factor = math.sqrt(n)
        factor += 2
    if n != 1:
        last_factor = n
    print("The greatest prime factor of {}: {}".format(m, last_factor))


if __name__ == "__main__":
    main()
