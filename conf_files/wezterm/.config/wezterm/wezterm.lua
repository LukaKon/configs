local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then config = wezterm.config_builder() end

config.color_scheme = 'Gruvbox dark, medium (base16)'

config.font = wezterm.font_with_fallback({
  { family = "CaskaydiaCove Nerd Font", scale = 1.0 },
  { family = "FantasqueSansM Nerd Font", scale = 1.0 },
})
-- config.font = wezterm.font({
-- family = 'Inconsolata Nerd Font Mono',
-- family = 'Iosevka Nerd Font Mono',
-- family = 'FiraCode Nerd Font Mono',
-- family = 'FiraCode Nerd Font Mono',
-- weight = "Regular",
-- stretch = "Normal",
-- style = 'Normal',
-- })
config.font_size = 13.0

config.window_background_opacity = 0.8

config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 9000
config.default_workspace = "home"

config.tab_max_width = 16
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- Dim inactive panes
config.inactive_pane_hsb = {
  saturation = 0.6,
  brightness = 0.7,
}

config.leader = {
  key = 'a',
  mods = 'CTRL',
  timeout_milliseconds = 1000,
}
config.keys = {
  { key = '-', mods = 'LEADER', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' }, },
  { key = '\\', mods = 'LEADER', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = 'w', mods = 'LEADER', action = wezterm.action.CloseCurrentTab { confirm = true }, },
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },
  { key = "x", mods = "LEADER", action = act.CloseCurrentPane { confirm = true } },
  { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },
  { key = "s", mods = "LEADER", action = act.RotatePanes "Clockwise" },
  { key = 'P', mods = 'CTRL', action = wezterm.action.ActivateCommandPalette, },
}

return config
