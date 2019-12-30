# Arch Linux Install Helper

## Base system

### Connect wifi (optional):
```
wpa_passphrase <ssid> <password> >> /etc/wpa_supplicant/<wifi>.conf
wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/<wifi>.conf
dhcpcd
ping archlinux.org
```

### Display larger fonts (optional):
```
pacman -Sy terminus-font
setfont ter-u22b
```

### Verify boot mode:
```
ls /sys/firmware/efi/efivars
```

### update system clock:
```
timedatectl set-ntp true
```

### Disk partitioning:

required partitions:
   1. EFI System (at least 350M)
   2. Linux filesystem (rest)

for example, using ```/dev/nvme0n1```

```
cgdisk /dev/nvme0n1     # make above changes and save
```

```
mkfs.fat -F32 /dev/nvme0n1p1
cryptsetup luksFormat --type=luks2 /dev/nvme0n1p2
cryptsetup open /dev/nvme0n1p2 luks
mkfs.btrfs -L luks /dev/mapper/luks
mount -t btrfs /dev/mapper/luks /mnt
btrfs subvolume create /mnt/@root
btrfs subvolume create /mnt/@home
umount /mnt
```

```
mount -o subvol=@root /dev/mapper/luks /mnt
mkdir /mnt/home
mount -o subvol=@home /dev/mapper/luks /mnt/home
mkdir /mnt/boot
mount /dev/nvme0n1p1 /mnt/boot
```

### Rank pacman mirrors:
```
pacman -Sy pacman-contrib
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
```

### Install base packages:
```
pacstrap /mnt base base-devel linux linux-firmware btrfs-progs vim git sudo efibootmgr wpa_supplicant dialog iw go terminus-font networkmanager
```

### Configure base system:

#### fstab:
```
genfstab -L /mnt >> /mnt/etc/fstab
```
SSD adjustments (non-boot partitions):
   * relatime --> noatime
   * discard
   * autodefrag


#### hostname, users, etc:

```
arch-chroot /mnt
```

```
ln -sf /usr/share/zoneinfo/<region>/<city> /etc/localtime
sed -i 's/#hu_HU.UTF-8/hu_HU.UTF-8/g' /etc/locale.gen
sed -i 's/#en_US.UTF-8/en_US.UTF-8/g' /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
```

```
echo 'FONT=ter-u22b' >> /etc/vconsole.conf
```

```
echo '<hostname>' > /etc/hostname
echo '127.0.0.1 localhost' >> /etc/hosts
echo '::1       localhost' >> /etc/hosts
echo '127.0.1.1	<hostname>.localdomain <hostname>' >> /etc/hosts
```

```
passwd      # root password
```

```
useradd -m -g users -G wheel <username>
passwd <username>
echo '<username> ALL=(ALL) NOPASSWD:ALL' > /etc/sudoers.d/<username>
```

#### init

```
nvim /etc/mkinitcpio.conf
```

Change hooks to: *HOOKS=(base systemd autodetect modconf block keyboard sd-vconsole sd-encrypt filesystems)*

```
mkinitcpio -p linux
bootctl --path=/boot install
```

```
pacman -Sy intel-ucode
```

```
export LUKS_UUID=`cryptsetup luksUUID /dev/nvme0n1p2`
echo "title Arch Linux" >> /boot/loader/entries/arch.conf
echo "linux /vmlinuz-linux" >> /boot/loader/entries/arch.conf
echo "initrd /intel-ucode.img" >> /boot/loader/entries/arch.conf
echo "initrd /initramfs-linux.img" >> /boot/loader/entries/arch.conf
echo "options rw luks.uuid=$LUKS_UUID luks.name=$LUKS_UUID=luks root=/dev/mapper/luks rootflags=subvol=@root" >> /boot/loader/entries/arch.conf
```

```
echo 'default arch' > /boot/loader/loader.conf
```

```
exit
reboot
```
