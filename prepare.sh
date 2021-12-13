#!/bin/bash

function abc {
    P_FRONT="$(tmux new-window -P)"
    tmux send -t "$P_FRONT" 'cd ~/proj/abc-front' C-m
    tmux send -t "$P_FRONT" 'yarn start' C-m

    P_BACK="$(tmux split-window -h -P)"
    tmux send -t "$P_BACK" 'cd ~/proj/abc-back' C-m
    tmux send -t "$P_BACK" 'poetry run ./manage.py runserver' C-m

    P_BACK_GIT="$(tmux split-window -v -P)"
    tmux send -t "$P_BACK_GIT" 'cd ~/proj/abc-back' C-m
    tmux send -t "$P_BACK_GIT" 'poetry shell' C-m

    tmux select-pane -t "$P_FRONT"
    P_FRONT_GIT="$(tmux split-window -v -P)"
    tmux send -t "$P_GIT" 'cd ~/proj/abc-front' C-m
}



if [[ $# -lt 1 ]]; then
    echo "USAGE: $0 PROJECT"
    exit 1;
fi;

FUN="$1"
shift;

"$FUN" "$@";
