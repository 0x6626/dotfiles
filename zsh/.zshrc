source $HOME/.zsh/aliases
source $HOME/.zsh/functions
source $HOME/.zshrc.local
source $HOME/.antigen/antigen.zsh

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
if ! [[ -v VIMRUNTIME ]] && ! [[ "$TERM_PROGRAM" == "vscode" ]] && ! [[ -n "$TMUX" ]] && [[ "$(uname)" == 'Darwin' ]]; then # load if not in vim term
	antigen bundle marzocchi/zsh-notify
  zstyle ':notify:*' error-icon "https://media3.giphy.com/media/10ECejNtM1GyRy/200_s.gif"
  zstyle ':notify:*' error-title "wow such #fail"
  zstyle ':notify:*' success-icon "https://s-media-cache-ak0.pinimg.com/564x/b5/5a/18/b55a1805f5650495a74202279036ecd2.jpg"
  zstyle ':notify:*' success-title "very #success. wow"
fi
antigen theme romkatv/powerlevel10k
antigen apply

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
