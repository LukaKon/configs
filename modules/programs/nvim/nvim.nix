{pkgs, ...}:

{
  environment = {
    variables = {EDITOR = "nvim"; VISUAL = "nvim";};
    systemPackages = with pkgs;[
      neovim-remote
      ripgrep
      ctags
      neovim
      gcc
      # clang
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
            packages.myVimPackage = with pkgs.vimPlugins;
            {
              start = [
                (nvim-treesitter.withPlugins (
                  plugins: with plugins;
                  [
                    tree-sitter-nix
                    tree-sitter-python
                    tree-sitter-html
                    tree-sitter-javascript
                  ]
                  ))

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
                # python-mode # TODO: was switched off
                vim-multiple-cursors
                vim-commentary
                splitjoin-vim     # gS - split; gJ - join
                ale
                vim-mundo

                vim-autoformat

                # completion
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
                neoterm
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
                deoplete-clang
                deoplete-github
                # deoplete-tabnine

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

              ];
              opt = [
                # File tree
                nvim-web-devicons
                nvim-tree-lua
                # nvim-web-devicon

                # Telescope
                popup-nvim
                telescope-nvim

                # Indent lines
                indent-blankline-nvim

                # Eyecandy
                nvim-treesitter
                bufferline-nvim
                galaxyline-nvim
                nvim-colorizer-lua
              ];
            };
            customRC = builtins.readFile ./init.vim;
          };
        };
      };
    };
  };
}
