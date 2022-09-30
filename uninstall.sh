#!/bin/bash

# Removes .git-prompt.sh from system

GIT_PROMPT=$HOME/.git-prompt.sh
SHELL_RC=$HOME/.zshrc

# remove .git-prompt.sh
if [ -f $GIT_PROMPT ]; then
    rm $GIT_PROMPT
fi

# remove temp file
if [ -f $GIT_PROMPT.tmp ]; then
    rm $GIT_PROMPT.tmp
fi

# check zshrc file
# itraeate through each line
delete=0
deleted=0
while read -r line || [[ -n "$line" ]]; do
    # if the line is Git Bash-like shell settings for zsh
    if [[ $line == "# Git Bash-like shell settings for zsh" ]]; then
        delete=4
        deleted=1
    fi
    # if delete is 0, write the line to a temp file
    # else, skip the line and decrement delete
    if [[ $delete == 0 ]]; then
        echo $line >> $SHELL_RC.tmp
    else
        # check if the line is empty, or start with `PS1=`, if not, reject operation and stop
        if [[ $line == "" || $line == "PS1="* ]]; then
            delete=$((delete-1))
        else
            echo "You might have modified your .zshrc file, exiting..."
            # remove temp file
            if [ -f $GIT_PROMPT.tmp ]; then
                rm $GIT_PROMPT.tmp
            fi
            exit 1
        fi
    fi
done < "$SHELL_RC"

# if deleted is 1, replace the original .zshrc file with the temp file
if [[ $deleted == 1 ]]; then
    mv $SHELL_RC.tmp $SHELL_RC
else
    echo "Git Bash-like shell have never been installed, or you might have modified your .zshrc file."
    # remove temp file
    if [ -f $GIT_PROMPT.tmp ]; then
        rm $GIT_PROMPT.tmp
    fi
    exit 1
fi