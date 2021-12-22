
source $HOME/.zshrc.local
source $HOME/.zsh/aliases
source $HOME/.zsh/functions
source $HOME/.zsh/fzf
source $HOME/.zsh/functions.zsh
source $HOME/.antigen/antigen.zsh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

bindkey -v

antigen use oh-my-zsh
antigen bundle git
antigen bundle vi-mode
antigen bundle command-not-found
antigen bundle atusy/gh-fzf
antigen theme romkatv/powerlevel10k
antigen apply

if [[ -d /usr/local/share/zsh-syntax-highlighting/highlighters ]]; then
  export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

[ -f ~/.p10k.zsh ] && source ~/.p10k.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval $(thefuck --alias)