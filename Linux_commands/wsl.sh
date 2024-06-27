# Symlink the mounted disk to some nice place. I like this:
ln -s /mnt/d /d


##### Move WSL. In CMD
wsl --list -v

wsl --export Ubuntu-18.04 d:\Other\WSL.tar
wsl --unregister Ubuntu-18.04
wsl --import Ubuntu-18.04 d:\Other\PC\WSL d:\Other\WSL.tar

# Useful WSL.conf settings
echo '[user]
default=rihards
[boot]
systemd=true
[network]
generateResolvConf = false
hostname = HOSTNAME
[interop]
appendWindowsPath = false' | sudo tee -a /etc/wsl.conf

# With generateResolvConf = false, set nameservers in /etc/resolv.conf
echo 'nameserver 1.1.1.1
nameserver 1.0.0.1' | sudo tee /etc/resolv.conf

### WSL provision, install some basic tools I like
sudo apt install -y tmux jq
