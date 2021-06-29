# Multi-device encrypted setup with BTRFS

Create an encrypted volume on the device partition:

```
sudo cryptsetup luksFormat --type=luks2 /dev/nvme0n1p1
sudo cryptsetup open /dev/nvme0n1p1 extra
```

Add the disk to the existing btrfs filesystem:

```
sudo btrfs device add /dev/mapper/extra /home
```

Rebalance with raid-0 disk and raid-1 metadata:

```
sudo btrfs balance start -dconvert=raid0 -mconvert=raid1 /home
```

Verify filesystems, and available disk space:

```
sudo btrfs filesystem show
sudo btrfs filesystem usage /home
```

Persist changes after reboot:

Obtain the luks UUID for the volume

```
sudo cryptsetup luksUUID /dev/nvme0n1p1
```

Use the UUID to add a mapping kernel param:

```
options [...] luks.uuid=<UUID> luks.name=<UUID>=extra 
```

If `btrfs scan` is executed during boot, there is no need to modify `/etc/fstab`.

