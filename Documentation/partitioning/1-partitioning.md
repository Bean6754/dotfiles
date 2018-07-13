# Partitioning.

## cryptsetup.

`cryptsetup -v -c aes-xts-plain64 -s 512 -h sha512 -i 4000 --use-urandom -y luksFormat /dev/sda3`

(cryptsetup -v --cipher aes-xts-plain64 --key-size 512 --hash sha512 --iter-time 4000 --use-urandom --verify-passphrase luksFormat /dev/sda3)

then

`cryptsetup luksOpen /dev/sda3 crypt`

to view cryptsetup header: `cryptsetup luksDump /dev/sda3`

## LVM2.
<!-- You could also use vg01/02/03/etc.. -->
Create physical volume.

`pvcreate /dev/mapper/crypt`

Create volume group.

`vgcreate vgroot /dev/mapper/crypt`

Create logical volume partitions.

```
lvcreate -L 8GiB -n swap vgroot
lvcreate -l100%FREE -n root vgroot
```

Rescan LVM.

```
vgscan --mknodes
vgchange -ay
```

## Create filesystems.

Swap: `mkswap /dev/vgroot/swap -L 'swap' && swapon /dev/vgroot/swap`

Root: `mkfs.ext4 -jv /dev/vgroot/root -L 'root'`
