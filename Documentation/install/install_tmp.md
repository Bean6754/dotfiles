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

`pacstrap /mnt base base-devel linux linux-firmware grub lvm2 emacs dhcpcd wpa_supplicant`

Generate fstab to help bootloader and kernel auto-mount stuff.

`genfstab -U /mnt >> /mnt/etc/fstab`

Chroot into nearly created install.

`arch-chroot /mnt`

Configure timezone.

`ln -sf /usr/share/zoneinfo/Europe/London /etc/localtime`

Generate `/etc/adjtime`.

`hwclock --systohc`

Comment out `en_GB.UTF-8 UTF-8` in `/etc/locale.gen`.

Run `locale-gen`.

Change `/etc/locale.conf`.

Add `LANG=en_GB.UTF-8` to `/etc/locale.conf`.

Change `/etc/vconsole.conf`.

Add `KEYMAP=uk` to `/etc/vconsole.conf`.

Set hostname.

Add a hostname to `/etc/hostname`.

Add these lines into `/etc/hosts` (replacing `myhostname` with your hostname and `localdomain` with your local domain name).

```
127.0.0.1	localhost
::1		localhost
127.0.1.1	myhostname.localdomain	myhostname
```

Edit `/etc/mkinitcpio.conf`.

```
Add 'ext4' to MODULES.
Add 'encrypt' and 'lvm2' to HOOKS before 'filesystems'
```

Generate initramfs.

`mkinitcpio -P`

Install GRUB.

`grub-install --target=i386-pc --recheck /dev/sda`

Edit `GRUB_CMDLINE_LINUX=""` to `GRUB_CMDLINE_LINUX="cryptdevice=/dev/sda2:luks:allow-discards"` in `/etc/defualt/grub`.

Generate GRUB config.

`grub-mkconfig -o /boot/grub/grub.cfg`

Set a root password.

`passwd`

Enable dhcpcd.

`systemctl enable dhcpcd`
