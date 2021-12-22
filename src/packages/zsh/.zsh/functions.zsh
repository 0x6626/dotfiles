#!/bin/zsh
source $HOME/.zsh/functions

function open_repo_in_code() {
  IFS=$'\n' files=($(ghq list -p | fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && code "${files[@]}"
}

zle -N open_repo_in_code
bindkey "^g^o" open_repo_in_code

# fshow - git commit browser
function fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr by %C(yellow)%ae" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

zle -N fshow
bindkey "^g^b" fshow

zle -N dot_reload
bindkey "^r^r" dot_reload

function ghf_repo() {
  ghf repo
}

zle -N ghf_repo
bindkey "^g^r" ghf_repo

function ghf_issue() {
  ghf issue
}

zle -N ghf_issue
bindkey "^g^i" ghf_issue

function ghf_codespace() {
  ghf codespace
}

zle -N ghf_codespace
bindkey "^g^s" ghf_codespace

function ghf_gist() {
  ghf gist
}

zle -N ghf_gist
bindkey "^g^g" ghf_gist

function ghf_pr() {
  ghf pr
}

zle -N ghf_pr
bindkey "^g^p" ghf_pr

function ghf_workflow() {
  ghf workflow
}

zle -N ghf_workflow
bindkey "^g^w" ghf_workflow

function ghf_run() {
  ghf run
}

zle -N ghf_run
bindkey "^g^a" ghf_run