{config, pkgs, ...}:

{
  environment.systemPackages = with pkgs; [dbeaver];
  services.postgresql = {
    enable = true;
    package = pkgs.postgresql_14;
    enableTCPIP = true;
    authentication = pkgs.lib.mkOverride 14 ''
      local all all trust
      host all all localhost trust
      host all all 127.0.0.1/32 trust
      host all all ::1/128 trust
      host all all 192.168.0.0/24 trust
      host all all 192.168.1.0/24 trust
    '';
    initialScript = pkgs.writeText "backend-initScript" ''
      CREATE ROLE lko
      LOGIN
      PASSWORD 'lko'
      CREATEDB
      CREATEROLE;

      CREATE DATABASE lko;
      GRANT ALL PRIVILEGES ON DATABASE lko TO lko;
    '';
  };

  networking.firewall.allowedTCPPorts = [5432];
}
