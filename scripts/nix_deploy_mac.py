"""
Copying configuration files from folder where they were edited to target folder - /etc/nixos
"""
import os
import subprocess
import getpass

user = getpass.getuser()

nix_edit_folder = f'/home/{user}/configs/nix_mac/'
nix_target_folder = '/etc/nixos/'

print(f'\nCopying config files to {nix_target_folder}...')
subprocess.run(['sudo', 'rsync', '-rav', '--delete',
                nix_edit_folder, nix_target_folder])

print('\nRebuild configuration...')
subprocess.run(['sudo', 'nixos-rebuild', 'switch'])
