### A custom .bashrc for ansible-site VS Code integration
# The script ensures the environment activation script is run
# after sourcing the VS Code Terminal Shell Integration script,
# which sources the default startup scripts in $HOME
# before installing the integration itself.

## Install the VS Code Terminal Shell Integration

# Get the 'code' executable path
if [[ "$(uname)" == "Darwin" ]]; then # macOS
    CODE="$(mdfind "kMDItemCFBundleIdentifier == 'com.microsoft.VSCode'" | head -n 1)/Contents/Resources/app/bin/code"
else
    CODE="code"
fi

# Pretend injection by VS Code
# so that the shell integration script sources scripts in default locations
VSCODE_INJECTION=1

# Source the install script located by calling 'code'
. "$("$CODE" --locate-shell-integration-path bash)"


## Source the environment activation script
. "$(dirname "${BASH_SOURCE[0]}")/../bin/activate"
