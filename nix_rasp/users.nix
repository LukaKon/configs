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
    users.anormaluser = {
      isNormalUser = true;
      password = "apassword";
      extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    };
  };
}
