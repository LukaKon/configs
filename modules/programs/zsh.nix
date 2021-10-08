{config, pkgs, ...}:

{
  console = {
    font = "firacode-14"; #"Lat2-Terminus16";
    keyMap = "pl";
  };

  environment.systemPackages = with pkgs; [any-nix-shell];

  programs = {
    zsh = {
      enable = true;
      promptInit = ''
        any-nix-shell zsh --info-right | source /dev/stdin
      '';
      enableGlobalCompInit = true;
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      autosuggestions.highlightStyle = "fg=blue";
      histFile = "$HOME/.config/zsh/.zsh_history";
      histSize = 10000;
      setOptions = [
        "AUTO_CD"                       # Go to folder path without using cd.
        "AUTO_PUSHD"                    # Push the old directory onto the stack on cd.
        "PUSHD_IGNORE_DUPS"         # Do not store duplicates in the stack.
        "PUSHD_SILENT"              # Do not print the directory stack after pushd or popd.
        "CORRECT"                       # Spelling correction
        "CDABLE_VARS"                   # Change directory to a path stored in a variable.
        "EXTENDED_GLOB"             # Use extended globbing syntax.

        "EXTENDED_HISTORY"              # Write the history file in the ':start:elapsed;command' format.
        "SHARE_HISTORY"                 # Share history between all sessions.
        "HIST_EXPIRE_DUPS_FIRST"        # Expire a duplicate event first when trimming history.
        "HIST_IGNORE_DUPS"            # Do not record an event that was just recorded again.
        "HIST_IGNORE_ALL_DUPS"          # Delete an old recorded event if a new event is a duplicate.
        "HIST_FIND_NO_DUPS"             # Do not display a previously found event.
        "HIST_IGNORE_SPACE"             # Do not record an event starting with a space.
        "HIST_SAVE_NO_DUPS"             # Do not write a duplicate event to the history file.
        "HIST_VERIFY"                   # Do not execute immediately upon history expansion.
      ];

      ohMyZsh = {
        enable = true;
        plugins = ["python" "colorize"];
        theme = "kolo";#"sporty_256"; #"strug"; # jonathan
        customPkgs = with pkgs; [
          nix-zsh-completions
          zsh-fast-syntax-highlighting
          any-nix-shell
          fzf-zsh
          zsh-nix-shell
        ];
      };
    };
  };
}