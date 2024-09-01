##### Install
# Ubuntu
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# With package
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

##### Kubectl completion
echo "source <(kubectl completion bash)" >> ~/.bashrc

##### Copy files
kubectl cp NAMESPACE/POD_NAME:/FOLDER/FILE_NAME ./FILE_NAME

##### Restart container
# Kill the containers root process, to "force" restart
kubectl exec -ti POD -- sh -c 'kill 1'
# Scale down and up
kubectl scale deployment NAME --replicas=0 -n NAMESPACE
# Best one:
kubectl rollout restart deployment NAME -n NAMESPACE


##### Remove failed/evicted containers
kubectl -n NAMESPACE delete pods --field-selector=status.phase=Failed

##### Switch namespace
kubectl config set-context --current --namespace=NAMESPACE
kubectl config view | grep namespace

tee -a ~/.bash_aliases <<EOF
alias kns="kubectl config set-context --current --namespace"
alias kcg="kubectl config get-contexts"
alias k=kubectl
complete -o default -F __start_kubectl k
EOF

##### Things to check about Kubernetes aliases, etc
https://github.com/ahmetb/kubectx
https://github.com/bhakta0007/kube-alias
https://github.com/cykerway/complete-alias # A general one. Try this

# What I want is for example:
alias kns="kubectl config set-context --current --namespace"
# this to show potential namespaces, but looks like even the plain version
# doesn't offer that. Eh.
