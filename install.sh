#!/bin/bash

set -e

# Function to parse the current Git branch
parse_git_branch() {
    git branch 2>/dev/null | grep -E '^\*' | sed -E 's/^\* (.+)/(\1)/'
}

# Append the contents of bash_customizations.sh to .bashrc
echo "Adding customizations to ~/.bashrc..."

# Adding theme
if grep -i "LS_COLORS" ~/.bashrc; then
    sudo sed -i '/LS_COLORS/c\export LS_COLORS="di=35;1:fi=33:ex=36;1"' ~/.bashrc
else
    sudo sed -i '7i\
export LS_COLORS="di=35;1:fi=33:ex=36;1"' ~/.bashrc
fi

# PS1
if grep -i "PS1" ~/.bashrc; then
    sudo sed -i '/PS1/c\export PS1="\[\033[0;30m\]@\h\n\[\033[01;34m\]'\['\[\033[01;35m\]\u\[\033[00m\] \[\033[01;37m\]<> \[\033[01;34m\]\w]\[\033[01;33m\]$(parse_git_branch)\[\033[00m\] "' ~/.bashrc
else
    sudo sed -i '8i\
export PS1="\[\033[0;30m\]@\h\n\[\033[01;34m\]'\['\[\033[01;35m\]\u\[\033[00m\] \[\033[01;37m\]<> \[\033[01;34m\]\w]\[\033[01;33m\]$(parse_git_branch)\[\033[00m\] "' ~/.bashrc
fi

# Set text color and background
if [[ -z grep -i "\033]10" ~/.bashrc && -z grep -i "\033]11" ~/.bashrc ]]; then
    echo 'echo -e "\033]10;#9F9F9F;#FFFFFF\033\\"' | sudo tee -a ~/.bashrc > /dev/null # Set text color (white) and background (dark grey)
    echo 'echo -e "\033]11;#000000\033\\"' | sudo tee -a ~/.bashrc > /dev/null # Set background color (black)
else
    sudo sed -i '\033]10/c\echo -e "\033]10;#9F9F9F;#FFFFFF\033\\"' ~/.bashrc
    sudo sed -i '\033]11/c\echo -e "\033]11;#000000\033\\"' ~/.bashrc
fi

# Finished :3
echo "Bash aesthetic updated!"

# Prompt for sourcing .bashrc
echo "Sourcing .bashrc..."
source ~/.bashrc

# Cleaning up...
read -p "Would you like to delete the theme folder [y/n]: " yn
if [[ $yn == "y" ]]; then
    rm -rf BeverageTheme
else
    echo "Skipping clean up"
fi

cd ~
