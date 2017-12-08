import color
import display
from enum import Enum
from color import Color


class Cell(object):
    class Align(Enum):
        NONE = 0
        CENTER = 1
        RIGHT = 2
        LEFT = 3

    def __init__(self, string=str(), title=False):
        self.string = string
        self.title = title
        self.align = self.Align.CENTER

    def __repr__(self):
        if self.title is True:
            return "<" + self.string + ">"
        return self.string

    def length(self):
        return display.display_length(self.string)

    def display(self, width=None):
        if width is None:
            width = self.length()
        if self.align is self.Align.CENTER:
            print("{:^{}}".format(self.string, width +
                                  (len(self.string) - self.length())), end='')
        elif self.align is self.Align.LEFT:
            print("{:<{}}".format(self.string, width +
                                  (len(self.string) - self.length())), end='')
        elif self.align is self.Align.RIGHT:
            print("{:>{}}".format(self.string, width +
                                  (len(self.string) - self.length())), end='')
        else:
            print("{:{}}".format(self.string, width +
                                 (len(self.string) - self.length())), end='')


class Table(object):
    def __init__(self, data, title_row=False, title_column=False, draw_box=False):
        self.title_row = title_row
        self.title_column = title_column
        self.cells = [[]]
        self.generate_cells(data)
        self.title_bold = True
        self.zebra = False
        self.draw_box = draw_box
        self.box = [['\u2501', '\u2503', '\u250F', '\u2513', '\u2517',
                     '\u251b', '\u2523', '\u252b', '\u2533', '\u253b', '\u254b'],
                    ['\u2500', '\u2502', '\u250C', '\u2510', '\u2514',
                     '\u2518', '\u251c', '\u2524', '\u252c', '\u2534', '\u253c'],
                    ['\u2520', '\u2521', '\u2522', '\u2528', '\u2529', '\u252a',
                     '\u252f', '\u2531', '\u2532', '\u2537', '\u2539', '\u253a'],
                    ['\u2543', '\u2544', '\u2545', '\u2546',
                     '\u2547', '\u2548', '\u2549', '\u254a']
                    ]

    def generate_cells(self, data):
        if isinstance(data, list) is False or isinstance(data[0], list) is False:
            return None
        self.cells = [None] * len(data)
        min_len = len(data[0])
        for i, row in enumerate(data):
            self.cells[i] = [Cell()] * max(min_len, len(row))
            for j, item in enumerate(row):
                if (self.title_row is True and i == 0) or (self.title_column is True and j == 0):
                    self.cells[i][j] = Cell(item, True)
                else:
                    self.cells[i][j] = Cell(item)

    def set_column_alignment(self, j, align):
        for row in self.cells:
            row[j].align = align

    def set_row_alignment(self, i, align):
        for item in self.cells[i]:
            item.align = align

    def get_box_corner(self, ul, ur=None, bl=None, br=None):
        if isinstance(ul, tuple):
            ul, ur, bl, br = ul
        if ul is None and ur is None:
            if bl is None:
                if br:
                    return self.box[0][2]
                return self.box[1][2]
            if br is None:
                if bl:
                    return self.box[0][3]
                return self.box[1][3]
            if bl and br:
                return self.box[0][8]
            elif bl and not br:
                return self.box[2][7]
            elif not bl and br:
                return self.box[2][8]
            return self.box[1][8]
        if bl is None and br is None:
            if ul is None:
                if ur:
                    return self.box[0][4]
                return self.box[1][4]
            if ur is None:
                if ul:
                    return self.box[0][5]
                return self.box[1][5]
            if ul and ur:
                return self.box[0][9]
            elif ul and not ur:
                return self.box[2][10]
            elif not ul and ur:
                return self.box[2][11]
            return self.box[1][9]
        if ul is None and bl is None:
            if ur and br:
                return self.box[0][6]
            elif ur and not br:
                return self.box[2][1]
            elif not ur and br:
                return self.box[2][2]
            return self.box[1][6]
        if ur is None and br is None:
            if ul and bl:
                return self.box[0][7]
            elif ul and not bl:
                return self.box[2][4]
            elif not ul and bl:
                return self.box[2][5]
            return self.box[1][7]
        if ul:
            if ur:
                if bl:
                    if br:
                        return self.box[0][10]
                    return self.box[0][10]
                if br:
                    return self.box[0][10]
                return self.box[3][4]
            if bl:
                if br:
                    return self.box[0][10]
                return self.box[3][6]
            if br:
                return self.box[0][10]
            return self.box[3][0]
        if ur:
            if bl:
                if br:
                    return self.box[0][10]
                return self.box[0][10]
            if br:
                return self.box[3][7]
            return self.box[3][1]
        if bl:
            if br:
                return self.box[3][5]
            return self.box[3][3]
        if br:
            return self.box[3][4]
        return self.box[1][10]

    def get_box_edge(self, l, r=None, vert=False):
        if isinstance(r, bool):
            vert = r
        if isinstance(l, tuple):
            l, r = l
        if vert is False:
            val = 1
        else:
            val = 0
        if l or r:
            return self.box[0][1 - val]
        else:
            return self.box[1][1 - val]

    def get_cell_corner(self, i, j):
        ul = None
        ur = None
        bl = None
        br = None
        if i != 0 and j != 0:
            ul = self.cells[i - 1][j - 1].title
        if i != 0 and j != len(self.cells[0]):
            ur = self.cells[i - 1][j].title
        if i != len(self.cells) and j != len(self.cells[0]):
            br = self.cells[i][j].title
        if i != len(self.cells) and j != 0:
            bl = self.cells[i][j - 1].title
        return (ul, ur, bl, br)

    def get_cell_edge(self, i, j, vert=False):
        l = None
        r = None
        if vert is False:
            if i != 0:
                l = self.cells[i - 1][j].title
            if i != len(self.cells):
                r = self.cells[i][j].title
        else:
            if j != 0:
                l = self.cells[i][j - 1].title
            if j != len(self.cells[0]):
                r = self.cells[i][j].title
        return (l, r)

    def get_longest(self, j):
        length = 0
        for i, row in enumerate(self.cells):
            length = max(length, row[j].length() + 1)
        return length

    def display(self):
        width = 10
        prev = False
        for i, row in enumerate(self.cells):
            if self.zebra is True and i % 2 != 0:
                print(color.get_color(0, background=True), end='')
            if self.draw_box is True and i == 0:
                for j, cell in enumerate(row):
                    width = self.get_longest(j)
                    print(self.get_box_corner(
                        self.get_cell_corner(i, j)), sep='', end='')
                    if cell.title is True:
                        print(self.box[0][0] * width, sep='', end='')
                    else:
                        print(self.box[1][0] * width, sep='', end='')
                print(self.get_box_corner(self.get_cell_corner(i, len(row))))
            for j, cell in enumerate(row):
                width = self.get_longest(j)
                if self.draw_box is True:
                    print(self.get_box_edge(self.get_cell_edge(
                        i, j, True), True), sep='', end='')
                else:
                    print(' ',end='')
                if cell.title is True and self.title_bold is True:
                    print("\033[1m", end='')
                cell.display(width)
                if cell.title is True and self.title_bold is True:
                    print("\033[21m", end='')
            if self.draw_box is True:
                print(self.get_box_edge(self.get_cell_edge(
                    i, len(row), True), True), end='')
            if self.zebra is True and i % 2 != 0:
                print(color.get_color(color.Color.DEFAULT, background=True), end='')
            print()
            if self.draw_box is True and i != len(self.cells):
                for j, cell in enumerate(row):
                    width = self.get_longest(j)
                    print(self.get_box_corner(
                        self.get_cell_corner(i + 1, j)), sep='', end='')
                    if cell.title is True:
                        print(self.box[0][0] * width, sep='', end='')
                    else:
                        print(self.box[1][0] * width, sep='', end='')
                print(self.get_box_corner(self.get_cell_corner(i + 1, len(row))))
