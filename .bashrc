#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion

# history search with arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# better autocomplete
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# agnoster theme
export THEME=$HOME/.bash/themes/agnoster-bash/agnoster.bash
if [[ -f $THEME ]]; then
    export DEFAULT_USER=`whoami`
    source $THEME
fi

