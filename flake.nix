{
  description = "Flake system configurations";

  inputs = rec {

    # lko = {
      # type="github";
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

    neovim-flake = {
      # url = "/home/lk/nvim-flake";
      url = "github:LukaKon/neovim-flake";
    };
};

outputs = inputs@{ nixpkgs, flake-utils, neovim-flake, ... }:
  # outputs = inputs:

  let

    system = "x86_64-linux";

    # pkgs = import nixpkgs;

    inherit (import ./overlays {
      inherit neovim-flake;
    }) overlays;

    pkgs = import nixpkgs {
      inherit system  overlays;
      config = {
          allowUnfree = true;
        };
    };


  in {

    nixosConfigurations = {

        # desktop
        fuji = nixpkgs.lib.nixosSystem {
          inherit system pkgs;
          # system = "x86_64-linux";
          modules = [
            ./comp/fuji.nix
          ];
        };

        # laptop
        lap = nixpkgs.lib.nixosSystem {
          # system = "x86_64-linux";
          inherit system; # pkgs;

          modules = [
            ./lap/lap.nix
          ];
        };

        # raspberry
        # raspi  = nixpkgs.lib.nixosSystem {
          # # inherit pkgs;
          # system = "aarch64-linux";

          # modules = [
            # ./raspi/configuration.nix
          # ];
        # };

      };
    };
  }
