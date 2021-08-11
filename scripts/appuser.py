#!/nix/store/gih0k73swr69wkjxyg4hdphgnlh6xbzn-system-path/bin/python

import subprocess

print('\nUpdate home:\n')
subprocess.run(
    ['nix', 'build', '.#homeManagerConfigurations.lk.activationPackage']
)

print('\nActivate:')
subprocess.run(
    '/home/lk/configs/result/activate'
)