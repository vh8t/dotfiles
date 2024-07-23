ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

autoload -U compinit && compinit

eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/conf.toml)"

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^ ' autosuggest-accept

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#8a8c84"
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

alias cl=clear
alias off='shutdown now'

alias cd=z
alias top=btop
alias cat='bat --paging=never --theme gruvbox-dark'
alias ls='g --time --time-style=locale --icons --size --perm --table --table-style=unicode'

alias htop=btop
alias vi=nvim
alias nf=neofetch
alias src='source ~/.zshrc'

eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

export PATH="$HOME/exec:$PATH"
export PATH="$HOME/.nimble/bin:$PATH"
export PATH="$HOME/.ghcup/bin:$PATH"
export TERM=xterm-256color

[ -f "$HOME/.ghcup/env" ] && . "$HOME/.ghcup/env" # ghcup-env

clear && nerdfetch_arch && echo
