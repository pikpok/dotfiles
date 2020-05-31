#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /etc/profile

alias ls='ls --color=auto'
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# save all history
export PROMPT_COMMAND='history -a'
export HISTSIZE=-1
export HISTFILESIZE=-1

# history search with arrows
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# better autocomplete
bind 'set show-all-if-ambiguous on'
bind 'TAB:menu-complete'

# dotfiles management
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'

# agnoster theme
export THEME=$HOME/.bash/themes/agnoster-bash/agnoster.bash
if [[ -f $THEME ]]; then
    export DEFAULT_USER=`whoami`
    source $THEME
fi

export PATH=$HOME/.local/bin:$PATH:$HOME/.gem/ruby/2.6.0/bin:$HOME/go/bin:$HOME/.config/yarn/global/node_modules/.bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

alias cat='bat --style snip'

