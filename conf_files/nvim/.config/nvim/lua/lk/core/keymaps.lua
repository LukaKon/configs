vim.g.mapleader = ' '

local keymap = vim.keymap  -- for conciseness

-- general keymaps
keymap.set({'v', 'n'}, '<Space>', '<Nop>', {silent = true})

keymap.set('i', 'jk', '<ESC>')

keymap.set('n', '<leader>nh', ':nohl<CR>')  -- deselect after search

keymap.set('n', 'x', '"_x')  -- delete single character without copying it to a register

keymap.set('n', '<leader>+', '<C-a>')  -- increment
keymap.set('n', '<leaces>-', '<C-x>')  -- decrement

keymap.set('n', '<leader>sv', '<C-w>v')  -- split window vertically
keymap.set('n', '<leader>sh', '<C-w>s')  -- split window horizontally
keymap.set('n', '<leader>se', '<C-w>=')  -- make split windows equal width
keymap.set('n', '<leader>sx', ':close<CR>')  -- close current split window

keymap.set('n', '<leader>to', ':tabnew<CR>')  -- open new tab
keymap.set('n', '<leader>tx', ':tabclose<CR>')  -- close current tab
keymap.set('n', '<leader>tn', ':tabn<CR>')  -- go to next tab
keymap.set('n', '<leader>tp', ':tabp<CR>')  -- go to previous tab

keymap.set('n', 'gn', ':bNext<CR>') -- go to next buffer
keymap.set('n', 'gp', ':bprevious<CR>') -- go to previous buffer



-- plugin keymaps

-- vim-maximizer
keymap.set('n', '<leader>sm', ':MaximizerToggle<CR>')

-- nvim-tree
-- keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

-- telescope
-- keymap.set('n', '<leader>f', '<cmd>Telescope find_files<cr>')
-- keymap.set('n', '<leader>s', '<cmd>Telescope live_grep<cr>')
-- keymap.set('n', '<leader>c', '<cmd>Telescope grep_string<cr>')
-- keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>')
-- keymap.set('n', '<leader>h', '<cmd>Telescope help_tags<cr>')
-- keymap.set('n', '<leader>th', '<cmd> Telescope find_files hidden=true<cr>')

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
