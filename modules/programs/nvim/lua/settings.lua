-- local opt = vim.opt
local set = vim.opt

set.mapleader = ' '
-- vim.g.mapleader=' '

set.tw=80
print('tw: ',set.tw)

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
