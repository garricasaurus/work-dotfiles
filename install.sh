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
yay -Sy                             \
    acpi                            \
    alacritty                       \
    arc-gtk-theme                   \
    arc-icon-theme                  \
    autojump                        \
    autorandr                       \
    brillo                          \
    bluez                           \
    capitaine-cursors               \
    code                            \
    dust                            \
    firefox	                        \
    fish                            \
    gimp                            \
    git-credential-gopass           \
    gnupg                           \
    gopass                          \
    gopass-jsonapi                  \
    grim                            \
    htop                            \
    jq                              \
    lf                              \
    librewolf-bin                   \
    lutris                          \
    lxappearance                    \
    make                            \
    man-db                          \
    man-pages                       \
    mpv                             \
    most                            \
    neofetch                        \
    neovim                          \
    neovim-drop-in                  \
    noto-fonts                      \
    openssh                         \
    otf-font-awesome                \
    p7zip                           \
    pacman-contrib                  \
    pacman-mirrorlist               \
    pamixer                         \
    proton-ge-custom-bin            \
    polkit                          \
    powertop                        \
    rsync                           \
    rust                            \
    scrot                           \
    slock                           \
    steam                           \
    sway                            \
    swaybg                          \
    swayidle                        \
    swaylock                        \
    sxiv                            \
    ttf-fira-code                   \
    ttf-fira-mono                   \
    ttf-fira-sans                   \
    ttf-liberation                  \
    upower                          \
    wine                            \
    x11-ssh-askpass                 \
    xclip                           \
    xorg-server                     \
    xorg-apps                       \
    xorg-xinit                      \
    xorg-xsetroot                   \
    xorg-xwayland                   \
    zsh

# install customized utility from git
grab() {
    rm -rf $HOME/$1
	git clone -b $2 "https://github.com/garricasaurus/$1" "$HOME/$1"
	cd "$HOME/$1"
	make clean build
	sudo make install
}

grab "dwm" "patched"
grab "dmenu" "patched"
grab "okki-status" "master"
grab "okki-refresh" "master"

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

# setup misc directories
mkdir -p $HOME/Pictures
mkdir -p $HOME/Screenshots
mkdir -p $HOME/.gnupg

link_resource "zshrc" ".zshrc"
link_resource "zprofile" ".zprofile"
link_resource "xinitrc" ".xinitrc"
link_resource "Xresources" ".Xresources"
link_resource "gpg-agent.conf" ".gnupg/gpg-agent.conf"
link_resource "ssh" ".ssh"
link_resource "gitconfig" ".gitconfig"
link_resource "helpers" "helpers"
link_config "alacritty"
link_config "nvim"
link_config "sway"
link_config "systemd"
link_config "wireplumber"
