# Create swapfile on btrfs

We need to create a dedicated btrfs subvolume which will hold the swapfile.

```shell
sudo btrfs subvolume create /@swap
sudo chmod 700 /@swap
sudo mkdir /swap
```

Add it to `/etc/fstab`:

```
<device>   /swap   btrfs    defaults,noatime,subvol=@root/@swap 0 0
```

Mount the subvolume:

```shell
sudo mount /swap
```

Initialize and allocate the swapfile ([ArchWiki](https://wiki.archlinux.org/index.php/Btrfs#Swap_file)):

```shell
sudo truncate -s 0 /swap/swapfile
sudo chattr +C /swap/swapfile
sudo btrfs property set /swap/swapfile compression none
sudo dd if=/dev/zero of=/swap/swapfile bs=1M count=8096 status=progress
sudo chmod 600 /swap/swapfile
sudo mkswap /swap/swapfile
sudo swapon /swap/swapfile
```

Add it to `/etc/fstab`:

```
/swap/swapfile   none   swap   defaults 0 0
```

Finally verify mounts:

```shell
sudo findmnt --verify --verbose
```

Optionally set a lower swappiness in `/etc/sysctl.d/99-swappiness.conf`:

```
vm.swappiness=10
```
