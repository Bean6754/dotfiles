# Filesystems table.
## Location: /etc/fstab

# EXT4 or XFS.
```
<fs>            <mountpoint>                    <type>    <opts>            <dump/pass>

UUID=<uuid>     /boot/efi                        vfat     defaults,noatime      0     2
UUID=<uuid>     /boot                           ext4     defaults,noatime      0     2
UUID=<uuid>     /                               ext4     defaults,noatime      0     1
UUID=<uuid>     none                            swap     sw                    0     0

/dev/cdrom      /mnt/cdrom                      auto      noauto,ro            0     0
```

# BTRFS.
```
<fs>            <mountpoint>                    <type>    <opts>                                                 <dump/pass>

UUID=<uuid>     /boot/efi                        vfat      defaults,noatime                                       0     2
UUID=<uuid>     /boot                           btrfs     defaults,noatime,subvol=boot                           0     2
UUID=<uuid>     /                               btrfs     defaults,compress=lzo,noatime,autodefrag,subvol=root   0     1
UUID=<uuid>     none                            swap      sw                                                     0     0

/dev/cdrom      /mnt/cdrom                      auto      noauto,ro                                              0     0
```

## Notes:
### Options.
`autodefrag` Specific to btrfs. Enable automatic file defragmentation. When enabled, small random writes into files (in a range of tens of kilobytes, currently it’s 64K) are detected and queued up for the defragmentation process. Not well suited for large database workloads.

[Why autodefrag should still be enabled on SSDs.](https://www.spinics.net/lists/linux-btrfs/msg31028.html)

`defaults` Use default options: rw, suid, dev, exec, auto, nouser, and async.

`discard` Enables TRIM (for SSDs).

`noauto` Does not automatically mount at boot. Can still be mounted via the `mount -a` command.

`compress=lzo` Specific to btrfs. (See 'compression' below.)

`sw` Specific to swap.

## Pass (fsck).
The 6th column (in bold) is the fsck option.

    0 = Do not check.
    1 = First file system (partition) to check; / (root partition) should be set to 1.
    2 = All other filesystems to be checked.

## Compression.
### What are the differences between compression methods?
There's a speed/ratio trade-off:

    ZLIB -- slower, higher compression ratio (uses zlib level 3 setting, you can see the zlib level difference between 1 and 6 in zlib sources).
    LZO -- faster compression and decompression than zlib, worse compression ratio, designed to be fast
    ZSTD -- (since v4.14) compression comparable to zlib with higher compression/decompression speeds and different ratio levels (details) 
    
The differences depend on the actual data set and cannot be expressed by a single number or recommendation. Do your own benchmarks. LZO seems to give satisfying results for general use. 
