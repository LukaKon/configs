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
                                                nvim-tree-lua
                                                # python-mode
												vim-commentary
												fzf-vim
												tabular
												syntastic
												vim-nix
												vim-python-pep8-indent
												vim-csharp
												neomake
												neoformat
                                                neoterm
                                                vim-javascript
                                                vim-commentary
												coc-fzf
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

												colorizer

												deoplete-zsh
												deoplete-jedi
												deoplete-nvim
												deoplete-clang
												deoplete-github

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

											" press <esc> to cancel.
											nmap f <Plug>(coc-smartf-forward)
											nmap F <Plug>(coc-smartf-backward)
											nmap ; <Plug>(coc-smartf-repeat)
											nmap , <Plug>(coc-smartf-repeat-opposite)

                                            " neoterm
                                            let g:neoterm_default_mod = 'vertical'
                                            let g:neoterm_size = 60
                                            let g:neoterm_autoinsert = 1
                                            nnoremap <c-q> :Ttoggle<CR>
                                            inoremap <c-q> <Esc> :Ttoggle<CR>
                                            tnoremap <c-q> <c-\><c-n> :Ttoggle<CR>

                                            " neoformat
                                            nnoremap <leader>F :Neoformat prettier<CR>

                                            " fzf
                                            nnoremap <leader><space> :GFiles<CR>
                                            nnoremap <leader>ff :Rg<CR>
                                            inoremap <expr> <c-x><c-f> "fzf#vim#complete#path(
                                              \ "find . -path '*/\.*' -prune -o -print\| sed '1d;s:^..::'",
                                              \ fzf#wrap({'dir':expand('%:p:h')}))
                                            if has('nvim')
                                              au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
                                              au! FileType fzf tunmap <buffer> <Esc>
                                            endif

                                            " fugitive
                                            nnoremap <leader>gg :G<CR>


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


                                            let g:nvim_tree_side = 'right' "left by default
                                            let g:nvim_tree_width = 40 "30 by default
                                            let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
                                            let g:nvim_tree_gitignore = 1 "0 by default
                                            let g:nvim_tree_auto_open = 1 "0 by default, opens the tree when typing `vim $DIR` or `vim`
                                            let g:nvim_tree_auto_close = 1 "0 by default, closes the tree when it's the last window
                                            let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ] "empty by default, don't auto open tree on specific filetypes.
                                            let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
                                            let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
                                            let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
                                            let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
                                            let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
                                            let g:nvim_tree_highlight_opened_files = 1 "0 by default, will enable folder and file icon highlight for opened files/directories.
                                            let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
                                            let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
                                            let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
                                            let g:nvim_tree_disable_netrw = 0 "1 by default, disables netrw
                                            let g:nvim_tree_hijack_netrw = 0 "1 by default, prevents netrw from automatically opening when opening directories (but lets you keep its other utilities)
                                            let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
                                            let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
                                            let g:nvim_tree_lsp_diagnostics = 1 "0 by default, will show lsp diagnostics in the signcolumn. See :help nvim_tree_lsp_diagnostics
                                            let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
                                            let g:nvim_tree_hijack_cursor = 0 "1 by default, when moving cursor in the tree, will position the cursor at the start of the file on the current line
                                            let g:nvim_tree_window_picker_exclude = {
                                                \   'filetype': [
                                                \     'packer',
                                                \     'qf'
                                                \   ],
                                                \   'buftype': [
                                                \     'terminal'
                                                \   ]
                                                \ }
                                            " Dictionary of buffer option names mapped to a list of option values that
                                            " indicates to the window picker that the buffer's window should not be
                                            " selectable.
                                            let g:nvim_tree_special_files = [ 'README.md', 'Makefile', 'MAKEFILE' ] " List of filenames that gets highlighted with NvimTreeSpecialFile
                                            let g:nvim_tree_show_icons = {
                                                \ 'git': 1,
                                                \ 'folders': 0,
                                                \ 'files': 0,
                                                \ 'folder_arrows': 0,
                                                \ }
                                            "If 0, do not show the icons for one of 'git' 'folder' and 'files'
                                            "1 by default, notice that if 'files' is 1, it will only display
                                            "if nvim-web-devicons is installed and on your runtimepath.
                                            "if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
                                            "but this will not work when you set indent_markers (because of UI conflict)

                                            " default will show icon by default if no icon is provided
                                            " default shows no icon by default
                                            let g:nvim_tree_icons = {
                                                \ 'default': '',
                                                \ 'symlink': '',
                                                \ 'git': {
                                                \   'unstaged': "✗",
                                                \   'staged': "✓",
                                                \   'unmerged': "",
                                                \   'renamed': "➜",
                                                \   'untracked': "★",
                                                \   'deleted': "",
                                                \   'ignored': "◌"
                                                \   },
                                                \ 'folder': {
                                                \   'arrow_open': "",
                                                \   'arrow_closed': "",
                                                \   'default': "",
                                                \   'open': "",
                                                \   'empty': "",
                                                \   'empty_open': "",
                                                \   'symlink': "",
                                                \   'symlink_open': "",
                                                \   },
                                                \   'lsp': {
                                                \     'hint': "",
                                                \     'info': "",
                                                \     'warning': "",
                                                \     'error': "",
                                                \   }
                                                \ }


                                            nnoremap <C-n> :NvimTreeToggle<CR>
                                            nnoremap <leader>r :NvimTreeRefresh<CR>
                                            nnoremap <leader>n :NvimTreeFindFile<CR>
                                            " NvimTreeOpen and NvimTreeClose are also available if you need them

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
                                '';
                                    #opt=[];
                                };
                            };
                };
            };
};
}
