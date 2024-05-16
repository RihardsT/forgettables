##### Install
# Ubuntu
sudo apt-get update && sudo apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# General
curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl


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

tee -a ~/.bashrc <<EOF
alias kns="kubectl config set-context --current --namespace"
EOF


##### Kubens - tool to easily switch namespaces
https://github.com/ahmetb/kubectx
