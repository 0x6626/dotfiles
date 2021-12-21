
source $HOME/.zshrc.local
source $HOME/.zsh/aliases
source $HOME/.zsh/functions
source $HOME/.zsh/functions.zsh
source $HOME/.antigen/antigen.zsh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# vim mode
bindkey -v

antigen use oh-my-zsh
antigen bundle git
antigen bundle vi-mode
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen theme romkatv/powerlevel10k
antigen apply

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
