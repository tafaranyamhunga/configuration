#!/usr/bin/env bash

: '
Setup script to bootstrap the development environment.

Install Rosetta 2 for Apple Silicon Macs:
	- Used by DaVinci Resolve
	- Used by Flutter
	- And other applications that require x86_64 architecture support
'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

print_message "Starting Rosetta 2 installation..."

sleep 1

# Install Rosetta 2 for Apple Silicon Macs
if [[ "$(uname -m)" == "arm64" ]]; then
	print_message "Installing Rosetta 2..."
	if /usr/bin/pgrep oahd >/dev/null 2>&1; then
	print_message "Rosetta 2 is already installed."
else
	/usr/sbin/softwareupdate --install-rosetta --agree-to-license
	print_message "Rosetta 2 installed successfully."
fi
else
	print_message "Rosetta 2 installation not required on Intel Macs."
fi
