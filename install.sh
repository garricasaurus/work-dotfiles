BASEDIR="`dirname \"$0\"`"              # relative
BASEDIR="`( cd \"$BASEDIR\" && pwd )`"  # absolutized and normalized
if [ -z "$BASEDIR" ] ; then
  exit 1  # fail
fi
PROFILE=${1-"razer-blade"}

# perform cleanup
echo performing cleanup...
rm -rf /home/$USER/.bashrc
rm -rf /home/$USER/.vimrc
rm -rf /home/$USER/.xinitrc
rm -rf /home/$USER/.Xresources
rm -rf /home/$USER/.config/i3
rm -rf /home/$USER/.config/rofi
rm -rf /home/$USER/.config/polybar
rm -rf /home/$USER/.config/nvim
rm -rf /home/$USER/helpers

# make directory structure
echo creating directory...
mkdir -p /home/$USER/.config

# create links for generic config items
echo creating symlinks...
ln -s $BASEDIR/bashrc /home/$USER/.bashrc
ln -s $BASEDIR/xinitrc /home/$USER/.xinitrc
ln -s $BASEDIR/Xresources /home/$USER/.Xresources
ln -s $BASEDIR/helpers /home/$USER/helpers
ln -s $BASEDIR/generic/i3 /home/$USER/.config/i3
ln -s $BASEDIR/generic/rofi /home/$USER/.config/rofi
ln -s $BASEDIR/generic/nvim /home/$USER/.config/nvim
ln -s $BASEDIR/$PROFILE/polybar /home/$USER/.config/polybar

