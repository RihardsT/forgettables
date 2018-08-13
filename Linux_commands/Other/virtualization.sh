# virt-manager is gui tool
yum install virt-manager qemu-kvm qemu-img
yum install libvirt libvirt-python python-virtinst libvirt-client

systemctl enable libvirtd
systemctl start libvirtd

virsh # commandline tool