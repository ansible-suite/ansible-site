# Makefile usage

The `Makefile` helps prepare the development environment, download Ansible
roles and collections, and run linting checks for new roles.

> [!NOTE]
> The Ansible playbook itself must be run manually from the activated virtual
> environment. The `Makefile` does not run the playbook.

## Working with `make`

Run `make help` to display the available targets:

```text
Usage: make [target]

Targets:
  all:                   Run all linting checks (yamllint, ansible-lint, and ansible-playbook syntax check)
  install:               Install required packages
  yaml-lint:             Run yamllint on all YAML files in the repository
  ansible-lint:          Run ansible-lint on all Ansible playbooks in the repository
  ansible-playbook-syntax-check: Check the syntax of all Ansible playbooks in the repository
  lint:                  Run all linting checks (yaml-lint, ansible-lint, and ansible-playbook syntax check)
  auto-fix-syntax:       Automatically fix syntax issues in Ansible playbooks using ansible-lint
  setup:                 Download and install dependencies, set up the virtual environment, and prepare the development environment
  clean:                 Clean build artifacts
  clean-all:             Clean all build artifacts and dependencies
```

> [!TIP]
> If you add dependencies to `requirements.yml`, `make setup` is the
> recommended command for setting up or updating the environment.

> [!WARNING]
> If the repository dependencies change, run `bin/setup` manually to install
> the updated Ansible Galaxy dependencies.

> [!NOTE]
> When creating custom roles, it is recommended to run `make lint` to check
> the code.

- [linting.md](linting.md) provides more information about the linting checks.

## Finding YAML files

The `bin/find-yaml-files.sh` script finds YAML files with either the `.yml` or
`.yaml` extension. When run without a path argument, it searches the whole
repository and excludes the `.ansible` and `.venv` directories.

Run it for the whole repository:

```bash
bin/find-yaml-files.sh
```

You can also limit the search to specific files or directories:

```bash
bin/find-yaml-files.sh site.yml playbooks
```

Use the `--print0` option to separate results with a null character. This is
useful when piping file names to commands such as `xargs`, because it safely
handles spaces and other special characters in file names:

```bash
bin/find-yaml-files.sh --print0 | xargs -0 -r yamllint
```

The `Makefile` uses this script for YAML linting and to find playbooks for
syntax checks.

## Activating the virtual environment

To activate the virtual environment:

```bash
source bin/activate
```

> [!NOTE]
> To deactivate the virtual environment, run `deactivate`.
