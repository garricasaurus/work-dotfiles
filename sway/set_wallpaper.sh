#!/bin/sh
set HRES=`swaymsg -t get_outputs | jq '.[0].current_mode.width'`
case $HRES in
"3840")
swaybg -i "$HOME/dotfiles/wallpapers/wallpaper_3840x1080.jpg"
;;
*)
swaybg -i "$HOME/dotfiles/wallpapers/wallpaper_1920x1080.jpg"
;;
esac
