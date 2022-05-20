{ config, pkgs, ... }:
let
  myKakoune =
    let
      config = pkgs.writeTextFile (rec {
        name = "kakrc.kak";
        destination = "/share/kak/autoload/${name}";
        text = ''
          set global ui_options ncurses_assistant=cat
        '';
      });
    in
    pkgs.kakoune.override {
      plugins = with pkgs.kakounePlugins; [
        config
        # parinfer-rust
        fzf-kak
        tabs-kak
        kakboard
        powerline-kak
        kakoune-rainbow
        kakoune-buffers
        kakoune-state-save
        kakoune-buffer-switcher
        kak-lsp
      ];
    };
in
{
  environment.systemPackages = [ myKakoune ];
}
