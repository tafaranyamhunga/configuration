#!/usr/bin/env bash

: '
Set up ZSH:

    - Install Nerd fonts
    - Set ~/.zprofile file
    - Set ~/.zshrc file
    - Set aliases
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

# Copy nerd fonts into Font Book
print_message "Installing Nerd Fonts..."

FONT_DIR="$HOME/Library/Fonts"
NERD_FONTS_SOURCE_DIR="$MACBOOK_DIR/fonts"

if [ -d "$NERD_FONTS_SOURCE_DIR" ]; then
  cp "$NERD_FONTS_SOURCE_DIR"/* "$FONT_DIR"/
  print_message "Nerd Fonts installed successfully."
else
  print_message "Nerd Fonts source directory not found. Skipping Nerd Fonts installation."
fi

DOTFILES_DIR="$MACBOOK_DIR/.dotfiles"

# Backup the ~/.gitconfig if it exists
if [[ -f "$HOME/.gitconfig" ]]; then
	print_message "Backing up existing ~/.gitconfig"
	cp "$HOME/.gitconfig" "$HOME/.gitconfig.backup.$(date "+%Y%m%d-%H%M")"
else
	print_message "No existing ~/.gitconfig found. Skipping backup."
fi

print_message "Temporarily copying the ~/.gitconfig and then symlink it later"

mkdir -p "$HOME/.config/git"

install -m644 "$DOTFILES_DIR/git/.config/git/config" "$HOME/.config/git/config"

# Backup the ~/.zprofile if it exists
if [[ -f "$HOME/.zprofile" ]]; then
	print_message "Backing up existing ~/.zprofile"
	cp "$HOME/.zprofile" "$HOME/.zprofile.backup.$(date "+%Y%m%d-%H%M")"
else
	print_message "No existing ~/.zprofile found. Skipping backup."
fi

print_message "Temporarily copying the ~/.zprofile and then symlink it later"

cp -f "$DOTFILES_DIR/zsh/.zprofile" "$HOME"/.zprofile

# Backup ~/.zshrc if it exists
if [[ -f "$HOME/.zshrc" ]]; then
	print_message "Backing up existing ~/.zshrc"
	cp "$HOME/.zshrc" "$HOME/.zshrc.backup.$(date "+%Y%m%d-%H%M")"
else
	print_message "No existing ~/.zshrc found. Skipping backup."
fi

print_message "Temporarily copying the ~/.zshrc and then symlink it later"

cp -f "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"

# Backup ~/.oh-my-zsh/custom/aliases.zsh if it exists
if [[ -f "$HOME/.oh-my-zsh/custom/aliases.zsh" ]]; then
	print_message "Backing up existing ~/.oh-my-zsh/custom/aliases.zsh"
	cp "$HOME/.oh-my-zsh/custom/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh.backup.$(date "+%d-%m-%Y-%H:%M")"
fi

print_message "Temporarily copying the ~/.oh-my-zsh/custom/aliases.zsh and then symlink it later"
install -m644 "$DOTFILES_DIR/zsh/.oh-my-zsh/custom/aliases.zsh" "$HOME/.oh-my-zsh/custom/aliases.zsh"

echo "Next steps:"
echo "  - First change the terminal font to a more suitable nerd font"
echo "  - Restart your terminal OR run: source ~/.zprofile"
echo -e "  - Later, replace ~/.zprofile, ~/.zshrc with symlinks to my dotfiles\n"

echo "Login into Apple, download Xcode and run the ./post_install.sh after Xcode has been installed along with all it's dependencies."
