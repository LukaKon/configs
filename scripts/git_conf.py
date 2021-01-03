"""
Put whole configs folder to github
"""
import subprocess
import os

ref_path = '/home/lk/configs/'

files_path = (
    {'name':'config.py','file':'/home/lk/.config/qtile/config.py', 'dir':f'{ref_path}qtile'},
)


# Copying
print('\nCopying Qtile config file to git folder:\n')

for file in files_path:
    print(f"Copying {file['name']} to {file['dir']}: ", subprocess.run(['rsync', '-rav', file['file'], file['dir']]))

print(f'Enter to {ref_path}...')

# Send files to git repo
os.chdir(ref_path)

print('Checking git status:')
subprocess.run(['git', 'status'])

print('Add all files:')
subprocess.run(['git', 'add', '--all', '.'])

print('Checking git status again:')
subprocess.run(['git', 'status'])

commit_note = input('Enter commit comment: ')
print('Commiting:')
subprocess.run(['git', 'commit', '-m', commit_note])

print('Pushing:')
subprocess.run(['git', 'push', 'origin', 'main'])