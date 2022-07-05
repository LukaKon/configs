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
      #url = "github:jordanisaacs/neovim-flake";
      #url = "github:wiltaylor/neovim-flake";
      url = "github:lukakon/neovim-flake";
    };

    nixvim.url = github:pta2002/nixvim;

    #home-manager = {
    #  url = "github:nix-community/home-manager";
    #  inputs.nixpkgs.follows = "nixpkgs-unstable";
    #};
  };

  outputs =
    inputs@{ self
    , nix
    , nixpkgs
    , nixpkgs-unstable
    , flake-utils
    , neovim-flake
    , nixvim
      #, home-manager
    , ...
    }:

    let
      system = "x86_64-linux";

      inherit (nixpkgs-unstable) lib;

      #util = import ./lib {
      #  inherit system pkgs home-manager lib;
      #  overlays = (pkgs.overlays);
      #};

      #inherit (util) user;
      #inherit (util) host;

      pkgs = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
        overlays = [ ];
      };

      #    in
      #    {
      #      homeManagerConfiguration =
      #        { system
      #        , configuration
      #        , homeDirectory
      #        , username
      #        , extraModules ? [ ]
      #        , extraSpecialArgs ? { }.pkgs ? builtins.getAttr system nixpkgs.outputs.legacyPackages
      #        , check ? true
      #        , stateVersion ? "20.09"
      #        }@args:
      #          assert nixpkgs.lib.versionAtLeast stateVersion "20.09";
      #
      #          import ./modules {
      #            inherit pkgs check extraSpecialArgs;
      #            configuration = { ... }: {
      #              imports = [ configuration ] ++ extraModules;
      #              home = { inherit homeDirectory stateVersion username; };
      #              nixpkgs = { inherit (pkgs) config overlays; };
      #            };
      #          };
      #      lk = user.mkHMUser {
      #        userConfig = {
      #          git.enable = true;
      #          zsh.enable = true;
      #        };
      #      };
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

        # laptop
        #        lap = host.mkHost {
        #          name = "lap";
        #          NICs = [ "enp0s31f6" "wlp0s20f3" ];
        #          kernelPackages = pkgs.linuxPackages;
        #          initrdMods = [ "xhci_pci" "thunderbolt" "vmd" "nvme" "usb_storage" "sd_mod" "rtsx_pci_sdmmc" ];
        #          kernelMods = [ "kvm-intel" ];
        #          kernelParams = [ ];
        #          systemConfig = { };

        #          users = [{
        #            name = "lk";
        #            groups = [ "wheel" "networkmanager" "dialout" "libvirtd" "docker" "video" ];
        #            uid = 1000;
        #            shell = pkgs.zsh;
        #          }];
        #          cpuCores = 8;
        #        };


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

            ({ config, pkgs, ... }:
              {
                environment.systemPackages = with pkgs; [
                  # packages.neovim-flake.${system}.default
                  neovim-flake.defaultPackage.${system}
                  # inputs.packages.neovim-flake.${system}.default
                ];

                imports =
                  [
                    ./virt/virt.nix
                  ];
              }
            )
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
