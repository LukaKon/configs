#!/nix/store/gih0k73swr69wkjxyg4hdphgnlh6xbzn-system-path/bin/python

import subprocess

print('\nApply to system:\n')
subprocess.run(
    ['sudo', 'nixos-rebuild', 'switch', '--flake', '.#']
)