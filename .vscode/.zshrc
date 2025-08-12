### A custom .zshrc for ansible-site VS Code integration
# The script, along with .zshenv and the environment defined in settings.json of this project,
# ensures custom environment activation script is run,
# while the startup files in the user-defined $ZDOTDIR (or $HOME if $ZDOTDIR is not set)
# are still sourced and the VS Code Terminal Shell Integration is installed
# similarly to the way VS Code itself installs Terminal Shell Integration.

# The mechanism relies on $VSCODE_ZDOTDIR (the internal top-level wrapper $ZDOTDIR of VS Code integration),
# which, residing in a temporary directory, is modified to source the activation script,
# while still retaining its original functionality.
# This script is linked to the $VSCODE_ZDOTDIR and itself first sources the original (renamed) one
# before sourcing the environment activation script.
# This script runs in the context of VS Code integration where ZDOTDIR is set to $VSCODE_ZDOTDIR.


## Source the original script
. $ZDOTDIR/.zshrc-vscode


## Source the environment activation script
. $ANSIBLESITE_WORKSPACE/bin/activate
