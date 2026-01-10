#!/usr/bin/env bash

: '
Install Python

	- uv: A tool to manage Python virtual environments and packages
	- Various Python libraries for development and data analysis

'

# Exit immediately if a command exits with a non-zero status, if an undefined variable is used, or if any command in a pipeline fails
set -euo pipefail

# cd to the $HOME directory
cd "${HOME}" || exit

# Function to print messages
print_message() {
	printf "\n========================================\n"
	printf "%s\n" "$1"
	printf "========================================\n\n"
}

# Create a UV virtual environment named "~/.venv"
print_message "Setting up UV virtual environment ..."

sleep 1

uv venv "${HOME}"/.venv

print_message "UV virtual environment created successfully, now activating it ..."

# Activate the UV virtual environment
source "${HOME}"/.venv/bin/activate

print_message "UV virtual environment activated successfully."

# Upgrade or install pip
print_message "Upgrading pip ..."

uv pip install --upgrade pip

# Install Python libraries
print_message "Installing Python libraries ..."

sleep 1

uv pip install Django Bcrypt Flask Faker litecli ptpython bpython isort iredis redis pymongo pudb mysqlclient SQLAlchemy pony peewee requests matplotlib pandas numpy seaborn autopep8 flake8 ruff pycodestyle mypy typing-extensions psycopg[binary] couchdb pygame pyautogui rich click cmd2 pytest pillow paramiko pickledb "pickledb[sqlite]" icecream humanize python-dateutil cs50 arrow pendulum Logbook orm mongoengine

print_message "Python libraries installed successfully."

# Deactivate the UV virtual environment
deactivate