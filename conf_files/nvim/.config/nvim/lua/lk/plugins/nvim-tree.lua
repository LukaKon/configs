local setup, nvimtree = pcall(require, 'nvim-tree')
if(not setup)
then
  print('nvim-tree not found')
  return
end

-- recomended settings from nvim-tree documentation
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- color for arrows in file tree defined in setup (below)
vim.cmd([[ highlight NvimTreeIndentMarker guifg=#81B622 ]])

nvimtree.setup({
  view = {
    adaptive_size = true,
    centralize_selection = false,
    width = 50,
    side = 'right',  -- default left
    number = true,
    relativenumber = true,
    -- signcolumn = "yes",
    float = {
      enable = true,  -- default false
      quit_on_focus_loss = true,  -- default true
      open_win_config = {
       border = 'rounded', 
      },
    },
  },
  -- change folder arrow icons
	renderer = {
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
        },
      },
    },
  },
  -- disable window_picker for
  -- explorer to work well with
  -- window splits
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },
})
