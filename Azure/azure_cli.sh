# Ensure that you have python, lol
# https://github.com/Azure/azure-cli
curl -L https://aka.ms/InstallAzureCli | bash
# or just
pip install -U azure

# Azure Xpat CLI
docker run --rm -it -v ${PWD}/:/d/ -w /d microsoft/azure-cli
# Or just don't bother with that and go with docker. Azure CLI 2
docker run --rm -it -v ${PWD}:/d -w /d azuresdk/azure-cli-python

######### Commands for azure-cli-python. Azure CLI 2
az login
az account set --subscription SUBSCRIPTION_ID
az group create -n "RESOURCE_GROUP" -l "REGION_NAME"
az group deployment create --template-file azuredeploy.json --resource-group RESOURCE_GROUP --verbose
# To use parameters file, add @ before it.
az group deployment create --template-file azuredeploy.json --parameters @azuredeploy.parameters.json --resource-group RESOURCE_GROUP --verbose



#########
https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-authenticate-service-principal-cli
https://docs.microsoft.com/en-us/azure/active-directory/role-based-access-built-in-roles#roles-in-azure


######### Linked templates
https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-linked-templates#complete-example


### List available vm images
az vm image list-skus -l westeurope -f CentOS -p OpenLogic

### List vm sizes available
az login
az vm list-sizes -l westeurope
