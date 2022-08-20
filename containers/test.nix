{}:
{
  containers.test = {
    ephemeral = true;
    autostart = true;
    config = { config, pkgs, ...}: {
      services.httpd.enable = true;
      services.httpd.adminAddr = "foo@example.org";
      networking.firewall.allowedTCPPorts = [ 80 ];
    };
  };
}