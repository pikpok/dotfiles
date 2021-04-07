#
# ~/.bash_profile
#
# If running from tty1 start sway
if [ "$(tty)" = "/dev/tty1" ]; then
  export XDG_SESSION_TYPE=wayland
  mv sway.log sway.log.old
  exec sway > ~/sway.log 2>&1
fi

[[ -f ~/.bashrc ]] && . ~/.bashrc

