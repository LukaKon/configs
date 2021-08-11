{
  description = "Flake system configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      # inputs.flake-utils.follows = "flake-utils";
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

  outputs = inputs@{ nixpkgs, flake-utils, home-manager, neovim-nightly-overlay, ... }:


    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true;};
      };

      lib = nixpkgs.lib;

      # overlays = [
      #   inputs.xmonad.overlay
      #   inputs.xmonad-contrib.overlay
      #   inputs.taffybar.overlay
        # inputs.neovim-nightly-overlay.overlay
      # ];

    in {
        homeManagerConfigurations = {
          lk = home-manager.lib.homeManagerConfiguration {
            inherit system pkgs;
            username = "lk";
            homeDirectory = "/home/lk";
            stateVersion = "21.05";
            configuration = {
              imports = [
                ./users/lk/home.nix
              ];
            };
          };
        };

      nixosConfigurations = {
        fuji = lib.nixosSystem {
          inherit system;

          modules = [
            ./nix/configuration.nix
            # ./nix/hardware-configuration.nix
            home-manager.nixosModules.home-manager
          {
            nixpkgs.overlays = [
              inputs.neovim-nightly-overlay.overlay
            ];
          }
          ];
        };
      };
    };
}
