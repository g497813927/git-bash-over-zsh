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
while read -r line || [[ -n "$line" ]]; do
    # if the line is Git Bash-like shell settings for zsh
    if [[ $line == "# Git Bash-like shell settings for zsh" ]]; then
        delete=4
    fi
    # if delete is 0, write the line to a temp file
    # else, skip the line and decrement delete
    if [[ $delete == 0 ]]; then
        echo $line >> $SHELL_RC.tmp
    else
        delete=$((delete-1))
    fi
done < "$SHELL_RC"

# replace zshrc with temp file
mv $SHELL_RC $SHELL_RC.bak
mv $SHELL_RC.tmp $SHELL_RC
