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

    #neovim-flake = {
    #  url = "github:LukaKon/neovim-flake_WT";
    #};
    neovim-flake = {
      #url = "github:jordanisaacs/neovim-flake";
      url = "github:wiltaylor/neovim-flake";
    };
  };

  outputs =
    inputs@{ self
    , nix
    , nixpkgs
    , nixpkgs-unstable
    , flake-utils
    , neovim-flake
    , ...
    }:

    let
      system = "x86_64-linux";

      lib = nixpkgs-unstable.lib;

      pkgs = import nixpkgs-unstable {
        # pkgs = import nixpkgs {
        inherit system; # overlays;
        config.allowUnfree = true;
        overlays = [
          (final: prev: {
            # neovim = neovim-flake.defaultPackage.${system};
          })
        ];
      };


    in
    rec {

      defaultPackage.${system} = self.packages.${system}.neovim-flake;
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
            ({ config, pkgs, ... }: {
              #nixpkgs.overlays = [overlay-neovim];
              environment.systemPackages = with pkgs; [
                #inputs.neovim-flake.defaultPackage.${system}
                neovim-flake.defaultPackage.${system}
                # packages.neovim-flake.${system}.default
                # neovim
              ];

              imports =
                [
                  ./lap/lap.nix
                ];
            }
            )
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
                  #neovim-flake.defaultPackage.${system}
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
        nixos = lib.nixosSystem {
          #inherit pkgs;
          nixpkgs = self.nixpkgs;
          system = "aarch64-linux";

          modules = [
            ./raspi/configuration.nix
          ];
        };

      };
    };
}
