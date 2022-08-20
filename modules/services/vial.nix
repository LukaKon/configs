{ pkgs, ... }:
{
  services.udev.packages = [
    (pkgs.writeTextFile
      {
        name = "vial";
        text = ''
          KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0666", TAG+="uaccess", TAG+="udev-acl"
        '';
        destination = "/etc/udev/rules.d/92-viia.rules";
      }
    )
  ];
}
