source $HOME/.zshrc.local
source $HOME/.zsh/aliases
source $HOME/.antigen/antigen.zsh

bindkey -v

antigen use oh-my-zsh >/dev/null
antigen bundle git >/dev/null
antigen bundle vi-mode >/dev/null
antigen bundle command-not-found >/dev/null
antigen bundle atusy/gh-fzf >/dev/null
antigen apply

eval "$(starship init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh && for f in ~/.zsh/**/*functions.zsh; do . $f; done
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true