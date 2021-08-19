#!/bin/bash
# this is used to setup codespace instances. much cloud. very ephemeral.
set -e
CALLED_DIR=$(pwd)
trap 'cd $CALLED_DIR' EXIT

export DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
export SCRIPT_DIR="$DOTFILES_DIR"/script
export UTILS="$SCRIPT_DIR"/utils

# shellcheck source=utils
[ -f "$UTILS" ] && source "$UTILS"

# if this is a codespace instance, we need to clean some stuff up first
# because stow doesn't disown these well
if [ -z ${CODESPACE_NAME+x} ]; then
    rm -f ~/.zshrc
    rm -rf ~/.zsh
    rm -f ~/.gitconfig
    rm -f ~/.vimrc
    rm -f ~/.tmux.conf
fi

setup
