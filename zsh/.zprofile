eval "$(ssh-agent -s)"

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
	export LDFLAGS="-L/opt/homebrew/opt/luajit-openresty/lib"
	export CPPFLAGS="-I/opt/homebrew/opt/luajit-openresty/include"
fi
