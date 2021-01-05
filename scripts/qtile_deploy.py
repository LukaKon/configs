"""
Copying configuration files from folder where they were edited to target folder 
"""

import os
import platform
import getpass
import subprocess

user = getpass.getuser()

qtile_edit_folder = f'/home/{user}/configs/qtile/'
qtile_target_folder = f'/home/{user}/.config/qtile/'

print(f'\nCopying qtile file to {qtile_target_folder}...')
subprocess.run(['rsync', '-rav', qtile_edit_folder, qtile_target_folder])
