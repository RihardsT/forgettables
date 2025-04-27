### Quick reference
```
sudo zypper refresh # refresh all repositories
sudo zypper update
```


### Cinnamon setup
https://en.opensuse.org/Portal:Cinnamon
```
sudo zypper ref
sudo zypper in -t pattern cinnamon
```

Install editor:
Nice that OpenSuse has VSCode OSS version https://en.opensuse.org/Visual_Studio_Code
```
sudo zypper ar -cf https://download.opensuse.org/repositories/devel:/tools:/ide:/vscode/openSUSE_Tumbleweed devel_tools_ide_vscode
sudo zypper in code

# Codium
# https://vscodium.com/

# Alternative - Zed editor
sudo zypper in zed
```

Brave browser
```
sudo zypper addrepo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo zypper install brave-browser
```

Kubectl:
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/#install-using-native-package-management

### OpenTofu:
https://opentofu.org/docs/intro/install/rpm/

### Install Ansible
And then apply the playbook
```
sudo zypper install ansible
ansible-playbook ./laptop.yaml --diff
```

### Signal
```
sudo zypper addrepo https://download.opensuse.org/repositories/network:im:signal/openSUSE_Tumbleweed/network:im:signal.repo
sudo zypper refresh
sudo zypper install signal-desktop
```


### Printer
Drivers.
https://www.canon-europe.com/support/consumer/products/printers/pixma/mg-series/pixma-mg3650s.html?type=drivers&language=EN&os=Linux%20(64-bit)
```
tar -xvf cnijfilter2-5.20-1-rpm.tar.gz
cd cnijfilter2-5.20-1-rpm
./install.sh
```
Then at least works with USB. Still have to figure out how to connect through Wifi

Check CUPS? http://localhost:631

https://en.opensuse.org/SDB:Printing_via_TCP/IP_network
