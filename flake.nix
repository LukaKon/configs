{
  description = "Flake system configurations";

  inputs = rec {

    # my_conf = {
      # url = "github:LukaKon/configs/nix";
      # inputs.nixpkgs.follows = "nixpkgs";
      # flake = false;
    # };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # neovim-nightly-overlay = {
    #   url = "github:nix-community/neovim-nightly-overlay";
    #   inputs.nixpkgs.follows = "nixpkgs";
    #   inputs.flake-utils.follows = "flake-utils";
    # };
};

outputs = inputs@{ nixpkgs, flake-utils, ... }: # neovim-nightly-overlay, ... }:
  # outputs = inputs:

  let
    # system = ["x86_64-linux" "aarch64-linux"];

  in {

    nixosConfigurations = {

        # desktop
        fuji = nixpkgs.lib.nixosSystem {
          # inherit system; # pkgs;
          system = "x86_64-linux";

          modules = [
            ./comp/fuji.nix
          ];
        };

        # laptop
        lap = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./lap/lap.nix
          ];
        };
        mac = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";

          modules = [
            ./mac/mac.nix
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
