local opt = vim.opt
-- local o = vim.o
-- local wo = vim.wo
-- local bo = vim.bo

opt.hidden = true -- Required to keep multiple buffers open multiple buffers ???
opt.wrap = false -- Display long lines as just one line - (wo)
opt.showcmd = true    -- show current command in status line
-- o.encoding = 'utf-8'    -- The encoding displayed
-- o.fileencoding = 'utf-8'    -- The encoding written to file
opt.ruler = true  -- Show the cursor position all the time
opt.tabstop = 4   -- Insert 4 spaces for a tab
-- opt.tabstop = 4   -- Insert 4 spaces for a tab - (bo)
opt.softtabstop = 4
-- opt.softtabstop = 4 -- (bo)
opt.shiftwidth = 4    -- Change the number of space characters inserted for indentation
-- opt.shiftwidth = 4    -- Change the number of space characters inserted for indentation - (bo)
opt.autoindent = true -- Good auto indent
-- opt.autoindent = true -- Good auto indent - (bo)
opt.expandtab = true  -- Converts tabs to spaces
-- opt.expandtab = true  -- Converts tabs to spaces - (bo)
opt.smartindent = true    -- Makes indenting smart
-- opt.smartindent = true    -- Makes indenting smart - (bo)
opt.splitright = true -- Vertical splits will automatically be to the right
opt.splitbelow = true -- Horizontal splits will automatically be below
opt.scrolloff = 5 -- keep 5 lines visible above/below the cursor when scrolling
opt.sidescrolloff = 5 -- keep 5 characters visible to the left/right of the cursor when scrolling
opt.sidescroll = 1    -- scroll left/right 1 character at a time

opt.number = true    -- line number - (wo)
opt.relativenumber = true    -- relative line number - (wo)



opt.background = 'dark'   -- tell vim what the background color looks like

opt.completeopt = 'menuone,noinsert,noselect' -- TODO - completion error
-- opt.ttimeoutlen = 5
opt.undofile = true
opt.undodir = "/home/lk/.cache/"
-- opt.compatible = false
opt.cursorline = true
opt.termguicolors = true
opt.mouse = "a"
-- opt.autoread = true
-- opt.smartindent = true
-- opt.clipboard = "unnamedplus"
opt.smartcase = true
-- opt.shiftwidth = 4
-- opt.expandtab = true
-- opt.incsearch = true
-- opt.viminfo = ""
-- opt.viminfofile = "NONE"
-- opt.hidden = true
-- opt.shortmess = "I"

vim.cmd('language en_US.utf-8')
