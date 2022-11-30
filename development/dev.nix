{ pkgs, config, ... }:

{
  environment.defaultPackages = with pkgs; [
    clang
    # gcc
    bmake
    cmake

    nodejs-18_x
    # deno

    # distrobox

    # http-prompt
    # gitlab
    # gitlab-runner
    # github-runner
    heroku

    hadolint # docker linter

    # dotnet-sdk

    rustc
    cargo
    rustfmt

    lldb

    tree-sitter

    # Language servers
    clang-tools # C-Style
    cmake-language-server # Cmake
    rust-analyzer
    # omnisharp-roslyn # .NET 
    sumneko-lua-language-server # Lua
    nodePackages.vscode-json-languageserver

    # nodePackages.pyright
    nodePackages.vscode-langservers-extracted
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.typescript-language-server
    nodePackages.typescript
    nodePackages.tailwindcss
    nodePackages.prettier
    nodePackages.eslint_d
    nodePackages.coc-markdownlint # linter

    gitlint # linter for git

    # yaml
    nodePackages.yaml-language-server
    yamllint # linter

    # LaTeX
    texlab

    # toml
    taplo-lsp

    # nix
    rnix-lsp
    nixfmt
    nixpkgs-fmt

    (python310.withPackages (ps: with ps;
    [
      python-lsp-server
      pyls-isort
      pylsp-mypy
      isort
      flake8
      pygments
      rope
      psutil
      pip
      # pynvim
      yapf
      jedi
      pylint
    ]))
  ];
}
