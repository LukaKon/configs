lua <<EOF
--require'nvim-treesitter.configs'.setup {
--    highlight = {
--    enable = true,
--    custom_captures = {
--        -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
--        --["javascript","css","c_sharp","cmake","cpp","dockerfile","html","json","latex","lua","nix","python","toml","vim","yaml"]="Identifier",
--        --["foo.bar"] = "Identifier",
--        },
--    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
--    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
--    -- Using this option may slow down your editor, and you may see some duplicate highlights.
--    -- Instead of true it can also be a list of languages
--    additional_vim_regex_highlighting = false,
--    },
--}
-- local opt = vim.opt
--local o = vim.o -- global options
--local wo = vim.wo -- window-local options
--local bo = vim.bo -- buffer-local options


--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.relativenumber = true

--Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true
vim.opt.undodir = "/home/lk/.cache/"

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time / faster completion
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
vim.o.timeoutlen=100  -- By default timeoutlen is 1000 ms

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.g.gruvbox_terminal_italics = 2
vim.cmd [[colorscheme gruvbox]]

--Set statusbar
vim.g.lightline = {
    colorscheme = 'gruvbox-community',
    active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
    component_function = { gitbranch = 'fugitive#head' },
    }

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

--Remap for dealing with word wrap
--vim.api.nvim_set_keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { noremap = true, expr = true, silent = true })
--vim.api.nvim_set_keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { noremap = true, expr = true, silent = true })

-- Highlight on yank
--vim.api.nvim_exec(
--[[
--augroup YankHighlight
--    autocmd!
--    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
--augroup end
--]],
--  false
--  )

-- Y yank until the end of line  (note: this is now a default on master)
vim.api.nvim_set_keymap('n', 'Y', 'y$', { noremap = true })

--Map blankline
vim.g.indent_blankline_char = '┊'
vim.g.indent_blankline_filetype_exclude = { 'help', 'packer' }
vim.g.indent_blankline_buftype_exclude = { 'terminal', 'nofile' }
vim.g.indent_blankline_char_highlight = 'LineNr'
vim.g.indent_blankline_show_trailing_blankline_indent = false

-- Gitsigns
--require('gitsigns').setup {
--    signs = {
--        add = { hl = 'GitGutterAdd', text = '+' },
--        change = { hl = 'GitGutterChange', text = '~' },
--        delete = { hl = 'GitGutterDelete', text = '_' },
--        topdelete = { hl = 'GitGutterDelete', text = '‾' },
--        changedelete = { hl = 'GitGutterChange', text = '~' },
--        },
--    }

-- Telescope
--require('telescope').setup {
--    defaults = {
--        mappings = {
--            i = {
--                ['<C-u>'] = false,
--                ['<C-d>'] = false,
--                },
--            },
--        },
--    }

--Add leader shortcuts
--vim.api.nvim_set_keymap('n', '<leader><space>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>sf', [[<cmd>lua require('telescope.builtin').find_files({previewer = false})<CR>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>sb', [[<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>sh', [[<cmd>lua require('telescope.builtin').help_tags()<CR>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>st', [[<cmd>lua require('telescope.builtin').tags()<CR>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>sd', [[<cmd>lua require('telescope.builtin').grep_string()<CR>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>sp', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>so', [[<cmd>lua require('telescope.builtin').tags{ only_current_buffer = true }<CR>]], { noremap = true, silent = true })
--vim.api.nvim_set_keymap('n', '<leader>?', [[<cmd>lua require('telescope.builtin').oldfiles()<CR>]], { noremap = true, silent = true })

-- Treesitter configuration
-- Parsers must be installed manually via :TSInstall
--require('nvim-treesitter.configs').setup {
--    highlight = {
--    enable = true, -- false will disable the whole extension
--    },
--incremental_selection = {
--enable = true,
--keymaps = {
--    init_selection = 'gnn',
--    node_incremental = 'grn',
--    scope_incremental = 'grc',
--    node_decremental = 'grm',
--    },
--},
--  indent = {
--  enable = true,
--  },
--  textobjects = {
--      select = {
--      enable = true,
--      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
--      keymaps = {
--          -- You can use the capture groups defined in textobjects.scm
--          ['af'] = '@function.outer',
--          ['if'] = '@function.inner',
--          ['ac'] = '@class.outer',
--          ['ic'] = '@class.inner',
--          },
--      },
--  move = {
--  enable = true,
--  set_jumps = true, -- whether to set jumps in the jumplist
--  goto_next_start = {
--      [']m'] = '@function.outer',
--      [']]'] = '@class.outer',
--      },
--  goto_next_end = {
--      [']M'] = '@function.outer',
--      [']['] = '@class.outer',
--      },
--  goto_previous_start = {
--      ['[m'] = '@function.outer',
--      ['[['] = '@class.outer',
--      },
--  goto_previous_end = {
--      ['[M'] = '@function.outer',
--      ['[]'] = '@class.outer',
--      },
--  },
--  },
--}

--bo.tw = 80
--bo.iskeyword +=- -- treat dash separated words as a word text object
--bo.formatoptions-=cro -- stop newline continution of comment
--wo.foldhethod=expr
--wo.foldexpr=nvim_treesitter#foldexpr()
--
--o.hidden = true -- Required to keep multiple buffers open multiple buffers ???
--wo.wrap = false -- Display long lines as just one line - (wo)
--o.showcmd = true    -- show current command in status line
--o.whichwrap+=<,>,[,],h,l
--o.pumneight=8 -- Makes popup menu smaller
--o.encoding = 'utf-8'    -- The encoding displayed
--ob.fileencoding = 'utf-8'    -- The encoding written to file

-- opt.ruler = true  -- Show the cursor position all the time
-- opt.tabstop = 4   -- Insert 4 spaces for a tab
-- -- opt.tabstop = 4   -- Insert 4 spaces for a tab - (bo)
-- opt.softtabstop = 4
-- -- opt.softtabstop = 4 -- (bo)
-- opt.shiftwidth = 4    -- Change the number of space characters inserted for indentation
-- -- opt.shiftwidth = 4    -- Change the number of space characters inserted for indentation - (bo)
-- opt.autoindent = true -- Good auto indent
-- -- opt.autoindent = true -- Good auto indent - (bo)
-- opt.expandtab = true  -- Converts tabs to spaces
-- -- opt.expandtab = true  -- Converts tabs to spaces - (bo)
-- opt.smartindent = true    -- Makes indenting smart
-- -- opt.smartindent = true    -- Makes indenting smart - (bo)
-- opt.splitright = true -- Vertical splits will automatically be to the right
-- opt.splitbelow = true -- Horizontal splits will automatically be below
-- opt.scrolloff = 5 -- keep 5 lines visible above/below the cursor when scrolling
-- opt.sidescrolloff = 5 -- keep 5 characters visible to the left/right of the cursor when scrolling
-- opt.sidescroll = 1    -- scroll left/right 1 character at a time




-- opt.background = 'dark'   -- tell vim what the background color looks like

-- -- opt.completeopt = 'menuone,noinsert,noselect' -- TODO - in lsp.lua but without noinsert
-- -- opt.ttimeoutlen = 5
-- opt.undofile = true
-- opt.undodir = "/home/lk/.cache/"
-- -- opt.compatible = false
-- opt.cursorline = true
-- opt.termguicolors = true
-- -- opt.autoread = true
-- -- opt.smartindent = true
-- -- opt.clipboard = "unnamedplus"
-- opt.smartcase = true
-- -- opt.shiftwidth = 4
-- -- opt.expandtab = true
-- -- opt.incsearch = true
-- -- opt.viminfo = ""
-- -- opt.viminfofile = "NONE"
-- -- opt.hidden = true
-- -- opt.shortmess = "I"

-- vim.cmd('language en_US.utf-8')
-- require('settings')
EOF



" set tw=80
" set iskeyword+=-                        " treat dash separated words as a word text object"
" set formatoptions-=cro                  " Stop newline continution of comments

" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()

syntax enable                           " Enables syntax highlighing
" set hidden                              " Required to keep multiple buffers open multiple buffers
" set nowrap                              " Display long lines as just one line
" set showcmd                             " show current command in status line
" set whichwrap+=<,>,[,],h,l
" set encoding=utf-8                      " The encoding displayed
" set pumheight=10                        " Makes popup menu smaller
" set fileencoding=utf-8                  " The encoding written to file
set ruler                               " Show the cursor position all the time
set showcmd                             " show current command in status line
set notimeout                           " disable timeout for finishing a mapping key sequence
set visualbell                          " visual bell = no sounds
set cmdheight=1                         " More space for displaying messages
" set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4                           " Insert 4 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
" set ignorecase
" set smartcase
set softtabstop=4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set completeopt=menuone,noinsert,noselect
set laststatus=2                        " Always display the status line
set number relativenumber               " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set nobackup                            " This is recommended by coc
set noswapfile
" set undodir=~/.vim/undodir
" set undofile
set nowritebackup                       " This is recommended by coc
set scrolloff=8                         " keep 8 lines visible above/below the cursor when scrolling
set sidescrolloff=7                     " keep 7 characters visible to the left/right of the cursor when scrolling
set sidescroll=1                        " scroll left/right one character at a time
set splitbelow splitright               " put new windows below or to the right
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
" set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
" set updatetime=300                      " Faster completion
set timeoutlen=100                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
set incsearch
set guifont=Fira\ Code\ Nerd\ Font
set diffopt+=vertical


filetype plugin indent on

" colorscheme gruvbox
highlight Normal guibg=none


let g:yankring_clipboard_monitor=0              " don't worry about the system clipboard, thanks YankRing
let g:yankring_n_keys = 'Y D'                   " by default: 'Y D x X', but I don't like x and X adding chars to my yank history
nnoremap x "_x
nnoremap X "_X

" let mapleader=" "                               " set <space> as the leader for mappings
" nnoremap <space> <nop>

let g:ctrlp_map = '<leader>jf'                  " open ctrl-p fuzzy finder (mnemonic: 'jump file')
nnoremap <Leader>jt :CtrlPTag<CR>
nnoremap <Leader>jb :CtrlPBuffer<CR>
nnoremap <Leader>jj <c-]>

let g:any_jump_disable_default_keybindings = 1  " open AnyJump (mnemonic: 'jump definition')
nnoremap <leader>jd :AnyJump<CR>
xnoremap <leader>jd :AnyJumpVisual<CR>

" if has("nvim")
"     set inccommand=nosplit                        " show substitutions incrementally
" endif

" restore last line position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


let g:markdown_fenced_languages = ['javascript','js=javascript', 'json=javascript', 'python', 'vim', 'sh', 'bash=sh', 'shell=sh', ]

nmap <leader>gj :diffget //3<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gs :G<CR>

" coc
" press <esc> to cancel.
nmap f <Plug>(coc-smartf-forward)
nmap F <Plug>(coc-smartf-backward)
nmap ; <Plug>(coc-smartf-repeat)
nmap , <Plug>(coc-smartf-repeat-opposite)

let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-python']

" integrated terminal
" open new split panes to right and below
"set splitright
"set splitbelow
" turn terminal to normal mode with escape
"tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
"au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
"function! OpenTerminal()
"  split term://bash
"    resize 10
"    endfunction
"    nnoremap <c-n> :call OpenTerminal()<CR>

" neoterm
" let g:neoterm_default_mod = 'vertical'
" let g:neoterm_size = 60
" let g:neoterm_autoinsert = 1
" nnoremap <c-q> :Ttoggle<CR>
" inoremap <c-q> <Esc> :Ttoggle<CR>
" tnoremap <c-q> <c-\><c-n> :Ttoggle<CR>

" vim-autoformat
noremap <F3> :Autoformat<CR>
" format on save
au BufWrite * :Autoformat

" auto format code
au BufWrite *.py,*.c,*.h,*.cpp,*.hpp,*.js :ALEFix
au User ALEFixPost :w
let g:ale_linters = { 'c': ['clangd'], 'cpp': ['clangd'], 'py' : ['flake8', 'pylint'] }
let g:ale_fixers = { 'c': ['clang-format'], 'cpp': ['clang-format'], 'javascript': ['prettier'], 'python': ['autopep8', 'yapf'] }
let g:prettier#exec_cmd_async = 1

" neoformat
" nnoremap <leader>F :Neoformat prettier<CR>
" Enable alignment
" let g:neoformat_basic_format_align = 1

" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

" deoplete
" let g:deoplete#enable_at_startup = 1

"jedi-vim
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" neomake
let g:neomake_python_enabled_makers = ['pylint']
" call neomake#configure#automake('nrwi', 500)


" fzf
nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
            \ 'ctrl-t': 'tab split',
            \ 'ctrl-s': 'split',
            \ 'ctrl-v': 'vsplit'
            \}

"nnoremap <leader><space> :GFiles<CR>
"nnoremap <leader>ff :Rg<CR>
"inoremap <expr> <c-x><c-f> "fzf#vim#complete#path(
"  \ "find . -path '*/\.*' -prune -o -print\| sed '1d;s:^..::'",
"  \ fzf#wrap({'dir':expand('%:p:h')}))
"if has('nvim')
"  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
"  au! FileType fzf tunmap <buffer> <Esc>
"endif

" fugitive
nnoremap <leader>gg :G<CR>

" NERDTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
            \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeGitStatusIndicatorMapCustom = {
            \ 'Modified'  :'✹',
            \ 'Staged'    :'✚',
            \ 'Untracked' :'✭',
            \ 'Renamed'   :'➜',
            \ 'Unmerged'  :'═',
            \ 'Deleted'   :'✖',
            \ 'Dirty'     :'✗',
            \ 'Ignored'   :'☒',
            \ 'Clean'     :'✔︎',
            \ 'Unknown'   :'?',
            \ }

let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0

augroup Smartf
    autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
    autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
augroup end

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" git setup
" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


" set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue


" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk


" If you like colors instead
" highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
" highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
" highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

" commenting
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>


" SimpylFold
" g:SimpylFold_docstring_preview = 0
" g:SimpylFold_fold_docstring    = 0
" b:SimpylFold_fold_docstring    = 0
" g:SimpylFold_fold_import       = 0
" b:SimpylFold_fold_import       = 0
" g:SimpylFold_fold_blank        = 0
" b:SimpylFold_fold_blank        = 0


" tagbar
nmap <F8> :TagbarToggle<CR>
