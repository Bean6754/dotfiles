# Partitioning.

## IN TESTING!

## Wipe partition-layout of drive (WARNING: Any data will be lost, although data-leaks possible).

`wipefs -a /dev/sda`

Super paranoid method to prevent data-leaks:

  - 1-pass for SSD/NVMe or 7-pass for mechanical HDD.

`dd if=/dev/zero of=/dev/sda bs=8M && sync`

Even though `swap` is crypttab-urandom-encswap and `zpool` is ZFS-passphrase-encrypted there could be data-leaks if drive is not zeroed due to encryption being "encrypt from now" and not "encrypt entire drive".

## For UEFI create GPT partition-scheme.

`fdisk /dev/sda`

Then run commands through stdin/input:

`g (enter)`
`w (enter)`
`q (enter)`

## For BIOS create MBR partition-scheme.

`fdisk /dev/sda`

Then run commands through stdin/input:

`o (enter)`
`w (enter)`
`q (enter)`

## Partition layout.

`cfdisk /dev/sda`

UEFI (GPT).

```
512MiB - Microsoft Basic Boot Partition - For /boot/efi
512MiB - Linux                          - For /boot
8GiB   - swap                           - If you use hibernate set your swap to your RAM amount + VRAM amount + a 512MiB extra for buffer
*      - Linux                          - For zpool / and its datasets
```

BIOS (MBR).

```
2MiB   - BIOS Boot                      - Set bootable flag
512MiB - Linux                          - For /boot
8GiB   - swap                           - If you use hibernate set your swap to your RAM amount + VRAM amount + a 512MiB extra for buffer
*      - Linux                          - For zpool / and its datasets
```

## EFI (UEFI-only) and boot filesystems.
EFI partition (UEFI-only).

`mkfs.vfat -F 32 /dev/sda1 -n 'efi'`

Boot partition (UEFI and BIOS).

`mkfs.ext4 -jv /dev/sda2 -L 'boot'`

## Swap partition (will be encrypted with encswp in /etc/crypttab).

Create swap filesystem.

`mkswap /dev/sda3 -L 'swap'`

_/etc/crypttab_:
```
encswap /dev/disk/by-id/drive-BRAND_SPECS-part4 /dev/urandom plain,cipher=aes-xts-plain64,size=512,swap
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
