# Create UEFI Win10 bootable usb

### Pre-requisites:
   * 8GB UDB
   * 7zip

### Partitioning
   * partition table: gpt
   * partition 1: primary, 2GB+, FAT32
   * partition 2: primary, 4GB+, NTFS


#### Copy files

```
mkdir -p /mnt/win-boot
mount /dev/sd[X]1 /mnt/win-boot

mkdir -p /mnt/win
mount /dev/sd[X]2 /mnt/win

7z x -x!sources/ [win.iso] -o/mnt/win-boot/
7z x -i!sources/boot.wim [win.iso] -o/mnt/win-boot/
7z x -i!sources/ [win.iso] -o/mnt/win/

sync
```