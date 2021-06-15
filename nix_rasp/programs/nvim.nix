{pkgs, ...}:

{
	environment = {
					variables = {EDITOR = "nvim"; VISUAL = "nvim";};
					systemPackages = with pkgs;[neovim-remote];
				};
	programs = {npm.enable = true;};

	nixpkgs = {
				config = {
					packageOverrides = pkgs: rec {
								neovim = pkgs.neovim.override {
									vimAlias = true;
									withPython3 = true;
									configure = {
										packages.myVimPackage = with
										pkgs.vimPlugins;
										{
											start = [
												# view
												vim-airline-themes
												vim-airline
												gruvbox-community

                                                # file explorer
                                                The_NERD_tree
                                                # nerdtree
                                                nerdtree-git-plugin
                                                vim-devicons
                                                vim-nerdtree-syntax-highlight
                                                vim-nerdtree-tabs
												fzf-vim
                                                # nvim-tree-lua
                                                # python-mode
                                                vim-multiple-cursors
                                                vim-commentary

                                                vim-autoformat

                                                # completion
                                                # nvim-lspconfig
                                                completion-nvim

												tabular
												syntastic
												vim-nix
												vim-python-pep8-indent
												vim-csharp
												neomake
												neoformat
                                                SimpylFold
                                                neoterm
                                                vim-javascript
                                                emmet-vim
                                                # coc-explorer
												coc-fzf
                                                coc-emmet
												coc-tabnine
												coc-python
												coc-html
												coc-nvim
												coc-yank
												coc-css
												coc-smartf
												coc-pairs
												coc-spell-checker
												coc-highlight
												# Change dates fast
												vim-speeddating
												# Repeat stuff
												vim-repeat
												# Text Navigation
												quick-scope
												# highlight all matches under cursor
												vim-illuminate
												# Better syntax support
												vim-polyglot
												# Auto pairs for '(' '[' '{'
												auto-pairs
												# Rainbow brackets
												rainbow_parentheses-vim
												# Start screen
												vim-startify
												vim-jinja
                                                vim-yapf
                                                jedi-vim

                                                nginx-vim

                                                unicode-vim
                                                # tagbar

												colorizer

												deoplete-zsh
												deoplete-jedi
												deoplete-nvim
												deoplete-clang
												deoplete-github
                                                deoplete-tabnine


												# git
												vim-gitgutter
                                                vim-gitbranch
												vim-signify
												vim-fugitive
												vim-rhubarb
												gv-vim
											];
											opt = [];
										};
										customRC = ''
											set tw=80
											set iskeyword+=-                     	" treat dash separated words as a word text object"
											set formatoptions-=cro                  " Stop newline continution of comments

											syntax enable                           " Enables syntax highlighing
											set hidden                              " Required to keep multiple buffers open multiple buffers
											set nowrap                              " Display long lines as just one line
											set whichwrap+=<,>,[,],h,l
											set encoding=utf-8                      " The encoding displayed
											set pumheight=10                        " Makes popup menu smaller
											set fileencoding=utf-8                  " The encoding written to file
											set ruler              			        " Show the cursor position all the time
											set cmdheight=1                         " More space for displaying messages
											set mouse=a                             " Enable your mouse
											set splitbelow                          " Horizontal splits will automatically be below
											set splitright                          " Vertical splits will automatically be to the right
											set t_Co=256                            " Support 256 colors
											set conceallevel=0                      " So that I can see `` in markdown files
											set tabstop=4                           " Insert 4 spaces for a tab
											set shiftwidth=4                        " Change the number of space characters inserted for indentation
											set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
                                            set ignorecase
                                            set smartcase
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
											set undodir=~/.vim/undodir
											set undofile
											set nowritebackup                       " This is recommended by coc
											set scrolloff=8
											set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
											set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
											set updatetime=300                      " Faster completion
											set timeoutlen=100                      " By default timeoutlen is 1000 ms
											set clipboard=unnamedplus               " Copy paste between vim and everything else
											set incsearch
											set guifont=Fira\ Code\ Nerd\ Font
                                            set diffopt+=vertical

                                            filetype plugin indent on

											colorscheme gruvbox
											highlight Normal guibg=none

											let mapleager = " "

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
                                            let g:neoterm_default_mod = 'vertical'
                                            let g:neoterm_size = 60
                                            let g:neoterm_autoinsert = 1
                                            nnoremap <c-q> :Ttoggle<CR>
                                            inoremap <c-q> <Esc> :Ttoggle<CR>
                                            tnoremap <c-q> <c-\><c-n> :Ttoggle<CR>

                                            " vim-autoformat
                                            noremap <F3> :Autoformat<CR>
                                            " format on save
                                            au BufWrite * :Autoformat

                                            " neoformat
                                            nnoremap <leader>F :Neoformat prettier<CR>
                                            " Enable alignment
                                            let g:neoformat_basic_format_align = 1

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

                                            " Explorer
                                            " let g:coc_explorer_global_presets = {
                                            " \   '.vim': {
                                            " \     'root-uri': '~/.vim',
                                            " \   },
                                            " \   'tab': {
                                            " \     'position': 'tab',
                                            " \     'quit-on-open': v:true,
                                            " \   },
                                            " \   'floating': {
                                            " \     'position': 'floating',
                                            " \     'open-action-strategy': 'sourceWindow',
                                            " \   },
                                            " \   'floatingTop': {
                                            " \     'position': 'floating',
                                            " \     'floating-position': 'center-top',
                                            " \     'open-action-strategy': 'sourceWindow',
                                            " \   },
                                            " \   'floatingLeftside': {
                                            " \     'position': 'floating',
                                            " \     'floating-position': 'left-center',
                                            " \     'floating-width': 50,
                                            " \     'open-action-strategy': 'sourceWindow',
                                            " \   },
                                            " \   'floatingRightside': {
                                            " \     'position': 'floating',
                                            " \     'floating-position': 'right-center',
                                            " \     'floating-width': 50,
                                            " \     'open-action-strategy': 'sourceWindow',
                                            " \   },
                                            " \   'simplify': {
                                            " \     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
                                            " \   }
                                            " \ }

                                            " nmap <space>e :CocCommand explorer<CR>
                                            " nmap <space>f :CocCommand explorer --preset floating<CR>
                                            " autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

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


                                            set termguicolors " this variable must be enabled for colors to be applied properly

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

                                            " tagbar
                                            " nmap <F8> :TagbarToggle<CR>
                                '';
                                    #opt=[];
                                };
                            };
                };
            };
};
}
