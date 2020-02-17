#!/bin/sh

BASEDIR="`dirname \"$0\"`"              # relative
BASEDIR="`( cd \"$BASEDIR\" && pwd )`"  # absolutized and normalized
if [ -z "$BASEDIR" ] ; then
  exit 1  # fail
fi

SL=$HOME/sl

echo performing cleanup...
rm -rf $HOME/.xinitrc
rm -rf $HOME/.Xresources
rm -rf $HOME/.config/fish
rm -rf $HOME/helpers
rm -rf $SL

echo creating directories...
mkdir -p $HOME/.config

echo creating configs...
ln -sf $BASEDIR/xinitrc $HOME/.xinitrc
ln -sf $BASEDIR/Xresources $HOME/.Xresources
ln -sf $BASEDIR/helpers $HOME/helpers
ln -sf $BASEDIR/fish $HOME/.config/fish

echo creating sl apps...
mkdir -p $SL
git clone https://git.suckless.org/dwm $SL/dwm
git clone https://git.suckless.org/dmenu $SL/dmenu
git clone https://git.suckless.org/st $SL/st
git clone https://github.com/dargzero/okki-status $SL/okki-status

echo linking sl configs...
ln -sf $BASEDIR/dwm/config.h $SL/dwm/config.h
ln -sf $BASEDIR/dmenu/config.h $SL/dmenu/config.h
ln -sf $BASEDIR/st/config.h $SL/st/config.h

echo "please proceed with manual steps:"
echo "  - set fish as default shell"
echo "  - patch and build sl apps"
