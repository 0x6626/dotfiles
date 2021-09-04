#!/bin/bash
if [ "$CODESPACES" = true ]; then
	export DOTFILES_DIR="/workspaces/.codespaces/.persistedshare/dotfiles"
elif [ "$CI" = true]; then
	export DOTFILES_DIR="$GITHUB_WORKSPACE"
else
	export DOTFILES_DIR="$HOME/.dotfiles"
fi
export DOTFILES_LIB=$DOTFILES_DIR/script/utils/dotfiles.lib.sh
export TPM_DIR=$HOME/.tmux/plugins/tpm
export VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"
export FZF_DIR="$HOME/.fzf"
export PATH=$HOME/gopath/bin:/usr/local/bin:~/.local/bin:/usr/local:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export ZSH_ANTIGEN_DIR=~/.zsh/antigen
export ZSH_ALIASES=~/.zsh/aliases
export ZSH_FUNCTIONS=~/.zsh/functions
export ZSH_PYENV=~/.zsh/pyenv
export ANTIGEN_DEBUG_LOG=~/.antigen_debug
export TERM=xterm-256color
export ANSIBLE_NOCOWS=1
export TMUXP_CONFIGDIR=$HOME/.dotfiles/tmuxp:
