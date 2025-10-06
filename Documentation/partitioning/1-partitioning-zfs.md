# Partitioning.

## IN TESTING!

## EFI and boot filesystems.
EFI partition.

`mkfs.vfat -F 32 /dev/sda1 -n 'efi'`

Boot partition.

`mkfs.ext4 -jv /dev/sda2 -L 'boot'`

## Swap partition (will be encrypted with encswp in /etc/crypttab).

Zero partition (run `dd` command once on an SSD or 7 times on a mechanical HDD) to ensure it is blank before formatting. Prevent data leaks as encswap should only encrypt start+growing, not entire partition (otherwise your boot-time would be like 10-20 minutes+ lol).

`dd if=/dev/zero of=/dev/disk/by-id/nvme-BRAND_SPECS-part4 bs=8M && sync`

`mkswap /dev/sda3 -L 'swap'`

`/etc/crypttab`:
```
encswap /dev/disk/by-id/nvme-BRAND_SPECS-part4 /dev/urandom plain,cipher=aes-xts-plain64,size=512,swap
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
