{pkgs, config, ...}:

{
  # nixpkgs.overlays = [
  #   (import (builtins.fetchTarball {
  #     url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
  #     sha256 = "01dkd7w7q7klqfiszfrx9jbq2n149500hcs0799bi8b6zg0q56hn";
  #   }))
  # ];

  environment = {
    variables = {EDITOR = "nvim"; VISUAL = "nvim";};
    systemPackages = with pkgs;[
      ripgrep
      ctags
      gcc

      (neovim.override {
        configure = {
          packages.myPlugins = with pkgs.vimPlugins; {
            start = [
              popup-nvim
              plenary-nvim
              nvim-compe
              # neorg

              (nvim-treesitter.withPlugins (
                plugins: with plugins;
                [
                  tree-sitter-nix
                  tree-sitter-python
                  tree-sitter-html
                  tree-sitter-javascript
                  tree-sitter-css
                ]
                ))

                # File tree
                nvim-tree-lua

                # Eyecandy
                # nvim-treesitter
                # bufferline-nvim
                galaxyline-nvim
                nvim-colorizer-lua

                # dusk-vim
                pears-nvim

                # Telescope
                telescope-nvim

                # Indent lines
                indent-blankline-nvim

                # file explorer
                The_NERD_tree
                # nerdtree
                nerdtree-git-plugin
                vim-devicons
                vim-nerdtree-syntax-highlight
                vim-nerdtree-tabs

                fzf-vim
                # python-mode # TODO: was switched off
                vim-multiple-cursors
                vim-commentary
                splitjoin-vim     # gS - split; gJ - join
                ale
                vim-mundo

                vim-autoformat

                # nvim-lspconfig
                completion-nvim

                vimspector

                tabular
                syntastic
                vim-snippets
                vim-nix
                vim-python-pep8-indent
                vim-csharp
                neomake
                neoformat
                # SimpylFold
                # neoterm
                vim-javascript
                vim-javascript-syntax
                emmet-vim
                coc-fzf
                coc-emmet
                coc-pyright
                coc-html
                coc-nvim
                coc-yank
                coc-css
                coc-texlab
                coc-lua
                coc-stylelint
                coc-json
                coc-smartf
                coc-lists
                coc-cmake
                coc-pairs
                coc-prettier
                coc-spell-checker
                coc-highlight

                vim-speeddating # Change dates fast

                vim-repeat # Repeat stuff

                quick-scope # Text Navigation
                vim-illuminate # highlight all matches under cursor

                vim-polyglot # Better syntax support

                auto-pairs # Auto pairs for '(' '[' '{'

                rainbow # Rainbow brackets

                # Start screen
                vim-startify

                vim-jinja
                vim-yapf
                emmet-vim
                jedi-vim

                nginx-vim

                unicode-vim
                tagbar

                colorizer
                vim-surround

                deoplete-zsh
                deoplete-jedi
                deoplete-nvim
                deoplete-github

                # git
                vim-gitgutter
                vim-gitbranch
                vim-signify
                vim-fugitive
                vim-rhubarb
                gv-vim

                popup-nvim
                nvim-compe
                plenary-nvim

                gruvbox-community
                vim-airline-themes
                vim-airline
              ];
              opt = [
              ];
            };
            customRC = builtins.readFile ./boot.vim; #./init.vim;
          };
        }
        )
      ];
    };
  }
