import os
import re
import getpass
import subprocess
from datetime import datetime, timedelta

data = datetime.now().strftime('%Y-%m-%d_%H-%M')

paths = (
    {'name': 'home', 'directory': '/home',
        'snap_loc': f'/home/.snapshots/home-{data}'},
    {'name': 'root', 'directory': '/', 'snap_loc': f'/.snapshots/root-{data}'},
)


def create_new_snaps():
    for snap in paths:
        print(f"{snap['name']}:")
        subprocess.run(['sudo', 'btrfs', 'subvolume',
                        'snapshot', snap['directory'], snap['snap_loc']]).returncode
        print('\n')


def delete_old_snaps():
    for folder in paths:
        print(f"\n\nDelete from: {folder['directory']}")

        path = f"{folder['directory']}/.snapshots"
        expression_date = '[0-9]{4}-[0-9]{2}-[0-9]{2}'

        with os.scandir(path) as snaps:

            for entry in snaps:
                match = re.search(expression_date, entry.name)
                # convert 'match' (str) to date
                match_date = datetime.strptime(match.group(), '%Y-%m-%d')

                if match_date < datetime.today() - timedelta(days=7):   # selecting folders older than 7 days old
                    print(f'{entry.name}: to delete')
                    subprocess.run(
                        ['sudo', 'rm', '-r', f'{path}/{entry.name}'])


print('\nCreate new snapshots:\n')
create_new_snaps()
print('\nDelete old snapshots:\n')
delete_old_snaps()
