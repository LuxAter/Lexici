#!/usr/bin/python3

import sys
import math


def main():
    k = 20
    if len(sys.argv) > 1:
        k = int(sys.argv[1])
    multiple = 1
    i = 0
    check = True
    limit = math.sqrt(k)
    a = [None]*50
    p = [
        2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67,
        71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139,
        149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223,
        227, 229
    ]
    while p[i] <= k:
        a[i] = 1
        if check:
            if p[i] <= limit:
                a[i] = math.floor(math.log(k) / math.log(p[i]))
            else:
                check = False
        multiple *= math.pow(p[i], a[i])
        i += 1
    print(int(multiple))

if __name__ == "__main__":
    main()
