#!/usr/bin/python3

import sys

def main():
    limit = 4000000
    sum = 0
    a = 1
    b = 1
    c = 2
    if len(sys.argv) > 1:
        limit = int(sys.argv[1])
    while c < limit:
        sum += c
        a = b + c
        b = c + a
        c = a + b
    print("Sum of even fibonacci numbers less than {}: {}".format(limit, sum))

if __name__ == "__main__":
    main()
