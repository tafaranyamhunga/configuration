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

# Setup docker CLI
./scripts/docker.sh
