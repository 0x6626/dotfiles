#!/usr/bin/env bash
# shellcheck source=../../../lib/utils
source "$DOTFILES_DIR"/src/lib/utils

dot_reload() {
  # shellcheck disable=SC1090
  source ~/.zshrc
  # shellcheck source=../../../lib/utils
  source "$DOTFILES_DIR"/src/lib/utils
  tmux source-file ~/.tmux.conf
  if target_is_macos; then
    hs -c "hs.reload()"
  fi
}
