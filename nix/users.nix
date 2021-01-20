{ config, pkgs, ... }:

{
    users.users.lk = {
                        isNormalUser = true;
                        home = "/home/lk";
                        description = "lko";
                        extraGroups = [ "wheel" "networkmanager" "dialout" "vboxusers" "docker"]; 
                        shell = pkgs.zsh;
                packages = with pkgs;
                                    [
                                    # text editor
                                    neovim
                                    ranger
                                    ueberzug

                                    exercism

                                    # IDE
                                    vscode
                                    arduino
                                    jetbrains.pycharm-community
                                    #monodevelop

                                    # LaTeX
                                    texlive.combined.scheme-full 
                                    texstudio
                                                                                                          
                                    # dotnet
                                    #mono
                                    dotnet-sdk_3
                                    #dotnetCorePackages.sdk_3_0
                                    #dotnetCorePackages.netcore_3_1
                                ];
		};
}
