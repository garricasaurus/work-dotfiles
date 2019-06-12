#!/bin/sh
sudo paccache -r
sudo pacman -Rns $(pacman -Qtdq)
