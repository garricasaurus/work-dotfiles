#!/bin/sh

xrandr --auto

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps
if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start programs
if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# fix for JetBrains reparenting issue
export _JAVA_AWT_WM_NONREPARENTING=1 
export AWT_TOOLKIT=MToolkit

# set wallpaper
resolution=`xrandr | grep '*' | grep -Po '([0-9]+x[0-9]+)'`
wallpaperdir=$HOME/dotfiles/wallpapers
wallpaper=wallpaper_$resolution.jpg
if [ ! -f "$wallpaperdir/$wallpaper" ]; then
	wallpaper="$wallpaperdir/wallpaper_1920x1080.jpg"
fi
exec feh --bg-fill "$wallpaperdir/$wallpaper" &

# status bar
exec /usr/local/bin/okki-status &

exec dwm
