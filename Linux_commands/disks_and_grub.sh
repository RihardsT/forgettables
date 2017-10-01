# Mount a disk temporarily (good for checking for stuff hidden by an overmount)
mkdir tmpdir
mount --bind <LOCATION> tmpdir
# Do your checking, then remove it
umount tmpdir

########## Format a disk
# List attached disks
fdisk -l
# Create a partition on a mounted disk. This is non interactive way for usually interactive command. Olol
fdisk /dev/sdb <<EOF
n
p
1


w
EOF
# format the partition as ext4
mkfs.ext4 /dev/sdb1


########## Get UUID of partitions
lsblk -o NAME,SIZE,MOUNTPOINT,UUID


########## Set default grub entry
# Get all the menuentries grub shows
less /boot/grub/grub.cfg | grep menuentry
# Edit the file and replace the default with a menuentry. Something like that.
/etc/default/grub
  GRUB_DEFAULT='Windows 10 (loader) (on /dev/sda1)'
# Update grub, when file updated
sudo update-grub

########## Swap
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon -s

vim /etc/fstab
  /mnt/swapfile   none    swap    sw    0   0
