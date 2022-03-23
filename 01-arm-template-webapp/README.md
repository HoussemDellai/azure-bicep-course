```bash
# deploy ARM template using Azure CLI
az group create --name rg-bicep-webapp-021 --location westeurope

az deployment group what-if --resource-group rg-bicep-webapp-021 \
   --template-file webapp-linux.json \
   --parameters webAppName='bicep-021'
```