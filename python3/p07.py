#!/usr/bin/python3

import sys
import math


def is_prime(n):
    if n == 1:
        return False
    elif n < 4:
        return True
    elif n % 2 == 0:
        return False
    elif n < 9:
        return True
    elif n % 3 == 0:
        return False
    else:
        r = math.floor(math.sqrt(n))
        f = 5
        while f <= r:
            if n % f == 0:
                return False
            elif n % (f + 2) == 0:
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
        if is_prime(val):
            count += 1
    print(int(val))


if __name__ == "__main__":
    main()
