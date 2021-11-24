#!/bin/sh

WIDTH=`swaymsg -t get_outputs | jq '.[] | select(.focused) | .current_mode.width'`

case $WIDTH in
"3840")
swaybg -i "$HOME/dotfiles/wallpapers/wallpaper_3840x1080.jpg"
;;
*)
swaybg -i "$HOME/dotfiles/wallpapers/wallpaper_1920x1080.jpg"
;;
esac
