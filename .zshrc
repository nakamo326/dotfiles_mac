### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit snippet OMZ::lib/git.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh

## history option ##
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000
setopt share_history
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

# Use emacs keybindings
bindkey -e

# add brew completion
fpath=(/opt/homebrew/share/zsh/site-functions $fpath)

# Use modern completion system
autoload -Uz compinit
compinit

#enable bash completion
autoload -Uz +X bashcompinit && bashcompinit
source /opt/homebrew/etc/bash_completion.d/az


# add kubecl completion
source <(kubectl completion zsh)

# terraform completion
complete -o nospace -C /opt/homebrew/bin/terraform terraform

setopt auto_list
setopt auto_menu
setopt auto_cd
setopt nonomatch

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

export MAKEFLAGS=-j4
alias mkr="make fclean && make"
alias make="make "
alias re="fclean && make"
alias stmux='tmux source-file ~/.tmux.conf'
alias venv='source ~/venv/.venv/bin/activate'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias wo='cd ~/workspace'
alias 42='cd ~/workspace/42cursus/'
alias ls='eza --icons --git --time-style relative'
alias la='eza --icons --git --time-style relative -a'
alias lla='eza --icons --git --time-style relative -al'
alias dc='docker-compose'
alias cat='bat'
alias cpp='clang++'
alias tf='terraform'
# alias vim='nvim'

# add brew path
eval "$(/opt/homebrew/bin/brew shellenv)"

source "$HOME/.cargo/env"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
	PATH="$HOME/.local/bin:$PATH"
fi

export PATH=$PATH:/usr/local/go/bin

# add python path
export PATH=$PATH:$HOME/Library/Python/3.11/bin

# volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

# pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

# zoxide
eval "$(zoxide init zsh)"

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pyenv (mac)
eval "$(pyenv init --path)"

# starship
eval "$(starship init zsh)"
