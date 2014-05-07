#!/bin/sh
CARD_DEVICE="/dev/mmcblk0"
BOOT_DEVICE=$CARD_DEVICE"p1"
ROOT_DEVICE=$CARD_DEVICE"p2"

echo
echo "unmounting..."
sudo umount $BOOT_DEVICE 
sudo umount $ROOT_DEVICE
echo
echo "checking $BOOT_DEVICE ..."
sudo fsck.msdos -av $BOOT_DEVICE
echo
echo "checking $ROOT_DEVICE ..."
sudo fsck.ext4 -vfp $ROOT_DEVICE

IMAGE_NAME=`date +"%Y%m%d"`".img.xz"
echo
echo "copying $CARD_DEVICE to $IMAGE_NAME..."
sudo dd if=$CARD_DEVICE bs=4M | xz --best --threads=4 -v > $IMAGE_NAME

