#!/bin/sh

WP_DIR="$HOME/dotfiles/wallpapers"
WIDTH=`swaymsg -t get_outputs | jq '.[] | select(.focused) | .current_mode_width'`

case $WIDTH in
    "3840")
        echo "$WP_DIR/wallpaper_3840x1080.jpg"
        ;;
    *)
        echo "$WP_DIR/wallpaper_1920x1080.jpg"
        ;;
esac
