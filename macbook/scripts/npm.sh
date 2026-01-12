#!/usr/bin/env bash

: '
Install NPM global packages

	- npm: A tool to manage JavaScript packages and libraries
	- Various JavaScript libraries for development

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

# Install NPM global packages
print_message "Installing NPM global packages ..."

sleep 1

npm install -g sass nodemon eslint prettier typescript react react-dom semistandard webpack webpack-cli @angular/cli
