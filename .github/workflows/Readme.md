Prerequites:
Create a Service Principal:

```bash
az ad sp create-for-rbac --name spn-azure-bicep-github --role contributor --scopes /subscriptions/<SUBSCRIPTION_ID> --sdk-auth
---------
output:
---------
{
  "clientId": "227271a6-xxx",
  "clientSecret": "Aw8l8Rxxx",
  "subscriptionId": "17b12858-xxx",
  "tenantId": "558506eb-xxx",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}
```

More resources:  
https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/deploy-github-actions?tabs=CLI
