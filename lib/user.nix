{ pkgs, home-manager, lib, system, overlays, ... }:

with builtins; {
  mkHMUser = {
    userConfig
  , username
  }:
    home-manager.lib.homeManagreConfiguration {
      inherit system pkgs username;
      stateVersion = "22.05";
      configuration = 
        let
          trySettings = tryEval (fromJSON (readFile /etc/hmsystemdata.json));
          machineData = if trySettings.success then trySettings.value else {};
      
          machineModule = {
              pkgs
            , config
            , lib
            , ...
          }: {
            options.machineData = lib.mkOption {
              default = {};
              description = "Settings from passed from nixos system configuration. If not present will be empty.";
            };
          
            config.machineData = machineData;
          };
          in {
            lk = userConfig;
            
            nixpkgs = {
              overlays = overlays;
              config.allowUnfree = true;
            };
            
            systemd.user.startService = true;
            
            home = {
              stateVersion = "22.05";
              username = username;
              homeDirectory = "/home/${username}";
            };
            
            imports = [ ../modules/users machineModule];
          };
      homeDirectory = "/home/${username}";
    };
  
  mkSystemUser = {
    name
  , groups
  , uid
  , shell
  , ...
  }:
  {
    users.users."${name}" = {
      name = name;
      isNormalUser = true;
      isSystemUser = false;
      extraGroups = groups;
      uid = uid;
      initialPassword = "password";
      shell = shell;
    };
  };
}


