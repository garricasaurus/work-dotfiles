eval "$(keychain --eval --quiet --nogui --noask id_ed25519)"

if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi
