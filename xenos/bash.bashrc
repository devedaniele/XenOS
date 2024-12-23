#!/bin/bash
clear

case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

VIRTUAL_ENV_DISABLE_PROMPT=1

prompt_color='\[\033[;32m\]'
info_color='\[\033[1;34m\]'
symbol_color='\[\033[1;25m\]'
prompt_symbol=㉿
if [ "$EUID" -eq 0 ]; then
    prompt_color='\[\e[32;1m\]'
    info_color='\[\e[30;1m\]'
    symbol_color='\[\e[34;1m\]'
    prompt_symbol=@
fi

PS1='┌─('$prompt_color'\u'$prompt_symbol'\h\[\e[0m\])-['$info_color'\w\[\e[0m\]]\n└─'$symbol_color'$\[\e[0m\] '

PROMPT_COMMAND="PROMPT_COMMAND=echo"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    export LS_COLORS="$LS_COLORS:ow=30;44:"

    export LESS_TERMCAP_mb=$'\E[1;31m'
    export LESS_TERMCAP_md=$'\E[1;36m'
    export LESS_TERMCAP_me=$'\E[0m'
    export LESS_TERMCAP_so=$'\E[01;33m'
    export LESS_TERMCAP_se=$'\E[0m'
    export LESS_TERMCAP_us=$'\E[1;32m'
    export LESS_TERMCAP_ue=$'\E[0m'
fi

#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'