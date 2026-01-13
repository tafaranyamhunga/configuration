#!/usr/bin/env bash

: '

mkcert -> Has already been installed via Homebrew

Setup mkcert: A simple tool for making locally-trusted development certificates.

This will:
    - Setup local development certificates
    - Make localhost development easier with HTTPS

SETUP LINK:
===========
https://softwareengineeringstandard.com/2025/08/16/localhost-httpss/

'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

print_message "Setting up mkcert for local development ..."

sleep 1

# Install the local CA (Certificate Authority) in the system trust store
mkcert -install