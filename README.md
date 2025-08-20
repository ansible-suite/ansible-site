# Ansible Site
An ansible site repository.

## About
This repository provides the structure of a self-contained ansible environment.

Features:
- self-contained Ansible file structure - inventories, host/group vars, playbooks, roles, collections
- Ansible config file - corresponds to the file structure
- scripts for environment management - Python venv setup, PIP and Ansible Galaxy dependencies installation
- VS Code integration - extensions recommendation, environment and extensions config, automatic environment activation


## Usage
>   [!IMPORTANT]
>   The [ansible-suite/ansible-site](https://github.com/ansible-suite/ansible-site) is a skeleton repository.
>   In order to use it, create your own fork or copy, as described in the [Creating a fork or copy](#creating-a-fork-or-copy) section.
>   The other sections of the documentation assume you are already using your own fork or copy.


### Creating a fork or copy
The skeleton repository [ansible-suite/ansible-site](https://github.com/ansible-suite/ansible-site)
provides a universal but empty Ansible environment structure. In order to use it, you should create
a copy of it and fill it with your content (playbooks, inventories, vars). The copy can be created in one of the ways in the subsections below.


#### Creating your own fork
The recommended way to use the environment is to create your own fork of the repository.

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
follow the [Creating a repository from a template](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template#creating-a-repository-from-a-template) guide on GitHub docs, using the [ansible-suite/ansible-site](https://github.com/ansible-suite/ansible-site) as a template.


#### Downloading and storing locally without Git
The simplest way to use the environment with your own content is to download the skeleton
and then store any changes in it locally.

Pros:
- no Git usage required

Cons:
- no version control
- complicated collaboration
- backups only as part of file backups
- no updates from the skeleton repository

To use the environment by storing locally:
1. Download the skeleton repository's content as a ZIP file.
2. Uncompress the ZIP file to a local directory on Linux or macOS (on Windows, use WSL).


### Command-line usage

#### Local setup in the command-line
To start using your Ansible site from the command line:
1. If using Git to version-control your Ansible site, clone it (if you have not yet):

       git clone <your_repo_url>

2. Change the working directory to the repository (if you have not yet):

       cd <your_repo_path>

3. Run the setup script.

   - If you only want the ansible runtime dependencies, run:

         bin/setup

   - If you also want development dependencies, run:

         bin/setup dev

   This script:
   - creates Python virtual environment and installs required PIP packages in it, as specified in `requirements.txt` (and `requirements_dev.txt`, if development dependencies were requested)
   - installs required Ansible collections and roles from Ansible Galaxy, as specified in `requirements.yml`

#### Using Ansible from the command-line
To use Ansible from the command line:
1. Ensure you have either a Git repository or a local copy of your Ansible site
   see the [Creating a fork or copy](#creating-a-fork-or-copy) section.

2. Ensure you have performed the local setup once, see the [Local setup in the command-line](#local-setup-in-the-command-line) section.

3. Activate the environment:

        source bin/activate

4. Use any Ansible commands. For more information, see the [Working with command line tools](https://docs.ansible.com/ansible/latest/command_guide/command_line_tools.html)
   section of the Ansible Docs.


### Usage with Visual Studio Code
The Ansible site contains Visual Studio Code integration that automatically activates the environment in the integrated terminal and recommends the Ansible extension.


#### Local setup in Visual Studio Code
To start using your ansible site locally:
1. Open the repository.

   - If using Git to version-control your repository, and you don't have
   a local clone yet, clone and open it in VS Code, see the [Clone a repository locally](https://code.visualstudio.com/docs/sourcecontrol/intro-to-git#_clone-a-repository-locally) guide on VS Code docs.

   - If you do not use git or already have a clone, open the folder in VS Code.

3. Run the setup script.

       bin/setup dev

   This script:
   - creates Python virtual environment and installs required PIP packages in it, as specified in `requirements.txt` and `requirements_dev.txt`
   - installs required Ansible collections and roles from Ansible Galaxy, as specified in `requirements.yml`


#### Using Ansible in Visual Studio Code
1. Ensure you have either a Git repository or a local copy of your Ansible site,
   see the [Creating a fork or copy](#creating-a-fork-or-copy) section.

2. Ensure you have performed the local setup once, see the [Local Setup in Visual Studio Code](#local-setup-in-visual-studio-code) section.

3. Ensure you have opened the folder in Visual Studio Code.

4. Open the integrated terminal in Visual Studio Code.

5. From the terminal, use any Ansible commands. For more information, see the [Working with command line tools](https://docs.ansible.com/ansible/latest/command_guide/command_line_tools.html)
   section of the Ansible Docs.

## Structure overview

The structure of the repository shown as a tree with comments:

    .
    ├── ansible.cfg # the configuration file
    ├── bin # directory with scripts, added to PATH by the activation script
    │   ├── activate # the activation script
    │   ├── install-pip-deps # installs PIP dependencies of ansible collections and roles
    │   ├── setup # the full setup script, runs 'setup-venv' and 'setup-galaxy'
    │   ├── setup-galaxy # installs roles and collections using 'ansible-galaxy'
    │   ├── setup-venv # creates a venv and installs PIP packages from 'requirements.txt' or 'requirements_$mode.txt', where $mode is the setup mode, e.g. 'dev'
        └── ...
    ├── external_bin # downloaded binaries and scripts, added to PATH by the activation script
    │   └── jq
    ├── external_collections # collections downloaded from Ansible Galaxy
    │   └── ansible_collections
    ├── external_roles # roles downloaded from Ansible Galaxy
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
    ├── README.md # this README
    ├── requirements_dev.txt # development PIP requirements, used when 'setup' or 'setup-venv' is called with 'dev', includes 'requirements.txt'
    ├── requirements.txt # runtime PIP requirements
    ├── requirements.yml # Ansible Galaxy collection and role requirements
    ├── roles # roles local to this site
    └── venv # the Python virtual environment, is activated by the activation script
        └── ...
