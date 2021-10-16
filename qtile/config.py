
import os
import re
import socket
import subprocess

from libqtile import qtile
from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget, hook
from typing import List  # noqa: F401

mod = "mod4"
myTerm = "alacritty"
myConfig = "/home/lk/.config/qtile/config.py"
home = os.path.expanduser("~")

GREY = "#d1d1d1"
DARK_GREY = "#595959"
LIGHT_BLUE = "#7bacd3"
BLUE = "#6ea1f8"
DARK_BLUE = "#2e0fce"
ORANGE = "#ff9235"
DARK_ORANGE = "#d16608"
GREEN = "#31ce43"
DARK_GREEN = "#4b8734"
RED = "#ff4f4f"
WHITE = "#ffffff"
BLACK = "#000000"

# fontsize
font_small = 10
font_medium = 11
font_large = 12

main_font = "fira"

keys = [
    # Switch between windows in current stack pane
    Key([mod], "k", lazy.layout.down()),
    Key([mod], "j", lazy.layout.up()),
    # Move windows up or down in current stack
    Key([mod, "shift"], "k", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_up()),
    # Switch window focus to other pane(s) of stack
    Key([mod], "space", lazy.layout.next()),
    # Swap panes of split stack
    Key([mod, "shift"], "space", lazy.layout.rotate()),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
    Key([mod], "Return", lazy.spawn(myTerm)),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "w", lazy.window.kill()),
    Key(
        [mod, "shift"],
        "r",
        lazy.restart(),
        desc="Restart Qtile",
    ),
    Key(
        [mod, "shift"],
        "q",
        lazy.shutdown(),
        desc="Shutdown",
    ),
    # run program
    Key([mod], "r", lazy.spawncmd()),
    Key(
        [mod],
        "f",
        lazy.spawn("firefox"),
        desc="start Firefox",
    ),
    Key(
        [mod],
        "c",
        lazy.spawn("code"),
        desc="start vscode",
    ),
    Key(
        [mod],
        "d",
        lazy.spawn("pycharm-community"),
        desc="start pycharm",
    ),
    # RESIZE UP, DOWN, LEFT, RIGHT
    Key(
        [mod, "control"],
        "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
    ),
    Key(
        [mod, "control"],
        "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
    ),
    Key(
        [mod, "control"],
        "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
    ),
    Key(
        [mod, "control"],
        "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
    ),
]

group_names = [
    ("term", {"layout": "matrix"}),
    ("www", {"layout": "monadtall"}),
    ("dev", {"layout": "monadtall"}),
    ("text", {"layout": "monadtall"}),
    ("graphic", {"layout": "monadtall"}),
    ("media", {"layout": "monadtall"}),
    ("virt", {"layout": "max"}),
    ("games", {"layout": "max"}),
]

groups = [Group(name, **kwargs) for name, kwargs in group_names]

for i, (name, kwargs) in enumerate(group_names, 1):
    keys.append(Key([mod], str(i), lazy.group[name].toscreen()))
    keys.append(Key([mod, "shift"], str(i), lazy.window.togroup(name)))

layout_theme = {
    "border_width": 2,
    "margin": 2,
    "border_focus": GREY,
    "border_normal": DARK_GREY,
}

layouts = [
    layout.Max(**layout_theme),
    # layout.Stack(num_stacks=2),
    # Try more layouts by unleashing below layouts.
    # layout.Bsp(),
    # layout.Columns(),
    layout.Matrix(),
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    # layout.RatioTile(),
    #layout.Tile(shift_windows=True, **layout_theme),
    #        layout.TreeTab(
    #            font =main_font,
    #            fontsize=font_medium,
    #            sections=["FIRST", "SECOND"],
    #            section_fontsize=font_large,
    #            bg_color = BLACK,
    #            active_bg = GREEN,
    #            active_fg = BLACK,
    #            inactive_bg = DARK_GREEN,
    #            inactive_fg = DARK_GREY,
    #            padding_y = 5,
    #            section_top = 10,
    #            panel_width = 320
    #            ),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

colors = [
    [DARK_GREY, DARK_GREY],  # panel background
    ["#636881", "#636881"],  # background for current screen tab
    [WHITE, WHITE],  # font color for group names
    [RED, RED],  # border line color for current tab
    ["#8d62a9", "#8d62a9"],  # border line color for other tab and odd widgets
    [BLUE, BLUE],  # color for the even widgets
    [LIGHT_BLUE, LIGHT_BLUE],
]  # window name

prompt = "{DARK_GREY}@{1}: ".format(os.environ["USER"], socket.gethostname())

# Default widget settings
widget_defaults = dict(
    font=main_font,
    fontsize=font_large,
    padding=3,
    background=colors[0],
)
extension_defaults = widget_defaults.copy()


def init_widgets_list():
    widgets_list = [
        widget.CurrentLayout(),
        widget.Sep(
            background=GREY,
            foreground=GREEN,
            linewidth=1,
            size_percent=80,
        ),
        widget.GroupBox(
            active=WHITE,
            inactive=BLUE,
            background=DARK_GREY,
            block_highlight_text_color=GREEN,
            highlight_color=GREEN,
            borderwidth=2,
        ),
        widget.Sep(
            background=GREY,
            foreground=GREEN,
            linewidth=1,
            size_percent=50,
        ),
        widget.Prompt(),
        widget.WindowName(),
        #widget.TextBox("default config", name="default"),
        widget.CPU(
            background=None,
            font=main_font,
            fontsize=font_large,
            foreground=WHITE,
            format="CPU {freq_current}GHz  {load_percent}%",
            update_interval=1.0,
        ),
        widget.CPUGraph(
            background=None,
            border_color=RED,
            border_width=1,
            core="all",
            fill_color=LIGHT_BLUE,
            frequency=1.0,
            graph_color=ORANGE,
            line_width=3,
            margin_x=3,
            margin_y=3,
            samples=100,
            start_pos="bottom",
            type="linefill",
        ),
        widget.Memory(
            background=None,
            font=main_font,
            fontsize=font_large,
            foreground=WHITE,
            format="RAM {MemUsed}M / {MemTotal}M",
            update_interval=1.0,
        ),
        widget.MemoryGraph(
            background=None,
            border_color=RED,
            border_width=1,
            fill_color=LIGHT_BLUE,
            frequency=1.0,
            graph_color=ORANGE,
            line_width=3,
            margin_x=3,
            margin_y=3,
            samples=100,
            start_pos="bottom",
            type="linefill",
        ),
        widget.Sep(
            background=GREY,
            foreground=GREEN,
            linewidth=2,
            size_percent=50,
        ),
        widget.Clock(
            background=None,
            font=main_font,
            #                            fontsize=font_medium;
            format="%d.%m.%Y",
            #                            timezone="Europe/Warsaw",
            update_interval=5,
        ),
        widget.Clock(
            background=None,
            font=main_font,
            #                            fontsize=font_large;
            format="%a %I:%M %p",
            #                            timezone="Europe/Warsaw",
            update_interval=1.0,
        ),
        #                        widget.Spacer(
        #                            background=GREY,
        #                            ),
        # widget.QuickExit()
    ]


def init_widgets_screen1():
    widgets_screen1 = init_widgets_list()
    return widgets_screen1


def init_widgets_screen2():
    widgets_screen2 = init_widgets_list()
    return widgets_screen2


def init_screens():
    return[
        Screen(top=bar.Bar(widget=init_widgets_screen1(), opacity=1.0, size=20)),
        Screen(top=bar.Bar(init_widgets_screen2(), opacity=1.0, size=20)),
    ]


if __name__ in ['config', '__main__']:
    screens = init_screens()
    widgets_list = init_widgets_list()
    widgets_screen1 = init_widgets_screen1()
    widget_screen2 = init_widgets_screen2()


def window_to_prev_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i - 1].name)


def window_to_next_group(qtile):
    if qtile.currentWindow is not None:
        i = qtile.groups.index(qtile.currentGroup)
        qtile.currentWindow.togroup(qtile.groups[i + 1].name)


def window_to_previous_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i != 0:
        group = qtile.screens[i - 1].group.name
        qtile.current_window.togroup(group)


def window_to_next_screen(qtile):
    i = qtile.screens.index(qtile.current_screen)
    if i + 1 != len(qtile.screens):
        group = qtile.screens[i + 1].group.name
        qtile.current_window.togroup(group)


def switch_screens(qtile):
    i = qtile.screens.index(qtile.current_screen)
    group = qtile.screens[i - 1].group
    qtile.current_screen.set_group(group)


# Drag floating layouts.
mouse = [
    Drag(
        [mod],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        {"wmclass": "confirm"},
        {"wmclass": "dialog"},
        {"wmclass": "download"},
        {"wmclass": "error"},
        {"wmclass": "file_progress"},
        {"wmclass": "notification"},
        {"wmclass": "splash"},
        {"wmclass": "toolbar"},
        {"wmclass": "confirmreset"},  # gitk
        {"wmclass": "makebranch"},  # gitk
        {"wmclass": "maketag"},  # gitk
        {"wname": "branchdialog"},  # gitk
        {"wname": "pinentry"},  # GPG key password entry
        {"wmclass": "ssh-askpass"},  # ssh-askpass
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
