{
  description = "Flake system configurations";

  inputs = rec {

    # lko = {
      # type="github";
      # url = "github:LukaKon/configs/nix";
      # inputs.nixpkgs.follows = "nixpkgs";
      # flake = false;
    # };

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

    helix-flake = {
      url = github:helix-editor/helix;
    };

    # leftwm = {
      # url = github:leftwm/leftwm;
    # };

};

# outputs = inputs@{ self ,nixpkgs, flake-utils, neovim-flake, helix-flake, ... }:
outputs = attrs@{ self ,nixpkgs, flake-utils, neovim-flake, helix-flake, ... }:

  # outputs = inputs:

  let
    system = "x86_64-linux";

    # specialArgs = attrs;

    # overlays = [
      # inputs.neovim-flake.overlay
      # inputs.helix-flake
    # ];
    # [(import ./overlays)];
    pkgs = import nixpkgs {
        # inherit system overlays;
        config.allowUnfree = true;
    };

    overlays = [
      (final: prev: { mynvim = neovim-flake.defaultPackage; })
      (final: prev: { myhelix = helix-flake.defaultPackage; })
      ];

  in {

    nixosConfigurations = {

        # desktop
        fuji = nixpkgs.lib.nixosSystem {
          inherit system ;#pkgs ; #nixpkgs allPkgs;

          specialArgs = attrs;

          modules = [
            # ./comp/fuji.nix

            ({ config, pkgs, ... }:
            {
              # nixpkgs.overlays = [ overlay-neovim ];
              nixpkgs.overlays = overlays;

              environment.systemPackages = with pkgs; [
                # nvim
                # myhelix
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
        lap = nixpkgs.lib.nixosSystem {
          # system = "x86_64-linux";
          inherit system;

          modules = [
            ./lap/lap.nix
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
