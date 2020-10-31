#  ╺━┓┏━┓╻ ╻┏━┓┏━╸
#  ┏━┛┗━┓┣━┫┣┳┛┃  
# ╹┗━╸┗━┛╹ ╹╹┗╸┗━╸

# 🌐 load envs
for environment in ~/.zsh/*.env; do
	source $environment || printf "Failed to source '$environment'\n"
done
source $ZSH_ALIASES

# 💻 start a tmux session for every vim instance
if [[ -v VIMRUNTIME ]] && ! [[ -v TMUX ]]; then
	tmux new
fi

# 💻 statusbar
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# 🔌 plugins
source $ZSH_ANTIGEN
antigen use oh-my-zsh
antigen bundle git
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
if ! [[ -v VIMRUNTIME ]]; then # load if not in vim term
	antigen bundle marzocchi/zsh-notify
fi
antigen theme romkatv/powerlevel10k
antigen apply

# 🐶 notify configuration
zstyle ':notify:*' error-icon "https://media3.giphy.com/media/10ECejNtM1GyRy/200_s.gif"
zstyle ':notify:*' error-title "wow such #fail"
zstyle ':notify:*' success-icon "https://s-media-cache-ak0.pinimg.com/564x/b5/5a/18/b55a1805f5650495a74202279036ecd2.jpg"
zstyle ':notify:*' success-title "very #success. wow"

# 🔍 fzf search
if type rg &> /dev/null; then
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m --height 50% --border'
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# 💻 statusbar
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# 🐻 bear cli
BEAR_AC_ZSH_SETUP_PATH=/Users/jeffmartin/Library/Caches/@sloansparger/bear/autocomplete/zsh_setup && test -f $BEAR_AC_ZSH_SETUP_PATH && source $BEAR_AC_ZSH_SETUP_PATH;
