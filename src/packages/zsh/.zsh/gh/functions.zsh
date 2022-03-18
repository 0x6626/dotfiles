#!/usr/bin/env zsh
# shellcheck source=../../../../lib/utils
source "$DOTFILES_DIR"/src/lib/utils

gh_set_token() {
  unset GITHUB_TOKEN
  if ! gh auth status &>/dev/null; then
    gh auth login -h github.com
  fi
  token="$(gh config get -h github.com oauth_token)"
  export GITHUB_TOKEN="$token"
}

