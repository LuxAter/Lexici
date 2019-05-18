#!/usr/bin/python3
import argparse
import glob
import os
import time
import subprocess
import sys
import json
import re
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
        'fsharp': 'F#',
        'lisp': 'Common Lisp',
        'ocaml': 'OCaml'
    }
    if name in names:
        return names[name]
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


def get_exes(names, black_list=[]):
    files = glob.glob('*/{}.*'.format(names))
    exes = []
    black = re.compile('|'.join(['(' + f + ')' for f in black_list]))
    for file in files:
        if os.path.isfile(os.path.join(os.getcwd(), file)) and os.access(
                os.path.join(os.getcwd(), file), os.X_OK):
            if black_list != [] and not black.match(file):
                exes.append(file)
            elif black_list == []:
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

def not_ends_with(match, ends):
    for end in ends:
        if match.endswith(end):
            return False
    return True


def run(exes, files, reps, capture=[Capture.TIME, Capture.LOC]):
    length = max(len(max(exes, key=len)) + 6 + (2 * len(str(reps))), 40)
    subtitle('Collecting Data', 35, length)
    data = {}
    exes = sorted(exes)
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
            data[language]['time']['inverse_avg'] = 1 / avg_t
            data[language]['time']['max'] = max_t
        if Capture.LOC in capture:
            data[language]['size'] = dict()
            if exe.endswith('.a') or exe.endswith('.exe'):
                matching = [s for s in files if exe[:-2] in s]
                for match in matching:
                    if not_ends_with(match, ['.a', '.exe', '.o', '.cmi', '.cmx', '.ali']):
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
    count = len(data)
    row, col = os.popen('stty size', 'r').read().split()
    width = min(count * 6, int(col))
    height = min(20, int(row))
    if 'avg' in args.graph:
        par('Average Time', width)
        display_graph(format_graph_data(data, 'time.avg'), 2, width, height)
    if 'iavg' in args.graph:
        par('Inverse Average Time', width)
        display_graph(
            format_graph_data(data, 'time.inverse_avg'), 2, width, height)
    if 'min' in args.graph:
        par('Minimum Time', width)
        display_graph(format_graph_data(data, 'time.min'), 2, width, height)
    if 'max' in args.graph:
        par('Maximum Time', width)
        display_graph(format_graph_data(data, 'time.max'), 2, width, height)
    if 'eff' in args.graph:
        par("Efficiency", width)
        display_graph(format_graph_data(data, 'eff'), 2, width, height)
    if 'bytes' in args.graph:
        par('Bytes', width)
        display_graph(format_graph_data(data, 'size.bytes'), 2, width, height)
    if 'lines' in args.graph:
        par('Lines', width)
        display_graph(format_graph_data(data, 'size.lines'), 2, width, height)
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


def save(data, args):
    def gen_line(value, opts):
        row = value['name']
        if opts[0]:
            row += ',{}'.format(value['time']['avg'])
        if opts[1]:
            row += ',{}'.format(value['time']['min'])
        if opts[2]:
            row += ',{}'.format(value['time']['max'])
        if opts[3]:
            row += ',{}'.format(value['size']['bytes'])
        if opts[4]:
            row += ',{}'.format(value['size']['lines'])
        if opts[5]:
            row += ',{}'.format(value['eff'])
        return row

    opts = [False] * 7
    row = 'Name'
    if 'avg' in args.table:
        opts[0] = True
        row += ',Average Time'
    if 'min' in args.table:
        opts[1] = True
        row += ',Minimum Time'
    if 'max' in args.table:
        opts[2] = True
        row += ',Maximum Time'
    if 'bytes' in args.table:
        opts[3] = True
        row += ',Bytes'
    if 'lines' in args.table:
        opts[4] = True
        row += ',Lines'
    if 'eff' in args.table:
        opts[5] = True
        row += ',Efficiency'
    f = open(args.csv, 'w')
    f.write(row + '\n')
    for key, value in data.items():
        f.write(gen_line(value, opts) + '\n')


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
        '-b',
        '--black',
        type=str,
        nargs='*',
        default=[],
        help='folders/files to not run.')
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
        choices={'min', 'max', 'avg', 'iavg', 'eff', 'bytes', 'lines'})
    parser.add_argument(
        '-t',
        '--table',
        default=['color', 'name', 'avg', 'bytes', 'eff'],
        nargs='*',
        help='data sets to place in table',
        choices={
            'color', 'name', 'min', 'max', 'avg', 'eff', 'bytes', 'lines'
        })
    parser.add_argument('--csv', default='', help='Outputs values as CSV file')
    args = parser.parse_args()
    title('RUNNING', 35)
    exes, files = get_exes(args.exe, args.black)
    data = run(exes, files, args.reps)
    if args.csv is not '':
        save(data, args)
    else:
        display(data, args)


if __name__ == "__main__":
    main()
