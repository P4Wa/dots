#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

. ~/.local/share/nerdps1

bind "TAB: menu-complete"

bind "set show-all-if-ambiguous on"
bind "set menu-complete-display-prefix on"
bind "set colored-completion-prefix on"
bind "set colored-stats on"

bind '"\C-i": menu-complete'

#bind '"\e[C": menu-select-forward'
#bind '"\e[D": menu-select-backward'

export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.local/bin/bar:$PATH"
