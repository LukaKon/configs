{ pkgs, config, lib, ... }:

with lib;

let
  cfg = config.lk.git;
in
{
  options.lk.git = {
    enable = mkOption {
      description = "Enable git";
      type = types.bool;
      default = false;
    };

    userName = mkOption {
      description = "Name for git";
      type = types.str;
      default = "lukakon";
    };

    userEmail = mkOption {
      description = "Email for git";
      type = types.str;
      default = "lukasz.konieczny.lk@protonmail.com";
    };
  };

  config = mkIf (cfg.enable) {
    program.git = {
      enable = true;
      userName = cfg.userName;
      userEmail = cfg.userEmail;
      extraConfig = {
        credential.helper = "${pkgs.git.override {withLibsecret = true; }}/bin/git-credential-libsecret";
      };
    };
  };
}
