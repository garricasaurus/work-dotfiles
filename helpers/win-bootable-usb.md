# Create a Win10 bootable usb

### Pre-requisites:
   * 8GB UDB
   * NTFS partition
   * ms-sys, rsync


```
mkdir -p /mnt/win
mount -t udf loop,ro,unhide [win10.iso] /mnt/win

mkdir -p /mnt/usb
mount /dev/sd[Xn] /mnt/usb

rsync -avrP /mnt/win/* /mnt/usb
ms-sys -7 /dev/sd[X]
sync
umount /mnt/usb
```