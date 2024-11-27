#!/bin/bash

-set e

export LS_COLORS='di=35;1:fi=33:ex=36;1'

# Set terminal colors (using ANSI escape codes)
echo -e "\033]10;#9F9F9F;#FFFFFF\033\\"  # Set text color (white) and background (dark grey)
echo -e "\033]11;#000000\033\\"          # Set background color (black)

# Customize the Bash prompt (PS1)
# Setting the prompt to show the username, current directory, and Git branch (if in a Git repo)
PS1='\[\033[0;30m\]@\h\n\[\033[01;34m\]'\['\[\033[01;35m\]\u\[\033[00m\] \[\033[01;37m\]<> \[\033[01;34m\]\w]\[\033[01;33m\]$(parse_git_branch)\[\033[00m\] '

# Function to parse the current Git branch
parse_git_branch() {
    git branch 2>/dev/null | grep -E '^\*' | sed -E 's/^\* (.+)/(\1)/'
}

# Apply changes
export PS1

echo "Bash aesthetic updated!"
