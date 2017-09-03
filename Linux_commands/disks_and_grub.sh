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


###
lsblk -o NAME,SIZE,MOUNTPOINT,UUID