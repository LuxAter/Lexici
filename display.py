import math
import os
from pprint import pprint


def get_json(obj, key):
    if isinstance(obj, dict):
        if key.split('.')[0] in obj:
            if key.split('.')[1:] != list():
                return get_json(obj[key.split('.')[0]], '.'.join(
                    key.split('.')[1:]))
            return obj[key.split('.')[0]]
    return None


def set_color(color):
    color = tuple(int(color[i:i + 2], 16) for i in (1, 3, 5))
    return "\033[38;2;{};{};{}m".format(color[0], color[1], color[2])


def display_table(data, gap=2, width=40, height=10, axis=True):
    max_height, max_width = os.popen('stty size', 'r').read().split()
    if width == 'max':
        width = int(max_width)
    if height == 'max':
        height = int(max_height)
    cols = {}
    for entry in data:
        for key, value in entry.items():
            if isinstance(value, float):
                value = float("{:.3}".format(value))
            if key in cols:
                cols[key].append(value)
            else:
                cols[key] = [value]
    widths = [
        len(str(max(x, key=lambda st: len(str(st))))) for _, x in cols.items()
    ]
    for i, key in enumerate(cols):
        if key == 'color':
            widths[i] = 3
        else:
            widths[i] = max(widths[i], len(key))
    for i in range(len(data) + axis):
        if i == 0:
            for j, kv in enumerate(cols.items()):
                key = kv[0]
                if key == 'color':
                    print('{}'.format(' ' * (widths[j] + gap)), end='')
                else:
                    print(
                        "\033[1m{:{}}\033[0m{}".format(key.title(), widths[j],
                                                       ' ' * gap),
                        end='')
            print()
            print("─" * (sum(widths) + (gap * len(widths))))
        else:
            if i % 2 == 0:
                print('\033[40m', end='')
            for j, kv in enumerate(cols.items()):
                key = kv[0]
                value = kv[1]
                if key == 'color':
                    print(
                        "{}{:>{}}{}{}".format(
                            set_color(value[i - axis]), '', widths[j],
                            '\033[39m', ' ' * gap),
                        end='')
                else:
                    print(
                        "{:<{}}{}".format(value[i - axis], widths[j],
                                          ' ' * gap),
                        end='')
            if i % 2 == 0:
                print('\033[0m', end='')
            print()


def display_graph(data, gap=2, width=40, height=10, axis=True):
    max_height, max_width = os.popen('stty size', 'r').read().split()
    if width == 'max':
        width = int(max_width)
    if height == 'max':
        height = int(max_height)
    if axis is True:
        height -= 1
    normalizer = max(data, key=lambda item: item[0])[0]
    for i, entry in enumerate(data):
        if not (isinstance(entry, tuple) or isinstance(entry, list)):
            data[i] = (height * entry / normalizer, '#ffffff')
        else:
            data[i] = (height * entry[0] / normalizer, entry[1])
    if isinstance(normalizer, int):
        axis_width = len("{}".format(normalizer)) + 1
    else:
        axis_width = len("{:.4}".format(normalizer)) + 1
    width -= (axis_width + 1)
    bar_width = int(width / len(data)) - gap
    for i in range(height):
        if axis is True:
            if i == int(height / 4) or i == int(height / 2) or i == int(
                    3 * height / 4) or i == 0 or i == height:
                if isinstance(normalizer, int):
                    print(
                        "{:{}}│".format(
                            int(normalizer * (height - i) / height),
                            axis_width),
                        end='')
                else:
                    print(
                        "{:{}.4}│".format(normalizer * (height - i) / height,
                                          axis_width),
                        end='')
            else:
                print("{}│".format(" " * axis_width), end='')
        for val in data:
            char = '█'
            if height - i <= val[0]:
                char = '█'
            elif height - i - 1 <= val[0]:
                perc = int((val[0] % 1) * 8)
                if perc == 0:
                    char = ' '
                elif perc == 1:
                    char = '▁'
                elif perc == 2:
                    char = '▂'
                elif perc == 3:
                    char = '▃'
                elif perc == 4:
                    char = '▄'
                elif perc == 5:
                    char = '▅'
                elif perc == 6:
                    char = '▆'
                elif perc == 7:
                    char = '▇'
            else:
                char = ' '
            print(
                "{}{}{}{}".format(
                    set_color(val[1]), char * bar_width, "\033[0m", " " * gap),
                end='')
        print()
    if axis is True:
        print("{}└{}".format(' ' * axis_width,
                             '─' * ((bar_width + gap) * len(data))))


def format_graph_data(data, comp):
    values = []
    for key, value in data.items():
        values.append((get_json(value, comp), value['color']))
    return values


def format_table_data(data, values):
    res = []
    for key, value in data.items():
        res.append(dict())
        for val in values:
            res[-1][val.split('.')[-1]] = get_json(value, val)
    return res
