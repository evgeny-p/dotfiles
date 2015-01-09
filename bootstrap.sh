#!/bin/bash

echo "Installing git"
sudo apt-get install -y git

echo "Installing ansible"
sudo apt-get install software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt-get install -y ansible

echo "Cloning dotfiles repo"
git clone https://github.com/evgeny-p/dotfiles.git ~/dotfiles
~/dotfiles/install.sh
