{config, pkgs, ...}:

let
    dusk-vim = pkgs.vimUtils.buildVimPlugin {
        name = "dusk-vim";
        src = pkgs.fetchFromGitHub {
            owner = "notusknot";
            repo = "dusk-vim";
            rev = "8eb71f092ebfa173a6568befbe522a56e8382756";
            sha256 = "09l4hda5jnyigc2hhlirv1rc8hsnsc4zgcv4sa4br8fryi73nf4g";
        };
    };

in
{
  environment = {
    variables = {EDITOR = "nvim"; VISUAL = "nvim";};
    systemPackages = with pkgs; [
      # neovim-remote
      # ripgrep
      # ctags
      # gcc
      # lua
      # rnix-lsp
      # sumneko-lua-language-server
      # tree-sitter
      # nodePackages.typescript
      # nodePackages.typescript-language-server
      # nodePackages.pyright
      (neovim.override {
        configure = {
          packages.myPlugins =with pkgs.vimPlugins;{
            start = [ popup-nvim nvim-compe plenary-nvim ];
                opt = [
                # File tree
                nvim-web-devicons
                nvim-tree-lua

                # LSP
                nvim-lspconfig

                # Languages
                vim-nix

                # Eyecandy
                nvim-treesitter
                nvim-bufferline-lua
                galaxyline-nvim
                nvim-colorizer-lua
                # twilight-nvim

                dusk-vim
                pears-nvim

                # Telescope
                popup-nvim
                telescope-nvim

                # Indent lines
                indent-blankline-nvim

            ];
        };
        customRC = ''
            lua << EOF
            vim.cmd [[
                syntax off
                filetype off
                filetype plugin indent off
            ]]
            vim.defer_fn(function()
                vim.cmd [[
                    syntax on
                    filetype on
                    filetype plugin indent on
                    packadd nvim-treesitter
                    packadd dusk-vim
                    colorscheme dusk

                    packadd nvim-web-devicons
                    packadd twilight-nvim
                    packadd nvim-tree-lua
                    packadd nvim-lspconfig
                    packadd nvim-compe
                    packadd vim-nix
                    packadd nvim-treesitter
                    packadd nvim-bufferline-lua
                    packadd galaxyline-nvim
                    packadd nvim-colorizer-lua
                    packadd popup-nvim
                    packadd plenary-nvim
                    packadd telescope-nvim
                    packadd indent-blankline-nvim
                    packadd pears-nvim
                    packadd neorg
                    doautocmd BufRead
                ]]
            end, 0)
            EOF
        '';
        };
        }
    )];
    };

    programs = {npm.enable = true;};
}

  # nixpkgs = {
  #   config = {
  #     packageOverrides = pkgs: rec {
  #       neovim = pkgs.neovim.override {
  #         vimAlias = true;
  #         withPython3 = true;
  #         configure = {
  #           packages.myVimPackage = with
  #           pkgs.vimPlugins;
  #           {
  #             start = [
  #               #---lua---

  #               # File tree
  #               nvim-web-devicons
  #               nvim-tree-lua

  #               # Lsp and auto completion
  #               nvim-lspconfig
  #               nvim-compe
  #               completion-nvim

  #               # Eyecandy
  #               galaxyline-nvim
  #               nvim-treesitter
  #               indentLine
  #               nvim-bufferline-lua

  #               # Languages
  #               vim-nix

  #               # Assorted web dev plugins
  #               nvim-colorizer-lua
  #               vim-closetag
  #               pears-nvim

  #               # Misc
  #               neorg
  #               plenary-nvim
  #               markdown-preview-nvim

  #               telescope-nvim

  #               # autocompletion server:
  #               # rnix-lsp

  #               #---old---

  #               # vim-airline-themes
  #               # vim-airline
  #               gruvbox-community

  #               # file explorer
  #               The_NERD_tree
  #               # nerdtree
  #               nerdtree-git-plugin
  #               vim-devicons
  #               vim-nerdtree-syntax-highlight
  #               vim-nerdtree-tabs
  #               fzf-vim
  #               # nvim-tree-lua
  #               # python-mode
  #               vim-multiple-cursors
  #               vim-commentary
  #               splitjoin-vim     # gS - split; gJ - join
  #               # ale
  #               vim-mundo

  #               vim-autoformat

  #               # completion

  #               vimspector

  #               tabular
  #               syntastic
  #               vim-snippets
  #               # vim-nix
  #               vim-python-pep8-indent
  #               vim-csharp
  #               neomake
  #               neoformat
  #               # SimpylFold
  #               # neoterm
  #               vim-javascript
  #               vim-javascript-syntax
  #               emmet-vim
  #               # coc-fzf
  #               # coc-emmet
  #               # coc-pyright
  #               # coc-html
  #               # coc-nvim
  #               # coc-yank
  #               # coc-css
  #               # coc-stylelint
  #               # coc-json
  #               # coc-smartf
  #               # coc-lists
  #               # # coc-cmake
  #               # coc-pairs
  #               # coc-prettier
  #               # coc-spell-checker
  #               # coc-highlight
  #               # coc-tsserver

  #               vim-speeddating # Change dates fast

  #               vim-repeat # Repeat stuff

  #               quick-scope # Text Navigation
  #               vim-illuminate # highlight all matches under cursor

  #               vim-polyglot # Better syntax support

  #               auto-pairs # Auto pairs for '(' '[' '{'

  #               rainbow # Rainbow brackets

  #               # Start screen
  #               vim-startify
  #               vim-jinja
  #               vim-yapf
  #               jedi-vim

  #               nginx-vim

  #               unicode-vim
  #               tagbar

  #               colorizer
  #               vim-surround

  #               # deoplete-zsh
  #               # deoplete-jedi
  #               # deoplete-nvim
  #               # deoplete-clang
  #               # deoplete-github
  #               # deoplete-tabnine

  #               # git
  #               vim-gitgutter
  #               vim-gitbranch
  #               vim-signify
  #               vim-fugitive
  #               vim-rhubarb
  #               gv-vim
  #             ];
  #             opt = [];
  #           };
  #           customRC = ''
  #           luafile ./lua/settings.lua
  #           luafile ./lua/bufferline.lua
  #           luafile ./lua/statusline.lua

  #           lua << EOF
  #           vim.defer_fn(function()
  #           vim.cmd [[
  #             luafile ./lua/lsp.lua
  #             luafile ./lua/tree.lua
  #             luafile ./lua/treesitter.lua
  #             luafile ./lua/neorg.lua
  #           ]]
  #           end, 70)
  #           EOF

  #           set tw=80
  #           set iskeyword+=-                        " treat dash separated words as a word text object"
  #           set formatoptions-=cro                  " Stop newline continution of comments

  #           syntax enable                           " Enables syntax highlighing
  #           " set hidden                              " Required to keep multiple buffers open multiple buffers
  #           " set nowrap                              " Display long lines as just one line
  #           " set showcmd                             " show current command in status line
  #           set whichwrap+=<,>,[,],h,l
  #           " set encoding=utf-8                      " The encoding displayed
  #           set pumheight=10                        " Makes popup menu smaller
  #           " TODO - check for sure: set fileencoding=utf-8                  " The encoding written to file
  #           " set ruler                               " Show the cursor position all the time
  #           set notimeout                           " disable timeout for finishing a mapping key sequence
  #           set visualbell                          " visual bell = no sounds
  #           set cmdheight=1                         " More space for displaying messages
  #           " set mouse=a                             " Enable your mouse
  #           " set splitbelow                          " Horizontal splits will automatically be below
  #           " set splitright                          " Vertical splits will automatically be to the right
  #           set t_Co=256                            " Support 256 colors
  #           set conceallevel=0                      " So that I can see `` in markdown files
  #           " set tabstop=4                           " Insert 4 spaces for a tab
  #           " set shiftwidth=4                        " Change the number of space characters inserted for indentation
  #           set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
  #           set ignorecase
  #           set smartcase
  #           " set softtabstop=4
  #           " set expandtab                           " Converts tabs to spaces
  #           " set smartindent                         " Makes indenting smart
  #           " set autoindent                          " Good auto indent
  #           " set completeopt=menuone,noinsert,noselect
  #           set laststatus=2                        " Always display the status line
  #           " set number relativenumber               " Line numbers
  #           set cursorline                          " Enable highlighting of the current line
  #           " set background=dark                     " tell vim what the background color looks like
  #           set showtabline=2                       " Always show tabs
  #           set nobackup                            " This is recommended by coc
  #           set noswapfile
  #           "set undodir=~/.vim/undodir
  #           " set undofile
  #           set nowritebackup                       " This is recommended by coc
  #           " set scrolloff=8                         " keep 8 lines visible above/below the cursor when scrolling
  #           " set sidescrolloff=7                     " keep 7 characters visible to the left/right of the cursor when scrolling
  #           " set sidescroll=1                        " scroll left/right one character at a time
  #           set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
  #           " set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
  #           set updatetime=300                      " Faster completion
  #           set timeoutlen=100                      " By default timeoutlen is 1000 ms
  #           set clipboard=unnamedplus               " Copy paste between vim and everything else
  #           set incsearch
  #           set guifont=Fira\ Code\ Nerd\ Font
  #           set diffopt+=vertical


  #           filetype plugin indent on

  #           colorscheme gruvbox
  #           highlight Normal guibg=none

  #           let mapleager = " "

  #           let g:yankring_clipboard_monitor=0              " don't worry about the system clipboard, thanks YankRing
  #           let g:yankring_n_keys = 'Y D'                   " by default: 'Y D x X', but I don't like x and X adding chars to my yank history
  #           nnoremap x "_x
  #           nnoremap X "_X

  #           let mapleader=" "                               " set <space> as the leader for mappings
  #           nnoremap <space> <nop>

  #           let g:ctrlp_map = '<leader>jf'                  " open ctrl-p fuzzy finder (mnemonic: 'jump file')
  #           nnoremap <Leader>jt :CtrlPTag<CR>
  #           nnoremap <Leader>jb :CtrlPBuffer<CR>
  #           nnoremap <Leader>jj <c-]>

  #           let g:any_jump_disable_default_keybindings = 1  " open AnyJump (mnemonic: 'jump definition')
  #           nnoremap <leader>jd :AnyJump<CR>
  #           xnoremap <leader>jd :AnyJumpVisual<CR>

  #           if has("nvim")
  #           set inccommand=nosplit                        " show substitutions incrementally
  #           endif

  #           " restore last line position when opening file
  #           au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif


  #           let g:markdown_fenced_languages = ['javascript','js=javascript', 'json=javascript', 'python', 'vim', 'sh', 'bash=sh', 'shell=sh', ]

  #           nmap <leader>gj :diffget //3<CR>
  #           nmap <leader>gf :diffget //2<CR>
  #           nmap <leader>gs :G<CR>

  #           " coc
  #           " press <esc> to cancel.
  #           " nmap f <Plug>(coc-smartf-forward)
  #           " nmap F <Plug>(coc-smartf-backward)
  #           " nmap ; <Plug>(coc-smartf-repeat)
  #           " nmap , <Plug>(coc-smartf-repeat-opposite)



  #           " let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-python']

  #           " vim-autoformat
  #           noremap <F3> :Autoformat<CR>
  #           " format on save
  #           au BufWrite * :Autoformat

  #           " auto format code
  #           au BufWrite *.py,*.c,*.h,*.cpp,*.hpp,*.js :ALEFix
  #           au User ALEFixPost :w
  #           let g:ale_linters = { 'c': ['clangd'], 'cpp': ['clangd'], 'py' : ['flake8', 'pylint'] }
  #           let g:ale_fixers = { 'c': ['clang-format'], 'cpp': ['clang-format'], 'javascript': ['prettier'], 'python': ['autopep8', 'yapf'] }
  #           let g:prettier#exec_cmd_async = 1

  #           " neoformat
  #           " nnoremap <leader>F :Neoformat prettier<CR>
  #           " Enable alignment
  #           " let g:neoformat_basic_format_align = 1

  #           " Enable tab to space conversion
  #           let g:neoformat_basic_format_retab = 1

  #           " Enable trimmming of trailing whitespace
  #           let g:neoformat_basic_format_trim = 1

  #           " deoplete
  #           " let g:deoplete#enable_at_startup = 1

  #           "jedi-vim
  #           " disable autocompletion, because we use deoplete for completion
  #           let g:jedi#completions_enabled = 0

  #           " open the go-to function in split, not another buffer
  #           let g:jedi#use_splits_not_buffers = "right"

  #           " neomake
  #           let g:neomake_python_enabled_makers = ['pylint']
  #           " call neomake#configure#automake('nrwi', 500)

  #           " fzf
  #           nnoremap <C-p> :FZF<CR>
  #           let g:fzf_action = {
  #             \ 'ctrl-t': 'tab split',
  #             \ 'ctrl-s': 'split',
  #             \ 'ctrl-v': 'vsplit'
  #             \}

  #             "nnoremap <leader><space> :GFiles<CR>
  #             "nnoremap <leader>ff :Rg<CR>
  #             "inoremap <expr> <c-x><c-f> "fzf#vim#complete#path(
  #               "  \ "find . -path '*/\.*' -prune -o -print\| sed '1d;s:^..::'",
  #               "  \ fzf#wrap({'dir':expand('%:p:h')}))
  #               "if has('nvim')
  #               "  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  #               "  au! FileType fzf tunmap <buffer> <Esc>
  #               "endif

  #               " fugitive
  #               nnoremap <leader>gg :G<CR>

  #               " NERDTree
  #               let g:NERDTreeShowHidden = 1
  #               let g:NERDTreeMinimalUI = 1
  #               let g:NERDTreeIgnore = []

  #               nnoremap <leader>n :NERDTreeFocus<CR>
  #               nnoremap <C-n> :NERDTree<CR>
  #               nnoremap <C-t> :NERDTreeToggle<CR>
  #               nnoremap <C-f> :NERDTreeFind<CR>

  #               " use alt+hjkl to move between split/vsplit panels
  #               tnoremap <A-h> <C-\><C-n><C-w>h
  #               tnoremap <A-j> <C-\><C-n><C-w>j
  #               tnoremap <A-k> <C-\><C-n><C-w>k
  #               tnoremap <A-l> <C-\><C-n><C-w>l
  #               nnoremap <A-h> <C-w>h
  #               nnoremap <A-j> <C-w>j
  #               nnoremap <A-k> <C-w>k
  #               nnoremap <A-l> <C-w>l

  #               " Start NERDTree when Vim is started without file arguments.
  #               autocmd StdinReadPre * let s:std_in=1
  #               autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

  #               " Exit Vim if NERDTree is the only window left.
  #               autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
  #               \ quit | endif

  #               " If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
  #               autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
  #               \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

  #               let g:NERDTreeDirArrowExpandable = '▸'
  #               let g:NERDTreeDirArrowCollapsible = '▾'

  #               let g:NERDTreeGitStatusIndicatorMapCustom = {
  #                 \ 'Modified'  :'✹',
  #                 \ 'Staged'    :'✚',
  #                 \ 'Untracked' :'✭',
  #                 \ 'Renamed'   :'➜',
  #                 \ 'Unmerged'  :'═',
  #                 \ 'Deleted'   :'✖',
  #                 \ 'Dirty'     :'✗',
  #                 \ 'Ignored'   :'☒',
  #                 \ 'Clean'     :'✔︎',
  #                 \ 'Unknown'   :'?',
  #                 \ }

  #                 let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0
  #                 let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time. default: 0

  #                 augroup Smartf
  #                 autocmd User SmartfEnter :hi Conceal ctermfg=220 guifg=#6638F0
  #                 autocmd User SmartfLeave :hi Conceal ctermfg=239 guifg=#504945
  #                 augroup end

  #                 fun! TrimWhitespace()
  #                 let l:save = winsaveview()
  #                 keeppatterns %s/\s\+$//e
  #                 call winrestview(l:save)
  #                 endfun

  #                 augroup THE_PRIMEAGEN
  #                 autocmd!
  #                 autocmd BufWritePre * :call TrimWhitespace()
  #                 augroup END

  #                 " git setup
  #                 " Change these if you want
  #                 let g:signify_sign_add               = '+'
  #                 let g:signify_sign_delete            = '_'
  #                 let g:signify_sign_delete_first_line = '‾'
  #                 let g:signify_sign_change            = '~'

  #                 " I find the numbers disctracting
  #                 let g:signify_sign_show_count = 0
  #                 let g:signify_sign_show_text = 1


  #                 set termguicolors " this variable must be enabled for colors to be applied properly

  #                 " a list of groups can be found at `:help nvim_tree_highlight`
  #                 highlight NvimTreeFolderIcon guibg=blue


  #                 " Jump though hunks
  #                 nmap <leader>gj <plug>(signify-next-hunk)
  #                 nmap <leader>gk <plug>(signify-prev-hunk)
  #                 nmap <leader>gJ 9999<leader>gJ
  #                 nmap <leader>gK 9999<leader>gk


  #                 " If you like colors instead
  #                 " highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
  #                 " highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
  #                 " highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

  #                 " commenting
  #                 nnoremap <space>/ :Commentary<CR>
  #                 vnoremap <space>/ :Commentary<CR>


  #                 " SimpylFold
  #                 " g:SimpylFold_docstring_preview = 0
  #                 " g:SimpylFold_fold_docstring    = 0
  #                 " b:SimpylFold_fold_docstring    = 0
  #                 " g:SimpylFold_fold_import       = 0
  #                 " b:SimpylFold_fold_import       = 0
  #                 " g:SimpylFold_fold_blank        = 0
  #                 " b:SimpylFold_fold_blank        = 0

  #                 " tagbar
  #                 nmap <F8> :TagbarToggle<CR>

  #                 " run script (python, javascript, bash)
  #                 augroup exe_code
  #                 autocmd!

  #                 " execute python code
  #                 autocmd FileType python nnoremap <buffer> <localleader>r
  #                 \ :sp<CR> :term bpython %<CR> :startinsert<CR>

  #                 " execute javascript code
  #                 autocmd FileType javascript nnoremap <buffer> <localleader>r
  #                 \ :sp<CR> :term nodejs %<CR> :startinsert<CR>

  #                 " execute bash code
  #                 autocmd FileType bash,sh nnoremap <buffer> <localleader>r
  #                 \ :sp<CR> :term bash %<CR> :startinsert<CR>

  #                 augroup END
  #                 '';
  #             #opt=[];
  #           };
  #         };
  #       };
  #     };
  #   };
  # }