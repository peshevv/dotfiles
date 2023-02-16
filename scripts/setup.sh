#!/bin/bash

# Path of directory script is in
SCRIPTS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" > /dev/null 2>&1 && pwd)"

CURR_DATE_TIME="$(date '+%Y%m%d%H%M%S')"
LOG_DIR="${HOME}/.bootstrap.log"
LOG_FILE="${LOG_DIR}/bootstrap-${CURR_DATE_TIME}.log"

function handle_error {
    printf "\n[Bootstrap] Error encountered. Stop.\n"
    exit 1
}
 
function check_cmd_exists {
    cmd=$1
    command -v $cmd > /dev/null 2>&1 || {
        echo >&2 "[Bootstrap] Command not found: $cmd. Aborting."
        exit 1
    }
}

function check_deps_exist {
    check_cmd_exists git
    check_cmd_exists curl
    check_cmd_exists tmux
    check_cmd_exists nvim
}

function bootstrap {
    # Create symlinks
    printf "\n[Bootstrap] Creating symlinks to dotfiles...\n"
    $SCRIPTS_DIR/create_links.sh || handle_error

    # Download vim-plug
    printf "\n[Bootstrap] Downloading vim-plug...\n"
	sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim' || handle_error

    # Download vim plugins
    printf "\n[Bootstrap] Downloading nvim plugins...\n"
    nvim +PlugInstall +qa!

    # Done
    printf "\n[Bootstrap] Done.\n"
}

function main {
    check_deps_exist

    mkdir -p $LOG_DIR || handle_error
    touch $LOG_FILE || handle_error

    # Run bootstrap with logging
    # Different ways of saving terminal output to a file: https://askubuntu.com/a/731237
    # Using tee with '|&' but in a way that works with older versions of bash: https://askubuntu.com/a/485762
    bootstrap 2>&1 | tee $LOG_FILE

    printf "\n[Bootstrap] Logs: $LOG_FILE\n"
}

main






