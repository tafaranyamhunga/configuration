#!/usr/bin/env bash

: '
This script installs a list of Visual Studio Code extensions

The list of extensions is defined in the "../vscode/extensions.list" file
'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

# Read the extensions list file and install each extension
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MACBOOK_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

print_message "Starting VS Code extensions installation..."

sleep 1

# Check if code command is available
if ! command -v code &>/dev/null; then
	print_message "Error: 'code' command not found. Please ensure Visual Studio Code is installed and the 'code' command is available in your PATH."
	exit 1
fi

EXTENSIONS_FILE="$MACBOOK_DIR/vscode/extensions.list"

if [[ ! -f "$EXTENSIONS_FILE" ]]; then
	print_message "Error: Extensions list file '$EXTENSIONS_FILE' not found."
	exit 1
fi
while IFS= read -r extension || [[ -n "$extension" ]]; do
	# Skip empty lines and comments
	if [[ -z "$extension" || "$extension" == \#* ]]; then
		continue
	fi

	print_message "Installing VS Code extension: $extension"
	code --force --install-extension "$extension" || {
		print_message "Failed to install extension: $extension"
		exit 1
	}
done < "$EXTENSIONS_FILE"

print_message "VS Code extensions installation completed successfully."
