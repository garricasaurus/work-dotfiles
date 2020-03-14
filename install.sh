#!/bin/sh

BASEDIR="`dirname \"$0\"`"              # relative
BASEDIR="`( cd \"$BASEDIR\" && pwd )`"  # absolutized and normalized
if [ -z "$BASEDIR" ] ; then
  exit 1  # fail
fi

SL=$HOME/sl

echo " => xinitrc"  
rm -f $HOME/.xinitrc
ln -sf $BASEDIR/xinitrc $HOME/.xinitrc

echo " => Xresources"
rm -f $HOME/.Xresources
ln -sf $BASEDIR/Xresources $HOME/.Xresources

echo " => helpers"
rm -rf $HOME/helpers
ln -sf $BASEDIR/helpers $HOME/helpers

mkdir -p $SL

echo " => dwm"
git clone https://git.suckless.org/dwm $SL/dwm
ln -sf $BASEDIR/dwm/config.h $SL/dwm/config.h

echo " => dmenu"
git clone https://git.suckless.org/dmenu $SL/dmenu
ln -sf $BASEDIR/dmenu/config.h $SL/dmenu/config.h

echo " => okki status"
git clone https://github.com/dargzero/okki-status $SL/okki-status

echo " => alacritty"
mkdir -p $HOME/.config
ln -sf $BASEDIR/alacritty $HOME/.config/alacritty

echo " => proceed with manual steps"
echo "  * set fish as default shell"
echo "  * install omf"
echo "  * patch and build sl apps"
