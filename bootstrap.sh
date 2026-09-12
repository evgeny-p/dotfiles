#!/bin/sh
# Install ansible and apply the playbook to this machine.
set -eu

repo_dir=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)

if ! command -v ansible-playbook >/dev/null 2>&1; then
    case "$(uname -s)" in
    Darwin)
        if ! command -v brew >/dev/null 2>&1; then
            echo "Homebrew is required, see https://brew.sh" >&2
            exit 1
        fi
        brew install ansible
        ;;
    Linux)
        sudo apt-get update
        sudo apt-get install --yes ansible
        ;;
    *)
        echo "Unsupported OS: $(uname -s)" >&2
        exit 1
        ;;
    esac
fi

cd "$repo_dir"
ansible-galaxy collection install --requirements-file requirements.yml
exec ansible-playbook site.yml --ask-become-pass "$@"
