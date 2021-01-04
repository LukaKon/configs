"""
Copying configuration files from folder where they were edited to target folder - /etc/nixos
"""
import os
import subprocess

output_folder = '/home/lk/configs/nix_mac/'
target_folder = '/etc/nixos/'

print(f'\nCopying config files to {target_folder}...')
subprocess.run(['sudo', 'rsync', '-rav', '--delete', output_folder, target_folder])

print('\nRebuild configuration...')
subprocess.run(['sudo', 'nixos-rebuild', 'switch'])