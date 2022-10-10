{ config, pkgs, ... }:

{
  imports = [
    ../modules/programs/helix.nix
    ../modules/programs/nvim.nix
    ../development/dev.nix
  ];
}
