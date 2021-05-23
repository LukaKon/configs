# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

let
  mkTuple = lib.hm.gvariant.mkTuple;
in
{
  dconf.settings = {
    "org/blueman/general" = {
      "window-properties" = [ 556 494 3040 40 ];
    };

    "org/blueman/plugins/powermanager" = {
      "auto-power-on" = "@mb false";
    };

    "org/gnome/brasero/display" = {
      "iso-folder" = "/home/lk/Downloads";
    };

    "org/gnome/brasero/plugins/audio2cue" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/burn-uri" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/cdda2wav" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/cdrdao" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/cdrecord" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/dvd-rw-format" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/dvdauthor" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/dvdcss" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/file-checksum" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/file-downloader" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/genisoimage" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/growisofs" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/image-checksum" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/libburn" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/libisofs" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/mkisofs" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/normalize" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/readcd" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/readom" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/transcode" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/transcode2vob" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/vcdimager" = {
      "priority" = 0;
    };

    "org/gnome/brasero/plugins/wodim" = {
      "priority" = 0;
    };

    "org/gnome/desktop/input-sources" = {
      "current" = "uint32 0";
      "sources" = [ (mkTuple [ "xkb" "pl" ]) ];
      "xkb-options" = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      "gtk-im-module" = "gtk-im-context-simple";
    };

    "org/gnome/desktop/privacy" = {
      "report-technical-problems" = true;
    };

    "org/gnome/evolution-data-server" = {
      "migrated" = true;
      "network-monitor-gio-name" = "";
    };

    "org/gnome/mutter" = {
      "attach-modal-dialogs" = true;
      "dynamic-workspaces" = true;
      "edge-tiling" = true;
      "focus-change-on-pointer-rest" = true;
      "workspaces-only-on-primary" = true;
    };

    "org/gnome/nautilus/preferences" = {
      "default-folder-viewer" = "icon-view";
      "search-filter-time-type" = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      "initial-size" = mkTuple [ 960 1126 ];
      "maximized" = false;
    };

    "org/gnome/shell" = {
      "disabled-extensions" = [ "places-menu@gnome-shell-extensions.gcampax.github.com" ];
      "enabled-extensions" = [ "horizontal-workspaces@gnome-shell-extensions.gcampax.github.com" "sound-output-device-chooser@kgshank.net" "user-theme@gnome-shell-extensions.gcampax.github.com" "tilingnome@rliang.github.com" "windowsNavigator@gnome-shell-extensions.gcampax.github.com" "workspace-indicator@gnome-shell-extensions.gcampax.github.com" ];
      "favorite-apps" = [ "org.gnome.Nautilus.desktop" "Alacritty.desktop" "code.desktop" "org.qutebrowser.qutebrowser.desktop" "slack.desktop" "Zoom.desktop" ];
      "had-bluetooth-devices-setup" = true;
    };

    "org/gnome/shell/extensions/auto-move-windows" = {
      "application-list" = [ "Alacritty.desktop:1" ];
    };

    "org/gnome/system/location" = {
      "enabled" = false;
    };

    "org/gtk/settings/file-chooser" = {
      "date-format" = "regular";
      "location-mode" = "path-bar";
      "show-hidden" = false;
      "show-size-column" = true;
      "show-type-column" = true;
      "sidebar-width" = 171;
      "sort-column" = "name";
      "sort-directories-first" = false;
      "sort-order" = "ascending";
      "type-format" = "category";
      "window-position" = mkTuple [ 2759 524 ];
      "window-size" = mkTuple [ 1 1 ];
    };

    "org/virt-manager/virt-manager" = {
      "manager-window-height" = 1031;
      "manager-window-width" = 1678;
      "system-tray" = true;
    };

    "org/virt-manager/virt-manager/confirm" = {
      "delete-storage" = true;
      "forcepoweroff" = false;
      "removedev" = true;
      "unapplied-dev" = true;
    };

    "org/virt-manager/virt-manager/connections" = {
      "autoconnect" = [ "qemu:///system" ];
      "uris" = [ "qemu:///system" ];
    };

    "org/virt-manager/virt-manager/conns/qemu:system" = {
      "window-size" = mkTuple [ 956 569 ];
    };

    "org/virt-manager/virt-manager/details" = {
      "show-toolbar" = true;
    };

    "org/virt-manager/virt-manager/new-vm" = {
      "graphics-type" = "system";
    };

    "org/virt-manager/virt-manager/paths" = {
      "image-default" = "/home/lk/vm";
      "media-default" = "/home/lk/iso";
    };

    "org/virt-manager/virt-manager/urls" = {
      "isos" = [ "/home/lk/iso/elementaryos-5.1-stable.20200814.iso" "/home/lk/iso/Fedora-Silverblue-ostree-x86_64-34-1.2.iso" "/home/lk/iso/NetBSD-9.1-amd64.iso" "/home/lk/iso/4MLinux-36.0-64bit.iso" "/home/lk/iso/tribblix-0m24.1.iso" "/home/lk/iso/Mageia-8-netinstall-nonfree-x86_64.iso" "/home/lk/iso/nixos-gnome-20.09.2122.2fbcd0b9df9-x86_64-linux.iso" "/home/lk/iso/ubuntu-20.04.2-live-server-amd64.iso" "/home/lk/iso/nixos-gnome-20.09.3505.12d9950bf47-x86_64-linux.iso" "/home/lk/iso/Fedora-Everything-netinst-x86_64-33-1.2.iso" ];
    };

    "org/virt-manager/virt-manager/vmlist-fields" = {
      "disk-usage" = false;
      "host-cpu-usage" = true;
      "network-traffic" = false;
    };

    "org/virt-manager/virt-manager/vms/09ee897298694cfdbf6b9466f6caf99d" = {
      "vm-window-size" = mkTuple [ 956 1158 ];
    };

    "org/virt-manager/virt-manager/vms/17ac013205a64e339aa620cab6eb51ea" = {
      "vm-window-size" = mkTuple [ 636 1158 ];
    };

    "org/virt-manager/virt-manager/vms/1d3430b29e74471babdf5789b6313e7d" = {
      "vm-window-size" = mkTuple [ 1680 1181 ];
    };

    "org/virt-manager/virt-manager/vms/1e3212fbd3d14b41aab373c79c32749f" = {
      "vm-window-size" = mkTuple [ 1857 1181 ];
    };

    "org/virt-manager/virt-manager/vms/32623f3fe8f3466b9c450052ae5ecfa1" = {
      "vm-window-size" = mkTuple [ 1916 1158 ];
    };

    "org/virt-manager/virt-manager/vms/4550c0b904914b008ed0a026bf3fa273" = {
      "vm-window-size" = mkTuple [ 1918 1181 ];
    };

    "org/virt-manager/virt-manager/vms/4f2283d5e69144859e27853cdf7c2903" = {
      "vm-window-size" = mkTuple [ 636 1158 ];
    };

    "org/virt-manager/virt-manager/vms/571d95051672466580a1d4fef5b2e637" = {
      "vm-window-size" = mkTuple [ 636 1158 ];
    };

    "org/virt-manager/virt-manager/vms/57df5a09ac0946aa91ce66b86cd4a523" = {
      "vm-window-size" = mkTuple [ 956 373 ];
    };

    "org/virt-manager/virt-manager/vms/5baee34d6c644261a767292ed5524c98" = {
      "vm-window-size" = mkTuple [ 956 1158 ];
    };

    "org/virt-manager/virt-manager/vms/7d3d5963911c407889d356e678e2a678" = {
      "vm-window-size" = mkTuple [ 1580 1158 ];
    };

    "org/virt-manager/virt-manager/vms/835f7f7ca03a4afaa73c1f4704bca262" = {
      "vm-window-size" = mkTuple [ 972 1181 ];
    };

    "org/virt-manager/virt-manager/vms/97f6031901bf425ba86ba3cc273fbd69" = {
      "vm-window-size" = mkTuple [ 972 1181 ];
    };

    "org/virt-manager/virt-manager/vms/9cd096484f3b44d7afea0a9c41a4f3b1" = {
      "vm-window-size" = mkTuple [ 1340 1158 ];
    };

    "org/virt-manager/virt-manager/vms/ca73eced4a6f4888bbf141622b4ff3f5" = {
      "vm-window-size" = mkTuple [ 972 1181 ];
    };

    "org/virt-manager/virt-manager/vms/cc4f16fd2f8c4ad7afe6c2b25a7bdb3c" = {
      "vm-window-size" = mkTuple [ 1676 1008 ];
    };

    "org/virt-manager/virt-manager/vms/cf2b1c53bf274c73a0e77b1cd45c1b13" = {
      "vm-window-size" = mkTuple [ 844 1028 ];
    };

    "org/virt-manager/virt-manager/vms/d41cccb8b7bf4b079f5e51e1d533c35b" = {
      "vm-window-size" = mkTuple [ 956 1158 ];
    };

    "org/virt-manager/virt-manager/vms/d8e28ff4c0f740c392fa37ae5adb8172" = {
      "vm-window-size" = mkTuple [ 1624 1031 ];
    };

    "org/virt-manager/virt-manager/vms/f18e00227a3d41e09cd628fda53072db" = {
      "vm-window-size" = mkTuple [ 1267 1181 ];
    };

    "org/virt-manager/virt-manager/vms/f79d2aa5eb914cf7a24d5521cc10f610" = {
      "vm-window-size" = mkTuple [ 636 1158 ];
    };

  };
}
