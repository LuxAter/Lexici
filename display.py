import math
import os
import loc.color as color
import numpy as np

def print_lang(lang, width):
    return " {}\u25CF{} {:<{}} ".format(color.get_color(lang.color), color.get_color(color.Color.DEFAULT), lang.name, width)


def display_length(string):
    length = 0
    counting = 0
    for char in string:
        if char == '\033':
            counting = 1
        elif char == 'm' and counting == 1:
            counting = 0
            length -= 1
        if counting == 0:
            length += 1
    return length


def print_languages(items):
    rows, columns = os.popen("stty size", "r").read().split()
    rows = int(rows)
    columns = int(columns)
    lengths = [len(x.name) + 2 for x in items]
    count = len(lengths)
    col = 1
    while count / col > (rows * 0.25):
        col += 1
    while col * max(lengths) > columns:
        col -= 1
    width = max(lengths) - 2
    split = count / col
    groups = []
    last = 0.0
    while len(items) % int(split) != 0:
        items.append(None)
    split = len(items) / col
    while last < len(items):
        groups.append(items[int(last):int(last + split)])
        last += split
    for i in range(0, len(max(groups, key=len))):
        for li in groups:
            if len(li) > i and li[i] is not None:
                print(print_lang(li[i], width), end='')
            else:
                print(" " * (width + 3), end='')
        print('')

def print_char(fill, a, b):
    print(color.get_color(a.color), end='')
    if fill != 8:
        print(color.get_color(b.color, background=True), end='')
    if fill == 8:
        print("\u2588", end='')
    elif fill == 7:
        print("\u2589", end='')
    elif fill == 6:
        print("\u258A", end='')
    elif fill == 5:
        print("\u258B", end='')
    elif fill == 4:
        print("\u258C", end='')
    elif fill == 3:
        print("\u258D", end='')
    elif fill == 2:
        print("\u258E", end='')
    elif fill == 1:
        print("\u258F", end='')
    print(color.get_color(color.Color.DEFAULT), end='')
    if fill != 8:
        print(color.get_color(color.Color.DEFAULT, background=True), end='')


def print_bar(data, total, sort,width):
    percents = [[None, None, None]] * len(data)
    i = 0
    for key, value in data.items():
        if isinstance(sort, int):
            percents[i] = [key, value[sort] / total[sort]]
        else:
            percents[i] = [key, value[sort[0]][sort[1]] / total[sort[0]][sort[1]]]
        i += 1
    percents = sorted(percents, key=lambda x: -x[1])
    splits =[None] * int(width * 8)
    index = 0
    count = 0
    for i, split in enumerate(splits):
        if count + (percents[index][1]* width) >= (i * 0.125):
            splits[i] = percents[index][0]
        else:
            count += (percents[index][1] * width)
            if count - (i * 0.125) >= 0.0625:
                splits[i] = percents[index][0]
            else:
                splits[i] = percents[index + 1][0]
            index += 1
    for i in range(0, len(splits), 8):
        div = [x for x in splits[i:i+8]]
        counts = dict()
        for j in range(0, 8):
            if div[j] not in counts:
                counts[div[j]] = 1
            else:
                counts[div[j]] += 1
        counts_index = sorted(counts, key=counts.__getitem__, reverse=True)
        if len(counts_index) > 2:
            a = counts_index[0]
            b = div[-1]
            a_count = counts[a]
            b_count = counts[b]
            tot = a_count + b_count
            a_count = int(round(8 * (a_count / tot)))
            b_count = int(round(8 * (b_count / tot)))
        else:
            a = div[0]
            b = div[-1]
            a_count = counts[a]
            b_count = counts[b]
        print_char(a_count, a, b)
    print()
