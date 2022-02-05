{config, pkgs, ...}:

{
  fonts = {
    fonts = with pkgs; [
      inconsolata
      inconsolata-nerdfont
      fira-code
      fira-code-symbols
      ubuntu_font_family
      corefonts
      noto-fonts-emoji
      monoid
      # joypixels
      nerdfonts
      font-awesome
      line-awesome
      mononoki
    ];

    fontconfig = {
      defaultFonts = {
        monospace = ["Fira Code"];
            # emoji = ["Joypixels"];
          };
        };
      };
    }
