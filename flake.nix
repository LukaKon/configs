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

outputs = inputs@{ self ,nixpkgs, flake-utils, neovim-flake, helix-flake, ... }:
# outputs = attrs@{ self ,nixpkgs, nixpkgs-unstable, flake-utils, neovim-flake, helix-flake, ... }:

  # outputs = inputs:

  let
    system = "x86_64-linux";

    overlays = [
      neovim-flake.overlay
      helix-flake.overlay
    ];

    lib = nixpkgs.lib;

    # [(import ./overlays)];
    pkgs = import nixpkgs {
        inherit system ;#overlays;
        config.allowUnfree = true;
        overlays = [
          helix-flake.overlay
          (self: last: {
            neovimJD = inputs.neovim-flake.packages."${self.system}".neovimJD;
          })
        ];
    };

    # overlays = [
    #   (final: prev: { mynvim = neovim-flake.defaultPackage; })
    #   (final: prev: { myhelix = helix-flake.defaultPackage; })
    #   ];

  in {

    nixosConfigurations = {

        # desktop
        fuji = lib.nixosSystem {
          inherit system pkgs ; #nixpkgs allPkgs;

          # specialArgs = attrs;
          # specialArgs = { inherit pkgs neovim-flake; };

          modules = [
            # ./comp/fuji.nix

            ({ config, pkgs, ... }:
            {
              nixpkgs.overlays = overlays;

              environment.systemPackages = with pkgs; [
                inputs.neovim-flake.defaultPackage.x86_64-linux
                # nvim
                # helix
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
