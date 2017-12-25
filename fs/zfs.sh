#!/bin/bash
# ZFS snapshots

zpool create szpool clt3d0
zpool list szpool

zpool create mzpool mirror clt5d0 clt6d0
zpool list mzpool

# what the fuck is raidz pool.
# Similar to RAID-5 but using dynamic stripe width - every block is its own RAID stripe, regardless of blocksize,
# resulting in every RAID-Z write being a full-strinpe write
# parity bit. Parity disks.
# error detecting code 0000000 0000001
zpool create rzpool raidz clt2d0 clt1d0 clt8d0
zpool list rzpool


# creating dataset
# What is advantage of datasets?
zfs create szpool/vlo1
zfs list | grep szpool

zfs set mountpoint=/ora_voll szpool/vol1
zfs list | grep szpool

zfs get sharenfs szpool/vol1
zfs get compression szpool/vol1

#create dataset under dataset
zfs create szpool/vol1/oraarch
zfs list | grep ora

# this reserved for dataset and can't be used by other dataset
zfs set reservation=20M szpool/vol1/oraarch
zfs get reservation szpool/vol1/oraarch

#
zfs set quota=20M szpool/vol1/oraarch
zfs get quota szpool/vol1/oraarch

# status of pool
zpool status
# create dataset with different mount point, use the following command
zpool create -m /export/zfs home c1t0d0
# thi is the exampl, zeepool is an existing two-way mirror that is transformed to a three-way
# mirrir by attaching c2t1d0, the new device, to the existing device, c1t1d0
zpool attach zeepool c1t1d0 c2t1d0
zpool detach zeepool c2t1d0