#!/usr/bin/env bash

NAME='dev'

# start a new tmux session or attach to existing one
tmux new-session -d -s $NAME

# first window with helix editor run
tmux rename-window -t $NAME:0 'editor' # rename the first window
tmux send-keys -t $NAME:0 'hx .' C-m # run application in the first window

# create second window
tmux new-window -t $NAME:1 -n 'console tools'

# split second window into panes
tmux split-window -h -p 70 # create vertical split (70% left)
tmux split-window -v -p 50 # split right pane horizontally (50% of remaining)

# naming panes
tmux select-pane -t $NAME:1.0
tmux select-pane -T 'terminal'

tmux select-pane -t $NAME:1.1
tmux select-pane -T 'file manager'

tmux select-pane -t $NAME:1.2
tmux select-pane -T 'shell'

# run applications/commands in panes
tmux send-keys -t $NAME:1.1 'yazi' C-m
tmux send-keys -t $NAME:1.2 'make shell' C-m

# attach to the session
tmux attach-session -t $NAME
