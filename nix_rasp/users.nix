{ config, pkgs, ... }:

{
    # users.users.lk = {
    #                     isNormalUser = true;
    #                     home = "/home/lk";
    #                     description = "lko";
    #                     extraGroups = [ "wheel" "networkmanager" "docker"];
    #                     shell = pkgs.zsh;
    #                     packages = with pkgs;
    #                                         [
    #                                             # exercism

    #                                         ];
    #                 };


    users = {
    defaultUserShell = pkgs.zsh;
    mutableUsers = false;
    users.root = {
      password = "apassword";
    };
    users.lk = {
      isNormalUser = true;
      password = "lk";
      extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
    };
  };
}
