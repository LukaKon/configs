{ pkgs, ... }:
{
  environment.variables = { EDITOR = "vim"; };


  environment.systemPackages = with pkgs; [
    ((vim_configurable.override { python = python3; }).customize{
      name = "vim";
      vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
        start = [ vim-nix vim-lastplace ];
        opt = [];
      };
      vimrcConfig.customRC = builtins.readFile ./init.vim; #./boot.vim; ./init.vim;
    }
  )];
}