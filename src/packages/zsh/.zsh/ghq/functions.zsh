#!/bin/zsh

# source: https://gist.github.com/tsub/4448666a276b088bce3f19005f512c15
function ghq_cd() {
  local selected_dir=$(ghq list | fzf --query="$LBUFFER")

  if [ -n "$selected_dir" ]; then
    BUFFER="cd $(ghq root)/${selected_dir}"
    zle accept-line
  fi

  zle reset-prompt
}

function ghq_code() {
  local selected_dir=$(ghq list | fzf --query="$LBUFFER")

  if [ -n "$selected_dir" ]; then
    BUFFER="code $(ghq root)/${selected_dir}"
    zle accept-line
  fi

  zle reset-prompt
}