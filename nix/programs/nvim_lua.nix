{pkgs, ...}:

{
  environment = {
    variables = {EDITOR = "nvim"; VISUAL = "nvim";};
    systemPackages = with pkgs;[
      neovim-remote
      ripgrep
      ctags
    ];
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
                nvim-lspconfig
                lspsaga-nvim
              ];
              opt = [];
            };
            customRC = ''
              set tw=80
              set iskeyword+=-                        " treat dash separated words as a word text object"
              set formatoptions-=cro                  " Stop newline continution of comments

              syntax enable                           " Enables syntax highlighing
              set hidden                              " Required to keep multiple buffers open multiple buffers
              set nowrap                              " Display long lines as just one line
              set showcmd                             " show current command in status line
              set whichwrap+=<,>,[,],h,l
              set encoding=utf-8                      " The encoding displayed
              set pumheight=10                        " Makes popup menu smaller
              set fileencoding=utf-8                  " The encoding written to file
              set ruler                               " Show the cursor position all the time
              set showcmd                             " show current command in status line
              set notimeout                           " disable timeout for finishing a mapping key sequence
              set visualbell                          " visual bell = no sounds
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
              set scrolloff=8                         " keep 8 lines visible above/below the cursor when scrolling
              set sidescrolloff=7                     " keep 7 characters visible to the left/right of the cursor when scrolling
              set sidescroll=1                        " scroll left/right one character at a time
              set splitbelow splitright               " put new windows below or to the right
              set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
              set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
              set updatetime=300                      " Faster completion
              set timeoutlen=100                      " By default timeoutlen is 1000 ms
              set clipboard=unnamedplus               " Copy paste between vim and everything else
              set incsearch
              set guifont=Fira\ Code\ Nerd\ Font
              set diffopt+=vertical


              filetype plugin indent on


              lua << EOF
              require'lspconfig'.pyright.setup{}
              EOF

              local nvim_lsp = require('lspconfig')local on_attach = function(client, bufnr)
              local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end  -- Mappings.
              local opts = { noremap=true, silent=true }  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
              buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
              --...
              end


              " LSPSAGA
              local saga = require 'lspsaga'```lua
              saga.init_lsp_saga {
              error_sign = '',
              warn_sign = '',
              hint_sign = '',
              infor_sign = '',
              border_style = "round",
              }


              " show hover doc
              nnoremap <silent>K :Lspsaga hover_doc<CR>

              inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>

              nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>


              " DIAGNOSTIC
              nvim_lsp.diagnosticls.setup {
              on_attach = on_attach,
              filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'css', 'less', 'scss', 'markdown', 'pandoc' },
              init_options = {
              linters = {
              eslint = {
              command = 'eslint_d',
              rootPatterns = { '.git' },
              debounce = 100,
              args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
              sourceName = 'eslint_d',
              parseJson = {
              errorsRoot = '[0].messages',
              line = 'line',
              column = 'column',
              endLine = 'endLine',
              endColumn = 'endColumn',
              message = '[eslint] ${message} [${ruleId}]',
              security = 'severity'
              },
              securities = {
              [2] = 'error',
              [1] = 'warning'
              }
              },
              },
              filetypes = {
              javascript = 'eslint',
              javascriptreact = 'eslint',
              typescript = 'eslint',
              typescriptreact = 'eslint',
              },
              formatters = {
              eslint_d = {
              command = 'eslint_d',
              args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
              rootPatterns = { '.git' },
              },
              prettier = {
              command = 'prettier',
              args = { '--stdin-filepath', '%filename' }
              }
              },
              formatFiletypes = {
              css = 'prettier',
              javascript = 'eslint_d',
              javascriptreact = 'eslint_d',
              json = 'prettier',
              scss = 'prettier',
              less = 'prettier',
              typescript = 'eslint_d',
              typescriptreact = 'eslint_d',
              json = 'prettier',
              markdown = 'prettier',
              }
              }
              }

              nnoremap <silent> <C-j> :Lspsaga diagnostic_jump_next<CR>
            '';
            #opt=[];
          };
        };
      };
    };
  };
}
