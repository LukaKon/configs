{ pkgs, lib, dotfiles, neovim-flake, ... }:
{
  programs.neovim-ide = {
    enable = true;
    settings = { };
  };
}
