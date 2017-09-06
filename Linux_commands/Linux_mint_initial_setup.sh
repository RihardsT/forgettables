# Initial linuxmint setup to my liking

sudo su
apt-get update
apt-get -y upgrade
apt-get purge -y hexchat transmission-* pidgin* xplayer* rhythmbox*
apt-get install -y vim git chromium-browser audacious vlc keepass2
curl -fsSL https://get.docker.com/ | sh
sudo usermod -aG docker rihards

### Automount a disk
lsblk -o NAME,SIZE,MOUNTPOINT,UUID
# Get your disks UUID
mkdir /media/1TB
mount /dev/sda5 /media/1TB
UUID=SUBSTITUTE_WITH_YOUR_UUID_RIGHT_HERE_IF_YOU_WANT
echo "UUID=${UUID} /media/1TB ntfs-3g defaults,permissions 0 0" >> /etc/fstab

# Git initial config
git config --global push.default matching
git config --global user.email "richitislv@gmail.com"
git config --global user.name "Rihards Teteris"
git config --global core.editor vim

cd /media/1TB
wget https://atom.io/download/deb # Download Atom
dpkg -i deb # Probably this works. Dunno
wget https://go.microsoft.com/fwlink/?LinkID=760868 # Download VS Code

### AMD driver installation
# Because Linux Mint is like ubuntu
sed -i 's/$ID/$ID_LIKE/g' amdgpu-pro-install
./amdgpu-pro-install

### Windows 10 stuff for dual boot
# Control Panel -> Power Options -> Choose what the power buttons do
