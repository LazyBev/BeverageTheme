#!/bin/bash

set -e

# Define the file path for the customizations script
CUSTOM_SCRIPT="beverage"

# Check if the customizations script exists
if [ ! -f "$CUSTOM_SCRIPT" ]; then
    echo "Error: $CUSTOM_SCRIPT not found. Please make sure the script is in the current directory."
    exit 1
fi

# Append the contents of bash_customizations.sh to .bashrc
echo "Adding customizations to ~/.bashrc..."

# Adding theme
sudo sed -i '/alias ls/d' .bashrc
sudo sed -i '/PS1/d' .bashrc
cat "" >> ~/.bashrc
cat "$CUSTOM_SCRIPT" >> ~/.bashrc

# Finished :3
echo "Bash aesthetic updated!"

# Sourcing .bashrc
echo "Sourcing .bashrc..."
source ~/.bashrc
