{ pkgs, config, ... }:
{
  home.packages = with pkgs; [
    nodePackages.pyright
    nodePackages.vscode-langservers-extracted
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.typescript-language-server
    nodePackages.typescript
    nodePackages.yaml-language-server

    texlab
    taplo-lsp

    rnix-lsp
    nixfmt
    nixpkgs-fmt

    (python310.withPackages (ps: with ps;
    [
      python-lsp-server
      pylsp-mypy
    ]))

    hadolint # docker linter
  ];
}
