# Filesystems table.
## Location: /etc/fstab

## IN TESTING!

# ZFS.
```
<fs>            <mountpoint>                    <type>    <opts>            <dump/pass>

UUID=<uuid>     /boot/efi                       vfat     defaults,noatime      0     2
UUID=<uuid>     /boot                           ext4     defaults,noatime      0     2
UUID=<uuid>     /                               zfs      defaults,noatime      0     0
/dev/mapper/encswap    none                     swap     defaults              0     0
tmpfs           /tmp                            tmpfs    defaults,noatime,nosuid,nodev,noexec,mode=0755,size=4g    0  0
```
