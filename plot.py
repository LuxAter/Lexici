#!/usr/bin/python3

import json
import os
import sys
import glob
from pprint import pprint

import matplotlib.pyplot as plt
import matplotlib.patches as mpatches
import numpy as np

colors = dict()


def load_languages():
    global colors
    colors = json.load(open(os.path.join(os.path.dirname(
        os.path.realpath(__file__)), "languages.json")))


def load(file, delimiter=',', data=None):
    if data is None:
        data = dict()
    n = int(file.split('_')[1].split('.')[0])
    with open(file, 'r') as f:
        f.readline()
        for line in f:
            line = line.strip().split(delimiter)
            if line[0].title() not in data:
                data[line[0].title()] = {"data": [(n, float(line[1]))]}
            else:
                data[line[0].title()]['data'].append((n, float(line[1])))
    return data


def gen_color_table(data):
    global colors
    for key in data:
        if key in colors:
            data[key]["color"] = colors[key]
        else:
            data[key]["color"] = "#AAAFB4"

def prep_lang(data):
    new_data =dict()
    for key in data:
        if key.lower() == "cpp":
            new_data["C++"] = data[key]
        elif key.lower() == "csharp":
            new_data['C#'] = data[key]
        elif key.lower() == "lisp":
            new_data['Common Lisp'] = data[key]
        elif key.lower() == "javascript":
            new_data['JavaScript'] = data[key]
        else:
            new_data[key] = data[key]
    return new_data


def sort_data(data):
    for key, value in data.items():
        value["data"] = sorted(value["data"], key=lambda x: x[0])


def main():
    load_languages()
    base = "p1"
    if len(sys.argv) > 1:
        base = sys.argv[1]
    files = glob.glob(base + "*.csv")
    data=dict()
    for file in files:
        data = load(file, data=data)
    data = prep_lang(data)
    sort_data(data)
    gen_color_table(data)
    fig = plt.figure()
    ax = fig.add_subplot(111)
    for key, entry in data.items():
        plt.plot(*zip(*entry["data"]), c=entry["color"])
        for i, j in entry["data"]:
            ax.annotate("{:2.2}".format(j), xy=(i,j))
    legend = list()
    for key, value in data.items():
        legend.append(mpatches.Patch(color=value["color"], label=key))
    plt.legend(handles=legend)
    plt.show()


if __name__ == "__main__":
    main()
