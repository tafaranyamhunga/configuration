#!/usr/bin/env bash

: '
Set up gh CLI

	- login: Authenticate gh CLI with GitHub account
	- delete_repo: Grant permission to delete repositories via gh CLI

'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

# Authenticate gh CLI with GitHub account
print_message "Authenticating gh CLI with GitHub account ..."

sleep 1

gh auth login

print_message "gh CLI authenticated successfully."

# Grant permission to delete repositories via gh CLI
print_message "Granting permission to delete repositories via gh CLI ..."

sleep 1

gh auth refresh -h github.com -s delete_repo

print_message "Permission to delete repositories granted successfully."

# Install gh-dash extension for gh CLI
print_message "Installing gh-dash extension for gh CLI ..."

gh extension install dlvhdr/gh-dash