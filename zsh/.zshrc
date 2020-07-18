# load enviroment variables
for environment in ~/.zsh/*.env; do
	source $environment || printf "Failed to source '$environment'\n"
done

# load aliases
source $ZSH_ALIASES

# load functions
source $ZSH_FUNCTIONS

# load antigen
source $ZSH_ANTIGEN

# load pyenv stuffs
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# plugins
antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
# workaround for https://github.com/zsh-users/antigen/issues/675
THEME=denysdovhan/spaceship-prompt 
antigen list | grep $THEME; if [ $? -ne 0 ]; then antigen theme $THEME; fi
antigen apply

if [ -z "$SSH_CONNECTION" ]; then
  export EDITOR='code --wait'
else
  export EDITOR='vim'
fi
