## Deploy Bicep template using Azure CLI

```bash
# create resource group
az group create --name rg-bicep-webapp-013 --location westeurope

# preview changes
az deployment group what-if --resource-group rg-bicep-webapp-013 \
   --template-file webapp-linux.bicep \
   --parameters webAppName='bicep-013'

# deploy the web app using Bicep
az deployment group create --resource-group rg-bicep-webapp-013 \
   --template-file webapp-linux.bicep \
   --parameters webAppName='bicep-013'
```

More templates are available here:
https://github.com/Azure/bicep/blob/main/docs/examples/
