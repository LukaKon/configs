{ config, pkgs, ... }:

{
  users.users.lk = {
    isNormalUser = true;
    home = "/home/lk";
    description = "virtual user";
    extraGroups = [ "wheel" "networkmanager" "docker" ];
    shell = pkgs.zsh;
    packages = with pkgs;
      [
        firmwareLinuxNonfree
        microcodeIntel

        psutils
        pciutils

        git
        nix-prefetch-git

        rsync
        curl
        bat
        fd

        #firejail

        fzf
        ripgrep

        (python310.withPackages (ps: with ps;
        [
          #   ptpython

          pyls-isort
          rope
          autopep8
          flake8

          #   # colorama
          psutil
          pip
          # pynvim
          yapf
          jedi
          pylint
          #   # jupyter
        ]))
      ];
  };
}
