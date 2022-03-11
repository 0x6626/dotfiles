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

antigen use oh-my-zsh >/dev/null
antigen bundle git >/dev/null
antigen bundle vi-mode >/dev/null
antigen bundle command-not-found >/dev/null
antigen bundle atusy/gh-fzf >/dev/null
antigen apply

if [[ -d /usr/local/share/zsh-syntax-highlighting/highlighters ]]; then
  export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

eval "$(starship init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
eval $(thefuck --alias)
eval "$(leader init)"