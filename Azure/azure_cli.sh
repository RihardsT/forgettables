# Ensure that you have python, lol
# https://github.com/Azure/azure-cli
curl -L https://aka.ms/InstallAzureCli | bash
# or just
pip install -U azure

# Azure Xpat CLI
docker run --rm -it -v ${PWD}/:/d/ microsoft/azure-cli
# Or just don't bother with that and go with docker. Azure CLI 2
docker run --rm -it -v ${PWD}:/d azuresdk/azure-cli-python

######### Commands for azure-cli-python. Azure CLI 2
az login
az account set --subscription SUBSCRIPTION_ID
az group create -n "RESOURCE_GROUP" -l "REGION_NAME"
az group deployment create --template-file azuredeploy.json --resource-group RESOURCE_GROUP --verbose
# To use parameters file, add @ before it.
az group deployment create --template-file azuredeploy.json --parameters @azuredeploy.parameters.json --resource-group RESOURCE_GROUP --verbose
