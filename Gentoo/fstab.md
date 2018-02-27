# Filesystems table.
## Location: /etc/fstab

```<fs>            <mountpoint>                    <type>    <opts>                                                       <dump/pass>`

UUID=<uuid>     /boot/efi                       vfat      defaults,noatime                                              0     2
UUID=<uuid>     /boot                           btrfs     defaults,noauto,noatime,subvol=boot                           0     2
UUID=<uuid>     /dev/mapper/encrypted-root      btrfs     defaults,noauto,compress=lzo,noatime,autodefrag,subvol=root   0     0
UUID=<uuid>     /dev/mapper/encrypted-home      btrfs     defaults,noauto,compress=lzo,noatime,autodefrag,subvol=home   0     0
UUID=<uuid>     none                            swap      sw                                                            0     0

/dev/cdrom      /mnt/cdrom                      auto      noauto,ro                                                      0     0```
