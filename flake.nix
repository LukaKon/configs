{
  description = "Flake system configurations";

  inputs = rec {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.05";
    # nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    # nixpkgs.url = "nixpkgs/nixos-unstable";

    nix.url = "github:NixOS/nix";

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    helix-master.url = "github:helix-editor/helix";

    # neovim-flake.url = "github:jordanisaacs/neovim-flake";
    neovim-flake = {
      url = github:gvolpe/neovim-flake;
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      # url = "github:nix-community/home-manager";
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    leftwm.url = "github:leftwm/leftwm";

    # hyprland = {
    #   url = "github:hyprwm/Hyprland";
    #   # build with your own instance of nixpkgs
    #   inputs.nixpkgs-unstable.follows = "nixpkgs";
    # };
  };

  outputs =
    inputs@{ self
    , nix
    , nixpkgs
      # , nixpkgs-unstable
    , flake-utils
    , helix-master
    , neovim-flake
    , home-manager
    , leftwm
      # , hyprland
    , ...
    }:

    let
      system = "x86_64-linux";

      inherit (nixpkgs) lib;

      overlays = [
        leftwm.overlay
      ];

      pkgs = import nixpkgs {
        inherit system overlays;
        config = { allowUnfree = true; };
      };

    in
    rec {
      nixosConfigurations = {

        lap = lib.nixosSystem {
          inherit system pkgs;

          modules = [
            # Include the results of the hardware scan.
            ./lap/hardware-configuration.nix

            # System
            ./modules/system/system.nix # Base system settings
            ./modules/system/network.nix # Network configuration
            ./modules/system/fonts.nix
            ./modules/system/env_variables.nix
            ./modules/system/zfs.nix
            ./modules/system/sound.nix
            ./modules/system/shellAliases.nix # Shell aliases
            ./modules/system/lk.nix

            # Security
            ./modules/security/doas.nix # Add 'doas'
            ./modules/security/firewall.nix

            # Services
            ./modules/services/openssh.nix # SSH
            # ./modules/services/remote.nix # remote server/desktop
            ./modules/services/laptop.nix
            ./modules/services/vial.nix

            # Programs
            ./modules/programs/progr.nix
            ./modules/programs/zsh.nix
            ./modules/programs/flatpak.nix

            # Desktops
            ./modules/desktops/leftwm

            # Virtualisation
            ./modules/virtualisation/docker.nix # Docker
            # ./modules/virtualisation/podman.nix
            # ./modules/virtualisation/arion.nix
            ./modules/virtualisation/virt-manager.nix
            # ./modules/virtualisation/vbox.nix

            # Nixos ontainers
            # ./containers

            # hyprland.nixosModules.default

            # {
            #   programs = {
            #     hyprland.enable = true;
            #   };
            # }


            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit
                  helix-master;
              };
              home-manager.users.lk = { ... }: {
                home.stateVersion = "22.05";
                imports = [
                  ./home
                  neovim-flake.nixosModules.hm
                ];
              };
            }
          ];
        };
      };
    };
}
