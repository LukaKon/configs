{ config, pkgs, ... }:

let
  # customNeovim = import ./config/nvim/nvim.nix;
  # customNvim = import /etc/nixos/programs/nvim/nvim.nix;

in
{
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  # programs.neovim = customNeovim pkgs;

  programs.git = {
    enable = true;
    userName = "lukakon";
    userEmail = "lukasz.konieczny.lk@protonmail.com";
    extraConfig = {
      init = { defaultBranch = "main"; };
    };
  };
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "lk";
  home.homeDirectory = "/home/lk";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "21.05";

  programs.gpg = {
    enable = true;
  };

  services.gpg-agent = {
    enable = true;
    pinentryFlavor = "gnome3";#"qt";
  };

  home.packages = with pkgs; [
    # gtop
    git
    git-crypt
    gnupg # gpg
    pinentry-gnome
  ];
}
