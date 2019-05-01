# virt-manager is gui tool
yum install virt-manager qemu-kvm qemu-img
yum install libvirt libvirt-python python-virtinst libvirt-client

systemctl enable libvirtd
systemctl start libvirtd

virsh # commandline tool
virt-manager # GUI tool

### Configure autostart on boot
virsh
  list --all
  autostart VM_NAME



### Alternate install commands via groupinstall
yum grouplist hidden # Show packages in group?
yum groupinstall "Virtualization GROUP_HERE?" # Client/Tools/Platform
