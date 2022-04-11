{ neovim-flake }:

let

in
{
    overlays = [
        neovim-flake.overlay
    ];
}