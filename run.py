#!/usr/bin/python3
import argparse
import glob
import os
import time
import subprocess
import sys
import json
from pprint import pprint
from enum import Enum

from display import *

language_colors = dict()


class Capture(Enum):
    TIME = 0
    LOC = 1


def display_name(name):
    names = {
        'cpp': 'C++',
        'python3': 'Python',
        'javascript': 'JavaScript',
        'csharp': 'C#',
        'fsharp': 'F#'
    }
    if name in names:
        return names[name].title()
    return name.title()


def display_color(lang):
    global language_colors
    if language_colors == dict():
        tmp = json.load(open('languages.json', 'r'))
        for key, value in tmp.items():
            language_colors[key] = value['color']
    if lang in language_colors:
        return language_colors[lang]
    return 'ffffff'


def title(string, color, size=40):
    print("\033[{};1m{}\n{:^{}}\n{}\033[0m".format(color, '=' * size, string,
                                                   size, '=' * size))


def subtitle(string, color, size=40):
    print("\033[{};1;4m{:^{}}\033[0m".format(color, string, size))


def par(string, size=40):
    print("\033[1;4m{:^{}}\033[0m".format(string, size))


def get_exes(names):
    files = glob.glob('*/{}.*'.format(names))
    exes = []
    for file in files:
        if os.path.isfile(os.path.join(os.getcwd(), file)) and os.access(
                os.path.join(os.getcwd(), file), os.X_OK):
            exes.append(file)
    return exes, files


def run_exe(exe, reps, longest=0):
    avg = 0
    spacing = longest - 8 - (2 * len(str(reps)))
    min_t = 1e20
    max_t = 0
    print("\033[33m[ ] {:{}} [0/{}]\033[0m".format(exe, spacing, reps), end='')
    sys.stdout.flush()
    for i in range(reps):
        print(
            "\033[G\033[33m[ ] {:{}} [{}/{}]\033[0m".format(
                exe, spacing, i, reps),
            end='')
        sys.stdout.flush()
        start = time.time()
        result = subprocess.run(
            [exe], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
        end = time.time()
        diff = end - start
        max_t = max(max_t, diff)
        min_t = min(min_t, diff)
        avg += diff
    print("\033[G\033[32m[] {:{}} [{}/{}]\033[0m".format(
        exe, spacing, reps, reps))
    return min_t, (avg / reps), max_t


def run(exes, files, reps, capture=[Capture.TIME, Capture.LOC]):
    length = max(len(max(exes, key=len)) + 6 + (2 * len(str(reps))), 40)
    subtitle('Collecting Data', 35, length)
    data = {}
    for exe in exes:
        language = os.path.dirname(exe)
        data[language] = dict()
        data[language]['name'] = display_name(language)
        data[language]['color'] = display_color(data[language]['name'])
        if Capture.TIME in capture:
            min_t, avg_t, max_t = run_exe(exe, reps, length)
            data[language]['time'] = dict()
            data[language]['time']['min'] = min_t
            data[language]['time']['avg'] = avg_t
            data[language]['time']['max'] = max_t
        if Capture.LOC in capture:
            data[language]['size'] = dict()
            if exe.endswith('.a') or exe.endswith('.exe'):
                matching = [s for s in files if exe[:-2] in s]
                for match in matching:
                    if not match.endswith('.a') and not match.endswith('.exe'):
                        file = match
            else:
                file = exe
            data[language]['size']['bytes'] = os.path.getsize(file)
            lines = 0
            with open(file, 'r') as f:
                lines = len(f.readlines())
            data[language]['size']['lines'] = lines
        if Capture.LOC in capture and Capture.TIME in capture:
            data[language]['eff'] = 1 / (
                data[language]['size']['bytes'] * data[language]['time']['avg']
            )
    return data


def display(data, args):
    subtitle('Results', 35)
    if 'avg' in args.graph:
        par('Average Time')
        display_graph(format_graph_data(data, 'time.avg'))
    if 'min' in args.graph:
        par('Minimum Time')
        display_graph(format_graph_data(data, 'time.min'))
    if 'max' in args.graph:
        par('Maximum Time')
        display_graph(format_graph_data(data, 'time.max'))
    if 'eff' in args.graph:
        par("Efficiency")
        display_graph(format_graph_data(data, 'eff'), 2, 80, 20)
    if 'bytes' in args.graph:
        par('Bytes')
        display_graph(format_graph_data(data, 'size.bytes'))
    if 'lines' in args.graph:
        par('Lines')
        display_graph(format_graph_data(data, 'size.lines'))
    table_data = args.table
    for i, value in enumerate(table_data):
        if value == 'avg':
            table_data[i] = 'time.avg'
        elif value == 'min':
            table_data[i] = 'time.min'
        elif value == 'max':
            table_data[i] = 'time.max'
        elif value == 'bytes':
            table_data[i] = 'size.bytes'
        elif value == 'lines':
            table_data[i] = 'size.lines'
    display_table(format_table_data(data, table_data))


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        'exe', type=str, help='executable name to run in each directory.')
    parser.add_argument(
        '-r',
        '--reps',
        type=int,
        default=5,
        help='number of times to run each executable.')
    parser.add_argument(
        '--args', nargs='*', help='arguments to pass to the executables.')

    parser.add_argument(
        '-c', '--color', action='store_true', help='enables color in output.')
    parser.add_argument(
        '-g',
        '--graph',
        default=['eff'],
        nargs='*',
        help='data sets to graph',
        choices={'min', 'max', 'avg', 'eff', 'bytes', 'lines'})
    parser.add_argument(
        '-t',
        '--table',
        default=['color', 'name', 'avg', 'bytes', 'eff'],
        nargs='*',
        help='data sets to place in table',
        choices={
            'color', 'name', 'min', 'max', 'avg', 'eff', 'bytes', 'lines'
        })
    args = parser.parse_args()
    title('RUNNING', 35)
    exes, files = get_exes(args.exe)
    data = run(exes, files, args.reps)
    display(data, args)


if __name__ == "__main__":
    main()
