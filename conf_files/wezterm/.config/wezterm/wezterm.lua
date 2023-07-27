local wezterm = require 'wezterm'
local config = {}

-- config.color_scheme = 'Batman'
config.color_scheme = 'Gruvbox dark, medium (base16)'

-- config.font = wezterm.font('JetBrains Mono', {weight="Bold"})
config.font = wezterm.font('Fira Code', {weight="Bold", stretch="Normal"})
-- config.font = wezterm.font('Nerd Font', {weight="Bold"})

return config
