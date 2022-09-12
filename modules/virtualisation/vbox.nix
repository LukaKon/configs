{ config, lib, ... }:

{
  virtualisation = {
    virtualbox = {
      host = {
        enable = true;
        # enableExtensionPack = true;
      };

      guest = {
        enable = true;
        x11 = true;
      };

    };
  };
}
