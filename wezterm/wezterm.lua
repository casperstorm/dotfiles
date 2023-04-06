local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Kanagawa (Gogh)'
config.font = wezterm.font 'Iosevka Term'
config.font_size = 13.0
config.window_decorations = "RESIZE"

config.window_frame = {
    font = wezterm.font {
        family = 'Iosevka Term',
        weight = 'Bold'
    },
    font_size = 12.0
}

config.keys = {{
    key = 'LeftArrow',
    mods = 'CTRL',
    action = wezterm.action.SplitPane {
        direction = 'Left'
    }
}, {
    key = 'k',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitPane {
        direction = 'Up'
    }
}, {
    key = 'l',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitPane {
        direction = 'Right'
    }
}, {
    key = 'h',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitPane {
        direction = 'Left'
    }
}, {
    key = 'j',
    mods = 'CTRL|SHIFT',
    action = wezterm.action.SplitPane {
        direction = 'Down'
    }
}, {
    key = 'w',
    mods = 'CTRL',
    action = wezterm.action.CloseCurrentPane {
        confirm = true
    }
}, {
    key = 'h',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Left'
}, {
    key = 'j',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Down'
}, {
    key = 'k',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Up'
}, {
    key = 'l',
    mods = 'CTRL',
    action = wezterm.action.ActivatePaneDirection 'Right'
}}

return config
