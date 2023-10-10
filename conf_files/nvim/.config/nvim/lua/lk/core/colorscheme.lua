-- local status, nightfox = pcall(require, 'nightfox')
local status, gruvbox = pcall(require,'gruvbox')
if(not status)
then
  print('Coloscheme not found!')
  return
end

gruvbox.setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "soft", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = true,  -- false
  transparent_mode = false,
})

vim.cmd('colorscheme gruvbox')
-- nightfox.setup({
--   palettes = {
--     nordfox = {
--       -- A palette also defines the following:
--       --   bg0, bg1, bg2, bg3, bg4, fg0, fg1, fg2, fg3, sel0, sel1, comment
--       --
--       -- These are the different foreground and background shades used by the theme.
--       -- The base bg and fg is 1, 0 is normally the dark alternative. The others are
--       -- incrementally lighter versions.
--       bg1 = "#2e3440",

--       -- sel is different types of selection colors.
--       sel0 = "#3e4a5b", -- Popup bg, visual selection bg
--       sel1 = "#4f6074", -- Popup sel bg, search bg

--       -- comment is the definition of the comment color.
--       comment = "#60728a",
--     },
--   },
-- })

-- vim.cmd('colorscheme nightfox')
