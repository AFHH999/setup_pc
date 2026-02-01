#!/bin/bash

# 1. Install core dependencies
echo "Installing git and ansible..."
sudo pacman -Syu --noconfirm ansible git

# 2. Set up the Installer Directory (PC_setup)
REPO_URL="https://github.com/AFHH999/setup_pc"
TARGET_DIR="$HOME/PC_setup"

if [ -d "$TARGET_DIR" ]; then
    echo "Directory $TARGET_DIR already exists. Pulling latest changes..."
    cd "$TARGET_DIR" || exit
    git pull
else
    echo "Cloning setup_pc repository..."
    git clone "$REPO_URL" "$TARGET_DIR"
    cd "$TARGET_DIR" || exit
fi

# 3. Install Ansible Galaxy collections
echo "Installing required Ansible collections..."
ansible-galaxy collection install community.general

# 4. Run the playbook
# --ask-become-pass: Prompt for sudo password
# --ask-vault-pass: Prompt for Ansible Vault password (secrets)
echo "Running the ansible playbook..."
ansible-playbook -i inventory.ini site.yml --ask-become-pass --ask-vault-pass

echo "--------------------------------------------------"
echo "Setup complete! Please restart your shell."
echo "--------------------------------------------------"