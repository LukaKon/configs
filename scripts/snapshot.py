"""
#! /usr/bin/env nix-shell
#! nix-shell -i python3 -p "python3.withPackages(ps: [ps.colorama])"
"""
import subprocess
from datetime import datetime

data = datetime.now().strftime('%Y-%m-%d_%H-%M')

paths = (
    {'name': 'home', 'directory': '/home',
        'snap_loc': f'/home/.snapshots/home-{data}'},
    {'name': 'data', 'directory': '/home/lk/data',
        'snap_loc': f'/home/lk/data/.snapshots/data-{data}'},
    {'name': 'vm', 'directory': '/home/lk/vm',
        'snap_loc': f'/home/lk/vm/.snapshots/vm-{data}'},
    {'name': 'root', 'directory': '/', 'snap_loc': f'/.snapshots/root-{data}'},
)

print('\nCreate snapshots:\n')

for x in paths:
    print(f"{x['name']}: ", subprocess.run(['sudo', 'btrfs', 'subvolume',
                                            'snapshot', x['directory'], x['snap_loc']]).returncode)
