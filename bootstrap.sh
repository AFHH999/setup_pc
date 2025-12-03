#!/bin/bash

# Geting git and ansible
echo "installing git and ansible...."
sudo pacman -Syu --noconfirm ansible git

# Set up the directory
REPO_URL="https://github.com/AFHH999/Dotfiles"
TARGET_DIR="$HOME/PC_setup/"

if [ -d "$TARGET_DIR" ]; then
    echo "directory $TARGET_DIR already exist. Pulling latest changes..."
    cd "$TARGET_DIR" || exit
    git pull

else
    echo "Cloning repository..."
    git clone "$REPO_URL" "$TARGET_DIR"
    cd "$TARGET_DIR" || exit
fi

#Running the playbook
echo "Running the ansible playbook..."
ansible-playbook -i inventory.ini setup.yml --ask-become-pass
echo "Setup complete! Please restart your shell or log out and back in."
