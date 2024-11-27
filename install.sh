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

cat "$CUSTOM_SCRIPT" >> ~/.bashrc

# Notify user that the installation was successful
echo "Customizations have been added to ~/.bashrc."

# Optionally, prompt user to reload .bashrc
echo "Please run 'source ~/.bashrc' to apply the changes."
