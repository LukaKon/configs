#!/nix/store/gih0k73swr69wkjxyg4hdphgnlh6xbzn-system-path/bin/python

import subprocess

print("\nApply updates to system:\n")
print("\nBuild:")
subprocess.run(["nixos-rebuild", "build", "--flake", ".#"])
print("Switch:\n")
subprocess.run(["sudo", "./result/bin/switch-to-configuration", "switch"])
