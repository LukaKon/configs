{ config, pkgs, ... }:

{
    environment={
                    systemPackages = with pkgs;
                                            [
                                                nix

                                                # monitoring
                                                bmon
                                                htop
                                                nvtop
                                                iotop
                                                lm_sensors

                                                # terminal
                                                #termite
                                                alacritty

                                                vim
                                                zsh
                                                fzf
                                                xsel  # for copying
                                                clipmenu  # for copying
                                                mc
                                                pciutils
                                                unzip

                                                # graphics
                                                blender
                                                darktable
                                                gimp
                                                krita

                                                # www
                                                firefox
                                                geckodriver

                                                # office
                                                libreoffice

                                                # video conference
                                                #zoom-us
                                                teams
                                                skype

                                                gnome3.gnome-keyring
                                                gnome3.seahorse

                                                firmwareLinuxNonfree
                                                microcodeIntel

                                                wget
                                                curl
                                                git
                                                rsync
                                                tree
                                                
                                                # media
                                                feh # picture viewer
                                                mpv # video player
                                                libdvdcss # plugin to play cd/dvd in mpv
                                                moc  # music player
                                                
                                                psutils

                                                python37Packages.pip
                                            # python37Packages.autopep8
                                            # python37Packages.flake8
                                            # python37Packages.colorama
                                                
                                                ###

                                                doas
                                            ];
            variables = {
                        EDITOR = "nvim";
                        VISUAL = "nvim";
                    };
        shellAliases = {
                        # git
                        gs = "git status";
                        ga = "git add";
                        gc = "git commit";
                        gp = "git push";
                        
                        # term
                        susp = "systemctl suspend";
                        reboot = "doas reboot";

                        # nix
                        upnix = "sudo nix-channel --update && nix-env -u";
                        rebuild = "sudo nixos-rebuild switch";
                        upos = "sudo nixos-rebuild switch --upgrade";

                        # btrfs snapshots
                        sb = "python /home/lk/scripts/snapshot.py";

                        # backup config files to git
                        cong = "python /home/lk/scripts/git_conf.py";

                        # rsync
                        # data
                        #rdata = "cd && rsync -rav --exclude=".snapshots" data/ ssh
                        #lk@192.168.0.2:/volume2/homes/lk/Drive/pliki/";
                    };
	};
}