#!/usr/bin/env bash

: '
Set up my Macbook Wallpapers
'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MACBOOK_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

print_message "Set up zsh ..."

sleep 1

# Move wallpapers into ~/Pictures
print_message "Moving wallpapers..."

WALLPAPERS_DIR="$HOME/Pictures"
WALLPAPERS_SOURCE_DIR="$MACBOOK_DIR/wallpapers/Wallpapers"

if [ -d "$WALLPAPERS_SOURCE_DIR" ]; then
  cp -r "$WALLPAPERS_SOURCE_DIR" "$WALLPAPERS_DIR"/
  print_message "Wallpapers moved successfully."
else
  print_message "Wallpapers source directory not found. Skipping setup."
fi
