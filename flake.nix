{
  description = "Flake system configurations";

  inputs = rec {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix.url = "github:NixOS/nix";

    # flake-utils = {
    #   url = "github:numtide/flake-utils";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    # helix-master.url = "github:helix-editor/helix";
  };

  outputs =
    inputs@{ self
    , nix
    , nixpkgs
    , flake-utils
    , ...
    }:

    let
      system = "x86_64-linux";

      inherit (nixpkgs) lib;

      overlays = [
        #leftwm.overlay
      ];

      pkgs = import nixpkgs {
        inherit system overlays;
        config = {
          allowUnfree = true;
          joypixels.acceptLicense = true;
        };
      };

    in
    rec {
      nixosConfigurations = {

        lap = lib.nixosSystem {
          inherit system pkgs;

          modules = [
            # Include the results of the hardware scan.
            ./lap/hardware-configuration.nix

            # dev
            ./development/dev.nix

            # System
            ./modules/system/system.nix # Base system settings
            ./modules/system/network.nix # Network configuration
            ./modules/system/fonts.nix
            ./modules/system/env_variables.nix
            ./modules/system/shellAliases.nix # Shell aliases
            ./modules/system/lk.nix

            # Security
            ./modules/security/doas.nix # Add 'doas'
            ./modules/security/firewall.nix

            # Services
            ./modules/services/openssh.nix # SSH
            #./modules/services/laptop.nix

            # Programs
            #./modules/programs/progr.nix
            ./modules/programs/fish.nix
            # ./modules/programs/flatpak.nix

            # Desktops
            #./modules/desktops/leftwm

            # Virtualisation
            ./modules/virtualisation/docker.nix # Docker
            ./modules/virtualisation/podman.nix
            # ./modules/virtualisation/arion.nix


            # hyprland.nixosModules.default
            #
            # {
            #   programs = {
            #     hyprland.enable = true;
            #   };
            # }

            # home-manager.nixosModules.home-manager
            # {
            #   home-manager.useGlobalPkgs = true;
            #   home-manager.useUserPackages = true;
            #   home-manager.extraSpecialArgs = {
            #     inherit
            #       helix-master;
            #   };
            #   home-manager.users.lk = { ... }: {
            #     home.stateVersion = "22.05";
            #     imports = [
            #       ./home
            #     ];
            #   };
            # }
          ];
        };
      };
    };
}
