eval "$(ssh-agent -s)"
eval "$(/opt/homebrew/bin/brew shellenv)"


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
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
