{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs;
    [
      nix-prefetch-git

      doas
      tree
      pstree  # process tree
      wget
      curl
      git
      rsync
      bat # cat
      fd  # find

      nodejs

      # monitoring
      bmon
      htop
      nvtop
      iotop
      lm_sensors
      ncdu # disk analisys
      sysstat

      # terminal
      alacritty
      # foot

      # ueberzug
      fzf
      xsel  # for copying
      clipmenu  # for copying

      # packer
      unzip
      unar
      xarchiver
      p7zip

      firmwareLinuxNonfree
      microcodeIntel

      psutils
      pciutils
      gputils

      # (python39.withPackages(ps: with ps;
      # [
      #   autopep8
      #   flake8
      #   colorama
      #   psutil
      #   pip
      #   pynvim
      #   yapf
      #   jedi
      #   termcolor
      #   bpython
      #   pylint
      #   jupyter
      # ]))
    ];
  };
}
