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
							description = "lko";
							password = "lk";
							extraGroups = [ "wheel" "networkmanager" "dialout" "vboxusers" "libvirtd" "docker"];
							shell = pkgs.zsh;
							packages = with pkgs; [];
    };
  };
}
