from typing import List  # noqa: F401

import platform
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
from libqtile.dgroups import simple_key_binder

mod = "mod4"
terminal = guess_terminal()
browser = "firefox"

hostname = platform.node()  # hostname: fuji , lap

FONT = "fira"
SF = 10
MF = 11
LF = 12

# colors
DARK_GREY = "#595959"
LIGHT_GREEN = "#8feecc"
WHITE = "#ffffff"
BACKGROUND="#041716"
FRAME="#1ecbe1"
FOCUSE_FRAME="#1d9de2"
INACTIVE_FRAME='#0f177d'
URGENT='#d67f29'
INACTIVE='#1b29e4'

keys = [
    # A list of available commands that can be bound to keys can be found
    # at https://docs.qtile.org/en/latest/manual/config/lazy.html
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key(
        [mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"
    ),
    Key(
        [mod, "shift"],
        "l",
        lazy.layout.shuffle_right(),
        desc="Move window to the right",
    ),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key(
        [mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"
    ),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    # Key([mod], "r", lazy.spawncmd(), desc="Spawn a command using a prompt widget"), # because of installed rofi
    # programs
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "b", lazy.spawn(browser), desc="Launch web browser"),
    Key([mod], "g", lazy.spawn("chromium"), desc="Launch chromium"),
    Key([mod], "c", lazy.spawn("codium"), desc="Launch vscodium"),
    Key([mod], "d", lazy.spawn("dbeaver"), desc="Launch dbeaver"),
    Key([mod], "v", lazy.spawn("virt-manager"), desc="Launch virt-manager"),
    Key([mod], "y", lazy.spawn("freetube"), desc="Launch free tube"),
    Key([mod], "z", lazy.spawn("slack"), desc="Launch slack"),
    Key([mod], "f", lazy.spawn("flameshot"), desc="Launch flameshot"),
    Key([mod], "r", lazy.spawn('rofi -show run'), desc='Search and launch program'),
    Key([mod], "s", lazy.spawn('rofi -show window'), desc='Switch to opened program'),
    # Key([mod], "j", lazy.spawn("jitsi-meet-electron"), desc="Launch jitsi"),
    # Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    # Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -c 0 sset Master 1- unmute")),
    # Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -c 0 sset Master 1+ unmute")),
]

groups = [
    Group("1", layout="Bsp"),
    Group("2", layout="monadtall"),
    Group("3", layout="monadtall"),
    Group("4", layout="monadtall"),
    Group("5", layout="monadtall"),
    Group("6", layout="monadtall"),
    Group("7", layout="monadtall"),
    Group("8", layout="monadtall"),
    Group("9", layout="monadtall"),
    Group("0", layout="floating"),
]

# groups = [Group(i,layout='monadtall') for i in "1234567890"]

# dgroups_key_binder = simple_key_binder(mod)

for gr in groups:
    keys.extend(
        [
            # mod1 + letter of group = switch to group
            Key(
                [mod],
                gr.name,
                lazy.group[gr.name].toscreen(),
                desc=f"Switch to group {gr.name}",
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                gr.name,
                lazy.window.togroup(gr.name, switch_group=True),
                desc=f"Switch to & move focused window to group {gr.name}",
            ),
            # Or, use below if you prefer not to switch to that group.
            # # mod1 + shift + letter of group = move focused window to group
            # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
            #     desc="move focused window to group {}".format(i.name)),
        ]
    )

columns_layout={
    'border_focus':FOCUSE_FRAME,
    'border_normal':INACTIVE_FRAME,
    'border_width':2,
}
bsp_layout={
    'border_focus':FOCUSE_FRAME,
    'border_normal':FRAME,
    'border_on_single':False,
    'border_width':2,
    'grow_ammount':5,
    'ratio':1.6,
}
layout_theme = {
    "border_width": 2,
    "margin": 0,
    "border_focus": FOCUSE_FRAME,
    "border_normal": DARK_GREY,
}

layouts = [
    layout.Columns(**columns_layout),
    # layout.Bsp(**bsp_layout),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Matrix(),
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]

widget_defaults = dict(font=FONT, fontsize=MF, padding=3, background=BACKGROUND)
extension_defaults = widget_defaults.copy()

separator = widget.Sep(foreground=FRAME, linewidth=2, padding=2)

battery = None
net = None
sensors = None
if hostname == "lap":
    battery = (separator, widget.Battery())
    net = (
        separator,
        widget.Net(interface="wlp0s20f3", format="{interface}: {down} ↓↑ {up}"),
        separator,
        widget.Net(interface="enp0s31f6", format="{interface}: {down} ↓↑ {up}"),
    )
else:
    battery = (separator, widget.NvidiaSensors())
    net = (
        separator,
        widget.Net(interface="wlp1s0", format="{interface}: {down} ↓↑ {up}"),
        separator,
        widget.Net(interface="enp0s31f6", format="{interface}: {down} ↓↑ {up}"),
    )
sensors = (
    separator,
    widget.ThermalSensor(show_tag=True, tag_sensor="Package id 0"),
)


screens = [
    Screen(
        # bottom=bar.Bar(
        top=bar.Bar(
            [
                widget.CurrentLayout(),
                widget.GroupBox(
                    active=WHITE,
                    borderwidth=2,
                    disable_drag=True,
                    highlight_method='border',
                    this_current_screen_border=FOCUSE_FRAME,
                    urgent_border=URGENT,
                    inactive=INACTIVE,
                ),
                #widget.Prompt(), # rofi installed
                widget.WindowName(),
                # widget.Chord(
                #     chords_colors={
                #         "launch": ("#ff0000", "#ffffff"),
                #     },
                #     name_transform=lambda name: name.upper(),
                # ),
                *battery,
                separator,
                widget.CPU(),
                *sensors,
                separator,
                widget.Memory(
                    measure_mem="G",
                ),
                *net,
                separator,
                widget.Systray(),
                separator,
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
                # widget.QuickExit(),
            ],
            24,
            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
            background=BACKGROUND,
            border_color=FRAME,
            border_width=[1,1,1,1],
            margin=[1,1,1,1],
            opacity=0
        ),
    ),
]

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
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        #Match(wm_class="makebranch"),  # gitk
        #Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        #Match(title="branchdialog"),  # gitk
        #Match(title="pinentry"),  # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmnameE= "LG3D"
