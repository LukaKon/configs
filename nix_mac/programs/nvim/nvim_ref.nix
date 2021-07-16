{pkgs, ...}:

{
  environment = {
    variables = {EDITOR = "nvim"; VISUAL = "nvim";};
    systemPackages = with pkgs;[
      # neovim-remote
      # ripgrep
      # ctags
    ];
  };
  # programs = {npm.enable = true;};

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
                # File tree
                nvim-web-devicons
                nvim-tree-lua

                # Lsp and auto completion
                nvim-lspconfig
                nvim-compe

                # Eyecandy
                galaxyline-nvim
                nvim-treesitter
                indentLine
                nvim-bufferline-lua

                # Languages
                vim-nix

                # Assorted web dev plugins
                nvim-colorizer-lua
                vim-closetag
                pears-nvim

                # Misc
                neorg
                plenary-nvim
                markdown-preview-nvim
              ];
              opt = [];
            };
            customRC = ''
              luafile /etc/nixos/programs/nvim/lua/settings.lua
              luafile /etc/nixos/programs/nvim/lua/bufferline.lua
              luafile /etc/nixos/programs/nvim/lua/statusline.lua

              lua << EOF
              vim.defer_fn(function()
              vim.cmd [[
                luafile /etc/nixos/programs/nvim/lua/lsp.lua
                luafile /etc/nixos/programs/nvim/lua/tree.lua
                luafile /etc/nixos/programs/nvim/lua/treesitter.lua
                luafile /etc/nixos/programs/nvim/lua/neorg.lua
              ]]
              end, 70)
              EOF

              let g:indentLine_color_term = 8
              let g:indentLine_char_list = ['▏', '▏', '▏', '▏']

              map ; :

              let g:python_host_skip_check=1
              let g:loaded_python3_provider=1

              hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
              nmap <C-p> :NvimTreeToggle <CR>

              set nowrap
              set nobackup
              set nowritebackup
              set noerrorbells
              set noswapfile

            '';
            #opt=[];
          };
        };
      };
    };
  };
}
