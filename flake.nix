{
  description = "Flake system configurations";

  inputs = rec {

    # my_conf = {
      # url = "github:LukaKon/configs/nix";
      # inputs.nixpkgs.follows = "nixpkgs";
      # flake = false;
    # };

    # nixpkgs.url = "github:nixos/nixpkgs/nixos-21.05";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.flake-utils.follows = "flake-utils";
    };

  #   xmonad = {
  #     url = "github:xmonad/xmonad";
  #     nixpkgs.follows = "nixpkgs";
  #   };

  #   xmonad-contrib = {
  #     url = "github:ivanmalison/xmonad-contrib";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #   };

  #   taffybar = {
  #     url = "github:taffybar/taffybar";
  #     inputs.nixpkgs.follows = "nixpkgs";
  #   };

  #   picom-jonaburg = {
  #     url = "github:jonaburg/picom";
  #     flake = false;
};

outputs = inputs@{ nixpkgs, flake-utils, neovim-nightly-overlay, ... }:
  # outputs = inputs:

  let


  in {

    nixosConfigurations = {

        # desktop
        fuji = nixpkgs.lib.nixosSystem {
          # inherit system pkgs;
          system = "x86_64-linux";

          modules = [
            ./comp/fuji.nix
          ];
        };

        # laptop
        mac = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./nix_mac/configuration.nix
          ];
        };

        # raspberry
        raspi  = nixpkgs.lib.nixosSystem {
          # inherit pkgs;
          system = "aarch64-linux";

          modules = [
            ./raspi/configuration.nix
          ];
        };

      };
    };
  }
