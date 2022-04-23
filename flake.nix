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

    neovim-flake = {
      url = "github:LukaKon/neovim-flake";
    };

  };

  outputs = inputs@{ self, nixpkgs, nixpkgs-unstable, flake-utils, neovim-flake, ... }:

    let
      system = "x86_64-linux";

      lib = nixpkgs-unstable.lib;

      pkgs = import nixpkgs-unstable {
        inherit system; #overlays;
        config.allowUnfree = true;
        overlays = [
          # helix-flake.overlay
          #(self: last: {
          #  neovimJD = inputs.neovim-flake.packages."${self.system}".neovimJD;
          #})
        ];
      };

    in
    {

      nixosConfigurations = {

        # desktop
        fuji = lib.nixosSystem {
          inherit system pkgs; #nixpkgs allPkgs;

          modules = [
            # ./comp/fuji.nix

            ({ config, pkgs, ... }:
              {
                environment.systemPackages = with pkgs; [
                  inputs.neovim-flake.defaultPackage.${system}
                  #inputs.helix-flake.defaultPackage.${system}
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
        lap = nixpkgs-unstable.lib.nixosSystem {
          # system = "x86_64-linux";
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
