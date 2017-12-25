#!/bin/bash

su -
umount /dev/md0

lsof | grep /dev/md0
umount /dev/md0

mdadm --stop /dev/md0