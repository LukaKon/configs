"""
#! /usr/bin/env nix-shell
#! nix-shell -i python3 -p "python3.withPackages(ps: [ps.colorama])"
"""

import os
import re
import getpass
import subprocess
import colorama
from colorama import Fore, Back, Style
from datetime import datetime, timedelta

colorama.init(autoreset=True)

user = getpass.getuser()
data = datetime.now().strftime('%Y-%m-%d_%H-%M')

paths = (
    {'name': 'home', 'directory': '/home',
        'snap_loc': f'/home/.snapshots/home-{data}'},
    {'name': 'data', 'directory': f'/home/{user}/data',
        'snap_loc': f'/home/{user}/data/.snapshots/data-{data}'},
    {'name': 'vm', 'directory': f'/home/{user}/vm',
        'snap_loc': f'/home/{user}/vm/.snapshots/vm-{data}'},
    {'name': 'root', 'directory': '/', 'snap_loc': f'/.snapshots/root-{data}'},
)


def create_new_snaps():
    for snap in paths:
        # print(f"\n{snap['name']}:")
        subprocess.run(['sudo', 'btrfs', 'subvolume',
                        'snapshot', snap['directory'], snap['snap_loc']]).returncode


def delete_old_snaps():
    for folder in paths:
        # print(f"\n{folder['name']}:")
        print(f"Delete from: {folder['directory']}")

        path = f"{folder['directory']}/.snapshots"
        expression_date = '[0-9]{4}-[0-9]{2}-[0-9]{2}'

        with os.scandir(path) as snaps:

            for entry in snaps:
                match = re.search(expression_date, entry.name)
                # convert 'match' (str) to date
                match_date = datetime.strptime(match.group(), '%Y-%m-%d')

                if match_date < datetime.today() - timedelta(days=7):   # selecting folders older than 7 days old
                    print(
                        f'{Fore.LIGHTRED_EX}{entry.name}: {Fore.MAGENTA}to delete')
                    subprocess.run(
                        ['sudo', 'rm', '-r', f'{path}/{entry.name}'])


print(f'{Fore.BLUE}\nCreate new snapshots:')
create_new_snaps()
print(f'{Fore.RED}\nDelete old snapshots:')
delete_old_snaps()
print('\n')
