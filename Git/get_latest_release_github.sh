https://gist.github.com/lukechilds/a83e1d7127b78fef38c2914c4ececc3c

##### Bash
REPO="containerd/nerdctl"
LATEST_VERSION=$(curl --silent "https://api.github.com/repos/${REPO}/releases/latest" | grep '"tag_name":' | sed -E 's/.*"([^"]+)".*/\1/')

### Get latest download for linux amd64
# Example with nerdctl
REPO="containerd/nerdctl"
LATEST_ASSET_URL=$(curl --silent "https://api.github.com/repos/${REPO}/releases/latest" | grep '"browser_download_url":' | sed -E 's/.*"([^"]+)".*/\1/' | grep 'linux.*amd64' | grep -v 'full')
wget ${LATEST_ASSET_URL}

LATEST_ASSET_FILENAME=$(echo ${LATEST_ASSET_URL} | sed -n -e 's#.*/##p')

# Show contents
tar -tf ${LATEST_ASSET_FILENAME}

EXTRACT_SINGLE="nerdctl"
tar -xvzf ${LATEST_ASSET_FILENAME} ${EXTRACT_SINGLE}
sudo cp ${EXTRACT_SINGLE} /usr/bin/${EXTRACT_SINGLE}

# Extract all files
tar -xvzf ${LATEST_ASSET_FILENAME}
