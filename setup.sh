#!/bin/bash
# this is used to setup codespace instances. much cloud. very ephemeral.
set -e
CALLED_DIR=$(pwd)
trap 'cd $CALLED_DIR' EXIT

export DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
export SCRIPTS_DIR="$DOTFILES_DIR"/script
export UTILS="$SCRIPTS_DIR"/utils

# shellcheck source=utils
[ -f "$UTILS" ] && source "$UTILS"

# if this is a codespace instance, we need to clean some stuff up first
# because stow doesn't disown these well
if [ -z ${CODESPACE_NAME+x} ]; then
    rm -f ~/.zshrc
    rm -f ~/.gitconfig
fi

setup
