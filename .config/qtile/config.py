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
    Key(
        [mod, "control"], "j",
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
        [mod, "shift"], "Return", 
        lazy.layout.toggle_split() 
    ),
    Key(
        [mod], "h",
        lazy.layout.shrink_main(),
    ),
    Key(
        [mod], "l",
        lazy.layout.grow_main(),
    ),
    # Application
    Key(
        [mod], "r",
        lazy.spawncmd()
    ),
    Key(
        [mod], "Return", 
        lazy.spawn("alacritty")
    ),
]

colors = {
    "background": "282c34",
    "foreground": "abb2bf",
    "focused": "528bff",
    "unfocused": "3e4451",
    "urgent": "e06c75",
}

layouts = {
    "tall": layout.MonadTall(border_normal = colors["unfocused"], border_focus = colors["focused"]),
    "wide": layout.MonadWide(border_normal = colors["unfocused"], border_focus = colors["focused"]),
    "max": layout.Max()
}

groups = [Group(name, **kwargs) for name, kwargs in [
    ("u", {
        "label": "dev",
        "layout": "max",
        "layouts": [layouts["tall"], layouts["max"]],
    }),
    ("i", {
        "label": "sys",
        "layout": "monadtall",
        "layouts": [layouts["tall"], layouts["wide"]],
        "spawn": ["alacritty", "alacritty"]
    }),
    ("o", {
        "label": "www",
        "layout": "max",
        "layouts": [layouts["max"]],
        "spawn": ["qutebrowser"]
    }),
    ("m", {
        "label": "cht",
        "layout": "max",
        "layouts": [layouts["max"], layouts["tall"], layouts["wide"]],
        "spawn": []
    }),
    ("n", {
        "label": "etc",
        "layout": "monadtall",
        "layouts": [layouts["tall"], layouts["wide"]],
    }),
    #("0", {
    #    "label": "mus",
    #    "layout": "max",
    #    "layouts": [layouts["max"]],
    #    "spawn": ["alacritty -e vimpc", "alacritty -e pulsemixer"]
    #}),
]]

for group in groups:
    keys.extend([
        Key([mod], group.name, lazy.group[group.name].toscreen()),
        Key([mod, "shift"], group.name, lazy.window.togroup(group.name))
    ])

widget_defaults = dict(
    font="monospace",
    fontsize=12,
    padding=3,
)
screens = [
    Screen(),
    Screen(
        bottom = bar.Bar(
            [
                widget.GroupBox(
                    highlight_method = "text",
                    active = colors["unfocused"],
                    inactive = colors["unfocused"],
                    this_current_screen_border = colors["focused"],
                    urgent_text = colors["urgent"],
                ),
                widget.Prompt(foreground = colors["foreground"]),
                widget.WindowName(foreground = colors["foreground"]),
                widget.Systray(),
                widget.Notify(foreground = colors["foreground"]),
                widget.Clock(foreground = colors["foreground"], format="%Y-%m-%d %a %I:%M %p"),
            ],
            24,
            background = colors["background"],
            foreground = colors["foreground"],
        ),
    ),
]

follow_mouse_focus = False
cursor_warp = True
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]
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

# XXX: Gasp! We"re lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn"t work correctly. We may as well just lie
# and say that we"re a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java"s whitelist.
wmname = "LG3D"
