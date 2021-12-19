#!/bin/zsh

function open_repo_in_code() {
  IFS=$'\n' files=($(ghq list -p | fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && code "${files[@]}"
}

zle -N open_repo_in_code
bindkey "^g" open_repo_in_code
