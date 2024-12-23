#!/usr/bin/bash
alias xenos="proot-distro login xenos"
alias update="apt update && apt upgrade -y"
alias desktop="termux-x11 :1 -xstartup \"dbus-launch --exit-with-session xfce4-session\""
