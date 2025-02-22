https://github.com/containers/buildah
https://github.com/containers/skopeo

##### ContainerD
# Build with buildkit, make your life much more difficult with not using plain Docker
https://github.com/containerd/nerdctl
https://github.com/moby/buildkit


IMAGE_NAME="NAME"
sudo nerdctl run -d --env IMAGE_NAME=${IMAGE_NAME} --name buildkitd --privileged -v ${PWD}:/d -w /d moby/buildkit:latest
sudo nerdctl exec -ti buildkitd sh
buildctl build --frontend dockerfile.v0 --local context=. --local dockerfile=. --output type=oci,name=${IMAGE_NAME},dest=${IMAGE_NAME}.tar
exit
sudo nerdctl load -i ${IMAGE_NAME}.tar
sudo nerdctl rm -f buildkitd

# Silly alias for Kubernetes
tee -a .bashrc <<EOF
alias nerk="sudo nerdctl -n k8s.io"
alias nerdctl="sudo nerdctl"
source <(/usr/local/bin/nerdctl completion bash)
EOF

#####
https://github.com/kubernetes-sigs/cri-tools/blob/master/docs/crictl.md
crictl

### Easier with downloaded buildctl
buildctl_version=$(curl --silent "https://api.github.com/repos/moby/buildkit/releases/latest" | grep -Po "(?<=\"tag_name\": \").*(?=\")")
wget https://github.com/moby/buildkit/releases/download/${buildctl_version}/buildkit-${buildctl_version}.linux-amd64.tar.gz
tar -xvzf buildkit-${buildctl_version}.linux-amd64.tar.gz bin/buildctl
sudo cp bin/buildctl /usr/bin/buildctl

nerdctl run -d --name buildkitd --privileged moby/buildkit:latest
BUILD_IMAGE_NAME="NAME"
sudo buildctl --addr=nerdctl-container://buildkitd build --frontend dockerfile.v0 --local context=. --local dockerfile=. --output type=docker,name=${BUILD_IMAGE_NAME} | nerdctl load
