from libqtile.config import Key, Screen, Group, Drag, Click
from libqtile.command import lazy
from libqtile import layout, bar, widget

from typing import List # noqa: F401

mod = "mod4"

keys = [
    # QTile
    Key(
        [mod, "control"], "r",
        lazy.restart()
    ),
    Key(
        [mod, "control"], "q", 
        lazy.shutdown()
    ),
    Key(
        [mod, "shift"], "c", 
        lazy.window.kill()
    ),
    # Screen
    Key([mod, "control"], "j",
        lazy.next_screen()
    ),
    Key([mod, "control"], "k",
        lazy.prev_screen()
    ),
    # Layout
    Key(
        [mod], "Tab", 
        lazy.next_layout()
    ),
    Key(
        [mod], "j", 
        lazy.layout.down()
    ),
    Key(
        [mod], "k", 
        lazy.layout.up()
        ),
    Key(
        [mod, "shift"], "j",
        lazy.layout.shuffle_down()
    ),
    Key(
        [mod, "shift"], "k", 
        lazy.layout.shuffle_up()
    ),
    Key(
        [mod], "space", 
        lazy.layout.next() # Switch to next contextual window
    ),
    Key(
        [mod, "shift"], "space", 
        lazy.layout.rotate(), # Swap panes (Stack)
        lazy.layout.flip()    # Switch master side (MonadTall, MonadWide)
    ),
    Key(
        [mod, "shift"], "Return", 
        lazy.layout.toggle_split() 
    ),
    Key(
        [mod], "h",
        lazy.layout.shrink(),           # Shrink size of current window (MonadTall, MonadWide)
        lazy.layout.decrease_nmaster(), # Decrease number in master pane (Tile)
    ),
    Key(
        [mod], "l",
        lazy.layout.grow(),             # Grow size of current window (MonadTall, MonadWide)
        lazy.layout.increase_nmaster(), # Increase number in master pane (Tile)
    ),
    Key(
         [mod], "n",
         lazy.layout.normalize() # Restore all windows to default size ratios 
    ),
    Key(
        [mod], "m",
        lazy.layout.maximize(),    # Toggle a window between minimum and maximum sizes (MonadTall, ModalWide)
        lazy.layout.toggle_split() # Toggle between split and unsplit (Stack)
    ),
    Key(
        [mod], "f",
        lazy.window.toggle_fullscreen(), # Toggle window fullscreen
    ),
    # Application
    Key(
        [mod], "r", lazy.spawncmd()
    ),
    Key(
        [mod], "Return", 
        lazy.spawn("alacritty")
    ),
]

groups = [Group(name, **kwargs) for name, kwargs in [
    ("u", {
        "label": "dev",
        "layout": "max",
        "layouts": [layout.MonadTall(), layout.Max()],
    }),
    ("i", {
        "label": "sys",
        "layout": "monadtall",
        "layouts": [layout.MonadTall(), layout.MonadWide()],
        "spawn": ["alacritty", "alacritty"]
    }),
    ("o", {
        "label": "www",
        "layout": "max",
        "layouts": [layout.Max()],
        "spawn": ["qutebrowser"]
    }),
    ("m", {
        "label": "cht",
        "layout": "max",
        "layouts": [layout.Max(), layout.MonadTall(), layout.MonadWide()],
    }),
    ("n", {
        "label": "etc",
        "layout": "monadtall",
        "layouts": [layout.Stack(), layout.MonadTall(), layout.MonadWide()],
    }),
    #("0", {
    #    "label": "mus",
    #    "layout": "max",
    #    "layouts": [layout.Max()],
    #    "spawn": ["alacritty -e vimpc", "alacritty -e pulsemixer"]
    #}),
]]

for group in groups:
    keys.extend([
        Key([mod], group.name, lazy.group[group.name].toscreen()),
        Key([mod, "shift"], group.name, lazy.window.togroup(group.name))
    ])

layouts = [
    layout.Max(),
    layout.Stack(num_stacks=2),
    layout.MonadTall(),
]

widget_defaults = dict(
    font="monospace",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(),
    Screen(
        bottom = bar.Bar(
            [
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Systray(),
                widget.Notify(),
                widget.Clock(format="%Y-%m-%d %a %I:%M %p"),
            ],
            24,
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = [] # type: List
main = None
follow_mouse_focus = False
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    {"wmclass": "confirm"},
    {"wmclass": "dialog"},
    {"wmclass": "download"},
    {"wmclass": "error"},
    {"wmclass": "file_progress"},
    {"wmclass": "notification"},
    {"wmclass": "splash"},
    {"wmclass": "toolbar"},
    {"wmclass": "confirmreset"}, # gitk
    {"wmclass": "makebranch"}, # gitk
    {"wmclass": "maketag"}, # gitk
    {"wname": "branchdialog"}, # gitk
    {"wname": "pinentry"}, # GPG key password entry
    {"wmclass": "ssh-askpass"}, # ssh-askpass
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We"re lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn"t work correctly. We may as well just lie
# and say that we"re a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java"s whitelist.
wmname = "LG3D"
