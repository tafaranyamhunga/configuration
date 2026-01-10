#!/usr/bin/env bash

: '
After flutter has been downloaded, this script will set up flutter for development

    - Unzip flutter
    - Check if all the required tools have been installed
'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

FILE="$HOME/Downloads/flutter_macos_arm64_3.38.6-stable.zip"
DEVELOP="$HOME/develop"

# Ensure download directory exists
mkdir -p "$DEVELOP"

print_message "Starting Flutter setup ..."

sleep 1

if [[ ! -f "$FILE" ]]; then
	echo "Flutter archive not found at $FILE"
	exit 1
fi

print_message "Flutter archive found, setting up environment ..."

# Unzip only if not already extracted
if [[ -d "$DEVELOP" ]]; then
	print_message "Extracting Flutter SDK ..."
	unzip -q "$FILE" -d "$DEVELOP"
else
	echo "Flutter SDK already extracted, skipping unzip."
fi

# Add Flutter to PATH for current session
export PATH="$DEVELOP/bin:$PATH"

# Verify tools
flutter --version
dart --version

print_message "Running Flutter doctor (Android licenses may require input) ..."
flutter doctor --android-licenses

print_message "Checking Flutter environment ..."
flutter doctor

print_message "Flutter environment set up"
