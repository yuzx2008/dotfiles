#!/bin/sh

sudo umount /dev/disk/by-uuid/d75040b1-8aae-3eec-ba5b-50e5c2d6e036
sudo mount -t hfsplus -o force,rw /dev/disk/by-uuid/d75040b1-8aae-3eec-ba5b-50e5c2d6e036 /media/yuzx/Kingston16
