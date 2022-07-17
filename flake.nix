{
  description = "Flake system configurations";

  inputs = rec {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix.url = "github:NixOS/nix";

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    # neovim-flake = {
    #url = "github:jordanisaacs/neovim-flake";
    #url = "github:wiltaylor/neovim-flake";
    # url = "github:lukakon/neovim-flake";
    # };

    nixvim.url = github:pta2002/nixvim;
  };

  outputs =
    inputs@{ self
    , nix
    , nixpkgs
    , nixpkgs-unstable
    , flake-utils
      # , neovim-flake
    , nixvim
    , ...
    }:

    let
      system = "x86_64-linux";

      inherit (nixpkgs-unstable) lib;

      pkgs = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
        overlays = [ ];
      };

    in
    rec {
      nixosConfigurations = {

        # desktop
        fuji = lib.nixosSystem {
          inherit system pkgs;

          modules = [
            ./comp/fuji.nix

            # ({ config, pkgs, ... }:
            #   {
            #     environment.systemPackages = with pkgs; [
            #       neovim-flake.defaultPackage.${system}
            #     ];

            #     imports =
            #       [
            #         ./comp/fuji.nix
            #       ];
            #   }
            # )
          ];
        };

        lap = lib.nixosSystem {
          inherit system pkgs;

          modules = [
            ./lap/lap.nix
          ];
        };

        # virt
        virt = lib.nixosSystem {
          inherit system pkgs;

          modules = [

            ./virt/virt.nix
          ];
        };

        # raspberry
        #        nixos = lib.nixosSystem {
        #          #inherit pkgs;
        #          nixpkgs = self.nixpkgs;
        #          system = "aarch64-linux";

        #          modules = [
        #            ./raspi/configuration.nix
        #          ];
        #        };
      };
    };
}
