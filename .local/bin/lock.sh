#!/bin/bash

# Licensed under MIT License
# Copyright (c) 2020 Felix Stupp
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# Kills running swaylock to detect if swaylock was already running
# Locks screen with swaylock but only enables grace and or fade-in if appropriate
# Grace and fade-in is not considered appropriate if swaylock was already running (ignoring given arguments)

# Usage: Store script anywhere and use following commands
# ./lock.sh grace <grace-seconds> -> fade-in and grace enabled
# ./lock.sh fade -> fade-in enabled, grace disabled
# ./lock.sh -> grace and fade-in disabled

# Example usage at my system:
## swayidle:
## - fade-in and grace on timeout for good user experience
## - fade-in but no grace on manual lock (event triggered by lockd)
## - no fade-in and grace before sleep to prevent grace and fade-in to happen after resuming
# exec --no-startup-id swayidle \
#   idlehint 180 \
#   timeout 180 '~/.config/sway/lock.sh grace 30' \
#   lock '~/.config/sway/lock.sh fade' \
#   unlock 'killall -9 swaylock' \
#   before-sleep '~/.config/sway/lock.sh' \
#   -w
## lock key binding uses `loginctl lock-session $XDG_SESSION_ID`, but can be `./lock.sh` if you do not (want to) use logind (part of systemd)

FADE_IN_TIME=1
# Kill running lockscreen to refresh locking, if a lockscreen was running, disable grace to ensure security
fade_in_time=0
grace_timeout=0
if ! killall -q -9 swaylock; then
    if [[ "$1" == "grace" ]]; then
        fade_in_time="$FADE_IN_TIME"
        grace_timeout="${2:-0}"
    elif [[ "$1" == "fade" ]]; then
        fade_in_time="$FADE_IN_TIME"
    fi
fi

swaylock \
  --show-failed-attempts \
  --daemonize \
  --clock \
  --datestr "%A, %Y-%m-%d" \
  --timestr "%T" \
  --submit-on-touch \
  --grace "$grace_timeout" \
  --fade-in "$fade_in_time" \
  --screenshot \
  --effect-blur 10x10 \
  --indicator \
  --indicator-idle-visible \
  --scaling fill \
  --hide-keyboard-layout \
  --font "Hack" \
  --font-size 100 \
  --indicator-radius 300 \
  --indicator-thickness 0 \
  --disable-caps-lock-text \
  --ring-color 00000000 \
  --inside-color 00000000 \
  --inside-clear-color 00000000 \
  --inside-ver-color 00000000 \
  --inside-wrong-color 00000000 \
  --line-color 00000000 \
  --line-wrong-color 00000000 \
  --bs-hl-color 00000000 \
  --key-hl-color 00000000 \
  --text-color ffffff \
  --text-ver-color ffffff \
  --text-clear-color ffffff \
  --text-wrong-color ffffff \
  --ring-clear-color 00000000 \
  --ring-ver-color 00000000 \
  --ring-wrong-color 00000000 \
  -n \
  --

