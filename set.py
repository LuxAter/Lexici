#!/usr/bin/python3

import sys
import subprocess


def main():
    lower = int(sys.argv[1])
    upper = int(sys.argv[2])
    step = int(sys.argv[3])
    runs = 100
    d = "p1"
    if len(sys.argv) > 4:
        runs = int(sys.argv[4])
    if len(sys.argv) > 5:
        d = sys.argv[5]
    if len(sys.argv) > 6:
        lower = int(sys.argv[6]) - lower
        upper = int(sys.argv[6]) + upper
    index = lower
    while index <= upper:
        print("RUN: {}".format(index))
        subprocess.run(["./run.py", d, "--sort", "name", "--args", str(index),
                        "--runs", str(runs), "--fileout", "data/" + d + "_" + str(index) + ".csv"])
        index += step


if __name__ == "__main__":
    main()
