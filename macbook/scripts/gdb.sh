#!/usr/bin/env bash

: '
gdb: GNU Debugger -> Has already been installed via Homebrew, but needs to be code-signed to work on macOS.

Creating a Certificate
=======================
- Open the "Keychain Access" application.

- Select "Certificate Assistant"
	- Create a Certificate in the application menu (Keychain Access). An assistant window will appear for guiding you through the process.

First, we will be asked for the name and type of the certificate. We may choose the name arbitrarily, but to simplify its future use in command line, prefer names without spaces or other fancy characters, e.g., ** gdbcert **.

Make sure that:
	- "Identity Type" is set to ** Self Signed Root **,
	- change "Certificate Type" to ** Code Signing **,
	- check the "Let me override" defaults checkbox, and click Continue.

Click Continue again in the popup prompt warning about the certificate being self-signed.

On the next page:
	- leave "Security Number" to be ** 1 **,
	- and set "Validity Period" to a large enough number of days to cover the duration of the class or more, say, 365. (Certificates cannot last forever; the maximum validity period is 20 years.)

Then click Continue once again, and keep doing so to skip the next six screens until you see the one entitled "Specify a Location For The Certificate".

For the only property, "Keychain":
	- choose ** System ** from the drop-down list.

Lastly, click Create, type in your password, if prompted, and click Done.

Back in the main window, choose the System keychain in the sidebar on the left, and select the newly created certificate from the list. Open the context menu and select Get Info. In the information window that will appear, expand the Trust section and set the Code Signing property to Always Trust. Close this window (you may be asked for your password), and quit Keychain Access.

SETUP LINK:
===========
https://ics.uci.edu/~pattis/common/handouts/macmingweclipse/allexperimental/mac-gdb-install.html

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

print_message "Setting up gdb code-signing certificate ..."

sleep 1

codesign -s gdbcert /usr/local/bin/gdb