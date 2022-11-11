{ pkgs, config, ... }:

{
  environment.defaultPackages = with pkgs; [
    clang
    # gcc
    bmake
    cmake

    nodejs-18_x
    # deno

    distrobox

    # http-prompt
    # gitlab
    # gitlab-runner
    # github-runner
    heroku

    hadolint # docker linter

    dotnet-sdk

    rustc
    cargo
    rustfmt

    lldb

    # Language servers
    clang-tools # C-Style
    cmake-language-server # Cmake
    rust-analyzer
    omnisharp-roslyn # .NET 
    sumneko-lua-language-server # Lua
    # nodePackages.vim-language-server
    nodePackages.vscode-json-languageserver

    # nodePackages.pyright
    nodePackages.vscode-langservers-extracted
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.typescript-language-server
    nodePackages.typescript
    nodePackages.tailwindcss
    nodePackages.prettier

    # yaml
    nodePackages.yaml-language-server

    # LaTeX
    texlab

    # toml
    taplo-lsp

    # nix
    rnix-lsp
    nixfmt
    nixpkgs-fmt

    # markdown
    # TODO: markdown is not yet supported by helix
    tree-sitter-grammars.tree-sitter-markdown

    (python310.withPackages (ps: with ps;
    [
      python-lsp-server
      pylsp-mypy
      isort
      flake8
    ]))
  ];
}
