{ pkgs, config, ... }:

{
  environment.defaultPackages = with pkgs; [
    # clang
    # gcc
    # bmake
    # cmake

    nodejs-18_x
    # deno

    # distrobox

    # opencv
    # pkg-config

    # http-prompt
    # gitlab
    # gitlab-runner
    # github-runner

    # heroku

# TODO: broken pkg: # hadolint # docker linter

    # dotnet-sdk

    # rustc
    # cargo
    # rustfmt
    # rustup
    # rust-analyzer

    # lldb

    tree-sitter

    # astyle # Source code indenter, formatter, and beautifier for C, C++, C# and Java
    # stylua # An opinionated Lua code formatter
    # luajit # High-performance JIT compiler for Lua
    # luajitPackages.luacheck

    marksman # Language Server for Markdown

    # Language servers
    # clang-tools # C-Style
    cmake-language-server # Cmake
    # omnisharp-roslyn # .NET 
    # sumneko-lua-language-server # Lua

    # nodePackages.pyright
    nodePackages.vscode-json-languageserver
    nodePackages.vscode-langservers-extracted
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.typescript-language-server
    nodePackages.typescript
    # nodePackages.tailwindcss
    nodePackages.prettier
    nodePackages.prettier_d_slim
    nodePackages.eslint
    nodePackages.eslint_d
    nodePackages.coc-markdownlint # linter

    gitlint # linter for git

    # yaml
    nodePackages.yaml-language-server
    yamllint # linter

    # LaTeX
    # texlab

    # toml
    taplo-lsp

    # nix
    rnix-lsp
    nixfmt
    nixpkgs-fmt
    nixd
    nil

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
      yamllint
    ]))
  ];
}
