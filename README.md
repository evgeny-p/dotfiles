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

### fonts

Downloads MesloLGS NF — the Nerd Font tide recommends — into the per-user
font directory (`~/Library/Fonts` on macOS, `~/.local/share/fonts` on
Ubuntu, followed by `fc-cache`). No privileges needed. The files are pinned
to a commit of `romkatv/powerlevel10k-media` and verified by sha256, so
every machine ends up with the same bytes.

The font covers the full Russian alphabet, and its Cyrillic glyphs carry the
same advance width as the Latin ones, so box drawing and alignment survive.
Missing: the rouble sign (U+20BD) and the extended Cyrillic blocks.

### fish

Installs fish (Homebrew on macOS, apt on Ubuntu), deploys
`~/.config/fish/config.fish` plus `conf.d/` snippets for environment
variables and abbreviations, and makes fish the login shell when
`fish_set_default_shell` is enabled.

Plugins are managed declaratively: `fish_plugins` is rendered into
`~/.config/fish/fish_plugins` and `fisher update` reconciles the installed
set with that file, installing what is missing and removing what was
dropped. Versions are pinned to tags, so bumping a plugin is a commit.

The prompt is [tide](https://github.com/IlanCosman/tide), configured
non-interactively through `tide configure --auto`; the options live in
`fish_tide_configure` and every choice on the path of the selected style has
to be present. tide stores its settings in fish universal variables, which
are outside this repository, so the applied options are recorded in
`.tide-configure-state` and re-applied only when they change.

Two things worth knowing:

- tide v6 targets fish 4, while Ubuntu 24.04 still ships fish 3.7 — hence
  `fish_apt_use_ppa: true`, which pulls fish from `ppa:fish-shell/release-4`.
  The role fails with an explicit message if fish is older than
  `fish_tide_min_fish_version`.
- tide expects a [Nerd Font](https://www.nerdfonts.com) in the terminal.
  `icons: 'Few icons'` keeps the prompt readable with a plain font, but the
  git and OS glyphs still need one.

Variables are documented in `roles/fish/defaults/main.yml`; the values in
use are set in `group_vars/all.yml`.
