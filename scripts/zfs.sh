#zfs snapshots
zfs list -t snapshot

# zfs монтирует .zfs-snapshot folder в момент обращения
# watch size of zfs partitions
zpool list

# see history, snapshots may be viewesd
zpool history -l

# zfs dataset show
zfs list 

# understang space
# until reently i confused and frustrated by zfs list output
# Now let's create some files and snapshots
mkfile 100M /tank/file1
zfs snapshot tank@snap1
mkfile 100M /tank/file2
zfs snapshot tank@snap2
zfs list -t all -r tank

#the output here looks as I'dxpect. I have used 200mb neither of wich is used by the snapshots. nsap1 refers to 100mb of data  and snap2 refers to 200MB of data (file 1 and file2)
# Now let's delete file 1 and look 
#zfs scrub check consistency of files
rm /tank/file1zpool scrub tank
zfs list -t all -o space -r tank
# here we can see that of 200mb 100 is snap and 100 is data
my snapshots are consuming 18/
snap refer is how many space it contains really