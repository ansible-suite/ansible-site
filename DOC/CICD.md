# CI/CD

The repository uses GitHub Actions to validate Ansible content automatically.

## Ansible lint runner

The workflow is defined in `.github/workflows/ansible-lint.yml`. It runs when a pull
request targets the `main` branch and can also be started manually from the GitHub
Actions interface using **Run workflow**.

The job runs on an `ubuntu-24.04` GitHub-hosted runner and performs the following steps:

1. Checks out the repository.
2. Sets up Python 3.14.
3. Installs the Ansible dependencies from `requirements.yml`.
4. Runs `ansible-lint` against the repository using the repository's `.ansible-lint`
   configuration.

A pull request should pass this workflow before it is merged into `main`.

More information about the `ansible-lint` [linting.md](linting.md).