"""
Copying configuration files from folder where they were edited to target folder
"""


import os
import platform
import getpass
import subprocess

user = getpass.getuser()

nix_edit_folder = f'/home/{user}/configs/nix_virt/'
nix_target_folder = '/etc/nixos/'

print(f'\nCopying nix files to {nix_target_folder}...\n')
subprocess.run(['sudo', 'rsync', '-rav', '--delete',
                nix_edit_folder, nix_target_folder])

print('\nRebuild configuration...')
subprocess.run(['sudo', 'nixos-rebuild', 'switch'])
