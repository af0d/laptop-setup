# Set up the prompt

#autoload -Uz promptinit
#promptinit
#prompt adam2

setopt histignorealldups inc_append_history inc_append_history_time
unsetopt sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

autoload -U select-word-style
select-word-style bash

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

settitle() { printf "\e]0;$@\a" }
dir_in_title() { settitle $PWD }
chpwd_functions=(dir_in_title)

alias l='/bin/ls -CF --color=auto'
alias ll='/bin/ls -lF --color=auto'
alias dn='pushd'
alias up='popd'
alias em='emacs -nw'

alias sup='ps -u ${LOGNAME} -o user,pid,ppid,args'
alias sup2='ps -u ${LOGNAME} -o user,pid,ppid,rss,vsz,args'

export EDITOR="/usr/bin/vim"

bindkey -e
autoload -U colors && colors

export PROMPT="%{$fg[white]%}%{$bg[red]%}%n@%m-%{$reset_color%} "
export RPROMPT="%~"
