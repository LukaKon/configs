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
         

              # File tree
              nvim-tree-lua



             

              gruvbox-community
          
            ];
            opt = [
            ];
          };
          customRC = builtins.readFile ./cm/init.lua; #./nvim.vim;
        };
      }
      )
    ];
  };
}
