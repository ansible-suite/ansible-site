### A custom .zshenv for ansible-site VS Code integration
# The script, along with .zshrc and the environment defined in settings.json of this project,
# ensures custom environment activation script is run,
# while the startup files in the user-defined $ZDOTDIR (or $HOME if $ZDOTDIR is not set)
# are still sourced and the VS Code Terminal Shell Integration is installed
# similarly to the way VS Code itself installs Terminal Shell Integration.

# The mechanism relies on $VSCODE_ZDOTDIR (the internal top-level wrapper $ZDOTDIR of VS Code integration),
# which, residing in a temporary directory, is modified to source the activation script,
# while still retaining its original functionality.
# The user-defined ZDOTDIR (if any) should be defined in $ANSIBLESITE_USER_ZDOTDIR (if not, $HOME is assumed),
# and the ZDOTDIR in the context of this script is set to the user-defined value after running this script,
# so other user startup scripts are run from there as the custom functionality has already been injected
# in $VSCODE_ZDOTDIR.

## Define the workspace directory
ANSIBLESITE_WORKSPACE=$(realpath $(dirname ${(%):-%x})/..)


## Set the default of user ZDOTDIR
if [[ -z $ANSIBLESITE_USER_ZDOTDIR ]]; then
    ANSIBLESITE_USER_ZDOTDIR=$HOME
fi


## Replace $VSCODE_ZDOTDIR/.zshrc with a custom file

# Rename the original $VSCODE_ZDOTDIR/.zshrc to $VSCODE_ZDOTDIR/.zshrc-vscode
mv $VSCODE_ZDOTDIR/.zshrc{,-vscode}

# Copy custom .zshrc to $VSCODE_ZDOTDIR
cp $ZDOTDIR/.zshrc $VSCODE_ZDOTDIR/.zshrc


## Ensure subsequent startup files are loaded from user-defined ZDOTDIR

# Set ZDOTDIR to $ANSIBLESITE_USER_ZDOTDIR
ZDOTDIR=$ANSIBLESITE_USER_ZDOTDIR


## Source .zshenv from user ZDOTDIR
if [[ -f $ZDOTDIR/.zshenv ]]; then
   . $ZDOTDIR/.zshenv
fi
