#!/bin/bash

# For this file to work, make sure it is linked as .xinitrc, .xsession
$ and .xessionrc

if [ -f ~/.nix-profile/etc/profile.d/nix.sh ]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi

PATH=$PATH:~/.xmonad/bin

xrdb -merge ~/.Xresources
xsetroot -cursor_name left_ptr &
xmodmap ~/.xmodmap

urxvd -q -f -o &
compton -b --config ~/.config/compton.conf &

killall gnome-screensaver &
xscreensaver -no-splash &

(sleep 2 && nm-applet) &
(sleep 3 && parcellite) &

exec xmonad

# exec ck-launch-session dbus-launch --sh-syntax --exit-with-session xmonad
