#!/bin/bash
source "$DOTFILES_DIR/zsh/.zsh/core.env"

quiet_git() {
    stdout=$(mktemp)
    stderr=$(mktemp)

    if ! git "$@" </dev/null >"$stdout" 2>"$stderr"; then
        cat "$stderr" >&2
        rm -f "$stdout" "$stderr"
        exit 1
    fi

    rm -f "$stdout" "$stderr"
}

reset() {
    stow --delete --dir="$DOTFILES_DIR" --target="$HOME" zsh
    stow --delete --dir="$DOTFILES_DIR" --target="$HOME" tmux
    stow --delete --dir="$DOTFILES_DIR" --target="$HOME" git
    stow --delete --dir="$DOTFILES_DIR" --target="$HOME" hammerspoon
    stow --delete --dir="$DOTFILES_DIR" --target="$HOME" vim
    stow --delete --dir="$DOTFILES_DIR" --target="$HOME" nvim
}

reload() {
    stow --restow --dir="$DOTFILES_DIR" --target="$HOME" zsh
    stow --restow --dir="$DOTFILES_DIR" --target="$HOME" tmux
    stow --restow --dir="$DOTFILES_DIR" --target="$HOME" git
    stow --restow --dir="$DOTFILES_DIR" --target="$HOME" hammerspoon
    stow --restow --dir="$DOTFILES_DIR" --target="$HOME" vim
    stow --restow --dir="$DOTFILES_DIR" --target="$HOME" nvim
}

bootstrap() {
    # shellcheck source=../bootstrap
    source "$DOTFILES_DIR/script/bootstrap"
}

init_stow() {
    touch ~/.zshrc.local
    stow --dir="$DOTFILES_DIR" --target="$HOME" zsh
    stow --dir="$DOTFILES_DIR" --target="$HOME" tmux
    bash -c 'tmux start-server && tmux source ~/.tmux.conf' || true

    stow --dir="$DOTFILES_DIR" --target="$HOME" git
    stow --dir="$DOTFILES_DIR" --target="$HOME" vim
    stow --dir="$DOTFILES_DIR" --target="$HOME" nvim
}

setup() {
    bootstrap
    reset
    init_stow
    ~/.fzf/install --all
    if ! [ "$SHELL" == "/bin/zsh" ]; then
        if [ -n "$CODESPACE_NAME" ]; then
            sudo chsh -s /bin/zsh "codespace"
        elif [ -n "$USER" ]; then
            sudo chsh -s /bin/zsh "$USER"
        fi
    fi

    if [[ "$UNAME" == 'Darwin' ]]; then
        ## Hammerspoon
        rm -rf ~/.hammerspoon/Spoons/*
        mkdir -p ~/.hammerspoon/Spoons
        quiet_git clone https://github.com/jasonrudolph/ControlEscape.spoon.git ~/.hammerspoon/Spoons/ControlEscape.spoon
    fi
    DOTFILE_ALIAS="alias dotfiles=${DOTFILES_DIR}/script/dotfiles"
    grep -qF "${DOTFILE_ALIAS}" ~/.zshrc.local || echo "$DOTFILE_ALIAS" >>~/.zshrc.local
}
