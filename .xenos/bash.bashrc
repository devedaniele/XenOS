#!/data/data/com.termux/files/usr/bin/bash

shopt -s histappend
shopt -s histverify

export HISTCONTROL=ignoreboth

# termux-x11 :1 -xstartup "dbus-launch --exit-with-session xfce4-session" > /dev/null 2>&1 &

PROMPT_DIRTRIM=2
PS1='┌─(\[\e[32;1m\]Xen\[\e[0m\])-[\[\e[30;1m\]\w\[\e[0m\]]\n└─\[\e[34;1m\]\$\[\e[0m\] '

if [ -x /data/data/com.termux/files/usr/libexec/termux/command-not-found ]; then
	command_not_found_handle() {
		/data/data/com.termux/files/usr/libexec/termux/command-not-found "$1"
	}
fi

clear
