{ config, pkgs, ... }:

{
  imports = [
    ../modules/programs/helix.nix
    # ../development/dev.nix
  ];
}
