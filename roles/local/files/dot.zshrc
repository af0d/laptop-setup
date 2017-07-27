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

#. ${HOME}/.shenv
. ${HOME}/.profile.jdk8
. ${HOME}/.p4config

export P4CLIENT
export P4DIFF
export P4EDITOR
export P4MERGE
export P4PORT
export P4IGNORE
export P4USER

settitle() { printf "\e]0;$@\a" }
dir_in_title() { settitle $PWD }
chpwd_functions=(dir_in_title)
. ${HOME}/.shenv

alias l='/bin/ls -CF --color=auto'
alias ll='/bin/ls -lF --color=auto'
alias dn='pushd'
alias up='popd'
alias em='emacs -nw'

alias sup='ps -u ${LOGNAME} -o user,pid,ppid,args'
alias sup2='ps -u ${LOGNAME} -o user,pid,ppid,rss,vsz,args'

alias jdk6=". ${HOME}/.profile.jdk6"
alias jdk7=". ${HOME}/.profile.jdk7"
alias jdk8=". ${HOME}/.profile.jdk8"

alias perforce="pushd ${HOME}/Perforce/${P4CLIENT}"
alias bms="pushd ${HOME}/Perforce/${P4CLIENT}/BMS/dev/bms-MAIN"
alias ecp="pushd ${HOME}/Perforce/${P4CLIENT}/ECP/dev/ecp-MAIN"
alias exe="pushd ${HOME}/Perforce/${P4CLIENT}/Executive/dev/executive-MAIN"
alias mas="pushd ${HOME}/Perforce/${P4CLIENT}/MAS/dev/mas-MAIN"
alias madm="pushd ${HOME}/Perforce/${P4CLIENT}/server/releases/advertising/devTest"
alias ncs="pushd ${HOME}/Perforce/${P4CLIENT}/NCS/dev/ncs-MAIN"
alias mocks="pushd ${HOME}/Perforce/${P4CLIENT}/MBOMOCK/dev/mbomock-MAIN"
alias rta="pushd ${HOME}/Perforce/${P4CLIENT}/RTA/dev/rta-MAIN"
alias sia="pushd ${HOME}/Perforce/${P4CLIENT}/SIA/dev/sia-MAIN"
alias siam="pushd ${HOME}/Perforce/${P4CLIENT}/SIA/dev/siam-MAIN"
alias nam="pushd ${HOME}/Perforce/${P4CLIENT}/NAM/dev/nam-MAIN"
alias commons="pushd ${HOME}/Perforce/${P4CLIENT}/ServerCommon"

export PATH="${HOME}/bin:${JAVA_HOME}/bin:${PATH}"

export EDITOR="/usr/bin/vim"


bindkey -e
autoload -U colors && colors

export PROMPT="%{$fg[white]%}%{$bg[blue]%}%n@%m-%{$reset_color%} "
export RPROMPT="%~"
