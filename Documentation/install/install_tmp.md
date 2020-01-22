TODO: Convert to either HTML or Markdown and update.

## Partitioning.

Wipe hard drive.

`wipefs -a /dev/sda`

Add GPT partition table to hard drive.

`fdisk /dev/sda`
  1. g
  2. w

Partition disk.

`cgdisk /dev/sda`
  1. 512 MiB - sda1
  2. 512 MiB - sda2
  3. Rest    - sda3

Format partitions.

`mkfs.msdos -F 32 /dev/sda1 -n 'efi'`
`mkfs.ext4 -jv /dev/sda2 -L 'boot'`

Create and open LUKS encryption partition.

`cryptsetup -v -c aes-xts-plain64 -s 512 -h sha512 -i 4000 --use-urandom -y luksFormat /dev/sda3`
`cryptsetup luksOpen /dev/sda3 crypt`

Create LVM2 logical volumes and do a volume change sync.

`pvcreate /dev/mapper/crypt`
`vgcreate vgroot /dev/mapper/crypt`
`lvcreate -L 8GiB -n swap vgroot`
`lvcreate -l100%FREE -n root vgroot`
`vgscan --mknodes`
`vgchange -ay`

Format partitions of LVM2 logical partitions.

`mkswap /dev/vgroot/swap -L 'swap'`
`mkfs.ext4 -jv /dev/vgroot/root -L 'root'`

Mount partitions.

`swapon /dev/vgroot/swap`
`mount /dev/vgroot/root /mnt`
`mkdir /mnt/boot`
`mount /dev/sda2 /mnt/boot`
`mkdir /mnt/boot/efi`
`mount /dev/sda1 /mnt/boot/efi`

Install base packages to drive.

`pacstrap /mnt base base-devel linux linux-firmware grub dhcpcd wpa_supplicant`

Generate fstab to help bootloader and kernel auto-mount stuff.

`genfstab -U /mnt >> /mnt/etc/fstab`

Chroot into nearly created install.

`arch-chroot /mnt`

Configure timezone.

`ln -sf`

.....

Install GRUB.
