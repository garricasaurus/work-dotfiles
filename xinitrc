#!/bin/sh

# enable for NVIDIA modesetting
#xrandr --setprovideroutputsource modesetting NVIDIA-0

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

# set wallpaper
wallpaperdir=$HOME/dotfiles/wallpapers
wp_wide=$wallpaperdir/wallpaper_3840x1080.jpg
wp_normal=$wallpaperdir/wallpaper_1920x1080.jpg
current_profile=`autorandr --current`
case $current_profile in
	dual)
		exec feh --bg-fill "$wp_wide" --bg-fill "$wp_normal" &
		;;
	docked)
		exec feh --bg-fill "$wp_wide" &
		;;
	*)
		exec feh --bg-fill "$wp_normal" &
		;;
esac	

# status bar
exec /usr/local/bin/okki-status-dwm &

exec dwm
