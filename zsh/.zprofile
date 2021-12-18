eval "$(ssh-agent -s)"

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export CARGOPATH="~/.cargo/bin"
export PATH="$GOBIN:$CARGOPATH:$PATH"
export DOTFILES_LIB=$DOTFILES_DIR/script/utils/dotfiles.lib.sh
export TPM_DIR=$HOME/.tmux/plugins/tpm
export VUNDLE_DIR="$HOME/.vim/bundle/Vundle.vim"
export FZF_DIR="$HOME/.fzf"
export PATH=$HOME/gopath/bin:/usr/local/bin:$HOME/.local/bin:/usr/local:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export ZSH_LOCAL=~/.zshrc.local
export ZSH_ANTIGEN_DIR=~/.antigen
export ZSH_ALIASES=~/.zsh/aliases
export ZSH_FUNCTIONS=~/.zsh/functions
export ZSH_PYENV=~/.zsh/pyenv
export ANTIGEN_DEBUG_LOG=~/.antigen_debug
export TERM=xterm-256color
export ANSIBLE_NOCOWS=1
export TMUXP_CONFIGDIR=$HOME/.dotfiles/tmuxp:
export EDITOR="code --wait"


if [[ "$(uname)" == 'Darwin' ]]; then
	export HOMEBREW=/usr/local/bin/brew
	eval "$($HOMEBREW shellenv)"
	export PATH="/usr/local/opt/node@16/bin:$PATH"
fi
