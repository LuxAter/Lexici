#!/usr/bin/python3
"""Runs programs in sub directories measuring execution times."""

import time
import subprocess
import math
import argparse
import os
import stat
import yaml


import pprint


def run(program, count, args):
    """Runs provided executable count times provided with args."""
    data = list()
    if isinstance(program, str):
        if program[0] != '.':
            program = ['./' + program]
        else:
            program = [program]
    if args is None:
        args = list()
    print()
    for run_count in range(0, count):
        print("\033[F\033[33m[{:{}}/{}] {}...".format(run_count,
                                                      len(str(count)), count, program))
        start = time.time()
        subprocess.run(program + args, stdout=subprocess.PIPE)
        end = time.time()
        data.append(end - start)
    print("\033[F\033[32m[{}/{}] {}...\033[0m\n".format(count, count, program))
    return data


def average(times):
    """Calculates average time"""
    avg = float(0)
    for _t in times:
        avg += _t
    avg /= len(times)
    return avg


def diviation(times, avg):
    """Calculates standard diviation of times"""
    tot = float()
    for _t in times:
        tot = pow(_t - avg, 2)
    tot /= (len(times) - 1)
    return math.sqrt(tot)


def run_entry(program, count, args):
    """Generates dictionary entry relevant to provided arguments"""
    data = dict()
    data["times"] = run(program, count, args)
    data["average"] = average(data["times"])
    data["min"] = min(data["times"])
    data["max"] = max(data["times"])
    data["diviation"] = diviation(data["times"], data["average"])
    return data


def generate_cmds(args):
    """Scans directory, or reads config for commands to run"""
    cmds = dict()
    executable = stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH
    if args.config is None:
        for filename in os.listdir(args.dir):
            if os.path.isfile(os.path.join(args.dir, filename)) and filename != "run.py":
                _st = os.stat(os.path.join(args.dir, filename))
                mode = _st.st_mode
                if mode & executable:
                    cmds[filename.split('.')[0].title()] = os.path.join(
                        args.dir, filename)
    else:
        cmds = yaml.load(open(os.path.join(args.dir, args.config)))
        for key, value in cmds.items():
            cmds[key] = value.replace(
                "$CWD", os.path.join(os.getcwd(), args.dir))
    return cmds


def run_cmds(cmds, args):
    data = dict()
    for key, value in cmds.items():
        data[key] = run_entry(value, args.runs, args.args)


def main():
    """Main function"""
    parser = argparse.ArgumentParser(
        description="Runs executables in directory, providing time compairisions.")
    parser.add_argument("dir", metavar="DIR", type=str, nargs='?',
                        default=os.getcwd(), help="Directory to run executables from")
    parser.add_argument("--sort", type=str, nargs='?', default='avg',
                        help="Sorts result data", choices=["avg", "max", "min", "name", "div"])
    parser.add_argument("-c", "--config", metavar="CONFIG", type=str, nargs='?',
                        default=None, help="Config yaml, for configuring tests")
    parser.add_argument("-r", "--runs", type=int, nargs='?',
                        default=5, help="Runs each program this many times")
    parser.add_argument("-a", "--args", metavar="ARGS", type=str,
                        nargs='*', help="Pass additional argumentes to each program")
    args = parser.parse_args()
    if args.dir.startswith('/') is False:
        args.dir = os.path.join(os.getcwd(), args.dir)
    print(generate_cmds(args))
    print(args)


if __name__ == "__main__":
    main()
