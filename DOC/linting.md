# Linting

- [Linting](#linting)
  - [Configuration Files](#configuration-files)
    - [`.yamllint`](#yamllint)
    - [`.ansible-lint`](#ansible-lint)
  - [Linting YAML Files](#linting-yaml-files)
    - [Excluding Files and Directories](#excluding-files-and-directories)
  - [`ansible-lint`](#ansible-lint-1)
  - [`ansible-playbook`](#ansible-playbook)
  - [References](#references)

Linting checks the syntax, formatting, and common problems in Ansible content before it is
used. It should be run for playbooks, inventories, group and host variables, and files
under `roles/`.

The workspace uses two complementary tools:

- `yamllint` checks YAML syntax and general YAML style.
- `ansible-lint` checks Ansible-specific practices in playbooks, tasks, handlers, and
  roles.

On Debian-based systems, you can install the command-line tools using:
```bash
sudo apt install -y yamllint ansible-lint
```

When using the repository virtual environment, `ansible-lint` is also installed from
`requirements_dev.txt`. Make sure `yamllint` is available in the selected environment
before running the YAML checks.

## Configuration Files

The linting tools read their configuration automatically from the hidden files in the
repository root. Keeping the configuration in version control makes lint results
consistent for all contributors and in CI.

### `.yamllint`

`.yamllint` extends yamllint's `default` rules and adjusts them for Ansible content:

- comments must have at least one space after the comment marker;
- indentation of comments is not checked;
- braces may contain one space inside them;
- implicit and explicit octal values are forbidden;
- lines are limited to 90 characters, with exceptions for non-breakable words and
  inline mappings.

These rules apply to YAML files regardless of whether they contain Ansible content.
Change this file when the repository-wide YAML style needs to change.

### `.ansible-lint`

`.ansible-lint` selects the `production` profile and defines Ansible-specific exceptions
and warnings:

- `name[missing]`, `yaml[line-length]`, and `command-instead-of-shell` are skipped;
- `risky-file-permissions` and `no-changed-when` are reported as warnings;
- `.venv/` and `data/` are excluded from the lint run.

The skips are intentional repository policy. In particular, shell usage is allowed where
it is needed, and long YAML lines may be required by regular expressions or similar
values. Prefer a local fix over adding another global skip.


## Linting YAML Files

Run `yamllint` for all YAML files in the workspace, including role defaults, variables,
tasks, handlers, and metadata. The command below skips generated or environment-specific
directories before passing the remaining files to yamllint.

### Excluding Files and Directories

```bash
find . \( -path './.ansible' -o -path './.venv' \) -prune -o \
		-type f \( -name '*.yml' -o -name '*.yaml' \) -print0 | \
		xargs -0 -r yamllint
```

The `-print0` and `-0` options keep filenames containing spaces or other special
characters safe. Add further generated directories to the `find` exclusion list when
necessary.

## `ansible-lint`

Run `ansible-lint` from the repository root so that it can discover `.ansible-lint`.
This checks Ansible playbooks and roles while excluding `.ansible` explicitly.

```bash
ansible-lint . --exclude .ansible
```

Review warnings as well as errors. A warning may not fail the command, but it can still
indicate a task that is difficult to verify or unsafe to run.

## `ansible-playbook`

Use Ansible's syntax check for a specific playbook after the two linting passes:

```bash
ansible-playbook --syntax-check <playbook.yml>
```

The syntax check validates that the selected playbook can be parsed with the current
Ansible installation. It does not replace `yamllint` or `ansible-lint`, and it may need
the appropriate inventory, variables, collections, or vault configuration.

## References
- [oneuptime: How to set up Ansible linting with ansible-lint in CI](https://oneuptime.com/blog/post/2026-02-21-how-to-set-up-ansible-linting-with-ansible-lint-in-ci/view)
- [GitHub: run-ansible-lint](https://github.com/marketplace/actions/run-ansible-lint)