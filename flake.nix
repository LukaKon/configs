{
  description = "Flake system configurations";

  inputs = rec {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
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

     #neovim-flake = {
     #  url = "github:LukaKon/neovim-flake_WT";
     #};
     #neovim-flake = {
     #  url = "github:jordanisaacs/neovim-flake";
     #};
      neovim-flake = {
        url = "github:wiltaylor/neovim-flake";
    };
  };

  outputs = inputs@{ 
    self,
    nix,
    nixpkgs,
    nixpkgs-unstable,
    flake-utils,
    neovim-flake,
    ...
  }:

    let
      system = "x86_64-linux";

      lib = nixpkgs-unstable.lib;
      # lib = nixpkgs.lib;

      inherit
        ( import ./overlays {
          inherit
            pkgs
            neovim-flake
            ;
        })
        overlays;

      pkgs = import nixpkgs-unstable {
        # pkgs = import nixpkgs {
        inherit system overlays;
        config.allowUnfree = true;
        #overlays = [ ];
      };

      #overlay-neovim = final: prev: {
      #  neovim = import neovim-flake {
      #    inherit system;
      #    config.allowUnfree = true;
      #  };
      #};

    in
    {

      nixosConfigurations = {

        # desktop
        fuji = lib.nixosSystem {
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
                    ./comp/fuji.nix
                  ];
              }
            )
          ];
        };

        # laptop
        lap = lib.nixosSystem {
          inherit system pkgs;

          modules = [
            ({ config, pkgs, ... }:
              {
                #nixpkgs.overlays = [overlay-neovim];
                environment.systemPackages = with pkgs; [
                  #inputs.neovim-flake.defaultPackage.${system}
                  neovim-flake.defaultPackage.${system}
                ];

                imports =
                  [
                    ./lap/lap.nix
                  ];
              }
            )
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
