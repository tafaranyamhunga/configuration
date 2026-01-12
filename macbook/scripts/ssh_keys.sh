#!/usr/bin/env bash

: '
Generate SSH keys for secure access to remote servers and services

	- GitHub
	- Huawei Ubuntu 24.04.3 laptop
	- AWS
	- GitKraken
	- Ollama
	- General purpose key

'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

# Directory to store SSH keys
SSH_DIR="$HOME/.ssh"

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

# Function to generate SSH key if it doesn't exist
generate_ssh_key() {
	local key_name="$1"
	local comment="${2:-$key_name}"
	local key_path="$SSH_DIR/$key_name"

	if [[ -f "$key_path" ]]; then
		echo "SSH key $key_name already exists, skipping generation."
	else
		print_message "Generating SSH key: $key_name"
		ssh-keygen -t ed25519 -C "$comment" -f "$key_path"
		eval "$(ssh-agent -s)"
		ssh-add "$key_path"

		print_message "SSH key $key_name generated successfully."
	fi
}

# Before generating keys, tell the user that the script is interactive and may prompt for input
interaction_notice() {
	print_message "This script may prompt you for input during SSH key generation. Please follow the prompts as they appear."

	sleep 1
}

# Ensure SSH directory exists
mkdir -p "$SSH_DIR"
chmod 700 "$SSH_DIR"

print_message "Starting SSH key generation ..."

# Generate keys for various services

interaction_notice

# GitHub
generate_ssh_key "id_github" "GitHub SSH Key on MacBook Pro: c.tafaranyamhunga@gmail.com"

print_message "Add this SSH public key to my GitHub account:"
cat "$SSH_DIR/id_github.pub"

sleep 5

interaction_notice

# Huawei Ubuntu 24.04.3 laptop
generate_ssh_key "id_huawei" "Huawei Ubuntu 24.04.3 Laptop SSH Key on Macbook Pro"

interaction_notice

# GitKraken
generate_ssh_key "id_gitkraken" "GitKraken SSH Key on MacBook Pro"

interaction_notice

# AWS
generate_ssh_key "id_aws" "AWS SSH Key on MacBook Pro"

interaction_notice

# AWS: rsa algorithm
ssh-keygen -t rsa -b 4096 -C "AWS SSH Key on MacBook Pro (RSA)" -f "$SSH_DIR/id_aws_rsa"

interaction_notice

# AWS: tafara
generate_ssh_key "id_aws_tafara" "AWS SSH Key for tafara on MacBook Pro"

interaction_notice

# Git Tower
generate_ssh_key "id_tower" "Git Tower SSH Key on MacBook Pro"

interaction_notice

# Ollama
generate_ssh_key "id_ollama" "Ollama SSH Key on MacBook Pro"

interaction_notice

# Macbook General Purpose
generate_ssh_key "id_macbook" "General Purpose SSH Key on MacBook Pro"
