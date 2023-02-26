import subprocess

# Set the backup volume name
# BACKUP_VOL = "backuppool/backups"
BACKUP_VOL = "192.168.0.105:/tank/backup"

# Get a list of all ZFS volumes
volumes = subprocess.check_output(["zfs", "list", "-H", "-o", "name"]).decode("utf-8").splitlines()

# Iterate over all ZFS volumes
for vol in volumes:
    # Get a list of all snapshots for this volume
    snapshots = subprocess.check_output(["zfs", "list", "-H", "-o", "name", "-t", "snapshot", vol]).decode("utf-8").splitlines()

    # Iterate over all snapshots for this volume and send them to the backup volume
    for snap in snapshots:
        subprocess.run(["zfs", "send", snap], stdout=subprocess.PIPE) \
            .stdout \
            .pipe(subprocess.Popen(["zfs", "receive", f"{BACKUP_VOL}/{vol}"], stdin=subprocess.PIPE).stdin) \
            .communicate()
