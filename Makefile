.PHONY: all install server check lint

# Default target
all: install

# Run the full workstation setup
install:
	./bootstrap.sh

# Run only the server components (No Desktop, No Dotfiles)
server:
	ansible-playbook -i inventory.ini site.yml --skip-tags "desktop,dotfiles" --ask-become-pass --ask-vault-pass

# Check for syntax errors
check:
	ansible-playbook -i inventory.ini site.yml --syntax-check

# Run the linter locally
lint:
	ansible-lint
