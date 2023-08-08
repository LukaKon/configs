local wezterm = require 'wezterm'
local config = {}

-- config.color_scheme = 'Batman'
config.color_scheme = 'Gruvbox dark, medium (base16)'

-- config.font = wezterm.font('JetBrains Mono', {weight="Bold"})
-- config.font = wezterm.font({
--   family = 'Fira Code',
--   weight = "Regular",
--   stretch = "Normal"
-- })
config.font = wezterm.font({family = 'Symbols Nerd Font', weight = 'Regular'})
-- config.font = wezterm.font('SauceCodePro Nerd Font', {weight="Regular"})
-- config.font = wezterm.font('Overpass Regular Nerd Font Complete', { weight = "Regular" })
-- config.font = wezterm.font('Overpass Nerd Font Mono', {weight="Regular"})

config.window_background_opacity = 0.8

config.tab_max_width = 16
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

return config
