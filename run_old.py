#!/usr/bin/python3

import sys
import glob
import subprocess
import time
import argparse
import os
import stat
from table import Table
from math import floor
from pprint import pprint
import numpy as np


def run(programs, runs, args):
    print("\n")
    data = dict()
    for pg in programs:
        for x in range(0, runs):
            print("\033[F\033[33m[{:{}}/{}] {}...".format(
                x, len(str(runs)), runs, pg))
            start = time.time()
            if args is None:
                args = list()
            subprocess.run(['./' + pg] + args, stdout=subprocess.PIPE)
            end = time.time()
            language = pg.split('.')[0].title()
            if language not in data:
                data[language] = [end - start]
            else:
                data[language].append(end - start)
        print("\033[F\033[32m[{}/{}] {}...\n".format(runs, runs, pg))
    print("\033[0m", end='')
    return data


def average(data):
    for key, value in data.items():
        avg = float(0)
        long = float(0)
        div = float(0)
        short = float('inf')
        for t in value:
            avg += t
            long = max(t, long)
            short = min(t, short)
        avg /= len(value)
        #  for t in value:
            #  div = pow(t - avg, 2.0)
        #  div /= len(value) - 1
        #  div = np.sqrt(div)
        data[key].insert(0, long)
        data[key].insert(0, short)
        data[key].insert(0, avg)
        data[key].insert(0, div)
    print(data)


def get_duration(t):
    sec = floor(t)
    t -= sec
    t *= 1000
    milli_sec = floor(t)
    t -= milli_sec
    t *= 1000
    micro_sec = floor(t)
    t -= micro_sec
    t *= 1000
    nano_sec = floor(t)
    return "{:3}s {:3}ms {:3}μs {:3}ns".format(sec, milli_sec, micro_sec,
                                               nano_sec)


#  return "{:03}s {:03}ms {:03}μs {:03}ns".format(sec, milli_sec, micro_sec, nano_sec)


def print_table(table, has_title=False, colors=list(), col=None):
    if col is not None:
        lengths = [0] * col
    else:
        lengths = [0] * len(table[0])
    while len(colors) < len(lengths):
        colors.append("")
    for i, color in enumerate(colors):
        if type(color) is int:
            colors[i] = "\033[{}m".format(color)
    for row in table:
        for i in range(0, len(lengths)):
            if type(row[i]) is not str:
                lengths[i] = max(len(str(row[i]) + 2, lengths[i]))
            else:
                lengths[i] = max(len(row[i]) + 2, lengths[i])
    if has_title is True:
        titles = table[0]
        table = table[1:]
        print("\u250f", end='')
        for length in lengths[:-1]:
            print("\u2501" * length, end='')
            print("\u2533", end='')
        print("\u2501" * lengths[-1], end='')
        print("\u2513")
        print("\u2503", end='')
        for i, ent in enumerate(titles):
            print(" {:{width}}".format(ent, width=lengths[i] - 1), end='')
            print("\u2503", end='')
        print("")
        print("\u2521", end='')
        for length in lengths[:-1]:
            print("\u2501" * length, end='')
            print("\u2547", end='')
        print("\u2501" * lengths[-1], end='')
        print("\u2529")

    else:
        print("\u250c", end='')
        for length in lengths[:-1]:
            print("\u2500" * length, end='')
            print("\u252c", end='')
        print("\u2500" * lengths[-1], end='')
        print("\u2510")
    for entry in table:
        print("\u2502", end='')
        for i in range(0, len(lengths)):
            print(
                "{} {:{width}}\033[0m".format(
                    colors[i], entry[i], width=lengths[i] - 1),
                end='')
            print("\u2502", end='')
        print("")
    print("\u2514", end='')
    for length in lengths[:-1]:
        print("\u2500" * length, end='')
        print("\u2534", end='')
    print("\u2500" * lengths[-1], end='')
    print("\u2518")


def print_result(data):
    table = list()
    for key, value in data.items():
        table.append([
            key,
            get_duration(value[0]),
            get_duration(value[1]),
            get_duration(value[2]),
            "{:3.3f}".format(value[3]), value[0], value[1], value[2], value[3]
        ])
    table = sorted(table, key=lambda x: x[0])
    print(table)
    table = sorted(table, key=lambda x: x[4])
    display_table = [x[:5] for x in table]
    #  print_table(
        #  [["Executable", "Average", "Best", "Worst"]] + table,
        #  has_title=True,
        #  colors=[1, 39, 32, 31])
    summary = [["Best"] + table[0], ["Worst"] + table[-1]]
    #  print_table(summary, colors=[1, 1, 39, 32, 31], col=5)
    display_table = [["Executable", "Average", "Best", "Worst", "Diviation"]] + display_table
    tab = Table(display_table, title_row=True, title_column=True)
    tab.title_bold= True
    tab.zebra=True
    tab.display()


def in_list(exe, li):
    for el in li:
        if exe.split('.')[0].lower() == el.split('.')[0].lower():
            return exe
    return None


def main():
    parser = argparse.ArgumentParser(
        description=
        "Runs speed tests, of all executable applications in the directory")
    parser.add_argument(
        "-i",
        type=int,
        default=5,
        help="The number of times to run each executable")
    parser.add_argument(
        "--args",
        type=str,
        nargs='+',
        help="Additional arguments to pass to each executable")
    parser.add_argument(
        "--list",
        action="store_true",
        help="List all of the executables that will be run implemented")
    parser.add_argument(
        "--whitelist",
        type=str,
        nargs='+',
        help="Run only selected applications")
    parser.add_argument(
        "--blacklist",
        type=str,
        nargs='+',
        help="Dont run selected applications")
    args = parser.parse_args()
    programs = list()
    executable = stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH
    for filename in os.listdir('.'):
        if os.path.isfile(filename) and filename != "run.py":
            st = os.stat(filename)
            mode = st.st_mode
            if mode & executable:
                programs.append(filename)
    programs.sort()

    if args.blacklist is not None:
        for pg in programs[:]:
            if in_list(pg, args.blacklist) is not None:
                programs.remove(pg)
    if args.whitelist is not None:
        for pg in programs[:]:
            if in_list(pg, args.whitelist) is None:
                programs.remove(pg)

    if args.list is True:
        for pg in programs:
            print(" \u2022", pg.split('.')[0].title())
    else:
        data = run(programs, args.i, args.args)
        average(data)
        print_result(data)


if __name__ == "__main__":
    main()
