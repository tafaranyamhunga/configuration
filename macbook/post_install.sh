#!/usr/bin/env bash

: '
After installing all the required CMD Line tools, packages and software, run this script.

This will:
    - Start downloading DMG files
    - Setup wallpapers
    - Setup flutter for development
'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

# Install Ruby gems
./scripts/gems.sh

# Setup flutter
./scripts/flutter.sh

# Setup NPM global packages
./scripts/npm.sh

# Setup UV for Python development
./scripts/uv.sh

# Setup SSH keys
./scripts/ssh_keys.sh

# Give myself time to add my public SSH key to GitHub
print_message "Please add your public SSH key to your GitHub account. You have 30 seconds ..."

print_message "*********************************** GITHUB PUBLIC KEY ************************************"

cat "$HOME/.ssh/id_github.pub"

sleep 30

# Authorize gh CLI with GitHub and grant permissions
./scripts/gh.sh

# Setup docker CLI
./scripts/docker.sh

# Setup gdb: Create a code-signing certificate and sign gdb
./scripts/gdb.sh
