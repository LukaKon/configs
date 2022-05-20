{
  description = "Flake system configurations";

  inputs = rec {

    nixpkgs.url = "github:nixos/nixpkgs/nixos-21.11";
    nixpkgs-unstable.url = "nixpkgs/nixos-unstable";
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-utils = {
      url = "github:numtide/flake-utils";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };

    # neovim-flake = {
    #   url = "github:LukaKon/neovim-flake";
    # };
    neovim-flake = {
      url = "github:jordanisaacs/neovim-flake";
    };
  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, flake-utils, neovim-flake, ... }:

    let
      system = "x86_64-linux";

      lib = nixpkgs-unstable.lib;
      # lib = nixpkgs.lib;

      pkgs = import nixpkgs-unstable {
        # pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ ];
      };

    in
    {

      nixosConfigurations = {

        # desktop
        fuji = lib.nixosSystem {
          inherit system pkgs;

          modules = [
            # ./comp/fuji.nix

            ({ config, pkgs, ... }:
              {
                environment.systemPackages = with pkgs; [
                  inputs.neovim-flake.defaultPackage.${system}
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
          inherit system;

          modules = [
            # ./lap/lap.nix
            ({ config, pkgs, ... }:
              {
                environment.systemPackages = with pkgs; [
                  inputs.neovim-flake.defaultPackage.${system}
                  #inputs.helix-flake.defaultPackage.${system}
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
