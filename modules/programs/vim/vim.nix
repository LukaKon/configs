{ pkgs, ... }:
{
  environment.variables = { EDITOR = "vim"; };


  environment.systemPackages = with pkgs; [
    ((vim_configurable.override { python = python3; }).customize{
      name = "vim";
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [
           vim-nix
           vim-lastplace

           # file explorer
           The_NERD_tree
           # nerdtree
           nerdtree-git-plugin
              vim-devicons
              vim-nerdtree-syntax-highlight
              vim-nerdtree-tabs

              vimproc

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
              vim-css-color
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
        opt = [];
      };
      vimrcConfig.customRC = builtins.readFile ./init.vim; #./boot.vim; ./init.vim;
    }
  )];
}