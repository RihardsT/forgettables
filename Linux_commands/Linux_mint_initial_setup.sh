# Use the Ansible approach instead!

# Initial linuxmint setup to my liking

sudo su
add-apt-repository ppa:git-core/ppa
apt-get purge -y hexchat transmission-* pidgin* xplayer* rhythmbox*
apt-get update
apt-get -y upgrade
apt-get install -y vim git chromium-browser audacious vlc keepass2 psensor sysstat
# curl -fsSL https://get.docker.com/ | sh
# sudo usermod -aG docker rihards
# Podman
VERSION_ID=20.04
echo "deb https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /" | sudo tee /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list
curl -L https://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/Release.key | sudo apt-key add -
sudo apt-get update -qq
sudo apt-get -qq -y install podman

# Change Podman storage path
mkdir -p /media/500GB/containers/run
mkdir /media/500GB/containers/graph
mkdir ~/.config/containers/
vi ~/.config/containers/storage.conf
# And take the file from Containers/podman_config.conf

### Automount a disk
lsblk -o NAME,SIZE,MOUNTPOINT,UUID
# Get your disks UUID
mkdir /media/1TB
echo "/dev/sdb1 /media/1TB ntfs-3g defaults,permissions,nofail 0 0" >> /etc/fstab
mount -a

/dev/sdb1 /media/1TB ntfs-3g defaults,lazytime,uid=1000,gid=1000,dmask=007,fmask=117,big_writes,nofail,x-systemd.requires=multi-user.target,auto

# I have another ext4 partition
mkdir /media/data
echo "/dev/sdb2 /media/data ext4 defaults,nofail 0 0" >> /etc/fstab
mount -a

# Stac
mkdir /media/1TB
echo "/dev/sda5 /media/1TB ntfs-3g defaults,permissions,nofail 0 0" >> /etc/fstab
mount -a
mkdir /media/nvme
echo "/dev/nvme0n1p5 /media/nvme ext4 defaults,nofail 0 0" >> /etc/fstab
mount -a

#
ln -s /media/nvme/Code/ Code

# Git initial config
git config --global push.default matching
git config --global user.email "rudenspavasaris@proton.me"
git config --global user.name "Rihards"
git config --global core.editor vim
git config --global pull.ff only
ssh-keygen -t ed25519 -C $(cat /etc/hostname)
cat ~/.ssh/id_ed25519.pub

# VSCodium
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg \
    | gpg --dearmor \
    | sudo dd of=/usr/share/keyrings/vscodium-archive-keyring.gpg
echo 'deb [ signed-by=/usr/share/keyrings/vscodium-archive-keyring.gpg ] https://download.vscodium.com/debs vscodium main' \
    | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt update && sudo apt install codium

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




###########
gsettings list-recursively


##### Things that can be done in Welcome screen
### Desktop colours
gsettings set org.cinnamon.desktop.interface icon-theme 'Mint-Y'
gsettings set org.cinnamon.theme name 'Mint-Y-Dark'
gsettings set org.x.apps.portal color-scheme 'prefer-dark'
org.cinnamon.desktop.interface cursor-theme 'DMZ-White'
# gsettings set org.cinnamon.desktop.interface gtk-theme 'Mint-Y-Dark'
### Panel Layout: Traditional
gsettings set org.cinnamon app-menu-label 'Menu'
gsettings set org.cinnamon panels-height "['1:27']"
gsettings set org.cinnamon panel-zone-icon-sizes '[{"panelId": 1, "left": 0, "center": 0, "right": 0}]'
# gsettings set org.cinnamon enabled-applets "['panel1:left:0:menu@cinnamon.org:30', 'panel1:left:1:show-desktop@cinnamon.org:31', 'panel1:left:2:panel-launchers@cinnamon.org:32', 'panel1:left:3:window-list@cinnamon.org:33', 'panel1:right:0:systray@cinnamon.org:34', 'panel1:right:1:xapp-status@cinnamon.org:35', 'panel1:right:2:keyboard@cinnamon.org:36', 'panel1:right:3:notifications@cinnamon.org:37', 'panel1:right:4:printers@cinnamon.org:38', 'panel1:right:5:removable-drives@cinnamon.org:39', 'panel1:right:6:favorites@cinnamon.org:40', 'panel1:right:7:user@cinnamon.org:41', 'panel1:right:8:network@cinnamon.org:42', 'panel1:right:9:sound@cinnamon.org:43', 'panel1:right:10:power@cinnamon.org:44', 'panel1:right:11:calendar@cinnamon.org:45']"
# gsettings set org.cinnamon next-applet-id 46
### Background image
gsettings set org.cinnamon.desktop.background picture-uri 'file:///usr/share/backgrounds/linuxmint-vera/aburden_grass.jpg'

##### In Settings.
# Privacy:
gsettings set org.cinnamon.desktop.privacy remember-recent-files false

### Disable effects
gsettings set org.cinnamon startup-animation false
gsettings set org.cinnamon desktop-effects-workspace false
gsettings set org.cinnamon enable-vfade false

##### Add applet
# Places Center

gsettings set org.cinnamon enabled-applets "['panel1:left:0:menu@cinnamon.org:78', 'panel1:right:12:show-desktop@cinnamon.org:79', 'panel1:left:2:panel-launchers@cinnamon.org:80', 'panel1:left:4:window-list@cinnamon.org:81', 'panel1:right:1:systray@cinnamon.org:82', 'panel1:right:2:xapp-status@cinnamon.org:83', 'panel1:right:3:keyboard@cinnamon.org:84', 'panel1:right:4:notifications@cinnamon.org:85', 'panel1:right:5:printers@cinnamon.org:86', 'panel1:right:7:favorites@cinnamon.org:88', 'panel1:right:8:user@cinnamon.org:89', 'panel1:right:9:network@cinnamon.org:90', 'panel1:right:10:sound@cinnamon.org:91', 'panel1:right:11:power@cinnamon.org:92', 'panel1:right:12:calendar@cinnamon.org:93', 'panel1:left:3:placesCenter@scollins:94']"

gsettings set org.cinnamon next-applet-id 95

##### List view
gsettings set org.nemo.preferences default-folder-viewer 'list-view'
gsettings set org.nemo.list-view default-visible-columns ['name', 'size']
gsettings set org.nemo.list-view default-column-order ['name', 'size', 'type', 'date_modified', 'date_created_with_time', 'date_accessed', 'date_created', 'detailed_type', 'group', 'where', 'mime_type', 'date_modified_with_time', 'octal_permissions', 'owner', 'permissions']

#### Desktop
gsettings set psensor interface-window-h 282
gsettings set psensor interface-window-y 197
gsettings set psensor interface-hide-on-startup true
gsettings set psensor interface-window-divider-pos 362
gsettings set psensor interface-window-w 772
gsettings set psensor interface-window-x 121
gsettings set org.nemo.desktop computer-icon-visible false
gsettings set org.nemo.desktop volumes-visible false
gsettings set org.nemo.desktop home-icon-visible false

### Sound
gsettings set org.cinnamon.desktop.sound volume-sound-enabled false
gsettings set org.cinnamon.sounds plug-enabled false
gsettings set org.cinnamon.sounds unplug-enabled false
gsettings set org.cinnamon.sounds switch-enabled false
gsettings set org.cinnamon.sounds login-enabled false
gsettings set org.cinnamon.sounds logout-enabled false
gsettings set org.cinnamon.sounds tile-enabled false

# Favovites
gsettings set org.cinnamon favorite-apps "['firefox.desktop']"

# Ignored System reports
gsettings set com.linuxmint.report ignored-reports "['install-language-packs', 'install-media-codecs']"

# Remove from home
cd
rmdir Documents/ Music/ Pictures/ Public/ Public/ Templates/ Videos/

# Customize Menu: TODO
# vi  ~/.config/cinnamon/spices/menu@cinnamon.org/*.json

##### Updates and install
sudo apt update && sudo apt upgrade -y
sudo apt install python3-pip

##### GAMES!
sudo add-apt-repository ppa:lutris-team/lutris
sudo apt update && sudo apt install -y lutris
