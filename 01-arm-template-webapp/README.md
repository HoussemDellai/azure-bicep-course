## deploy ARM template using Azure CLI

```bash
# create resource group
az group create --name rg-bicep-webapp-011 --location westeurope

# preview changes
az deployment group what-if --resource-group rg-bicep-webapp-011 \
   --template-file webapp-linux.json \
   --parameters webAppName='bicep-011'

# deploy the web app using Bicep
az deployment group create --resource-group rg-bicep-webapp-011 \
   --template-file webapp-linux.json \
   --parameters webAppName='bicep-011'
```

More templates are available here:
https://github.com/Azure/bicep/blob/main/docs/examples/