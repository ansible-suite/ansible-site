# Ansible Site
An ansible site repository.

## About
This repository provides the structure of a self-contained Ansible workspace.

Features overview:
- self-contained Ansible file structure - inventories, host/group vars, playbooks, roles, collections
- Ansible config file - corresponds to the file structure
- management scripts - shell environment activation, Python venv setup, Ansible Galaxy dependencies installation from requirements files, vault password generation
- VS Code integration - extensions recommendation, workspace and extensions config, automatic shell environment activation in the terminal


## Requirements
In order to use this repository for runtime of Ansible, you need the following:
- OS: Linux or macOS (on Windows, use WSL)
- System or user Ansible installation or supported Python version with PIP and venv available

For convenient development of Ansible content, the following is recommended in addition to above requirements:
- `ansible-lint` (in case of system or user Ansible installation)
- (optional) `ansible-dev-tools` package (in case of system or user Ansible installation)
- (recommended editor) Visual Studio Code (or any editor based on it)


## Getting started
> [!IMPORTANT]
> The [ansible-suite/ansible-site](https://github.com/ansible-suite/ansible-site) is a skeleton repository.
> In order to use it, create your own fork or copy, as described in the [Creating a fork or copy](#creating-a-fork-or-copy) section.
> The other sections of the documentation assume you are already using your own fork or copy.


### Creating a fork or copy
The skeleton repository [ansible-suite/ansible-site](https://github.com/ansible-suite/ansible-site)
provides a universal but empty Ansible workspace structure. In order to use it, you should create
a copy of it and fill it with your content (playbooks, inventories, vars, etc.). The copy can be created in one of the ways in the subsections below.


#### Creating your own fork
The recommended way to use the Ansible site is to create your own fork of the skeleton repository.

> [!WARNING]
> In most cases, it is recommended to make the your fork private 
> as it may contain internal configuration of your infrastructure.
> This section guides you to create a private fork.

Pros:
- version control
- easy collaboration
- possible updates from the skeleton repository
- works on different Git servers (GitHub, GitLab, etc.)

Cons:
- git history is a mix of your own changes and the changes in the skeleton repository,
  especially if you periodically update your fork with new changes from the skeleton

To create a private fork of the skeleton repository:
1. Create an empty repository on your Git server of choice.
    - for GitHub, follow the [Creating a new repository from the web UI](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-new-repository#creating-a-new-repository-from-the-web-ui) guide on GitHub Docs
    - for GitLab, follow the [Create a blank project](https://docs.gitlab.com/user/project/#create-a-blank-project) guide on GitLab Docs

2. Clone the new empty repository:

       git clone <your_repo_url>

3. Change the working directory to the repository:

       cd <your_repo_path>

4. Add the `upstream` remote pointing to the skeleton repository:

       git remote add upstream https://github.com/ansible-suite/ansible-site

5. Pull from the `upstream` remote:

       git pull upstream main


To update your fork later with new changes to the upstream skeleton repository:

1. Check if your clone (as you may have more clones) of your fork has the `upstream` remove pointing to the skeleton repository:

       git remote show upstream

2. If the command fails with `fatal: 'upstream' does not appear to be a git repository`, add the remote upstream:

       git remote add upstream https://github.com/ansible-suite/ansible-site

3. Pull from the `upstream` remote:

       git pull upstream main


> [!NOTE]
> If you use feature branches and pull requests / merge requests, it is recommended to create a feature branch with these changes to ensure you fix any conflicts between your changes and the changes made to the upstream.


#### Using the skeleton repository as a template
The alternative to creating a fork is to use GitHub's template repository feature.
For more information about GitHub template repositories, see the [GitHub Docs](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template).

> [!WARNING]
> In most cases, it is recommended to make the your copied repository private 
> as it may contain internal configuration of your infrastructure.

Pros:
- version control
- easy collaboration
- separate git history from the skeleton repository

Cons:
- works only within GitHub
- no updates from the skeleton repository (the git history is separated)

To create a private repository from the skeleton as a template,
follow the [Creating a repository from a template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template) guide on GitHub docs, using [ansible-suite/ansible-site](https://github.com/ansible-suite/ansible-site) as a template.


#### Downloading and storing locally without Git
The simplest way to use the Ansible site with your own content is to download the skeleton and then store any changes in it locally.

Pros:
- no Git usage required

Cons:
- no version control
- complicated collaboration
- backups only as part of file backups
- no updates from the skeleton repository

To use the workspace by storing locally:
1. Download the skeleton repository's content as a ZIP file.
2. Uncompress the ZIP file to a local directory on Linux or macOS (on Windows, use WSL).


### Command-line usage

#### Local setup in the command-line
To start using your Ansible site from the command line:
1. If using Git to version-control your Ansible site, clone it (if you have not yet):

       git clone <your_repo_url>

2. Change the working directory to the repository (if you have not yet):

       cd <your_repo_path>

3. If you want to install development dependencies, create a file named `.env.local` with the following content:

       ANSIBLESITE_PROFILE=dev

4. Run the setup script.

         bin/setup

   This script:
   - creates Python virtual environment and installs required PIP packages in it
   - installs required Ansible collections and roles from Ansible Galaxy, as specified in `requirements.yml`

#### Using Ansible from the command-line
To use Ansible from the command line:
1. Ensure you have either a Git repository or a local copy of your Ansible site
   see the [Creating a fork or copy](#creating-a-fork-or-copy) section.

2. Ensure you have performed the local setup once, see the [Local setup in the command-line](#local-setup-in-the-command-line) section.

3. Activate the shell environment:

       source bin/activate

4. Use any Ansible commands. For more information, see the [Working with command line tools](https://docs.ansible.com/ansible/latest/command_guide/command_line_tools.html) section of the Ansible Docs.


### Usage with Visual Studio Code
The Ansible site contains Visual Studio Code integration that automatically activates the shell environment in the integrated terminal and recommends the Ansible extension.

#### Local setup in Visual Studio Code
To start using your ansible site locally:
1. Open the repository.

   - If using Git to version-control your repository, and you don't have
   a local clone yet, clone and open it in VS Code, see the [Clone a repository locally](https://code.visualstudio.com/docs/sourcecontrol/intro-to-git#_clone-a-repository-locally) guide on VS Code docs.

   - If you do not use git or already have a clone, open the folder in VS Code.

2. To install development dependencies (recommended for VS Code usage), create a file named `.env.local` with the following content:

       ANSIBLESITE_PROFILE=dev

3. Run the setup script.

       bin/setup

   This script:
   - creates Python virtual environment and installs required PIP packages in it
   - installs required Ansible collections and roles from Ansible Galaxy, as specified in `requirements.yml`


#### Using Ansible in Visual Studio Code
1. Ensure you have either a Git repository or a local copy of your Ansible site,
   see the [Creating a fork or copy](#creating-a-fork-or-copy) section.

2. Ensure you have performed the local setup once, see the [Local Setup in Visual Studio Code](#local-setup-in-visual-studio-code) section.

3. Ensure you have opened the folder in Visual Studio Code.

4. Open the integrated terminal in Visual Studio Code.

5. Edit files or use the terminal to invoke any Ansible commands. For more information, see the [Working with command line tools](https://docs.ansible.com/ansible/latest/command_guide/command_line_tools.html) section of the Ansible Docs.


## Features reference

### Structure overview

The structure of the repository shown as a tree with comments:

    .
    ├── .ansible
    │   ├── collections # collections downloaded with Ansible Galaxy
    │   │   └── ansible_collections
    │   ├── roles # roles downloaded with Ansible Galaxy
    │   └── ...
    ├── .env* # dotenv files (see Dotenv variable files)
    ├── .venv # the Python virtual environment, is activated by the activation script
    │   └── ...
    ├── README.md # this README
    ├── ansible.cfg # the configuration file
    ├── bin
    │   ├── activate # the activation script
    │   ├── ansible-galaxy # the wrapper around 'ansible-galaxy' (see Installing Ansible collection and role dependencies with Galaxy)
    │   ├── ansible-playbook-local # a convenience script for running 'ansible-playbook' limited to the local machine
    │   ├── generate-vault-password # generates a random password for Ansible vault
    │   ├── install-pip-deps # installs PIP dependencies of ansible collections and roles
    │   ├── setup # the full setup script, runs 'setup-venv' and 'setup-galaxy'
    │   ├── setup-galaxy # installs roles and collections using 'ansible-galaxy' (see Installing Ansible collection and role dependencies with Galaxy)
    │   ├── setup-venv # sets up the Python virtual environment (see Python virtual environment management)
    │   └── ...
    ├── inventory # the inventories
    │   ├── group_vars # group variables
    │   │   └── *.yml
    │   ├── host_vars # host variables
    │   │   └── *.yml
    │   ├── production # the production hosts
    │   ├── staging # the staging hosts
    │   └── test # the testing hosts
    ├── playbooks # playbooks
    │   └── *.yml
    ├── requirements_dev.txt # development PIP requirements
    ├── requirements.txt # runtime PIP requirements
    ├── requirements.yml # Ansible Galaxy collection and role requirements
    ├── roles # roles local to this site
    │   └── ...
    └── site.yml # the main playbook, defining the state of the Ansible site


### Shell environment activation
`bin/activate` is a sourceable script which can be run in the current shell to set the correct environment for working with the Ansible site. It must be sourced from an existing `bash` or `zsh` shell using `source bin/activate` (possibly `source activate` for re-activation).

The activation script does the following:
  - loads the environment variables from the dotenv files, see [Dotenv variable files](#dotenv-variable-files)
  - activates the Python virtual environment, if enabled, see [Python virtual environment management](#python-virtual-environment-management).
  - adds the `bin` and `external_bin` directories to the `PATH` environment variable, preceding the Python venv bin directory

The activation script is sourced in the following cases:
  - manually, calling `source bin/activate` from a shell session
  - by certain shell scripts from `bin` to ensure they have the correct environment
  - automatically in VS Code terminal from an Ansible site workspace

> [!NOTE]
> In some cases after modifying the workspace, you may need to re-activate the shell environment to update the environment variables by calling `source activate`.


### Profiles
The activation script supports specifying a 'profile' to control certain parts of the behaviour, such as selecting additional dependencies or loading additional environment variables in specific cases.

The profile can be specified by the environment variable `ANSIBLESITE_PROFILE`. Alternatively, it can be specified as the first argument given to the activation script (non-persistent and currently not recommended).

> [!TIP]
> Typically, one sets the profile using the enviromnment variable in the dotenv files, usually in the `.env.local` file (see [Dotenv variable files](#dotenv-variable-files) for more information).

There is a prepared `dev` profile which adds Python dependencies for developing with Ansible.


### Dotenv variable files
The shell environment activation script sources a set of `.env`-files on activation, which can be used to set any variables necessary to control the Ansible site environment and/or Ansible. The existence of any of the files is optional and if some of them do not exist, they are simply ignored.

The first sourced file is `.env`, the VCS-controlled (tracked by git) file containing variables that are needed to load in all cases.

To support storing environment variables locally without tracking in git, the activation script then sources the `.env.local` file. This file is listed in `.gitignore`.

After sourcing `.env` and `.env.local` files, `.env.$ANSIBLESITE_PROFILE` (VCS-controlled) and `.env.$ANSIBLESITE_PROFILE.local` (local untracked by git) are sourced, as well, allowing for profile-specific environment variables. The profile can be set in the global `.env` and `.env.local` files. Files that match `.env.*.local` are listed in `.gitignore`. See [Profiles](#profiles) for more information about profiles.

> [!TIP]
> A typical use case is to set the profile (the `ANSIBLESITE_PROFILE` variable) in the `.env.local` file of a particular clone of the repository to control which profile is used in the current clone. A concrete example is setting `ANSIBLESITE_PROFILE` to `dev` in clones that are meant for development.


### Python virtual environment management
By default, the management scripts maintain a Python virtual environment, located in `.venv`. The virtual environment is created and/or updated using the `setup-venv` script. This script is called by the overall `setup` script.

After the `setup-venv` script ensures the virtual environment exists, it calls `pip` to install and/or upgrade packages listed in a requirements file. When no profile is set, the `requirements.txt` file is used. Setting the profile (see [Profiles](#profiles)) results in `requirements_$ANSIBLESITE_PROFILE.txt` being used, instead.

The usage of the virtual environment can be switched off by setting the environment variable `ANSIBLESITE_USE_VENV` to `0`.

If the Python virtual environment is created after the shell environment has been activated, re-activate it so that the Python virtual environment is activated, as well.


### Installing Ansible collection and role dependencies with Galaxy
The management scripts allow installing Ansible collections and roles using Ansible Galaxy as part of the setup process. The installation is performed using the `setup-galaxy` script, which is called by the overall `setup` script.

The `setup-galaxy` script calls `ansible-galaxy` to install collections and roles from the `requirements.yml` file. See the [Galaxy User Guide](https://docs.ansible.com/projects/ansible/latest/galaxy/user_guide.html#installing-roles-and-collections-from-the-same-requirements-yml-file) for example content.

When using the `setup-galaxy` script or calling the `ansible-galaxy` command in an activated shell environment, it is called through a wrapper with the same name, overriding the roles and collections paths to ensure they are installed to the correct directories and not those for content of this ansible site.


### Managing Ansible vault password
The management scripts support the creation and usage of a password file for Ansible vault, named `.vault_pass`.

The vault password file can be generated using the `generate-vault-password`.

If the password file exists on shell environment activation, the `ANSIBLE_VAULT_PASSWORD_FILE` env variable is set, so Ansible uses this password file when called from the activated shell environment.

> [!NOTE]
> If you generate or create a password file after you have activated the shell environment, re-activate it by calling `source activate` so the env variable is set.
