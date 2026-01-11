#!/usr/bin/env bash

: '
Set up ZSH, by backing up existing config files and copying new ones:

	- broot
	- btop
	- cheat
	- gh
	- git
	- lazygit
	- litecli
	- mycli
	- nvim
'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MACBOOK_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
DOTFILES_DIR="$MACBOOK_DIR/.dotfiles"

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

print_message "Setting up zsh ..."

sleep 1

# Copy broot settings
print_message "Setting up broot ..."

mkdir -p "$HOME/.config/broot"

install -m644 "$DOTFILES_DIR/broot/.config/broot/conf.hjson" "$HOME/.config/broot/conf.hjson"
install -m644 "$DOTFILES_DIR/broot/.config/broot/verbs.hjson" "$HOME/.config/broot/verbs.hjson"

# Copy btop settings
print_message "Setting up btop ..."

mkdir -p "$HOME/.config/btop"

install -m644 "$DOTFILES_DIR/btop/.config/btop/btop.conf" "$HOME/.config/btop/btop.conf"

# Copy cheat settings
print_message "Setting up cheat ..."

mkdir -p "$HOME/.config/cheat"

install -m644 "$DOTFILES_DIR/cheat/.config/cheat/conf.yml" "$HOME/.config/cheat/conf.yml"

# Copy gh settings
print_message "Setting up gh ..."

mkdir -p "$HOME/.config/gh"

install -m644 "$DOTFILES_DIR/gh/.config/gh/config.yml" "$HOME/.config/gh/config.yml"
install -m644 "$DOTFILES_DIR/gh/.config/gh/hosts.yml" "$HOME/.config/gh/hosts.yml"

# Copy git settings
print_message "Setting up git ..."

mkdir -p "$HOME/.config/git"

install -m644 "$DOTFILES_DIR/git/.config/git/config" "$HOME/.config/git/config"

# Copy lazygit settings
print_message "Setting up lazygit ..."

mkdir -p "$HOME/Library/Application Support/lazygit"

install -m644 "$DOTFILES_DIR/lazygit/Library/Application Support/lazygit/config.yml" "$HOME/Library/Application Support/lazygit/config.yml"

# Copy litecli settings
print_message "Setting up litecli ..."

mkdir -p "$HOME/.config/litecli"

install -m644 "$DOTFILES_DIR/litecli/.config/litecli/config" "$HOME/.config/litecli/config"

# Copy mycli settings
print_message "Setting up mycli ..."

mkdir -p "$HOME/.config/mycli"

install -m644 "$DOTFILES_DIR/mycli/.config/mycli/config" "$HOME/.config/mycli/config"

# Copy nvim settings
print_message "Setting up nvim ..."

install -Dm644 "$DOTFILES_DIR/nvim/.config/nvim/init.lua" "$HOME/.config/nvim/init.lua"

# Copy lua directory
cp -r "$DOTFILES_DIR/nvim/.config/nvim/lua" "$HOME/.config/nvim/lua"

# Copy pgcli settings
print_message "Setting up pgcli ..."

mkdir -p "$HOME/.config/pgcli"

install -m644 "$DOTFILES_DIR/pgcli/.config/pgcli/config" "$HOME/.config/pgcli/config"

# Copy ptpython settings
print_message "Setting up ptpython ..."

mkdir -p "$HOME/.config/ptpython"

install -m644 "$DOTFILES_DIR/ptpython/.config/ptpython/config.py" "$HOME/.config/ptpython/config.py"

# Copy ssh config
print_message "Setting up ssh ..."

mkdir -p "$HOME/.ssh"

install -m644 "$DOTFILES_DIR/ssh/.ssh/config" "$HOME/.ssh/config"

# Copy superfile settings
print_message "Setting up superfile ..."

mkdir -p "$HOME/Library/Application Support/superfile"

install -m644 "$DOTFILES_DIR/superfile/Library/Application Support/superfile/config.toml" "$HOME/Library/Application Support/superfile/config.toml"

# Copy thefuck settings
print_message "Setting up thefuck ..."

mkdir -p "$HOME/.config/thefuck"

install -m644 "$DOTFILES_DIR/thefuck/.config/thefuck/settings.py" "$HOME/.config/thefuck/settings.py"

# Copy tmux settings
print_message "Setting up tmux ..."

mkdir -p "$HOME/.config/tmux"

install -m644 "$DOTFILES_DIR/tmux/.config/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"

# Copy vim settings
print_message "Setting up vim ..."

install -m644 "$DOTFILES_DIR/vim/.vimrc" "$HOME/.vimrc"

# Copy vscode settings
print_message "Setting up vscode ..."

install -m644 "$DOTFILES_DIR/vscode/Library/Application Support/Code/User/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
install -m644 "$DOTFILES_DIR/vscode/Library/Application Support/Code/User/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
install -m644 "$DOTFILES_DIR/vscode/Library/Application Support/Code/User/pep257.mustache" "$HOME/Library/Application Support/Code/User/pep257.mustache"

# Copy snippets
print_message "Setting up vscode snippets ..."

cp -r "$DOTFILES_DIR/vscode/Library/Application Support/Code/User/snippets" "$HOME/Library/Application Support/Code/User/snippets"
