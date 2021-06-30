# Create swapfile on btrfs

Steps are based on [this article](https://www.jwillikers.com/btrfs-swapfile), and adapted for the fish shell.
__Note__: won't work on filesystems that span multiple devices!

Mount the root filesystem and create a subvolume for swap:

```shell
set ROOT_FS (df --output=source / | tail -n 1)
sudo mount $ROOT_FS /mnt
sudo btrfs subvolume create /mnt/@swap
sudo chmod 700 /mnt/@swap
```

Create a directory where the swap subvolume will be mounted:

```shell
sudo mkdir /swap
```

Add it to `/etc/fstab`:

```shell
echo "$ROOT_FS    /swap   btrfs   defaults,noatime,subvol=@swap   0 0" | sudo tee -a /etc/fstab
```

Mount the subvolume, and create the swap file as described on [ArchWiki](https://wiki.archlinux.org/index.php/Btrfs#Swap_file):

```shell
sudo mount /swap
sudo truncate -s 0 /swap/swapfile
sudo chattr +C /swap/swapfile
sudo btrfs property set /swap/swapfile compression none
sudo dd if=/dev/zero of=/swap/swapfile bs=1M count=8096 status=progress
sudo chmod 600 /swap/swapfile
sudo mkswap /swap/swapfile
sudo swapon /swap/swapfile
```

Finally add the swapfile to `/etc/fstab` and verify mounts:

```shell
echo "/swap/swapfile   none   swap   defaults   0 0" | sudo tee -a /etc/fstab
sudo findmnt --verify --verbose
```

Optionally set a lower swappiness in `/etc/sysctl.d/99-swappiness.conf`:

```
vm.swappiness=10
```
