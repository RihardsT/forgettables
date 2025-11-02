# Build Signal AppImage
Given that there are some issues with installing/maintaining Signal
with zypper - update broke it some time ago - try building AppImage

https://github.com/signalapp/Signal-Desktop/blob/main/reproducible-builds/README.md
```shell
git checkout v7.77.1
git lfs install # sudo apt install git-lfs
# Append --linux AppImage to build:electron target
sed -i '/"build:electron.*/{s/",$/ --linux AppImage",/}' package.json | jq '.scripts."build:electron"'
cd reproducible-builds/
chmod +x ./build.sh
sudo ./build.sh public
# Copy the AppImage from ../releases
```
