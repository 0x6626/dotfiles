#!/bin/bash
# this is used to setup codespace instances. much cloud. very ephemeral.
set -e
CALLED_DIR=$(pwd)
trap 'cd $CALLED_DIR' EXIT

export DOTFILES_DIR="$HOME"/.dotfiles
export SCRIPTS_DIR="$DOTFILES_DIR"/script
export UTILS="$SCRIPTS_DIR"/utils

# shellcheck source=utils
[ -f "$UTILS" ] && source "$UTILS"

setup
