{config, pkgs, ...}:

{
	fonts = {
				fonts = with pkgs; [
									inconsolata
									fira-code
									fira-code-symbols
									ubuntu_font_family
									corefonts
									noto-fonts-emoji
									# joypixels
									# nerdfonts
								];
				fontconfig = {
								defaultFonts = {
												monospace = ["Fira Code"];
												# emoji = ["Joypixels"];
											};
		};
	};
}
