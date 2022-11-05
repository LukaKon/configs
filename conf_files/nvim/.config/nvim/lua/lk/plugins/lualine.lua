local status, lualine = pcall(require, 'lualine')
if not status then
  return
end

local lualine_gbox = require('lualine.theme.gruvbox_dark')

local new_colors = {
  blue = "#65D1FF",
	green = "#3EFFDC",
	violet = "#FF61EF",
	yellow = "#FFDA7B",
	black = "#000000",
}

lualine_gbox.normal.a.bg = new_colors.blue
lualine_gbox.insert.a.bg = new_colors.green

lualine.setup()
