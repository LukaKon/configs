{ config, pkgs, ... }:

{
  fonts = {
    fonts = with pkgs; [
      corefonts
      emojione
      fira-code
      fira-code-symbols
      font-awesome
      inconsolata
      inconsolata-nerdfont
      joypixels
      line-awesome
      meslo-lgs-nf
      mononoki
      nerdfonts
      noto-fonts-emoji
      rofi-emoji
      ubuntu_font_family
    ];

    fontconfig = {
      defaultFonts = {
        # monospace = [ "Fira Code" ];
        monospace = [ "Nerdfont" ];
        emoji = ["Joypixels"];
      };
    };
  };
}
