#!/usr/bin/env bash

: '
Install Homebrew and packages from the Brewfile

Homebrew is a package manager for macOS that simplifies the installation of software

The Brewfile contains:
	- Taps: Additional repositories for Homebrew packages
	- Packages: Software and tools to be installed via Homebrew
	- Casks: macOS applications to be installed via Homebrew Cask
	- VSCode Extensions: Extensions to be installed in Visual Studio Code
'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

print_message "Starting Homebrew installation ..."

sleep 1

# Install Homebrew if not already installed
if ! command -v brew &>/dev/null; then
	print_message "Homebrew not found. Installing Homebrew ..."
	/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

	# Add Homebrew to the PATH
	print_message "Adding Homebrew to $PATH"
	
	echo >> /Users/tafara/.zprofile
	echo 'eval "$(/opt/homebrew/bin/brew shellenv zsh)"' >> /Users/tafara/.zprofile
	eval "$(/opt/homebrew/bin/brew shellenv zsh)"

	print_message "Homebrew installed successfully."

	sleep 1
else
	print_message "Homebrew is already installed."
fi
	
# Check if Homebrew is correctly installed
print_message "Checking if Homebrew was installed successfully ..."

if command -v brew &>/dev/null; then
	print_message "Homebrew is available ..."
	brew --version
else
	print_message "Error: Homebrew installation failed or Homebrew is not in the PATH."
	exit 1
fi

# Get the directory where this script lives
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREWFILE="$SCRIPT_DIR/Brewfile"

print_message "Installing packages from the Brewfile ..."

# Install packages from the Brewfile
if [ -f "$BREWFILE" ]; then
	brew bundle install -v --file="$BREWFILE"
	print_message "Packages from the Brewfile installed successfully."
else
	print_message "Error: Brewfile not found at $BREWFILE"
	exit 1
fi

print_message "Brew bundle process completed."

