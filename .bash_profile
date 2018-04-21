#
# ~/.bash_profile
#

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  export _JAVA_AWT_WM_NONREPARENTING=1
  ~/.local/bin/startsway
  exit 0
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc
