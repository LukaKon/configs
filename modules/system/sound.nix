{ pkgs, ... }:

{
  # Sound

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    audio.enable = true;
    enable = true;
    alsa = {
      enable = true;
      # support32Bit = true;
    };

    # pulse.enable = true;
    # jack.enable = true;

    # wireplumber.enable = true;
  };

  sound = {
    enable = true;
    mediaKeys = {
      enable = true;
      volumeStep = "4%";
    };
  };

  environment = {
    systemPackages = with pkgs;
      [
        # pavucontrol
        helvum
      ];
  };
}
