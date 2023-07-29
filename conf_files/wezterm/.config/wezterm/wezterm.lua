local wezterm = require 'wezterm'
local config = {}

-- config.color_scheme = 'Batman'
config.color_scheme = 'Gruvbox dark, medium (base16)'

-- config.font = wezterm.font('JetBrains Mono', {weight="Bold"})
-- config.font = wezterm.font({
--   family = 'Fira Code',
--   weight = "Black",
--   stretch = "Normal"
-- })
-- config.font = wezterm.font('SauceCodePro Nerd Font', {weight="Regular"})
config.font = wezterm.font('Overpass Regular Nerd Font Complete', { weight = "Regular" })
-- config.font = wezterm.font('Overpass Nerd Font Mono', {weight="Regular"})

config.window_background_opacity = 0.8

return config
