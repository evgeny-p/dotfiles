# Dotfiles

Personal machine setup (macOS and Ubuntu) managed with Ansible.

## Layout

    ansible.cfg           ansible configuration
    site.yml              entry point playbook
    inventory/hosts.yml   machines, configured over a local connection
    group_vars/           per-group settings
    roles/                one role per tool
    requirements.yml      external collections

## Installation

```
git clone https://github.com/evgeny-p/dotfiles.git ~/workspace/dotfiles
cd ~/workspace/dotfiles
./bootstrap.sh
```

`bootstrap.sh` installs ansible, pulls the collections from
`requirements.yml` and runs `site.yml` against the local machine.

## Usage

Run everything:

```
ansible-playbook site.yml --ask-become-pass
```

A single role:

```
ansible-playbook site.yml --tags fish --ask-become-pass
```

Dry run:

```
ansible-playbook site.yml --check --diff
```

## Roles

### fish

Installs fish (Homebrew on macOS, apt on Ubuntu, optionally from the
upstream PPA via `fish_apt_use_ppa`), deploys `~/.config/fish/config.fish`
plus `conf.d/` snippets for environment variables and abbreviations, and
makes fish the login shell when `fish_set_default_shell` is enabled.

Variables are documented in `roles/fish/defaults/main.yml`; the values in
use are set in `group_vars/all.yml`.
