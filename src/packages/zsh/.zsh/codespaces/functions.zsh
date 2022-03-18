#!/usr/bin/env bash
# shellcheck source=../../../lib/utils
source "$DOTFILES_DIR"/src/lib/utils

cs_actions_dev() {
  name=$(gh cs create -r github/github -b master)
  gh cs ssh -c "$name" -- "cd /workspaces/github && script/setup-codespaces-actions"
  gh cs code -c "$name"
}

cs_ghm_list() {
  gh cs list --json repository,name | jq '.[] | select(.repository | contains("github/github")) | .name' | fzf | cut -f1 | xargs gh cs code --codespace "$@"
}

cs_create_and_open() {
  local nwo=$1
  local ref=$2
  if help_arg "$1"; then
    echo "Usage: cs_create_and_open <nwo> <ref>"
    echo "create a codespace for the given ref and nwo, then open it in vscode"
    return
  fi
  codespace="$(gh cs create -r "$nwo" -b "$ref")"
  gh cs code -c "$codespace"
}