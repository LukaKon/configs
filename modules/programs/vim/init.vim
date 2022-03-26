" "*****************************************************************************
" "" Vim-Plug core
" "*****************************************************************************
" let vimplug_exists=expand('~/.vim/autoload/plug.vim')
" if has('win32')&&!has('win64')
"   let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
" else
"   let curl_exists=expand('curl')
" endif

" let g:vim_bootstrap_langs = "html,javascript,python,typescript"
" let g:vim_bootstrap_editor = "vim"				" nvim or vim
" let g:vim_bootstrap_theme = "gruvbox"

" if !filereadable(vimplug_exists)
"   if !executable(curl_exists)
"     echoerr "You have to install curl or first install vim-plug yourself!"
"     execute "q!"
"   endif
"   echo "Installing Vim-Plug..."
"   echo ""
"   silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
"   let g:not_finish_vimplug = "yes"

"   autocmd VimEnter * PlugInstall
" endif

" " Required:
" call plug#begin(expand('~/.vim/plugged'))

" "*****************************************************************************
" "" Plug install packages
" "*****************************************************************************
" Plug 'scrooloose/nerdtree'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'tpope/vim-commentary'
" Plug 'tpope/vim-fugitive'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
" Plug 'airblade/vim-gitgutter'
" Plug 'vim-scripts/grep.vim'
" Plug 'vim-scripts/CSApprox'
" Plug 'Raimondi/delimitMate'
" Plug 'majutsushi/tagbar'
" Plug 'dense-analysis/ale'
" Plug 'Yggdroot/indentLine'
" Plug 'editor-bootstrap/vim-bootstrap-updater'
" Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
" Plug 'morhetz/gruvbox'

" if isdirectory('/usr/local/opt/fzf')
"   Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
" else
"   Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
"   Plug 'junegunn/fzf.vim'
" endif
" let g:make = 'gmake'
" if exists('make')
"         let g:make = 'make'
" endif
" Plug 'Shougo/vimproc.vim', {'do': g:make}

" "" Vim-Session
" Plug 'xolox/vim-misc'
" Plug 'xolox/vim-session'

" "" Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

" "*****************************************************************************
" "" Custom bundles
" "*****************************************************************************

" " html
" "" HTML Bundle
" Plug 'hail2u/vim-css3-syntax'
" Plug 'gko/vim-coloresque'
" Plug 'tpope/vim-haml'
" Plug 'mattn/emmet-vim'


" " javascript
" "" Javascript Bundle
" Plug 'jelera/vim-javascript-syntax'


" " python
" "" Python Bundle
" Plug 'davidhalter/jedi-vim'
" Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}


set tw=80
set iskeyword+=-                        " treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments

set nocompatible                        " Disable compatibility with vi which can cause unexpected issues.

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Do not wrap lines. Allow long lines to extend as far as the line goes.
set whichwrap+=<,>,[,],h,l
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                               " Show the cursor position all the time
set showcmd                             " show current command in status line
set showmode                            " Show partial command you type in the last line of the screen.
set showmatch                           " Show matching words during a search.
set hlsearch                            " Use highlighting when doing a search.
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
set ignorecase                          " Ignore capital letters during search.
set smartcase                           " Override the ignorecase option if searching for capital letters.
                                        " This will allow you to search specifically for capital letters.
set softtabstop=4                       " Set tab width to 4 columns.
set expandtab                           " Use space characters instead of tabs.
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set completeopt=menuone,noinsert,noselect
set laststatus=2                        " Always display the status line
set number relativenumber               " Line numbers
set cursorline                          " Highlight cursor line underneath the cursor horizontally.
" set cursorcolumn                        " Highlight cursor line underneath the cursor vertically.
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
set nobackup                            " Do not save backup files. This is recommended by coc
set noswapfile
set history=1000                        " Set the commands to save in history default number is 20.
" set undodir=~/.vim/undodir
" set undofile
set nowritebackup                       " This is recommended by coc
set scrolloff=8                         " keep 8 lines visible above/below the cursor when scrolling
set sidescrolloff=7                     " keep 7 characters visible to the left/right of the cursor when scrolling
set sidescroll=1                        " scroll left/right one character at a time
set splitbelow splitright               " put new windows below or to the right
set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set updatetime=300                      " Faster completion
set timeoutlen=100                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
" set incsearch                           " While searching though a file incrementally highlight matching characters as you type.
set guifont=Fira\ Code\ Nerd\ Font
set diffopt+=vertical

set wildmenu                            " Enable auto completion menu after pressing TAB.
set wildmode=list:longest               " Make wildmenu behave like similar to Bash completion.

" darker for python settings
" set autoread
" autocmd BufWritePost *.py silent :!darker %

filetype on                             " Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype plugin on                      " Enable plugins and load plugin for the detected file type.
filetype plugin indent on               " Load an indent file for the detected file type.

colorscheme gruvbox
" highlight Normal guibg=none

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

" map leader
let mapleader=" "                               " set <space> as the leader for mappings
" nnoremap <space> <nop>

let g:ctrlp_map = '<leader>jf'                  " open ctrl-p fuzzy finder (mnemonic: 'jump file')
nnoremap <Leader>jt :CtrlPTag<CR>
nnoremap <Leader>jb :CtrlPBuffer<CR>
nnoremap <Leader>jj <c-]>

let g:any_jump_disable_default_keybindings = 1  " open AnyJump (mnemonic: 'jump definition')
nnoremap <leader>jd :AnyJump<CR>
xnoremap <leader>jd :AnyJumpVisual<CR>


" vim-autoformat
noremap <F3> :Autoformat<CR>
" format on save
au BufWrite * :Autoformat

" auto format code
au BufWrite *.py,*.c,*.h,*.cpp,*.hpp,*.js :ALEFix
au User ALEFixPost :w
let g:ale_linters = { 'c': ['clangd'], 'cpp': ['clangd'], 'py' : ['black','isort','flake8', 'pylint'], 'javascript':['eslint'] }
let g:ale_fixers = { 'c': ['clang-format'], 'cpp': ['clang-format'], 'javascript': ['prettier'], 'python': ['autopep8', 'yapf'] }
let g:prettier#exec_cmd_async = 1

" NERDTree--------------------------------------------------
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

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

"-----------------------------------------------------------


"FZF-VIM----------------------------------------------------
let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" command! -bang -nargs=? -complete=dir Files
    " \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
"end FZF-VIM-----------------------------------------------------------


" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

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


" commenting
nnoremap <space>/ :Commentary<CR>
vnoremap <space>/ :Commentary<CR>

" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}