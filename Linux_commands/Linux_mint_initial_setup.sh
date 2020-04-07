# Initial linuxmint setup to my liking

sudo su
add-apt-repository ppa:git-core/ppa
apt-get purge -y hexchat transmission-* pidgin* xplayer* rhythmbox*
apt-get update
apt-get -y upgrade
apt-get install -y vim git chromium-browser audacious vlc keepass2 psensor
curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker rihards

### Automount a disk
lsblk -o NAME,SIZE,MOUNTPOINT,UUID
# Get your disks UUID
mkdir /media/1TB
echo "/dev/sdb1 /media/1TB ntfs-3g defaults,permissions 0 0" >> /etc/fstab
mount -a
# I have another ext4 partition
mkdir /media/ext
echo "/dev/sdb9 /media/ext ext4 defaults 0 0" >> /etc/fstab
mount -a
#
mkdir /Code
mkdir /home/rihards/Code
echo "/dev/sda8 /Code ext4 defaults 0 0" | sudo tee -a /etc/fstab
mount -a
chown rihards:rihards /Code
ln -s /Code /home/rihards/Code


# Git initial config
git config --global push.default matching
git config --global user.email "richitislv@gmail.com"
git config --global user.name "Rihards Teteris"
git config --global core.editor vim

cd /media/1TB
wget -O atom.deb https://atom.io/download/deb # Download Atom
dpkg -i atom.deb
wget -O vs_code.deb https://go.microsoft.com/fwlink/?LinkID=760868 # Download VS Code
dpkg -i vs_code.deb

### Use alternate DNS server
# https://superuser.com/questions/677343/how-to-make-name-server-address-permanent-in-etc-resolv-conf#677414
# https://www.computerworlduk.com/security/best-free-dns-services-2018-3632790/
# https://1.1.1.1/
sudo mkdir -p /etc/resolvconf/resolv.conf.d
echo "nameserver 1.0.0.1" | sudo tee /etc/resolvconf/resolv.conf.d/head

ping -c 1 1.1.1.1 # ping to confirm DNS change

### On laptop, disable sleep on lid closed
echo "HandleLidSwitch=ignore" | sudo tee --append /etc/systemd/logind.conf

### AMD driver installation
# https://linuxconfig.org/getting-the-rx-480-running-with-amdgpu-on-linux
# Read the awesome stuff given in this ppa:
# https://launchpad.net/~paulo-miguel-dias/+archive/ubuntu/mesa
sudo add-apt-repository ppa:paulo-miguel-dias/mesa
sudo apt-get update
sudo apt-get install -V mesa-opencl-icd
sudo apt-get install libdrm-amdgpu1 libdrm2 xserver-xorg-video-amdgpu

# https://askubuntu.com/questions/975277/cannot-extract-amdgpu-tar-xz
# Download with wget and note the http as https give corrupt file
wget --referer http://support.amd.com http://www2.ati.com/drivers/linux/ubuntu/amdgpu-pro-17.50-511655.tar.xz
tar -xvf amdgpu-pro-17.50-511655.tar.xz
# Because Linux Mint is like ubuntu
sed -i 's/$ID/$ID_LIKE/g' amdgpu-pro-install
./amdgpu-pro-install
sudo usermod -a -G video $LOGNAME
groups

# Either way, drivers either on Cinnamon or on Linux Mint in general doesn't work with my RX470.

### Windows 10 stuff for dual boot
# Control Panel -> Power Options -> Choose what the power buttons do -> Disable fast start-up




##### Audio hack for my broken audio jack
sudo apt-get install alsa-tools-gui
hdajackretask
# "Black Mic, Right side" Override to Line Out(Front)
# If Audacious is playing, restart it, or go to Output -> Audio Settings, click output plugin
