# Initial linuxmint setup to my liking

sudo su
apt-get update
apt-get -y upgrade
apt-get purge -y hexchat transmission-* pidgin* xplayer* rhythmbox*
apt-get install -y vim git chromium-browser audacious vlc

### Automount a disk
lsblk -o NAME,SIZE,MOUNTPOINT,UUID
# Get your disks UUID
mkdir /media/1TB
mount /dev/sda5 /media/1TB
echo "UUID=YOUR_UUID_GOES_RIGHT_HERE /media/1TB ntfs-3g defaults 0 0" >> /etc/fstab



### AMD driver installation
# Because Linux Mint is like ubuntu
sed -i 's/$ID/$ID_LIKE/g' amdgpu-pro-install
./amdgpu-pro-install

### Windows 10 stuff for dual boot
# Control Panel -> Power Options -> Choose what the power buttons do
