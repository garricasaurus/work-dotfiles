BASEDIR="`dirname \"$0\"`"              # relative
BASEDIR="`( cd \"$BASEDIR\" && pwd )`"  # absolutized and normalized
if [ -z "$BASEDIR" ] ; then
  exit 1  # fail
fi

SUCKLESS=$HOME/suckless.org

echo performing cleanup...
rm -rf $HOME/.xinitrc
rm -rf $HOME/.Xresources
rm -rf $HOME/.config/nvim
rm -rf $HOME/helpers
rm -rf $SUCKLESS/dwm
rm -rf $SUCKLESS/st
rm -rf $SUCKLESS/dmenu

echo creating directory...
mkdir -p $HOME/.config

echo creating symlinks...
ln -sf $BASEDIR/xinitrc $HOME/.xinitrc
ln -sf $BASEDIR/Xresources $HOME/.Xresources
ln -sf $BASEDIR/helpers $HOME/helpers
ln -sf $BASEDIR/nvim $HOME/.config/nvim

echo cloning suckless.org programs...
git clone https://git.suckless.org/dwm $SUCKLESS/dwm
git clone https://git.suckless.org/st $SUCKLESS/st
git clone https://git.suckless.org/dmenu $SUCKLESS/dmenu

echo linking suckless.org configs...
ln -sf $BASEDIR/dwm/config.h $SUCKLESS/dwm/config.h
ln -sf $BASEDIR/st/config.h $SUCKLESS/st/config.h
ln -sf $BASEDIR/dmenu/config.h $SUCKLESS/dmenu/config.h
