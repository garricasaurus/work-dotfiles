#!/bin/sh

BASEDIR="`dirname \"$0\"`"              # relative
BASEDIR="`( cd \"$BASEDIR\" && pwd )`"  # absolutized and normalized
if [ -z "$BASEDIR" ] ; then
  exit 1  # fail
fi

install() {
	sudo pacman --noconfirm -Sy $1
}

install_aur() {
	yay --noconfirm -Sy $1
}

install_sl() {
	git clone -b patched "https://github.com/dargzero/$1" "$HOME/$1"
	cd "$HOME/$1"
	sudo make clean install
}

link_resource() {
	rm -f "$HOME/$2"
	ln -sf "$BASEDIR/$1" "$HOME/$2"
}

link_config() {
	rm -rf "$HOME/.config/$1"
	mkdir -p "$HOME/.config"
	ln -sf "$BASEDIR/$1" "$HOME/.config/$1"
}

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
install scrot

mkdir $HOME/Screenshots


rm -rf $HOME/yay
git clone https://aur.archlinux.org/yay.git $HOME/yay
cd $HOME/yay
makepkg -si
cd $BASEDIR
rm -rf $HOME/yay

install_aur brillo

link_resource "xinitrc" ".xinitrc"
link_resource "Xresources" ".Xresources"
link_resource "vimrc" ".vimrc"
link_resource "helpers" "helpers"
link_config "alacritty"
link_config "fish"

install_sl dwm
install_sl dmenu

rm -rf $HOME/okki-status
git clone https://github.com/dargzero/okki-status $HOME/okki-status
cd $HOME/okki-status
go build
sudo mv okki-status /usr/local/bin/okki-status

