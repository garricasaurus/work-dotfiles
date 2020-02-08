# Install Windows 10 to external HDD

## install into VirtualBox

   * use _vdi_ disk format
   * after VM creation, enable EFI boot in settings
   * boot and install ISO as usual

## create image from virtual disk

   * locate virtual machine directory
   ```
   ~/virtual-machines/[name]
   ```
   * clone disk into _img_ file:
   ```
   VBoxManage clonehd [disk].vdi [disk].img --format RAW
   ```

## write image onto USB device

   ```
   sudo dd bs=4M if=[disk].img of=/dev/sd[X] status=progress oflag=sync
   ```

## resize/fix partition

   * open _gparted_
   * it should automatically prompt to fix unallocated space (if not, you can do it manually)

## boot windows from USB

   * finish setup
   * update
   * drivers
   * etc...
   * ready to use