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

    neovim-flake = {
    url = "github:jordanisaacs/neovim-flake";
    #url = "github:wiltaylor/neovim-flake";
    # url = "github:lukakon/neovim-flake";
    };

    # nixvim.url = github:pta2002/nixvim;

    helix-master.url = "github:helix-editor/helix";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs-unstable.follows = "nixpkgs";
    };

  };

  outputs =
    inputs@{ self
    , nix
    , nixpkgs
    , nixpkgs-unstable
    , flake-utils
      , neovim-flake
      # , nixvim
    , helix-master
    , home-manager
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
            # Include the results of the hardware scan.
            ./fuji/hardware-configuration.nix

            # System
            ./modules/system/system.nix # Base system settings
            ./modules/system/network.nix # Network configuration
            ./modules/system/nvidia.nix
            ./modules/system/fonts.nix
            ./modules/system/env_variables.nix
            # ./modules/system/cron.nix
            ./modules/system/shellAliases.nix # Shell aliases
            ./modules/system/lk.nix
            ./modules/system/kk.nix

            # Security
            ./modules/security/doas.nix # Add 'doas'
            ./modules/security/firewall.nix

            # Services
            ./modules/services/openssh.nix # SSH
            #./modules/services/keyring.nix
            # ./modules/services/bluetooth.nix
            # ./modules/services/remote.nix # remote server/desktop

            # Programs
            ./modules/programs/progr.nix
            #./modules/programs/kakoune.nix
            # ./modules/programs/nvim/nvim.nix
            ./modules/programs/zsh.nix
            ./modules/programs/flatpak.nix

            # Desktops
            # ./modules/desktops/i3/i3.nix  # i3 window manager settings
            # ./modules/desktops/qtile.nix
            ./modules/desktops/kde.nix

            # Virtualisation
            # ./modules/virtualisation/podman.nix # Podman
            # ./modules/virtualisation/docker.nix # Docker
            # ./modules/virtualisation/virt-manager.nix
          ];
        };

        lap = lib.nixosSystem {
          inherit system pkgs;

          modules = [
            # Include the results of the hardware scan.
            ./lap/hardware-configuration.nix

            # System
            ./modules/system/system.nix # Base system settings
            ./modules/system/network_lap.nix # Network configuration
            ./modules/system/fonts.nix
            ./modules/system/env_variables.nix
            # ./modules/system/cron.nix
            ./modules/system/shellAliases.nix # Shell aliases
            ./modules/system/lk.nix
            #./modules/system/kk.nix

            # Security
            ./modules/security/doas.nix # Add 'doas'
            ./modules/security/firewall.nix

            # Services
            ./modules/services/openssh.nix # SSH
            # ./modules/services/keyring.nix
            # ./modules/services/remote.nix # remote server/desktop
            ./modules/services/laptop.nix

            # Programs
            ./modules/programs/progr.nix
            # ./modules/programs/vim
            #./modules/programs/nixvim.nix
            # ./modules/programs/nvim/nvim.nix
            #./modules/programs/kakoune.nix
            ./modules/programs/zsh.nix
            ./modules/programs/flatpak.nix

            # Desktops
            # ./modules/desktops/i3/i3.nix  # i3 window manager settings
            # ./modules/desktops/qtile
            ./modules/desktops/leftwm
            # ./modules/desktops/spectrwm

            # Virtualisation
            ./modules/virtualisation/docker.nix # Docker
            # ./modules/virtualisation/podman.nix
            ./modules/virtualisation/arion.nix
            ./modules/virtualisation/virt-manager.nix

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = {
                inherit
                  helix-master
                neovim-flake;
              };
              home-manager.users.lk = { ... }: {
                home.stateVersion="22.11";
                imports = [ ./home ];
              };
            }
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
