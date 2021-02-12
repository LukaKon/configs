{ config, pkgs, ... }:

{
    users.users.lk = {
                        isNormalUser = true;
                        home = "/home/lk";
                        description = "lko";
                        extraGroups = [ "wheel" "networkmanager" "dialout"
                        "vboxsf" "vboxusers" "docker"];
                        shell = pkgs.zsh;
                        packages = with pkgs;
                                            [
                                                # text editor
                                                neovim

                                                # IDE
                                                vscode
                                                #arduino

                                                wordpress
                                            ];
                    };
}
