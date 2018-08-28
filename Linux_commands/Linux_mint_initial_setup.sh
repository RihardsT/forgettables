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
UUID=SUBSTITUTE_WITH_YOUR_UUID_RIGHT_HERE_IF_YOU_WANT
echo "UUID=${UUID} /media/ext ext4 defaults 0 0" >> /etc/fstab

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
