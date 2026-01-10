#!/usr/bin/env bash

: '
Setup script to bootstrap the development environment.

Install developer tools
'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

print_message "Starting developer tools installation process..."

sleep 1

# Install Xcode Command Line Tools (required for compilers, git, make, etc.)
print_message "Installing Xcode Command Line Tools..."

if ! xcode-select -p &>/dev/null; then
	xcode-select --install

	# Wait until the Xcode Command Line Tools are installed
	until xcode-select -p &>/dev/null; do
	sleep 5
	done
	print_message "Xcode Command Line Tools installed."

	# Accepts Apple’s Xcode license agreement
	sudo xcodebuild -license accept
else
	print_message "Xcode Command Line Tools already installed."
fi
