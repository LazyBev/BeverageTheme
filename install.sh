#!/bin/bash

set -e

# Define the file path for the customizations script
CUSTOM_SCRIPT="beverage.sh"

# Check if the customizations script exists
if [ ! -f "$CUSTOM_SCRIPT" ]; then
    echo "Error: $CUSTOM_SCRIPT not found. Please make sure the script is in the current directory."
    exit 1
fi

# Append the contents of bash_customizations.sh to .bashrc
echo "Adding customizations to ~/.bashrc..."

# Adding theme
sed -i '/alias ls/d' .bashrc
sed -i '/PS1/d' .bashrc
cat "" >> ~/.bashrc
cat "$CUSTOM_SCRIPT" >> ~/.bashrc

# Notify user that the installation was successful
echo "Customizations have been added to ~/.bashrc."

echo "Sourcing .bashrc..."
source ~/.bashrc
