#!/bin/sh

xrdb ~/.Xresources


if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#if [[ -z `xrandr | grep " connected" | grep 'HDMI2'` ]]; then
#	echo "No monitor found" &
#else
#	xrandr --output eDP1 --mode 1920x1080 --pos 0x1240 --rotate normal --output DP1 --primary --mode 1920x1200 --pos 1920x0 --rotate left --output HDMI2 --mode 1920x1200 --pos 3120x350 --rotate normal &
#fi

devmon --no-gui &

setxkbmap -layout "us,ru" -option "grp:caps_toggle,grp_led:scroll" &
xsetroot -solid "#002b36"
xautolock -time 10 -locker 'i3lock -u -e -c 000000' &

exec i3
