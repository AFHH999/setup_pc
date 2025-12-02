# Automated Arch Linux setup

This repository contains an Ansible playbook that automate the configuration of a
fresh new Arch Linux installation, set ups the environment with Hyprland and manage
the dotfiles with GNU stow.

## 🚀 Quick start

The easiest way to use the bootstrap.sh that is included in this repository.
Run the following commands:

  Download the bootstrap script
  curl -O <https://raw.githubusercontent.com/AFHH999/setup_pc/main/bootstrap.sh>

  Make it executable
  chmod +x bootstrap.sh

  Run the script
  ./bootstrap.sh

## 🛠 What This Playbook Does

    1.  **System Updates**: Updates the Pacman package cache.
    2.  **Package Installation**: Installs a curated list of software including:
        *   **Core**: `git`, `stow`, `rustup`
        *   **Desktop**: `hyprland`, `waybar`, `kitty`
        *   **Tools**: `neovim`, `tmux`, `zsh`, `fastfetch`, `btop`, `fzf`, `bat`, 'zoxide'
        *   **Fonts & Themes**: `ttf-jetbrains-mono-nerd`, `zsh-theme-powerlevel10k`
    3.  **Dotfiles Management**:
        *   Clones your dotfiles from `https://github.com/AFHH999/Dotfiles` to `~/Dotfiles`.
        *   Uses **GNU Stow** to symlink configurations for `nvim`, `zsh`, `tmux`, and `hypr` to your home directory.
    4.  **Shell Configuration**: Changes the default user shell to **Zsh**.

## Manual installation

If you prefer to run the steps manually without the bootstrap script:

1. **Install Ansible and Git:**
sudo pacman -Syu --noconfirm ansible git

2. **Clone the Repository:**
git clone <https://github.com/AFHH999/setup_pc.git> ~/PC_setup
cd ~/PC_setup

3. **Run the Playbook:**
ansible-playbook -i inventory.ini setup.yml --ask-become-pass

## 📦 Requirements

**Operating System**: Arch Linux
**User**: A user with `sudo` privileges.

## 📄 License

This project is licensed under the [MIT License](LICENSE).
