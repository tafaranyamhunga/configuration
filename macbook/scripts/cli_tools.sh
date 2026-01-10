#!/usr/bin/env bash

: '
Install packages, git repositories and other CLI tools

Also setup development environment
    - nvm
    - rust
    - colorls

'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

print_message "Starting CLI tools installation..."

# Set Git LFS
print_message "Setting up Git LFS ..."

if ! command -v git-lfs &>/dev/null; then
  print_message "Git LFS not found, installing ..."
  brew install git-lfs
  git lfs install
  print_message "Git LFS installed successfully."
else
  print_message "Git LFS is already installed."
fi

# Install LazyVim
if [ ! -d "$HOME/.config/nvim" ]; then
  print_message "Installing LazyVim..."
  git clone https://github.com/LazyVim/starter ~/.config/nvim
  rm -rf ~/.config/nvim/.git
  print_message "LazyVim installed successfully."
else
  print_message "LazyVim is already installed."
fi

# Install nvm (Node Version Manager)
if [ ! -d "$HOME/.nvm" ]; then
  print_message "Installing nvm (Node Version Manager)..."
  # Download and install nvm:
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

	# in lieu of restarting the shell
	\. "$HOME/.nvm/nvm.sh"

	# Download and install Node.js:
	nvm install 24

	# Verify the Node.js version:
	node -v # Should print "v24.12.0".

	# Verify npm version:
	npm -v # Should print "11.6.2".

  print_message "nvm and Node.js installed successfully."
else
  print_message "nvm is already installed."
fi

# Create a version file for nvm
NVM_VERSION_FILE="$HOME/.nvmrc"
if [ ! -f "$NVM_VERSION_FILE" ]; then
  print_message "Creating .nvmrc file with Node.js version 24 ..."
  node --version > "$NVM_VERSION_FILE"
  print_message ".nvmrc file created successfully."
else
  print_message ".nvmrc file already exists."
fi

# Install Rust using rustup
if ! command -v rustc &>/dev/null; then
  print_message "Installing Rust programming language ..."
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  print_message "Rust installed successfully."
else
  print_message "Rust is already installed."
fi

# Install tmux plugins and set up tmux configuration
print_message "Setting up tmux configuration and installing plugins ..."

TMUX_CONFIG_DIR="$HOME/.tmux"

if [ ! -d "$TMUX_CONFIG_DIR" ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
  print_message "tmux plugin manager (tpm) installed successfully."
else
  print_message "tmux plugin manager (tpm) is already installed."
fi

# Install Oh My ZSH
print_message "Installing OH My ZSH ..."

OH_MY_ZSH="$HOME/.oh-my-zsh"
if [ ! -d "$OH_MY_ZSH" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  print_message "Oh My ZSH installed successfully."
else
  print_message "Oh My ZSH is already installed."
fi

# Install Powerlevel10k theme
print_message "Installing Powerlevel10k theme ..."

POWERLEVEL10K_DIR="$HOME/.oh-my-zsh/custom/themes/powerlevel10k"

if [ ! -d "$POWERLEVEL10K_DIR" ]; then
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
  print_message "Powerlevel10k theme installed successfully."
else
  print_message "Powerlevel10k theme is already installed."
fi

# Install zsh auto suggestions and syntax highlighting
print_message "Setting up ZSH auto suggestions and syntax highlighting ..."

ZSH_AUTO_SUGGESTIONS="$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions"

if [ ! -d "$ZSH_AUTO_SUGGESTIONS" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

  print_message "ZSH auto suggestions installed successfully."
else
  print_message "ZSH auto suggestions already installed."
fi

ZSH_SYNTAX_HIGHLIGHTING="$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"

if [ ! -d "$ZSH_SYNTAX_HIGHLIGHTING" ]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

  print_message "ZSH syntax highlighting installed successfully."
else
  print_message "ZSH syntax highlighting already installed."
fi

print_message "ZSH auto suggestions and syntax highlighting installed successfully ..."
