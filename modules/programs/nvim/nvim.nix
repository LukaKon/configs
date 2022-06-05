{ pkgs, config, ... }:

{
  environment = {
    variables = { EDITOR = "nvim"; VISUAL = "nvim"; };
    systemPackages = with pkgs;[
      # ripgrep
      # ctags
      # gcc

      (neovim.override {
        configure = {
          packages.myPlugins = with pkgs.vimPlugins; {
            start = [
              packer-nvim
              popup-nvim
              plenary-nvim
              nvim-whichkey-setup-lua
              nvim-autopairs
              nvim-web-devicons
              # File tree
              nvim-tree-lua

              bufferline-nvim
              vim-bbye
              lualine-nvim
              toggleterm-nvim
              impatient-nvim
              indent-blankline-nvim
              FixCursorHold-nvim

              # cmp plugins
             nvim-cmp
             cmp-buffer
             cmp-path
             cmp-cmdline
             cmp_luasnip
             cmp-nvim-lsp

              # snippets
              luasnip
              friendly-snippets

              # LSP
              nvim-lspconfig
              null-ls-nvim

              # Treesitter
              nvim-treesitter

             nvim-comment
             # git
             gitsigns-nvim
             
             
             

              #gruvbox-community
              gruvbox
          
            ];
            opt = [
            ];
          };
          customRC = builtins.readFile ./init.lua; #./nvim.vim;
        };
      }
      )
    ];
  };
}
