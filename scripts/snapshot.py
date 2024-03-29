import os
import re
import getpass
import subprocess
from datetime import datetime, timedelta

user = getpass.getuser()
data = datetime.now().strftime("%Y-%m-%d_%H-%M")

days = 10

paths = (
    {"name": "home", "directory": "/home", "snap_loc": f"/home/.snapshots/home-{data}"},
    {
        "name": "data",
        "directory": f"/home/{user}/data",
        "snap_loc": f"/home/{user}/data/.snapshots/data-{data}",
    },
    {
        "name": "dev",
        "directory": f"/home/{user}/dev",
        "snap_loc": f"/home/{user}/dev/.snapshots/dev-{data}",
    },
    {
        "name": "vm",
        "directory": f"/home/{user}/vm",
        "snap_loc": f"/home/{user}/vm/.snapshots/vm-{data}",
    },
    # {
    #     'name': 'root',
    #     'directory': '/',
    #     'snap_loc': f'/.snapshots/root-{data}'
    # },
)


def create_new_snaps():
    for snap in paths:
        # print(f"\n{snap['name']}:")
        subprocess.run(
            [
                "sudo",
                "btrfs",
                "subvolume",
                "snapshot",
                snap["directory"],
                snap["snap_loc"],
            ]
        ).returncode


def delete_old_snaps():
    for folder in paths:
        # TODO: if there is no older than 5 snapshot write 'nothing to delete'
        print(f"Delete from: {folder['directory']}")

        path = f"{folder['directory']}/.snapshots"
        expression_date = "[0-9]{4}-[0-9]{2}-[0-9]{2}"

        with os.scandir(path) as snaps:

            for entry in snaps:
                match = re.search(expression_date, entry.name)
                match_date = datetime.strptime(match.group(), "%Y-%m-%d")

                if match_date < datetime.today() - timedelta(
                    days=days
                ):  # selecting folders older than 7 days old
                    print(f"{entry.name}: to delete")
                    subprocess.run(["sudo", "rm", "-r", f"{path}/{entry.name}"])


print("\nCreate new snapshots:")
create_new_snaps()
print(f"\nDelete snapshots older than {days} days:")
delete_old_snaps()
print("\n")
