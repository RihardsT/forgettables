
# First need to pull image
ctr images pull docker.io/library/IMAGE
# Run image
ctr run --rm -t docker.io/library/ubuntu:20.04 CONTAINER_NAME COMMAND

# Don't want to bother with running containerd as non-root user, dirty alias:
tee -a .bashrc <<EOF
alias ctr="sudo ctr"
EOF


ctr images pull docker.io/library/ubuntu:20.04
ctr run --rm -t docker.io/library/ubuntu:20.04 ubuntu bash

##### Show containers
# First find out namespaces
ctr namespaces list
# then show containers within the namespace
ctr -n k8s.io container list

##### Use CRIctl
# feels like docker, but only partially
crictl ps -a
