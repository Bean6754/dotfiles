# Partitioning.

## IN TESTING!

## EFI and boot filesystems.
EFI partition.

`mkfs.vfat -F 32 /dev/sda1 -n 'efi'`

Boot partition.

`mkfs.ext4 -jv /dev/sda2 -L 'boot'`

## Swap partition (will be encrypted with encswp in /etc/crypttab).

`mkswap /dev/sda3 -L 'swap'`

`/etc/crypttab`:
```
encswap /dev/disk/by-id/nvme-BRAND_SPECS-part5 /dev/urandom plain,cipher=aes-xts-plain64,size=512,swap
```

## ZFS zpool.

`zpool create -f -o ashift=12 -O encryption=on -o keyformat=passphrase -O keylocation=prompt -O pbkdf2iters=6400000 -R /mnt zpool`

## ZFS datasets.

`zfs create -o mountpoint=/ zpool/ROOT`

`zfs create -o mountpoint=/usr zpool/ROOT/usr`

  - `zfs set quota=30G zpool/ROOT/usr`

`zfs create -o mountpoint=/var zpool/ROOT/var`

  - `zfs set quota=10G zpool/ROOT/var`

`zfs create -o mountpoint=/var/tmp zpool/ROOT/var/tmp`

  - `zfs set quota=4G zpool/ROOT/var/tmp`

`zfs create -o mountpoint=/home zpool/ROOT/home`
