#!/nix/store/gih0k73swr69wkjxyg4hdphgnlh6xbzn-system-path/bin/python

import subprocess

print("\nApply updates to system:\n")
subprocess.run(["nixos-rebuild", "switch", "--flake", ".#"])
subprocess.run(["sudo", "./result/bin/switch-to-configuration", "switch"])
