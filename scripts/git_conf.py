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

print('\nChecking git status:')
subprocess.run(['git', 'status', '-s'])

print('\nAdd all files:')
subprocess.run(['git', 'add', '--all', '.'])

print('\nChecking git status again:')
subprocess.run(['git', 'status', '-s'])

commit_note = input('Enter commit comment: ')
print('\nCommiting:')
subprocess.run(['git', 'commit', '-m', commit_note])

print('\nPushing:')
subprocess.run(['git', 'push', 'origin', 'main'])
