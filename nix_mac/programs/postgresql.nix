{config, pkgs, ...}:

{
    environment.systemPackages = with pkgs; [
      dbeaver
      # postgresql_jdbc
      ];
    services.postgresql = {
      enable = true;
      package = pkgs.postgresql_12;
      enableTCPIP = true;
                            authentication = pkgs.lib.mkOverride 12 ''
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
                            PASSWORD 'Lukasz82'
                            CREATEDB
                            CREATEROLE;

                            CREATE DATABASE lko;
                            GRANT ALL PRIVILEGES ON DATABASE lko TO lko;
                            '';
                          };
                        }
