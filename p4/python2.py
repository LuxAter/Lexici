#!/usr/bin/python2

import math
import sys

def ReverseInteger(val):
    reversed = 0
    while val > 0:
        reversed = (10 * reversed) + (val % 10)
        val /= 10
    return reversed


def IsPalindrome(n):
    return n == ReverseInteger(n)


def main():
    count = 3
    if len(sys.argv) > 1:
        count = int(sys.argv[1])
    tmp = count
    max = 0
    while tmp > 0:
        max = (max * 10) + 9
        tmp -= 1
    a = max
    largest = 0
    while a >= (10 * count):
        b = 0
        db = 0
        if a % 11 == 0:
            b = max
            db = 1
        else:
            b = 11 * math.floor(max / 11)
            db = 11
        while b >= a:
            if a * b <= largest:
                break
            elif IsPalindrome(a * b):
                largest = a * b
            b -= db
        a -= 1
    print "Largest palindrome multiples of %d digits: %d" % (count, largest)


if __name__ == "__main__":
    main()
