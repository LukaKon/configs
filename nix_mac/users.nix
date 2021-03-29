{ config, pkgs, ... }:

{
    users.users.lk = {
                        isNormalUser = true;
                        home = "/home/lk";
                        description = "lko";
                        extraGroups = [ "wheel" "networkmanager" "docker"];
                        shell = pkgs.zsh;
                        packages = with pkgs;
                                            [
                                                exercism

                                                # dotnet
                                                #mono
                                                # dotnet-sdk_3
                                                #dotnetCorePackages.sdk_3_0
                                                #dotnetCorePackages.netcore_3_1
                                            ];
                    };
}
