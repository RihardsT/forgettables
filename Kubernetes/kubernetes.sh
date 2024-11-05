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


##### Do command on multiple pods with grep
kubectl delete pod $(kubectl get pods --no-headers -o custom-columns=":metadata.name" | grep PODS)

##### Remove failed/evicted containers
kubectl -n NAMESPACE delete pods --field-selector=status.phase=Failed

##### Switch namespace
kubectl config set-context --current --namespace=NAMESPACE
kubectl config view | grep namespace

##### Aliases
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

##### Secrets
# Get
k get secrets nextcloud-password --template={{.data.db_password}} | sed 's/ /\n/g' | base64 -d
k get secrets nextcloud-password -o jsonpath="{.data.*}" | sed 's/ /\n/g' | base64 -d
k get secrets nextcloud-password -o json | jq '.data | map_values(@base64d)'

### Create
# This one creates with \n in the end, because the file saved with \n in the end
kubectl create secret generic nextcloud-password --from-file=Secrets/db_password --from-file=Secrets/nc_admin_password
# You can confirm that the secret is incorrect with this:
k get secrets nextcloud-password -o json | jq '.data | map_values(@base64d)'
# Thus create secret from literal by outputting the file:
kubectl create secret generic nextcloud-password --from-literal=db_password=$(cat Secrets/db_password) --from-literal=nc_admin_password=$(cat Secrets/nc_admin_password)
