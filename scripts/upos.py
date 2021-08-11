#!/nix/store/gih0k73swr69wkjxyg4hdphgnlh6xbzn-system-path/bin/python

import subprocess

print('\nUpdate system:\n')
subprocess.run(
    ['nix', 'flake', 'update']
)