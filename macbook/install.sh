#!/usr/bin/env bash

: '
Setup script to bootstrap the development environment.

This script runs other scripts to install neccessary CLI tools and developer tools.
'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

# Things to do while the installation is running

print_message "Starting installation process ..."

sleep 1

print_message "While the installation is running, please ensure that you have a stable internet connection and do not close the terminal window. This process may take some time depending on your internet speed and system performance."

print_message "Login to the App Store if you haven't already, and start downloading Xcode from the App Store along with its dependencies. Xcode is required for some developer tools eg Flutter and libraries."

# Give the user some time to read the message
sleep 7

# Proceed with the installation
print_message "Proceeding with the installation ..."

# Run the developer tools installation script
./scripts/developer_tools.sh

# Run the Rosetta installation script
./scripts/rosetta.sh

# Run the Homebrew installation script and install Homebrew packages
./scripts/homebrew.sh

# Run the VS Code extensions installation script
./scripts/vscode_extensions.sh

# Run the CLI tools installation script
./scripts/cli_tools.sh

# Download DMG files
./scripts/dmg_files.sh

# Move wallpapers
./scripts/wallpapers.sh

# Setup ZSH configuration
./scripts/config.sh

# Install nerd fonts
./scripts/fonts.sh

# Setup the terminal after installing everything then now restart for the changes to take place
./scripts/set_zsh.sh

print_message "Installation and setup process completed successfully!!!"
