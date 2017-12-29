#!/bin/bash

if [ ! -e /build/raspbian_lite_latest ]; then
	wget https://downloads.raspberrypi.org/raspbian_lite_latest
fi

IMAGE=$(ls *.img)

if [ -z "$IMAGE" ]; then
	unzip -u raspbian_lite_latest
	IMAGE=$(ls *.img)
fi

mkdir -p /mnt/image/boot
mkdir -p /mnt/image/root

fdisk -l $IMAGE

START_BOOT=$(fdisk -l $IMAGE | grep -i fat | awk '{ print $2*512 }')
START_ROOT=$(fdisk -l $IMAGE | grep -i Linux | awk '{ print $2*512 }')

mount -v -o offset=$START_BOOT -t vfat --source $IMAGE --target /mnt/image/boot
mount -v -o offset=$START_ROOT -t ext4 --source $IMAGE --target /mnt/image/root
