# Show available package versions
yum --showduplicates list PACKAGE | expand
# Install specific version
yum install PACKAGE-VERSION

# List installed packages
yum list installed | grep EXPRESSION
yum list installed httpd # specific package name

# Rebuild corrupted yum db
sudo rm -f /var/lib/rpm/__db*
sudo rpm --rebuilddb
sudo yum clean all

# Install obsolete package
yum --setopt=obsoletes=0 install PACKAGE-VERSION


###
rpm -qc PACKAGE # queue (-q) package configuration (-c) files

###
yum check-update
yum search EXPRESSION # searches description, details
yum search all EXPRESSION # searches in package name, summary, description, details, url
yum provides /var/www # Search what packages create the file/folder
yum update PACKAGE
yum remove PACKAGE
yum list all
yum clean all # clean cache



### RPM
yumdownloader PACKAGE # download package from yum repository

rpm -ivh # -v verbose, -h progress bar
-i # install
-U # upgrade

rpm -e PACKAGE # remove package

rpm -qa # query all installed packages
rpm -qa PACKAGE # query all, search single package
rpm -ql PACKAGE # list files that were created by install

rpm -qd PACKAGE # query documentation in RPM

yum localinstall PACKAGE # also takes care of dependencies an such
# ^^ might be preferable, rather than rpm -i


### Repositories
# Edit the reposories in the folder
/etc/yum.repos.d/

yum repolist all # list also disabled repos

yum-config-manager --disable REPO_ID


### Local repo
vi /etc/yum.repos.d/local.repo
[local]
name=Local Repo
baseurl=file://LOCAL_REPO_LOCATION
enabled=1
gpgcheck=0


### GPG keys
yum-config-manager --add-repo REPO_URL
# Get GPG key
cd /etc/pki/rpm-gpg/
wget GPG_KEY_FROM_REPO
# get full path of the downloaded gpg key
vi /etc/yum.repos.d/REPO
  gpgcheck=1
  gpgkey=file://FULL_PATH_TO_KEY


### Kernel update
uname -r # check kernel
yum clean all # clean repositories
yum list kernel

yum install linux-firmware # dependency
yumdownloader kernel
rpm -ivh KERNEL_PACKAGE

dracut # command to regenerate vmlinuz image for latest kernel if it's not there?
