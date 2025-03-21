# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export GOPATH="$HOME/go"
export PYTHONPATH='/Users/mmocek/Library/Python/3.9/bin'
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$PYTHONPATH"

export TTA_GUI="TFDGUI/xoh7Eih7fuchai9w@oda01tt.cloud.mgr-is.de:1521/az4.cloud.mgr-is.de"
export TTD_GUI="TFDGUI/xoh7Eih7fuchai9w@oda01tt.cloud.mgr-is.de:1521/dz4.cloud.mgr-is.de"
export TTT_GUI="TFDGUI/xoh7Eih7fuchai9w@oda01ose01.cloud.mgr-is.de:1521/tz4.cloud.mgr-is.de"
ZSH_THEME="powerlevel10k/powerlevel10k"

HYPHEN_INSENSITIVE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git copypath zsh-interactive-cd iterm2 kubectl z fzf zsh-autosuggestions zsh-syntax-highlighting)
zstyle ':completion:*' menu no

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias sed='gsed'
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
compdef _git config
alias :q='exit'
export LANG="en_US.UTF-8"

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


