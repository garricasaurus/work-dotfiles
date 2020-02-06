#!/bin/sh
sudo mkdir -p /mnt/$1
sudo mount -t nfs 192.168.0.235:/volume1/$1 /mnt/$1
