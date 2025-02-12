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

OpenTofu:
https://opentofu.org/docs/intro/install/rpm/

### Install Ansible
And then apply the playbook
```
sudo zypper install ansible
ansible-playbook ./laptop.yaml --diff
```
