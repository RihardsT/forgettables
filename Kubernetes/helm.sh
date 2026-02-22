### Install
# Ubuntu
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install apt-transport-https --yes
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm


### Helm list available releases
helm search repo REPO/CHART_NAME --versions

# Get stuff from the deployed helm
for item in $(helm list --no-headers | awk '{print $1}'); do
  echo "${item}"
  helm get values ${item} -a > helm_values_${item}
  helm get manifest ${item} > helm_manifest_${item}.yaml
  helm get all ${item} > helm_all_${item}.yaml
done



### Rollback
helm history RELEASE
helm rollback RELEASE REVISION
