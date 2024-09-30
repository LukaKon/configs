#!/usr/bin/env bash

# set -x

NAME='monitoring'

# start a new tmux session or attach to existing one
tmux new-session -d -s $NAME

# first window with helix editor run
tmux rename-window -t $NAME:0 'htop' # rename the first window
tmux send-keys -t $NAME:0 'htop' C-m # run application in the first window

# create second window
tmux new-window -t $NAME:1 -n 'proc/disk'

# split second window into panes
tmux split-window -h # create vertical split (70% left)
# tmux split-window -v -p 50 # split right pane horizontally (50% of remaining)

# naming panes
tmux select-pane -t $NAME:1.0
tmux select-pane -T 'prstat'

tmux select-pane -t $NAME:1.1
tmux select-pane -T 'zpool'

# run applications/commands in panes
tmux send-keys -t $NAME:1.0 'prstat -Z' C-m
sleep 3
tmux send-keys -t $NAME:1.1 'zpool iostat -v 2' C-m

# set first tab active
tmux select-window -t $NAME:0

# attach to the session
tmux attach-session -t $NAME
