# Install dependencies when dpkg -i failed
apt-get install -f

# list package versions
apt list -a PACKAGE

# Install specific version
apt-get install PACKAGE=VERSION


### Search for available packages
apt-cache search keyword

### convert rpm or other packages to deb
alien
