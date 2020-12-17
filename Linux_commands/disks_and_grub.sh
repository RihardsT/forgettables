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

#### Extend partition
fdisk /dev/sda # /dev/sda2
p # list partitions
d
2
n
p
2


w

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

########## Set default kernel to boot into
# 0, 1, 2... 0 is the newest.
grub2-set-default 1

########## Swap
fallocate -l 4G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon -s

echo "/swapfile   none    swap    sw    0   0" | sudo tee --append /etc/fstab
# enable swap that are in /etc/fstab
swapon -a

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
## Change root user password
# boot and on grub choice menu press "e" for desirable OS version
# at "linux16" line, go to end and add "rd.break", to enter initramfs debug. ctrl + x
mount -oremount,rw /sysroot # remount the actual root drive as rw
chroot /sysroot # change root to sysroot
passwd root # change roots password
touch /.autolabel # necessary for selinux to relabel files
exit # go for reboot
exit
## Enter rescue mode
# boot and on grub choice menu press "e"
# at "linux16" line, go to end of line, append systemd target:
systemd.unit=rescue.target
# continue boot with ctrl + x

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
# Extend volume group
vgextend VOLUME_GROUP_NAME /dev/DISK3
#
vgdisplay
# Create logical volume
lvcreate -n LOGICAL_VOLUME_NAME -L SIZE VOLUME_GROUP_NAME
# Display logical volumes
lvdisplay
# Then format the logical volume with mkfs
mkfs.ext4 /dev/LOGICAL_VOLUME_NAME
mount /dev/LOGICAL_VOLUME_NAME MOUNT_LOCATION

# Move data from one physical lvm disk to another, in the same volume group
pvmove /dev/DISK1 # move away from DISK1
vgreduce VOLUME_GROUP_NAME /dev/DISK1 # Remove physical disk from volume group

# extend logical volume. can be -l+5G, -l+50%FREE and such
# -l+5GB to extend by 5G
# -L 5G to extend to total of 5G
lvextend -L 5G VOLUME_GROUP_NAME
lvextend -l+50%FREE VOLUME_GROUP_NAME
xfs_growfs MOUNT_LOCATION # for xfs filesystem
resize2fs MOUNT_LOCATION # for ext


# Remove LVM related stuff
lvremove /dev/LOGICAL_VOLUME_NAME
vgremove VOLUME_GROUP_NAME
pvremove /dev/DISK1 /dev/DISK2

##### LVM add new disk and move data from old disk to it. Replace disk basically
pvcreate /dev/DISK2
pvs # show volumes
# Add new disk's PV to VG
vgextend VOLUME_GROUP_NAME /dev/DISK2
# Move data from old disk to new one
pvmove /dev/DISK1 /dev/DISK2
# Remove the old disk from VG
vgreduce VOLUME_GROUP_NAME /dev/DISK1
# Resize LV if the new disk is larger than old one. If required.
lvextend --resizefs -l +100%FREE /dev/LOGICAL_VOLUME_NAME


### Disk check
# fsck can check unmounted partitions
fsck /dev/PARTITION
xfs_repair /dev/PARTITION # for xfs filesystem

# Dump info
dump2fs /dev/PARTITION
xfs_info /dev/PARTITION # for xfs filesystem


### Samba stuff
yum install -y samba-client cifs-utils nfs-utils
# List samba shares:
smbclient -L SERVER_IP
# Mount share
mount -t cifs -o username=USERNAME //SERVER_IP/SHARE_NAME MOUNT_LOCATION
mount -t nfs SERVER_IP:/SHARE_NAME MOUNT_LOCATION

/etc/fstab:
//SERVER_IP/SHARE_NAME MOUNT_LOCATION cifs username=USERNAME,password=PASSWORD 0 0
SERVER_IP:/SHARE_NAME MOUNT_LOCATION nfs defaults 0 0

# test that with
umount MOUNT_LOCATION
mount -a # mount /etc/fstab entries. Good for testing /etc/fstab.




### Boot logs - get into shell on boot and check boot logs, if you can. Dunno how
dmesg | more


### mount iso
mount -o loop ISO_FILE MOUNT_LOCATION




### Fix boot after installing windows over top
# On windows, with Secure boot enabled, run in admin CMD
bcdedit /set {bootmgr} path \EFI\ubuntu\shimx64.efi
# On windows, without Secure boot enabled, run in admin CMD
bcdedit /set {bootmgr} path \EFI\ubuntu\grubx64.efi

# Otherwise try to replace
sudo su
mv /boot/efi/EFI/Microsoft/Boot/bootmgfw.efi /boot/efi/EFI/Microsoft/Boot/bootmgfw_windows.efi
cp /boot/efi/EFI/ubuntu/grubx64.efi /boot/efi/EFI/Microsoft/Boot/bootmgfw.efi
sed -i 's#/EFI/Microsoft/Boot/bootmgfw.efi#/EFI/Microsoft/Boot/bootmgfw_windows.efi#g' /boot/grub/grub.cfg
# That should work.
# After Linux kernel updates sed command is enough. After windows updates do all 3 of them.
