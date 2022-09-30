{ ... }:

{
  # Sound
  # sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      # support32Bit = true;
    };

    # pulse.enable = true;
    jack.enable = true;
  };

  sound.mediaKeys = {
    enable = true;
    volumeStep = "4%";
  };
}
