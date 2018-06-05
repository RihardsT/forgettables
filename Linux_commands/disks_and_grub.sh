# Mount a disk temporarily (good for checking for stuff hidden by an overmount)
mkdir tmpdir
mount --bind <LOCATION> tmpdir
# Do your checking, then remove it
umount tmpdir

###
mount /dev/DISK_PARTITION MOUNT_LOCATION

########## Format a disk
# List attached disks
fdisk -l
# fdisk creates MBR disks, up to 4 primary partitions
# Create a partition on a mounted disk. This is non interactive way for usually interactive command. Olol
fdisk /dev/sdb <<EOF
n
p
1


w
EOF
# format the partition as ext4
mkfs.ext4 /dev/sdb1

### Show available partitions
blkid
###
partprobe

########## Get UUID of partitions
lsblk -o NAME,SIZE,MOUNTPOINT,UUID


########## Set default grub entry
# Get all the menuentries grub shows
less /boot/grub/grub.cfg | grep menuentry
# Edit the file and replace the default with a menuentry. Something like that.
sudo vi /etc/default/grub
  GRUB_DEFAULT='Windows 10 (loader) (on /dev/sda1)'
  GRUB_DEFAULT='Windows Boot Manager (on /dev/sdb2)'
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

### /etc/fstab
# FSCK_FLAG is check order. should be 1 for /, 2,3,4 for others.
# 0 for those that don't need to be checked.
# DUMP_FLAG = enable file system dumping?

UUID=ID MOUNTPOINT FILESYSTEM MOUNT_OPTIONS DUMP_FLAG FSCK_FLAG
# Mount with label
LABEL=LABEL_NAME MOUNTPOINT FILESYSTEM MOUNT_OPTIONS DUMP_FLAG FSCK_FLAG

mount -a # mount /etc/fstab

########## Disk labels
# Add label xfs file systems
xfs_admin -L LABEL_NAME /dev/PARTITION
# Show label on xfs
xfs_admin -l /dev/PARTITION

# Label ext partitions
tune2fs -L LABEL_NAME /dev/PARTITION
tune2fs -l /dev/PARTITION

###### Edit grub stuff during boot.
# Change root user password
# boot and on grub choice menu press "e" for desirable OS version
# at "linux16" line, go to end and add "rd.break", to enter initramfs debug. ctrl + x
mount -oremount,rw /sysroot # remount the actual root drive as rw
chroot /sysroot # change root to sysroot
passwd root # change roots password
touch /.autolabel # necessary for selinux to relabel files
exit # go for reboot
exit



### GPT disk creation
gdisk /dev/DISK

### LVM
# Format disks as Linux LVM with gdisk:
gdisk /dev/DISK1
gdisk /dev/DISK2
# Prepare physical volumes
pvcreate /dev/DISK1 /dev/DISK2
pvdisplay
# create volume group
vgcreate VOLUME_GROUP_NAME /dev/DISK1 /dev/DISK2
# Create logical volume
lvcreate -n LOGICAL_VOLUME_NAME -L SIZE VOLUME_GROUP_NAME
# Display logical volumes
lvdisplay
# Then format the logical volume with mkfs
mkfs.ext4 /dev/LOGICAL_VOLUME_NAME
mount /dev/LOGICAL_VOLUME_NAME MOUNT_LOCATION

# Remove LVM related stuff
lvremove /dev/LOGICAL_VOLUME_NAME
vgremove VOLUME_GROUP_NAME
pvremove /dev/DISK1 /dev/DISK2
