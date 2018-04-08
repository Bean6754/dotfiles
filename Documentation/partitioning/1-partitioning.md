# Partitioning.

## cryptsetup.

`cryptsetup -v -c aes-xts-plain64 -s 512 -h sha512 -i 4000 --use-urandom -y`

(cryptsetup -v --cipher aes-xts-plain64 --key-size 512 --hash sha512 --iter-time 4000 --use-urandom --verify-passphrase luksFormat /dev/sda3)

then

`cryptsetup luksOpen /dev/sda3 crypt`

to view cryptsetup header: `cryptsetup luksDump /dev/sda3`

## LVM2.

Create physical volume.

`pvcreate /dev/mapper/crypt`

Create volume group.

`vgcreate vg01 /dev/mapper/crypt`

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

## Create filesystems.

Swap: `mkswap /dev/vg01/swap -L 'swap' && swapon /dev/vg01/swap`

Root: `mkfs.ext4 -jv /dev/vg01/root -L 'root'`

Home: `mkfs.ext4 -jv /dev/vg01/home -L 'home'`
