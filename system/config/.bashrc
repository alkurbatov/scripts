# This file is a part of Scripts project
#
# Copyright (C) 2015, Alexander Kurbatov <sir.alkurbatov@yandex.ru>
#
# Scripts is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Scripts is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program. If not, see <http://www.gnu.org/licenses/>.

# Purprose:
# bash configuration.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases for work.
alias ls='ls --color=auto'
alias grep="grep --color=always"
alias netcfg='sudo /usr/bin/netcfg'
alias shutdown='sudo /sbin/shutdown'
alias mc='. /usr/lib/mc/mc-wrapper.sh'
alias update-grub='grub2-mkconfig -o /boot/grub2/grub.cfg'

# Do win-like behaviour.
alias cls='clear'
alias ipconfig='ifconfig'

# Aliases for work.
alias svn-log="svn log | more"

# Check active ssh session
if [ -n "$SSH_CLIENT" ]; then text="ssh-session"
fi

# Invitation
if [ $(id -u) -eq 0 ];
then
    # root
    PS1='[\[\e[0;31m\]\u\[\e[m\]@\[\e[1;34m\]\h\[\e[m\] \[\e[1;36m\]\W\[\e[m\]] ${text}\[\e[0;31m\]\$\[\e[m\] '
else
    # basic user
    PS1='[\[\e[0;32m\]\u\[\e[m\]@\[\e[1;34m\]\h\[\e[m\] \[\e[1;36m\]\W\[\e[m\]] ${text}\[\e[0;32m\]\$\[\e[m\] '
fi

# Set up environment.
export EDITOR=vim
export SVN_EDITOR=vim

# Expand PATH.
PATH+=~/bin

# Colors for man pages.
man() {
 env \
  LESS_TERMCAP_mb=$(printf "\e[1;36m") \
  LESS_TERMCAP_md=$(printf "\e[1;36m") \
  LESS_TERMCAP_me=$(printf "\e[0m") \
  LESS_TERMCAP_se=$(printf "\e[0m") \
  LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
  LESS_TERMCAP_ue=$(printf "\e[0m") \
  LESS_TERMCAP_us=$(printf "\e[1;32m") \
  man "$@"
}

# Have fun :)
fortune

