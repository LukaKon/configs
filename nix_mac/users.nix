{ config, pkgs, ... }:

{
    users = {
	users.lk = {
                    isNormalUser = true;
                    home = "/home/lk";
                    description = "lko";
                    extraGroups = [ "wheel" "networkmanager" "dialout" "docker"];
                    shell = pkgs.zsh;
					packages = with pkgs;
											[
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
	users.kk = {
                    isNormalUser = true;
                    home = "/home/kk";
                    description = "krop";
                    extraGroups = [ "wheel" "networkmanager"];
                    shell = pkgs.zsh;
					packages = with pkgs;
										[];
		};
	};
}
