```bash
# deploy Bicep template using Azure CLI
az group create --name rg-bicep-webapp-021 --location westeurope

az deployment group what-if --resource-group rg-bicep-webapp-021 \
   --template-file webapp-linux.bicep \
   --parameters webAppName='bicep-021'
```

More templates are available here:
https://github.com/Azure/bicep/blob/main/docs/examples/