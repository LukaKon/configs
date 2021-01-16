{ config, pkgs, ... }:

{
    users.users.rk = {
                        isNormalUser = true;
                        home = "/home/rk";
                        description = "Romano";
                        extraGroups = [ "wheel" "networkmanager"]; 
                        shell = pkgs.zsh;
                packages = with pkgs;
                                    [
                                    # text editor
                                    neovim
                                    ranger
                                    ueberzug
                                    
                                    # IDE
                                    vscode

                                    ];
		};
}
