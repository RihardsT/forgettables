### Setup RHEL automatically with kickstart
# For this to run, PXE server has to be running

/root/anaconda-ks.cfg # kickstart script

# Utility to help generate kickstart config
yum install system-config-kickstart

# Get kickstart docks
rpm -qd pykickstart

