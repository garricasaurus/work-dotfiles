BASEDIR="`dirname \"$0\"`"              # relative
BASEDIR="`( cd \"$BASEDIR\" && pwd )`"  # absolutized and normalized
if [ -z "$BASEDIR" ] ; then
  exit 1  # fail
fi

# perform cleanup
echo performing cleanup...
rm -rf /home/$USER/.xinitrc
rm -rf /home/$USER/.Xresources
rm -rf /home/$USER/.config/nvim
rm -rf /home/$USER/helpers

# make directory structure
echo creating directory...
mkdir -p /home/$USER/.config

# create links for generic config items
echo creating symlinks...
ln -s $BASEDIR/xinitrc /home/$USER/.xinitrc
ln -s $BASEDIR/Xresources /home/$USER/.Xresources
ln -s $BASEDIR/helpers /home/$USER/helpers
ln -s $BASEDIR/nvim /home/$USER/.config/nvim

