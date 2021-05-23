{config, pkgs, ...}:

{
	# environment.systemPackages = with pkgs; [pgmanage];
	# services.pgmanage.enable = true;
	# services.pgmanage.connections = { myserver = "host=localhost port=5432 dbname=postgres"; };
	services.postgresql = {
							enable = true;
							package = pkgs.postgresql_12;
							enableTCPIP = true;
							# dataDir = "/home/lk/postDB";
							authentication = pkgs.lib.mkOverride 12 ''
							local all all trust
							host all all localhost trust
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
