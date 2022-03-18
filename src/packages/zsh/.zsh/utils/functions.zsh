#!/usr/bin/env bash
# shellcheck source=../../../lib/utils
source "$DOTFILES_DIR"/src/lib/utils

error() {
    echo -e "${n}${RED}[ERROR]\t${NC}$1"
}

fatal() {
    echo -e "${n}${CYAN}[FATAL]\t${NC}$1"
    exit 1
}

util_terminal_colors() {
    for i in {0..255}; do
        printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
        if ((i == 15)) || ((i > 15)) && (((i - 15) % 6 == 0)); then
            printf "\n"
        fi
    done
}

util_untar() {
  tar -xvf "$1"
}

util_tar() {
  tar -cvzf "$1".tar.gz "$1"
}

install() {
  if target_is_macos; then
    cd "$DOTFILES_DIR" || fatal "couldn't cd to dotfiles dir, exiting"
    git stash -u
    brew install "$@"
    rm -f Brewfile Brewfile.lock.json
    brew bundle dump "$DOTFILES_DIR"/Brewfile
    brew update
    git add -A
    git commit -F- <<EOF
dotbot: brew sync on $(fatal_portable_hostname)
EOF
  else
    error "no install utility for this system"
  fi
}

fatal_portable_hostname() {
  if target_is_macos; then
    scutil --get LocalHostName
  else
    fatal "no portal hostname for this system, bailing"
  fi
}

function bw_set_session() {
  BW_SESSION=$(bw unlock --raw "$1")
  export BW_SESSION
  echo "BW_SESSION=$BW_SESSION" >>~/.zshrc.local
}

function nas_enter() {
  sshpass -p "$(bw get password nas.dundercloud.io)" ssh nas
}

function scratch_repo() {
  help="Usage: scratch_repo <repo_name>
creates a local and remote repository"
  if help_arg "$1" || [[ "$#" != 1 ]]; then
    echo "$help"
    return
  fi
  export name="$1-$(date '+%m-%d-%Y-%H-%M-%S')"
  (
    ghq create nodeselector/"$name"
    repo="$(ghq list --full-path nodeselector/"$name")"
    gh repo create --private --source "$repo" "$name"
  )
}