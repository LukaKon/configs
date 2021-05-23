{ config, pkgs, ... }:

{
    users.users.lk = {
                        isNormalUser = true;
                        home = "/home/lk";
                        description = "lko";
                        extraGroups = [ "wheel" "networkmanager" "dialout" "vboxusers" "libvirtd" "docker"];
                        shell = pkgs.zsh;
                        packages = with pkgs;
                                            [
                                                exercism
                                            ];
                    };
}
