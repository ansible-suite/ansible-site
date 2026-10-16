#!/usr/bin/env bash
# By Pytel
# This script finds all YAML files in the repository, excluding certain directories.

set -euo pipefail

print0=false
if [[ "${1:-}" == "--print0" ]]; then
	print0=true
	shift
fi

if [[ "$#" -eq 0 ]]; then
	find_args=(. \( -path './.ansible' -o -path './.venv' \) -prune -o)
else
	find_args=("$@")
fi

if [[ "$print0" == true ]]; then
	find "${find_args[@]}" -type f \( -name '*.yml' -o -name '*.yaml' \) -print0
else
	find "${find_args[@]}" -type f \( -name '*.yml' -o -name '*.yaml' \)
fi
