#!/usr/bin/env bash

# Creates symlinks to dotfiles (including dotdirectories) on the home directory.
# Pre-existing dotfiles (or directories) that have name conflicts are saved onto
# the .backups directory.

# Usage: create_links.sh
# Note: safe to re-run

# Path of directory script is in
SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)"
# Path to dotfile directory
DOTFILES_DIR="$(cd $SCRIPTS_DIR/.. && pwd)"

CURR_DATE_TIME="$(date '+%Y%m%d%H%M%S')"
BACKUP_DIR="${HOME}/.backups/dotfiles-${CURR_DATE_TIME}"

# Map of [symlink to be created on home dir] to [path to actual dotfile]
typeset -A DOTFILES
DOTFILES=(
    [".bashrc"]="${DOTFILES_DIR}/shell/bash/bashrc"
    ["init.vim"]="${DOTFILES_DIR}/nvim/init.vim"
    ["init.vim"]="${HOME}/.config/nvim/init.vim"
    [".tmux.conf"]="${DOTFILES_DIR}/tmux/tmux.conf"
    #[".bash_profile"]="${DOTFILES_DIR}/shell/bash/bash_profile"
    #[".zshrc"]="${DOTFILES_DIR}/shell/zsh/zshrc"
    #[".gitcofig"]="${DOTFILES_DIR}/git/gitconfig"
    #[".ssh/config"]="${DOTFILES_DIR}/ssh/config"
)

function handle_error {
    printf "\nError encountered. Stop.\n"
    exit 1
}

function main {
    echo "Backing up any pre-existing files (or directories)..."
    mkdir -p "${BACKUP_DIR}"
    for f in "${!DOTFILES[@]}"; do
        parent_dirs=$(dirname ${f}) # Outputs "." if f has no parent directory (see dirname --help)
        backup_dir="${BACKUP_DIR}/${parent_dirs}"

        file="${HOME}/${f}"
        if [[ -e $file ]]; then
            mkdir -p $backup_dir || handle_error
            cp -rv $file $backup_dir/ || handle_error
            rm -rf $file || handle_error
        fi
    done
    echo ""

	echo "Creating .config directory for neovim..."
	mkdir -p "${HOME}/.config/nvim" || handle_error
	echo ""

    echo "Creating symlinks to dotfiles in the home directory..."
    for f in "${!DOTFILES[@]}"; do
        parent_dirs=$(dirname ${f}) # Outputs "." if f has no parent directory (see dirname --help)
        mkdir -p "${HOME}/${parent_dirs}" || handle_error

        symlink="${HOME}/${f}"
        file="${DOTFILES[$f]}"
        ln -sv $file $symlink || handle_error
    done
    echo ""

    echo "Done."
}

main

