{ pkgs, lib, dotfiles, helix-master, ... }:
{
  programs.helix = {
    enable = true;
    package = helix-master.packages."x86_64-linux".default;
    settings = {
      theme = "ayu_mirage";
      editor = {
        auto-format = false;
        auto-info = true;
        line-number = "relative";
        cursorline = true;
        scrolloff = 5;
        color-modes = true;
        idle-timeout = 400;
        true-color = true;
        mouse = true;
        middle-click-paste = true; # new default
        shell = [ "zsh" ];
        lsp.display-messages = true;
        completion-trigger-len = 3; #new
        search = {
          smart-case = false;
          wrap-around = true;
        };
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "underline";
        };
        file-picker = {
          hidden = false;
        };
        whitespace.render = "all";
        whitespace.characters = {
          space = "·";
          nbsp = "⍽";
          tab = "→";
          newline = "⤶";
          tabpad = ".";
        };
        statusline = {
          left = [ "mode" "spinner" "file-name" ];
          center = [ ];
          right = [ "diagnostics" "file-encoding" "file-line-ending" "file-type" "position" "position-percentage" "selections" ];
          # separator = "|";
        };
        indent-guides = {
          render = true;
          # character = "|"; # default is '|''
        };
      };
      keys.normal = {
        "X" = "extend_line_above";
        "{" = "goto_prev_paragraph";
        "}" = "goto_next_paragraph";
        # "y" = "yank_main_selection_to_clipboard";
      };
      keys.insert = {
        "up" = "move_line_up";
        "down" = "move_line_down";
        "left" = "move_char_left";
        "right" = "move_char_right";
        # "C-b" = "move_char_left";
        # "C-f" = "move_char_right";
        # "A-b" = "move_prev_word_end";
        # "C-left" = "move_prev_word_end";
        # "A-f" = "move_next_word_start";
        # "C-right" = "move_next_word_start";
        # "A-<" = "goto_file_start";
        # "A->" = "goto_file_end";
        # "pageup" = "page_up";
        # "pagedown" = "page_down";
        # "home" = "goto_line_start";
        # "C-a" = "goto_line_start";
        # "end" = "goto_line_end_newline";
        # "C-e" = "goto_line_end_newline";
        # "A-left" = "goto_line_start";
      };
    };
  };

  home.packages = with pkgs; [
    # Debugging
    lldb

    # Language servers
    clang-tools # C-Style
    cmake-language-server # Cmake
    rust-analyzer
    omnisharp-roslyn # .NET 
    # sumneko-lua-language-server # Lua
    # nodePackages.vim-language-server
    nodePackages.vscode-json-languageserver

    nodePackages.pyright
    nodePackages.vscode-langservers-extracted
    nodePackages.dockerfile-language-server-nodejs
    nodePackages.typescript-language-server
    nodePackages.typescript

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
    ]))
  ];
}
