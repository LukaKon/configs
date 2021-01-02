{config, ...}:

# keyring for non GNOME desktop

{
  services = {
              gnome3.gnome-keyring.enable = true;
            };

  programs = {
              seahorse.enable = true; # for gnome-keyring gui application
              dconf.enable = true;  # for gnome applications
              gnupg.agent = {enable = true; enableSSHSupport = true;};
            };
}
