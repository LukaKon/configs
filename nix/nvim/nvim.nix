# { config, pkgs, lib, ... }:

# let
#   vimpkg = pkgs.neovim.override {
#     configure = {
#       customRC = ./vimrc;
#       plug.plugins = with pkgs.vimPlugins; [
#         vim-nix
        
#         vim-airline-themes
#         vim-airline

#         # vim-vinegar
#         # vim-surround
#         # vim-fugitive
#         # vim-rhubarb
#         # vim-eunuch
#         # vim-closetag
#         /*
#         "vim-ripgrep"
#         "vim-endwise"
#         "vim-closer"
#         */
#       ];
#     };
#   };
# in {
#   environment.systemPackages = [ vimpkg ];
#   environment.variables = {
#     EDITOR = "nvim";
#     VISUAL = "nvim";
#   };
#   programs = {npm.enable = true;};
# }

{pkgs, ...}:
{
  environment.variables = {EDITOR = "nvim"; VISUAL = "nvim";};

  programs = {npm.enable = true;};

  nixpkgs = {
      config = {
          packageOverrides = pkgs: rec {
                    neovim = pkgs.neovim.override {
                          vimAlias = true;
                          withPython = true;
                          configure = {
                              packages.myVimPackage = with
                              pkgs.vimPlugins;
                              {
                                start = [
                                    vim-commentary
                                    vim-airline-themes
                                    vim-airline
                                    fzf-vim
                                    tabular
                                    syntastic
                                    vim-nix
                                    neomake
                                    neoformat
                                    gitgutter
                                    coc-python
                                    coc-html
                                    coc-nvim
                                    coc-yank
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
                                    rainbow
                                    # Start screen
                                    vim-startify
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
                                  set cmdheight=2                         " More space for displaying messages
                                  set mouse=a                             " Enable your mouse
                                  set splitbelow                          " Horizontal splits will automatically be below
                                  set splitright                          " Vertical splits will automatically be to the right
                                  set t_Co=256                            " Support 256 colors
                                  set conceallevel=0                      " So that I can see `` in markdown files
                                  set tabstop=4                           " Insert 2 spaces for a tab
                                  set shiftwidth=4                        " Change the number of space characters inserted for indentation
                                  set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
                                  set expandtab                           " Converts tabs to spaces
                                  set smartindent                         " Makes indenting smart
                                  set autoindent                          " Good auto indent
                                  set laststatus=2                        " Always display the status line
                                  set number relativenumber               " Line numbers
                                  set cursorline                          " Enable highlighting of the current line
                                  set background=dark                     " tell vim what the background color looks like
                                  set showtabline=2                       " Always show tabs
                                  set nobackup                            " This is recommended by coc
                                  set nowritebackup                       " This is recommended by coc
                                  set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
                                  set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
                                  set updatetime=300                      " Faster completion
                                  set timeoutlen=100                      " By default timeoutlen is 1000 ms
                                  set clipboard=unnamedplus               " Copy paste between vim and everything else
                                  set incsearch
                                  set guifont=Fira\ Code\ Nerd\ Font
                                  '';
                              #opt=[];
                            };
                      };
                    };    
            };
        };
}
