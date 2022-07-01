{pkgs, system, home-manager, lib, user, ...  }:

with builtins; {
  mkHost = {
    name
  , NICs
  , initrdMods
  , kernelMods
  , kernelParams
  , kernelPackages
  , systemConfig
  , cpuCores
  , users
  , wifi ? []
  , gpuTempSensor ? null
  , cpuTempSensor ? null
}:
  let
    networkCfg = listToAttrs (map (n: {
      name = "${n}";
      value = {useDHCP = true;};
    }) NICs);
  
    userCfg = {
      inherit name NICs systemConfig cpuCores gpuTempSensor cpuTempSensor;
    };
  
    sys_users = (map (u: user.mkSystemUser u) users);
  
  in lib.nixosSystem {
      inherit system;
        
      modules = [
        {
          imports = [ ../modules/system] ++ sys_users;
      
          lk = systemConfig;
      
          environment.etc = {
            "hmsystemdata.json".text = toJSON userCfg;
          };
  
          networking = {
            hostName = "${name}";
            interfaces = networkCfg;
            wireless.interfaces = wifi;
    
            networkmanager.enable = true;
            useDHCP = false;
          };
  
          boot = {
            initrd.availableKernelModules = initrdMods;
            kernelModules = kernelMods;
            kernelParams = kernelParams;
            kernelPackages = kernelPackages;
          };
  
          nixpkgs.pkgs = pkgs;
  
          nix.maxJobs = lib.mkDefault cpuCores;
  
          system.stateVersion = "22.05";
        }
      ];
    };
}