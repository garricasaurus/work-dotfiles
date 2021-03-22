#!/bin/sh

BASEDIR="`dirname \"$0\"`"              # relative
BASEDIR="`( cd \"$BASEDIR\" && pwd )`"  # absolutized and normalized
if [ -z "$BASEDIR" ] ; then
  exit 1  # fail
fi

# install base tools
sudo pacman --noconfirm -Sy         \
    base-devel                      \
    git                             \
    go

# install yay
rm -rf $HOME/yay
git clone https://aur.archlinux.org/yay.git $HOME/yay
cd $HOME/yay
makepkg -si
cd $BASEDIR
rm -rf $HOME/yay

# install some basic programs
yay --noconfirm -Sy                 \
    acpi                            \
    arc-icon-theme                  \
    autorandr                       \
    brillo                          \
    bluez                           \
    code                            \
    dust                            \
    feh                             \
    gimp                            \
    gopass                          \
    gopass-jsonapi-git              \
    lf                              \
    lxappearance                    \
    make                            \
    man-db                          \
    man-pages                       \
    mpv                             \
    neofetch                        \
    noto-fonts                      \
    openssh                         \
    p7zip                           \
    pacman-contrib                  \
    pacman-mirrorlist               \
    pamixer                         \
    physlock                        \
    powertop                        \
    pulseadio                       \
    pulseaudio-alsa                 \
    pulseaudio-bluetooth            \
    pulseaudio-jack                 \
    rust                            \
    scrot                           \
    slock                           \
    steam                           \
    sxiv                            \
    upower                          \
    xclip                           \
    xorg-server                     \
    xorg-apps                       \
    xorg-xinit                      \
    xorg-xsetroot                   

# install customized utility from git
grab() {
    rm -rf $HOME/$1
	git clone -b $2 "https://github.com/garricasaurus/$1" "$HOME/$1"
	cd "$HOME/$1"
	sudo make clean install
}

grab "dwm" "patched"
grab "dmenu" "patched"
grab "okki-status" "master"

# symlink indiviual dotfiles
link_resource() {
	rm -f "$HOME/$2"
	ln -sf "$BASEDIR/$1" "$HOME/$2"
}

link_config() {
	rm -rf "$HOME/.config/$1"
	mkdir -p "$HOME/.config"
	ln -sf "$BASEDIR/$1" "$HOME/.config/$1"
}

link_resource "xinitrc" ".xinitrc"
link_resource "Xresources" ".Xresources"
link_resource "bashrc" ".bashrc"
link_resource "vimrc" ".vimrc"
link_resource "gpg-agent.conf" ".gnupg/gpg-agent.conf"
link_resource "helpers" "helpers"
link_config "alacritty"
link_config "fish"
link_config "systemd"

# setup misc directories
mkdir $HOME/Pictures
mkdir $HOME/Screenshots
