{ neovim-flake, helix-flake }:

let

in
{
    overlays = [
        neovim-flake.overlay
        helix-flake.overlay
    ];
}