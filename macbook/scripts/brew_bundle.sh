#!/usr/bin/env bash

: '
After installing Homebrew and setting it up, lets packages from the Brewfile
'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

# Get the directory where this script lives
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

print_message "Installing packages from the Brewfile ..."

BREWFILE="$SCRIPT_DIR/Brewfile"

# Install packages from the Brewfile
if [ -f "$BREWFILE" ]; then
	brew bundle install -v --file="$BREWFILE"
	print_message "Packages from the Brewfile installed successfully."
else
	print_message "Error: Brewfile not found at $BREWFILE"
	exit 1
fi

print_message "Brew bundle process completed."
