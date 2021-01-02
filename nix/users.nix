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

                                    # Python
                                    tk
                                    jupyter
                                    
                                    # C++
                                    #gcc
                                    #cmake
                                    #clang
                                    
                                    exercism

                                    # IDE
                                    vscode
                                    #vscodium
                                    arduino
                                    #kdevelop
                                    #kdev-python
                                    jetbrains.pycharm-community
                                    #monodevelop

                                    # LaTeX
                                    texlive.combined.scheme-full 
                                    texstudio
                                    
                                    # snipping screen
                                    #flameshot  - not working

                                    # docker
                                    docker-compose
                                    
                                    # dotnet
                                    #mono
                                    dotnet-sdk_3
                                    #dotnetCorePackages.sdk_3_0
                                    #dotnetCorePackages.netcore_3_1

                                    ];
		};
}
