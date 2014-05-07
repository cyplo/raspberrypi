#!/bin/sh
echo
echo "unmounting..."
sudo umount /dev/mmcblk0p1
sudo umount /dev/mmcblk0p2
echo
echo "checking /boot ..."
sudo fsck.msdos -av /dev/mmcblk0p1
echo
echo "checking / ..."
sudo fsck.ext4 -vfp /dev/mmcblk0p2

