## deploy ARM template using Azure CLI

Prerequisites: you need to have the following:  

1) Azure subscription with Contributor role  
2) Azure CLI: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli  

```bash
# create resource group
az group create --name rg-arm-webapp-011 --location westeurope

# preview changes
az deployment group what-if --resource-group rg-arm-webapp-011 \
   --template-file webapp-linux.json \
   --parameters webAppName='arm-011'

# deploy the web app using Bicep
az deployment group create --resource-group rg-arm-webapp-011 \
   --template-file webapp-linux.json \
   --parameters webAppName='arm-011'
```

More templates are available here:
https://github.com/Azure/bicep/blob/main/docs/examples/  

More resources:  
https://docs.microsoft.com/en-us/azure/cloud-shell/features#deep-integration-with-open-source-tooling  
