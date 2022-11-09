require('lk.plugins-setup')
require('lk.core.options')
require('lk.core.keymaps')
require('lk.core.colorscheme')
require('lk.plugins.comment')
require('lk.plugins.nvim-tree')
require('lk.plugins.lualine')
require('lk.plugins.nvim-cmp')
require('lk.plugins.lsp.mason')

-- telescope at the end because generate error 'fzf'
require('lk.plugins.telescope')
