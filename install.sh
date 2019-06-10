BASEDIR="`dirname \"$0\"`"              # relative
BASEDIR="`( cd \"$BASEDIR\" && pwd )`"  # absolutized and normalized
if [ -z "$BASEDIR" ] ; then
  exit 1  # fail
fi

SL=$HOME/sl

echo performing cleanup...
rm -rf $HOME/.xinitrc
rm -rf $HOME/.Xresources
rm -rf $HOME/.config/nvim
rm -rf $HOME/helpers
rm -rf $SL

echo creating directory...
mkdir -p $HOME/.config

echo creating symlinks...
ln -sf $BASEDIR/xinitrc $HOME/.xinitrc
ln -sf $BASEDIR/Xresources $HOME/.Xresources
ln -sf $BASEDIR/helpers $HOME/helpers
ln -sf $BASEDIR/nvim $HOME/.config/nvim

echo creating sl apps...
mkdir -p $SL
git clone https://git.suckless.org/dwm $SL/dwm
git clone https://git.suckless.org/dmenu $SL/dmenu
git clone https://git.suckless.org/st $SL/st
git clone https://bitbucket.org/dargzero/smart-status $SL/smart-status
ln -sf $BASEDIR/dwm/config.h $SL/dwm/config.h
ln -sf $BASEDIR/dmenu/config.h $SL/dmenu/config.h
ln -sf $BASEDIR/st/config.h $SL/st/config.h

echo installing sl apps...
cd $SL/smart-status
go build
sudo mv smart-status /usr/local/bin
cd $SL/dwm
sudo make clean install
cd $SL/dmenu
sudo make clean install
cd $SL/st
sudo make clean install
cd $BASEDIR
