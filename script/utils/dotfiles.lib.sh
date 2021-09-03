#!/bin/bash

debug() {
	RED='\033[0;31m'
	NC='\033[0m'

	failure() {
		local lineno=$1
		local msg=$2
		echo -e "${RED}ERROR:${NC} $lineno: $msg"
	}
	trap 'failure ${LINENO} "$BASH_COMMAND"' ERR
}

debug


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

setup() {
    clean
    touch ~/.zshrc.local

    stow --dir="$DOTFILES_DIR" --target="$HOME" zsh
		init_antigen
		init_fzf

    stow --dir="$DOTFILES_DIR" --target="$HOME" tmux
		init_tpm

    stow --dir="$DOTFILES_DIR" --target="$HOME" git

    stow --dir="$DOTFILES_DIR" --target="$HOME" vim
    stow --dir="$DOTFILES_DIR" --target="$HOME" nvim
		init_vundle
}

clean() {
		rm -f "$HOME/.zshrc"
		rm -f "$HOME/.zshenv"
		rm -rf "$HOME/.zsh"
		rm -f "$HOME/.tmux.conf"
		rm -rf "$HOME/.tmux"
		rm -f "$HOME/.gitconfig"
		rm -rf "$HOME/.config/nvim"
		rm -rf "$HOME/.config/gh"
}

init_tpm() {
	sudo rm -rf "$TPM_DIR"
	quiet_git clone --depth 1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}

init_vundle() {
	sudo rm -rf "$VUNDLE_DIR"
	quiet_git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git "$VUNDLE_DIR"
	nvim +PluginInstall +qall
	cd $HOME/.vim/bundle/coc.nvim && yarn install
}

init_fzf() {
	sudo rm -rf "$FZF_DIR"
	quiet_git clone --depth 1 https://github.com/junegunn/fzf.git "$FZF_DIR"
	~/.fzf/install --all
}

init_antigen() {
	sudo rm -rf "$ZSH_ANTIGEN_DIR"
	quiet_git clone https://github.com/zsh-users/antigen.git "$ZSH_ANTIGEN_DIR"
}
