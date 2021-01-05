"""
Put whole configs folder to github
"""
import subprocess
import os
import getpass

user = getpass.getuser()

ref_path = f'/home/{user}/configs/'

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
