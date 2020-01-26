#!/bin/sh

xrandr --setprovideroutputsource modesetting NVIDIA-0
autorandr --change

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
resolution=`xrandr | grep '*' | grep -Po '([0-9]+x[0-9]+)' | head -1`
wallpaperdir=$HOME/dotfiles/wallpapers
wallpaper="$wallpaperdir/wallpaper_$resolution.jpg"
echo resolution=$resolution > ~/xinit.log
echo wallaper=$wallpaper >> ~/xinit.log
exec feh --bg-fill "$wallpaper" &

# status bar
exec /usr/local/bin/okki-status &

exec dwm
