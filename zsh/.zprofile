eval "$(ssh-agent -s)"

export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$PATH"
export LANGUAGE=(unset)
export LC_ALL=(unset)
export LANG="en_US.UTF-8"

export CARGOPATH="~/.cargo/bin"
export PATH="$CARGOPATH:$PATH"

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
	eval "$(/opt/homebrew/bin/brew shellenv)"
	export LDFLAGS="-L/usr/local/opt/luajit-openresty/lib"
	export CPPFLAGS="-I/usr/local/opt/luajit-openresty/include"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
