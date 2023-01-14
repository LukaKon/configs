local setup, toggleterm = pcall(require, 'toggleterm')
if(not setup)
then
  print('toggleterm not found')
  return
end

toggleterm.setup({
  size = 20,
  open_mapping = [[<C-/>]],
  hide_numbers = true,
  shade_filetypes = {},
  autochdir = true, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
  shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = true,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = 'float',  -- 'vertical' | 'horizontal' | 'tab' | 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell, -- change the default shell
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = 'single', -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    -- like `size`, width and height can be a number or function which is passed the current terminal
    width = 150,
    height = 80,
    winblend = 20,
    highlights = {
      border = 'Normal',
      background = 'Normal',
    },
  },
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-/><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-/><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal  = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = "lazygit",
  direction = "float",
  float_opts = {
    border = "shadow",
  },
  hidden = true,
})

function _lazygit_toggle()
  lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<C-g>", "<cmd>lua _lazygit_toggle()<CR>", {noremap = true, silent = true})


local lazydocker = Terminal:new({
  cmd = "lazydocker",
  direction = "float",
  float_opts = {
    border = "shadow",
  },
  hidden = true,
})

function _lazydocker_toggle()
  lazydocker:toggle()
end

vim.api.nvim_set_keymap("n", "<C-c>", "<cmd>lua _lazydocker_toggle()<CR>", {noremap = true, silent = true})
