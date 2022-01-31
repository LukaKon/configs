local set = vim.opt

-- set.mapleader = ' '
-- vim.g.mapleader = ' '
-- set.termguicolors=true

set.tw=80
-- print('tw: ',set.tw)

--Make line numbers default
set.relativenumber = true

--Set highlight on search
set.hlsearch = false

--Enable mouse mode
set.mouse = 'a'

--Enable break indent
set.breakindent = true

--Save undo history
set.undofile = true
set.undodir = "/home/lk/.cache/"

--Case insensitive searching UNLESS /C or capital in search
set.ignorecase = true
set.smartcase = true

--Decrease update time / faster completion
set.updatetime = 250
set.signcolumn = 'yes'
set.timeoutlen=100  -- By default timeoutlen is 1000 ms

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.gruvbox_terminal_italics = 2
vim.cmd [[colorscheme gruvbox]]

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })


-- vim.cmd "set whichwrap+=<,>,[,],h,l"
-- vim.cmd [[set iskeyword+=-]]
-- vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work