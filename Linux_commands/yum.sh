# Show available package versions
yum --showduplicates list PACKAGE | expand
# Install specific version
yum install PACKAGE-VERSION

# List installed packages
yum list installed | grep EXPRESSION

# Rebuild corrupted yum db
sudo rm -f /var/lib/rpm/__db*
sudo rpm --rebuilddb
sudo yum clean all
