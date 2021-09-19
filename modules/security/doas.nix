{config, pkgs, ...}:

{
    environment = {
        systemPackages = with pkgs; [ doas ];
    };
	security.doas = {
        enable = true;
        wheelNeedsPassword = true;
    };
}
