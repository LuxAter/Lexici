#!/usr/bin/python3
"""Runs programs in sub directories measuring execution times."""

import time
import subprocess
import math
import argparse
import os
import stat

import yaml

import table


def run(program, count, args, view, title=None):
    """Runs provided executable count times provided with args."""
    data = list()
    errored = False
    if isinstance(program, str):
        if title is None:
            title = os.path.splitext(os.path.basename(program))[0].title()
        program = [program]
    if args is None:
        args = list()
    if title is None:
        title = program[0].title()
    print()
    run_count = 0
    for run_count in range(0, count):
        print("\033[F\033[33m[{:{}}/{}] {}...".format(run_count, len(
            str(count)), count, title))
        start = time.time()
        try:
            res = subprocess.run(
                program + args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        except:
            errored = 1
            break
        if res.stderr.decode('utf-8') is not str():
            errored = 2
            break
        end = time.time()
        if view is True:
            print("\033[F\033[{}C{}".format(len(str(count)) * 2 + 20, res.stdout.decode('utf-8')[:-1]))
        data.append(end - start)
    if errored is False:
        run_count += 1
        print("\033[F\033[32m[{:{}}/{}] {}   \033[0m".format(
            run_count, len(str(count)), count, title))
    elif errored == 2:
        print("\033[F\033[31m[{:{}}/{}] {}   \033[0m".format(
            run_count, len(str(count)), count, title))
    elif errored == 1:
        print("\033[F\033[1;31m[{:{}}/{}] {}   \033[0m".format(
            run_count, len(str(count)), count, title))
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


def run_entry(program, count, args, view):
    """Generates dictionary entry relevant to provided arguments"""
    data = dict()
    data["times"] = run(program, count, args, view)
    if len(data["times"]) != 0:
        data["average"] = average(data["times"])
        data["min"] = min(data["times"])
        data["max"] = max(data["times"])
        data["diviation"] = diviation(data["times"], data["average"])
    else:
        data["average"] = 0.0
        data["min"] = 0.0
        data["max"] = 0.0
        data["diviation"] = 0.0
    return data


def order_dict(dictionary):
    res = dict()
    keys = sorted(dictionary.keys())
    for key in keys:
        res[key] = dictionary[key]
    return res


def generate_cmds(args):
    """Scans directory, or reads config for commands to run"""
    cmds = dict()
    executable = stat.S_IEXEC | stat.S_IXGRP | stat.S_IXOTH
    if args.config is None:
        for filename in os.listdir(args.dir):
            if os.path.isfile(os.path.join(
                    args.dir, filename)) and filename != "run.py" and (
                        (args.blacklist is not None and
                         filename.split('.')[0].lower() not in args.blacklist)
                        or args.blacklist is None) and (
                            (args.whitelist is not None and
                             filename.split('.')[0].lower() in args.whitelist)
                            or args.whitelist is None):
                _st = os.stat(os.path.join(args.dir, filename))
                mode = _st.st_mode
                if mode & executable:
                    cmds[filename.split('.')[0].title()] = os.path.join(
                        args.dir, filename)
    else:
        cmds = yaml.load(open(os.path.join(args.dir, args.config)))
        for key, value in cmds.items():
            cmds[key] = value.replace("$CWD",
                                      os.path.join(os.getcwd(), args.dir))
    return order_dict(cmds)


def run_cmds(cmds, args):
    data = dict()
    for key, value in cmds.items():
        ret = run_entry(value, args.runs, args.args, args.view)
        if len(ret["times"]) != 0:
            data[key] = ret
    return data


def prep_args(args):
    if args.dir.startswith('/') is False:
        args.dir = os.path.join(os.getcwd(), args.dir)
    if isinstance(args.blacklist, str):
        args.blacklist = [args.blacklist]
    if args.blacklist is not None:
        for i, item in enumerate(args.blacklist):
            args.blacklist[i] = item.lower()
    if args.sort == "avg":
        args.sort = 1
    elif args.sort == "max":
        args.sort = 3
    elif args.sort == "min":
        args.sort = 2
    elif args.sort == "name":
        args.sort = 0
    elif args.sort == "div":
        args.sort = 4
    return args


def display_time(t):
    sec = math.floor(t)
    t -= sec
    t *= 1000
    milli_sec = math.floor(t)
    t -= milli_sec
    t *= 1000
    micro_sec = math.floor(t)
    t -= micro_sec
    t *= 1000
    nano_sec = math.floor(t)
    return "{:3}s {:3}ms {:3}μs {:3}ns".format(sec, milli_sec, micro_sec, nano_sec)


def display_result(data, sort):
    data_table = list()
    for key, value in data.items():
        entry = [key, value['average'], value['min'],
                 value['max'], value['diviation']]
        data_table.append(entry)
    data_table = sorted(data_table, key=lambda x: x[sort])
    display_table = [[x[0], display_time(x[1]), display_time(
        x[2]), display_time(x[3]), "{:08.3}".format(x[4])] for x in data_table]
    display_table = [["Executable", "Average",
                      "Min", "Max", "Diviation"]] + display_table
    tab = table.Table(display_table, title_row=True, title_column=True)
    tab.zebra = True
    tab.set_column_alignment(0, table.Cell.Align.LEFT)
    tab.display()


def display_data(data, sort, file):
    data_table = list()
    for key, value in data.items():
        entry = [key, value['average'], value['min'],
                 value['max'], value['diviation']]
        data_table.append(entry)
    data_table = sorted(data_table, key=lambda x: x[sort])
    data_list = [[x[0], x[1], x[2], x[3], x[4]] for x in data_table]
    data_list = [["Executable", "Average",
                  "Min", "Max", "Diviation"]] + data_list
    with open(file, 'w') as f:
        for row in data_list:
            for i, item in enumerate(row):
                f.write(str(item))
                if i != len(row) - 1:
                    f.write(', ')
            f.write('\n')


def main():
    """Main function"""
    parser = argparse.ArgumentParser(
        description="Runs executables in directory, providing time compairisions.")
    parser.add_argument(
        "dir",
        metavar="DIR",
        type=str,
        nargs='?',
        default=os.getcwd(),
        help="Directory to run executables from")
    parser.add_argument(
        "--sort",
        type=str,
        nargs='?',
        default='avg',
        help="Sorts result data",
        choices=["avg", "max", "min", "name", "div"])
    parser.add_argument(
        "-c",
        "--config",
        metavar="CONFIG",
        type=str,
        nargs='?',
        default=None,
        help="Config yaml, for configuring tests")
    parser.add_argument(
        "-r",
        "--runs",
        type=int,
        nargs='?',
        default=5,
        help="Runs each program this many times")
    parser.add_argument(
        "-a",
        "--args",
        metavar="ARGS",
        type=str,
        nargs='*',
        default=list(),
        help="Pass additional argumentes to each program")
    parser.add_argument(
        "--blacklist",
        type=str,
        nargs='*',
        default=None,
        help="Prevent specified executables from running")
    parser.add_argument(
        "--whitelist",
        type=str,
        nargs='*',
        default=None,
        help="Prevent specified executables from running")
    parser.add_argument(
        "--fileout",
        default=False,
        type=str,
        help="Creates csv output format")
    parser.add_argument(
        "--view",
        action="store_true",
        help="View output of executables")
    args = prep_args(parser.parse_args())
    data = run_cmds(generate_cmds(args), args)
    if args.fileout == False:
        display_result(data, args.sort)
    else:
        display_data(data, args.sort, args.fileout)
    #  print(generate_cmds(args))
    #  print(args)


if __name__ == "__main__":
    main()
