#!/bin/bash

readonly SCRIPTDIR=$(readlink -m $(dirname $0))

main() {
  type ansible-playbook > /dev/null 2>&1 || {
    echo "Ansible not found. Aborting."
    exit 1
  }

  ansible-playbook $SCRIPTDIR/playbooks/workstation.yml
}

main
