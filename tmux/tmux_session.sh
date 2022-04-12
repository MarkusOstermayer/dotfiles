#!/bin/bash

# https://how-to.dev/how-to-create-tmux-session-with-a-script
# https://ryan.himmelwright.net/post/scripting-tmux-workspaces/
session=$1
tmux new-session -d -s $session

window=1
tmux new-window -t $session:$window
tmux send-keys -t $session:$window "ranger" Enter
tmux rename-window " Ranger"

window=2
tmux new-window -t $session:$window -n " Terminal"

tmux attach-session -t $session:1
