#!/usr/bin/env bash

: '
Install Ruby gems

    - colorls: Set as an alias in ~/.oh-my-zsh/custom/aliases.sh
    - cocoapods: Required by flutter and Android Studio

'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

# Install Ruby gem
print_message "Installing Ruby gems  ..."

sleep 1

gem install colorls
gem install cocoapods
