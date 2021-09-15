eval "$(ssh-agent -s)"

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

export CARGOPATH="~/.cargo/bin"
export PATH="$GOBIN:$CARGOPATH:$PATH"

if [[ "$(uname)" == 'Linux' ]]; then

elif [[ "$(uname)" == 'Darwin' ]]; then
	if [[ $(sw_vers -productVersion | cut -d "." -f -1) -lt 11 ]]; then
		export HOMEBREW_BASE_PATH="/usr/local"
	else
		export HOMEBREW_BASE_PATH="/opt/homebrew/"
	fi
	eval "$($HOMEBREW_BASE_PATH/bin/brew shellenv)"
	export LDFLAGS="-L/usr/local/opt/luajit-openresty/lib"
	export CPPFLAGS="-I/usr/local/opt/luajit-openresty/include"
	eval "$($HOMEBREW_BASE_PATH/bin/brew shellenv)"
fi
