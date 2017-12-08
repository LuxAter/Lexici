import os
from enum import Enum


class ColorAccess(Enum):
    NO_COLOR = 0
    COLOR_8_BIT = 1
    COLOR_16_BIT = 2
    COLOR_256_BIT = 3
    COLOR_TRUE = 4


class Color(Enum):
    DEFAULT = 0


def clamp(n, minn, maxn):
    if n < minn:
        return minn
    elif n > maxn:
        return maxn
    return n


def get_color_ability():
    if "COLORTERM" in os.environ:
        env = os.environ["COLORTERM"]
        if env == "truecolor":
            return ColorAccess.COLOR_TRUE
    if "TERM" in os.environ:
        term = os.environ["TERM"]
        if term == "xterm":
            return ColorAccess.COLOR_256_BIT
        elif term == "xterm-256color":
            return ColorAccess.COLOR_TRUE
        elif term == "linux":
            return ColorAccess.COLOR_16_BIT
    if "CI" in os.environ:
        ci_ = os.environ["CI"]
        if ci_ == "travis":
            return ColorAccess.COLOR_16_BIT
    return ColorAccess.COLOR_16_BIT


def get_color(color, background=False):
    access = get_color_ability()
    if isinstance(color, str):
        color = color.lstrip('#')
        if color == str():
            color = "aaafb4"
        color = tuple(int(color[i:i + 2], 16) for i in (0, 2, 4))
    if isinstance(color, list):
        color = tuple(color)
    if isinstance(color, tuple):
        red, green, blue = color
        red = clamp(red, 0, 256)
        green = clamp(green, 0, 256)
        blue = clamp(blue, 0, 256)
        if access is ColorAccess.COLOR_256_BIT:
            red = ((red / 256) * 5)
            green = ((green / 256) * 5)
            blue = ((blue / 256) * 5)
            xterm = (36 * int(round(red))) + (6 * int(round(green))) + (int(
                round(blue))) + 16
            if background is False:
                return "\033[38;5;{}m".format(xterm)
            return "\033[48;5;{}m".format(xterm)
        if background is False:
            return "\033[38;2;{};{};{}m".format(red, green, blue)
        return "\033[48;2;{};{};{}m".format(red, green, blue)
    if isinstance(color, int):
        color = clamp(color, 0, 256)
        if background is False:
            return "\033[38;5;{}m".format(color)
        return "\033[48;5;{}m".format(color)
    if isinstance(color, Color):
        if color is Color.DEFAULT:
            if background is False:
                return "\033[39m"
            return "\033[49m"
    return str()
