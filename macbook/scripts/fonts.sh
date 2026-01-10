#!/usr/bin/env bash

: '
Download nerd fonts, unzip them, and install them to the system fonts directory.

	-
	- Huawei Ubuntu 24.04.3 laptop
	- AWS
	- GitKraken
	- Ollama
	- General purpose key
'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

DOWNLOAD_DIR="$HOME/Downloads"

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

# Function to download fonts
install_font() {
	local FONT_NAME="$1"
	local FONT_URL="$2"

	print_message "Downloading font: $FONT_NAME"

	curl -fLo "$FONT_NAME" "$FONT_URL"

	print_message "Installing font: $FONT_NAME to $HOME/Library/Fonts"

	# Ignore files that don't end with otf when unzipping
	unzip -o "$FONT_NAME" '*.otf' -d "$HOME/Library/Fonts"

	# Remove the zip file after installation
	rm "$FONT_NAME"

	print_message "Installed font: $FONT_NAME"
}

# Ensure download directory exists
mkdir -p "$DOWNLOAD_DIR"
cd "$DOWNLOAD_DIR"

print_message "Starting to download files into $DOWNLOAD_DIR..."

sleep 1

# Fira Mono Nerd Font
install_font "FiraMono.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/FiraMono.zip"

# Hack Nerd Font
install_font "Hack.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Hack.zip"

# Inconsolata Nerd Font
install_font "Inconsolata.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Inconsolata.zip"

# Iosevka Nerd Font
install_font "Iosevka.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Iosevka.zip"

# JetBrains Mono Nerd Font
install_font "JetBrainsMono.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip"

# Victor Mono Nerd Font
install_font "VictorMono.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/VictorMono.zip"

# ZedMono Nerd Font
install_font "ZedMono.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/ZedMono.zip"

print_message "Nerd font installation completed successfully!"
