# Symlink the mounted disk to some nice place. I like this:
ln -s /mnt/d /d


##### Move WSL. In CMD
wsl --list -v

wsl --export Ubuntu-18.04 d:\Other\WSL.tar
wsl --unregister Ubuntu-18.04
wsl --import Ubuntu-18.04 d:\Other\PC\WSL d:\Other\WSL.tar

# In WSL
echo "[user]
default=rihards" > /etc/wsl.conf
