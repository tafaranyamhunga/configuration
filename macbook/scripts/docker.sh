#!/usr/bin/env bash

: '
Setup docker CLI for managing Docker containers and images.

	- Docker has been installed via Homebrew in the main installation script
	- This script configures Docker CLI settings

'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

# cd to the $HOME directory
cd "${HOME}" || exit

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

# Print starting message
print_message "Setting up Docker CLI ..."

print_message "Running docker may require input ..."

# Login and provide the personal access token when prompted

docker login -u ctafara
