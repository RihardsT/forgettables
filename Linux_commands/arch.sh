######### pacman
# install package
pacman -S PACKAGE_NAME

# Update all packages
pacman -Syu



##### Update CA certs
sudo trust extract-compat


##### Install something from AUR - Arch User Repository
https://aur.archlinux.org/packages/ for your package
Download the git repo
cd REPO
makepkg -cs
sudo pacman -U PACKAGE.tar.gz

### Use helpers? yaourt or yay?
