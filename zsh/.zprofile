eval "$(ssh-agent -s)"

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export CARGOPATH="~/.cargo/bin"
export PATH="$GOBIN:$CARGOPATH:$PATH"
export TPM_DIR=$HOME/.tmux/plugins/tpm
export FZF_DIR="$HOME/.fzf"
export PATH=$HOME/gopath/bin:/usr/local/bin:$HOME/.local/bin:/usr/local:$PATH
export MANPATH="/usr/local/man:$MANPATH"
export LANG=en_US.UTF-8
export ANTIGEN_DEBUG_LOG=~/.antigen_debug
export TERM=xterm-256color
export EDITOR="code --wait"


if [[ "$(uname)" == 'Darwin' ]]; then
	export HOMEBREW=/usr/local/bin/brew
	eval "$($HOMEBREW shellenv)"
	export PATH="/usr/local/opt/node@16/bin:$PATH"
fi
