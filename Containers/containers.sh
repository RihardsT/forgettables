https://github.com/containers/buildah
https://github.com/containers/skopeo

##### ContainerD
# Build with buildkit, make your life much more difficult with not using plain Docker
https://github.com/containerd/nerdctl
https://github.com/moby/buildkit

sudo nerdctl run -d --name buildkitd --privileged -v ${PWD}:/d -w /d moby/buildkit:latest
sudo nerdctl exec -ti buildkitd sh
IMAGE_NAME="NAME"
buildctl build --frontend dockerfile.v0 --local context=. --local dockerfile=. --output type=oci,name=${IMAGE_NAME},dest=${IMAGE_NAME}.tar
exit
sudo nerdctl load -i IMAGE_NAME.tar
sudo nerdctl rm -f buildkitd

#####
https://github.com/kubernetes-sigs/cri-tools/blob/master/docs/crictl.md
crictl
