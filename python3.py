#!/usr/bin/python3

import sys
from math import sqrt, floor

def is_prime(p):
    if p == 1:
        return False
    elif p < 4:
        return True
    elif p % 2 == 0:
        return False
    elif p < 9:
        return True
    elif p % 3 == 0:
        return False
    else:
        r = floor(sqrt(p))
        f = 5
        while f <= r:
            if p % f == 0 or p % (f+2) == 0:
                return False
            f += 6
    return True

def main():
    limit = 10001
    if len(sys.argv) > 1:
        limit = int(sys.argv[1])
    count = 1
    val = 1
    while count < limit:
        val += 2
        if is_prime(val) is True:
            count += 1
    print("{}'th Prime: {}".format(limit, val))


if __name__ == "__main__":
    main()
