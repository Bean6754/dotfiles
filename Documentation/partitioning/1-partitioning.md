# Partitioning.

## LVM2.

Create physical volume.

`pvcreate /dev/sda1`

Create volume group.

`vgcreate vg01 /dev/sda1`

Create logical volume partitions.

```
lvcreate -L 8GiB -n swap vg01
lvcreate -L 40GiB -n root vg01
lvcreate -l100%FREE -n home vg01
```

Rescan LVM.

```
vgscan --mknodes
vgchange -ay
```

## cryptsetup.

`cryptsetup -v -c aes-xts-plain64 -s 512 -h sha512 -i 4000 --use-urandom -y luksFormat /dev/mapper/vg01-storage1`

(cryptsetup -v --cipher aes-xts-plain64 --key-size 512 --hash sha512 --iter-time 4000 --use-urandom --verify-passphrase luksFormat /dev/mapper/vg01-storage1)

then

`cryptsetup luksOpen /dev/mapper/vg01-storage1 storage1_crypt`

to view cryptsetup header: `cryptsetup luksDump /dev/mapper/vg01-storage1`

## Create filesystems.

Swap: `mkswap /dev/vg01/swap -L 'swap' && swapon /dev/vg01/swap`

Root: `mkfs.xfs /dev/mapper/storage1_crypt -f -L 'root'`

Home: `mkfs.ext4 -jv /dev/vg01/home -L 'home'`
