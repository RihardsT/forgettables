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

Install VSCode
Nice that for Suse it's OSS version
https://en.opensuse.org/Visual_Studio_Code

```
sudo zypper ar -cf https://download.opensuse.org/repositories/devel:/tools:/ide:/vscode/openSUSE_Tumbleweed devel_tools_ide_vscode
sudo zypper in code

# Alternative - Zed editor
sudo zypper in zed
```

Brave browser
```
sudo zypper addrepo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo zypper install brave-browser
```

### Install Ansible
And then apply the playbook
```
sudo zypper install ansible
ansible-playbook ./laptop.yaml --diff
```
