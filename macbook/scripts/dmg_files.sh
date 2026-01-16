#!/usr/bin/env bash

: '
Download GUI software (DMG files) and make it ready for installation

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

# Function to download files
download_file() {
	local FILE="$1"
	local FILE_URL="$2"

	if [[ -f "$FILE" ]]; then
		echo "$FILE already exists, skipping download."
		return
	fi

	# Ensure curl exists
	if ! command -v curl >/dev/null 2>&1; then
		print_message "curl is not installed, installing via Homebrew..."

		# Check if Homebrew exists
		if ! command -v brew >/dev/null 2>&1; then
			echo "Homebrew not found. Installing Homebrew first..."
			/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

			# Add Homebrew to PATH
			eval "$(/opt/homebrew/bin/brew shellenv)"
		fi

		# Install curl
		brew install curl
	fi

	print_message "Downloading $FILE ..."
	curl -fL --progress-bar "$FILE_URL" -o "$FILE"
}

# Ensure download directory exists
mkdir -p "$DOWNLOAD_DIR"
cd "$DOWNLOAD_DIR"

print_message "Starting to download files into $DOWNLOAD_DIR..."

sleep 1

# Flutter (Apple Silicon)
FILE="flutter_macos_arm64_3.38.6-stable.zip"
FILE_URL="https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/$FILE"

download_file "$FILE" "$FILE_URL"

print_message "Flutter downloaded"

ls -lh

# Android Studio
FILE="android-studio-2025.2.2.8-mac_arm.dmg"
FILE_URL="https://redirector.gvt1.com/edgedl/android/studio/install/2025.2.2.8/$FILE"

download_file "$FILE" "$FILE_URL"

print_message "Android Studio downloaded"

ls -lh

# Dotnet
FILE="dotnet-sdk-10.0.102-osx-arm64.pkg"
FILE_URL="https://builds.dotnet.microsoft.com/dotnet/Sdk/10.0.102/$FILE"

download_file "$FILE" "$FILE_URL"

print_message "Dotnet downloaded ..."

ls -lh

# UTM
FILE="UTM.dmg"
FILE_URL="https://github.com/utmapp/UTM/releases/latest/download/$FILE"

download_file "$FILE" "$FILE_URL"

print_message "UTM downloaded ..."

ls -lh

# Noteey
FILE="Noteey-1.44.0.universal.dmg"
FILE_URL="https://github.com/andyyoungm/muenzo/releases/download/v1.44.0/$FILE"

download_file "$FILE" "$FILE_URL"

print_message "Noteey downloaded ..."

ls -lh

# Affinity
FILE="Affinity.dmg"
FILE_URL="https://downloads.affinity.studio/$FILE"

download_file "$FILE" "$FILE_URL"

print_message "Affinity Designer downloaded"

ls -lh

# Inkscape
FILE="Inkscape-1.4.3_arm64.dmg"
FILE_URL="https://inkscape.org/gallery/item/58922/$FILE"

download_file "$FILE" "$FILE_URL"

print_message "Inkscape downloaded"

ls -lh

# Rive
FILE="Rive.dmg"
FILE_URL="https://releases.rive.app/macos/latest/$FILE"

download_file "$FILE" "$FILE_URL"

print_message "Rive downloaded"

ls -lh

# Mega
FILE="MEGAsyncSetupArm64.dmg"
FILE_URL="https://mega.nz/$FILE"

download_file "$FILE" "$FILE_URL"

print_message "Mega downloaded"

ls -lh

# Unity Hub
FILE="UnityHubSetup-x64.dmg"
FILE_URL="https://public-cdn.cloud.unity3d.com/hub/prod/$FILE"

download_file "$FILE" "$FILE_URL"

print_message "Unity Hub downloaded"

ls -lh

# Wireshark
FILE="Wireshark%204.6.2.dmg"
FILE_URL="https://2.na.dl.wireshark.org/osx/$FILE"

download_file "$FILE" "$FILE_URL"

print_message "Wireshark downloaded"

ls -lh

# CMake
FILE="cmake-4.2.1-macos-universal.dmg"
FILE_URL="https://github.com/Kitware/CMake/releases/download/v4.2.1/$FILE"

download_file "$FILE" "$FILE_URL"

print_message "CMake downloaded"

ls -lh

# MacTex
FILE="MacTeX.pkg"
FILE_URL="https://mirror.ctan.org/systems/mac/mactex/$FILE"

download_file "$FILE" "$FILE_URL"

print_message "MacTex downloaded"

ls -lh

print_message "DMG files downloaded to $DOWNLOAD_DIR ..."

ls -lh
