{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [ doas ];
  };
  security={
    doas = {
      enable = true;
      wheelNeedsPassword = false;
      extraRules = [
        { 
        users = ["lk"];
        groups = [ "wheel" ];
        keepEnv = true;
        persist = true;
        }
      ];
    };
    sudo.enable=false;
  };
}
