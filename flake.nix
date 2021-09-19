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
    # unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # home-manager = {
    #   url = "github:nix-community/home-manager/master";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    #   # inputs.unstable.follows = "unstable";
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
      # system = "x86_64-linux";

      # pkgs = import inputs.nixpkgs {
      # pkgs = import nixpkgs {
        # inherit system;
        # config = { allowUnfree = true;};
      # };

      # lib = nixpkgs.lib;
      # lib = inputs.nixpkgs.lib;

      # overlays = [
      # #   inputs.xmonad.overlay
      # #   inputs.xmonad-contrib.overlay
      # #   inputs.taffybar.overlay
      #   inputs.neovim-nightly-overlay.overlay
      # ];

  in {
        # homeManagerConfigurations = {
        #   lk = home-manager.lib.homeManagerConfiguration {
        #     inherit system pkgs;
        #     username = "lk";
        #     homeDirectory = "/home/lk";
        #     stateVersion = "21.05";
        #     configuration = { pkgs, ...}:
        #     {
        #       imports = [
        #         ./users/lk/home.nix
        #         # ../../programs/nvim/nvim.nix
        #       ];
        #       # inputs.unstable.overlays = overlays;
        #       nixpkgs.overlays = overlays;
        #       # unstable.overlays = overlays;
        #     };
        #   };
        # };

        nixosConfigurations = {

        # desktop
        fuji = nixpkgs.lib.nixosSystem {
          # inherit system pkgs;
          system = "x86_64-linux";

          modules = [
            ./comp/fuji.nix

                # home-manager.nixosModules.home-manager {
                # # pkgs.nixosModules.home-manager {
                #   home-manager.useGlobalPkgs = true;
                #   home-manager.useUserPackages = true;
                #   home-manager.users.lk = import ./users/lk/home.nix;
                #   nixpkgs.overlays = [
                #     neovim-nightly-overlay.overlay
                #   ];
                # }
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
