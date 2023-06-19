{
  description = "Flake system configurations";

  inputs = rec {

    # nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

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

    # home-manager = {
    #   url = "github:nix-community/home-manager";
    #   # url = "github:nix-community/home-manager/release-22.11";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    # leftwm.url = "github:leftwm/leftwm";

    #hyprland = {
    #  url = "github:hyprwm/Hyprland";
    #  #   # build with your own instance of nixpkgs
    #  inputs.nixpkgs.follows = "nixpkgs";
    #};
  };

  outputs =
    inputs@{ self
    , nix
    , nixpkgs
    , flake-utils
    # , helix-master
    # , home-manager
    # , leftwm
      #, hyprland
    , ...
    }:

    let
      system = "x86_64-linux";

      inherit (nixpkgs) lib;

      overlays = [
        # leftwm.overlay
      ];

      pkgs = import nixpkgs {
        inherit system overlays;
        config = {
          permittedInsecurePackages = [ "xrdp-0.9.9" ];
          allowUnfree = true;
          joypixels.acceptLicense = true;
        };
      };

    in
    rec {
      nixosConfigurations = {

        vm = lib.nixosSystem {
          inherit system pkgs;

          modules = [
            # Include the results of the hardware scan.
            ./vm/hardware-configuration.nix

            # dev
            ./development/dev.nix

            # System
            ./vm/system.nix # Base system settings
            ./modules/system/network.nix # Network configuration
            # ./modules/system/fonts.nix
            ./modules/system/env_variables.nix
            ./modules/system/vr.nix

            # Security
            ./modules/security/doas.nix # Add 'doas'
            ./modules/security/firewall.nix

            # Services
            ./modules/services/openssh.nix # SSH
            ./modules/services/remote.nix # remote server/desktop

            # Programs
            ./modules/programs/progr.nix
            ./modules/programs/fish.nix

            # Desktops
            # ./modules/desktops/kde
            ./modules/desktops/xfce

            # Virtualisation
            ./modules/virtualisation/docker.nix # Docker
            # ./modules/virtualisation/podman.nix

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
            #     home.stateVersion = "22.11";
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
