#!/bin/sh

BASEDIR="`dirname \"$0\"`"              # relative
BASEDIR="`( cd \"$BASEDIR\" && pwd )`"  # absolutized and normalized
if [ -z "$BASEDIR" ] ; then
  exit 1  # fail
fi

install() {
	echo "  -> $1"
	sudo pacman --noconfirm -Sy $1 > /dev/null
}

install_aur() {
	echo "  -> $1 (AUR)"
	yay --noconfirm -Sy $1 > /dev/null
}

install_sl() {
	echo "  -> $1"
	cd "$BASEDIR/$1" > /dev/null
	sudo make clean install > /dev/null
}

link_resource() {
	echo "  -> linking $BASEDIR/$1 -> $HOME/$2"
	rm -f "$HOME/$2" > /dev/null
	ln -sf "$BASEDIR/$1" "$HOME/$2" > /dev/null
}

link_config() {
	echo "  -> linking config $BASEDIR/$1 -> $HOME/.config/$1"
	rm -rf "$HOME/.config/$1" > /dev/null
	mkdir -p "$HOME/.config" > /dev/null
	ln -sf "$BASEDIR/$1" "$HOME/.config/$1" > /dev/null
}

echo " => installing packages"
install git
install go
install noto-fonts
install pulseaudio 
install pulseaudio-alsa 
install pulseaudio-bluetooth 
install pulseaudio-jack 
install pamixer 
install fish
install upower

echo "  -> yay"
{
	rm -rf $HOME/yay
	git clone https://aur.archlinux.org/yay.git $HOME/yay
	cd $HOME/yay
	makepkg -si
	cd $BASEDIR
	rm -rf $HOME/yay
} > /dev/null
install_aur brillo

echo " => configuration files" 
link_resource "xinitrc" ".xinitrc"
link_resource "Xresources" ".Xresources"
link_resource "helpers" "helpers"
link_config "alacritty"
link_config "fish"

echo " => suckless.org"
install_sl dwm
install_sl dmenu

echo " => okki status"
{
	rm -rf $HOME/okki-status
	git clone https://github.com/dargzero/okki-status $HOME/okki-status
	cd $HOME/okki-status
	go build
	sudo mv okki-status /usr/local/bin/okki-status
} > /dev/null

