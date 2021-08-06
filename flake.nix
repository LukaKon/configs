{
  description = "Flake configurations";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";

      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = true;};
      };

      lib = nixpkgs.lib;

    in {
      homeManagerConfigurations = {
        lk = home-manager.lib.homeManagerConfiguration {
          inherit system pkgs;
          username = "lk";
          homeDirectory = "/home/lk";
          configuration = {
            imports = [
              ./users/lk/home.nix
            ];
          };
        };
      };
      nixosConfigurtions = {
        fuji = lib.nixosSystem {
          inherit system;

          modules = [
            ./config/nix/configuration.nix
          ];
        };
      };
    };
}
