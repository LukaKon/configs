local opt = vim.opt -- for conciseness

-- line number
opt.relativenumber = true
opt.number = true

-- tabs & indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true  -- default off

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true
opt.wildignore:append {'*/node_modules/*'}

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.winblend = 15 -- transparency 0-100
opt.wildoptions = "pum"

-- backspace
opt.backspace = "indent,eol,start"

-- clipboard
opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-") -- consider '-' as a part of word: 'test-test' as a one word

-- minimal lines below or under cursor
opt.scrolloff = 5

-- mouse
opt.mouse = 'a'

opt.inccommand = 'split'
