local wezterm = require 'wezterm'
local config = {}

-- config.color_scheme = 'Batman'
config.color_scheme = 'Gruvbox dark, medium (base16)'

-- config.font = wezterm.font('JetBrains Mono', {weight="Bold"})
config.font = wezterm.font({
  -- family = 'Inconsolata Nerd Font Mono',
  -- family = 'Iosevka Nerd Font Mono',
  -- family = 'FiraCode Nerd Font Mono',
  family = 'FiraCode Nerd Font Mono',
  weight = "Regular",
  stretch = "Normal",
  style = 'Normal',
})
config.font_size = 12.0

config.window_background_opacity = 0.8

config.tab_max_width = 16
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true

config.leader = {
  key = 'a',
  mods = 'CTRL',
  timeout_milliseconds = 1000,
}
config.keys = {
  {
    key = '\\',
    mods = 'LEADER',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  {
    key = '-',
    mods = 'LEADER',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  {
    key = 'w',
    mods = 'LEADER',
    action = wezterm.action.CloseCurrentTab { confirm = true },
  },
  {
    key = 'P',
    mods = 'CTRL',
    action = wezterm.action.ActivateCommandPalette,
  },
}

return config
