eval "$(ssh-agent -s)"

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"

export CARGOPATH="~/.cargo/bin"
export PATH="$GOBIN:$CARGOPATH:$PATH"

if [[ $(sw_vers -productVersion | cut -d "." -f -1) -lt 11 ]]; then
	export HOMEBREW_BASE_PATH="/usr/local"
else
	export HOMEBREW_BASE_PATH="/opt/homebrew/"
fi


if [[ "$(uname)" == 'Linux' ]]; then

	rm ~/.Xmodmap
	tee ~/.Xmodmap <<EOF
remove Lock = Caps_Lock
remove Control = Control_L
keysym Caps_Lock = Control_L
add Lock = Caps_Lock
add Control = Control_L
EOF
	xmodmap ~/.Xmodmap
elif [[ "$(uname)" == 'Darwin' ]]; then
	eval "$($HOMEBREW_BASE_PATH/bin/brew shellenv)"
	export LDFLAGS="-L/usr/local/opt/luajit-openresty/lib"
	export CPPFLAGS="-I/usr/local/opt/luajit-openresty/include"
fi
eval "$($HOMEBREW_BASE_PATH/bin/brew shellenv)"
