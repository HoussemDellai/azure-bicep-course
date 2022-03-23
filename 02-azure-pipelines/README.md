# Azure Bicep course

Sample demo for CI/CD for Azure Bicep using Azure DevOps Pipelines.

```yaml
name: Deploy Bicep files

trigger:
- main

variables:
  resourceGroupName: 'rg-bicep-demo-0017'
  location: 'westeurope'
  webAppName: 'bicep0017'
  templateFile: '01-bicep-webapp/webapp-linux.bicep'

pool:
  vmImage: 'ubuntu-latest'

steps:

- task: AzureCLI@2
  displayName: Preview Bicep Changes
  inputs:
    azureSubscription: 'Microsoft-Azure-0(17b12858-3960-4e6f-a663-a06fdae23428)'
    scriptType: 'bash'
    scriptLocation: 'inlineScript'
    inlineScript: |
      az --version
      az group create --name $(resourceGroupName) --location $(location)
      az deployment group what-if --resource-group $(resourceGroupName) \
         --template-file $(templateFile) \
         --parameters webAppName=$(webAppName)

- task: AzureCLI@2
  displayName: Deploy Bicep To Azure
  inputs:
    azureSubscription: 'Microsoft-Azure-0(17b12858-3960-4e6f-a663-a06fdae23428)'
    scriptType: 'bash'
    scriptLocation: 'inlineScript'
    inlineScript: |
      az deployment group create --resource-group $(resourceGroupName) \
         --template-file $(templateFile) \
         --parameters webAppName=$(webAppName)
```

CI/CD implemented in Azure DevOps Pipelines: https://dev.azure.com/houssemdellai/Azure-Bicep-Course

More resources:  
https://docs.microsoft.com/en-us/azure/azure-resource-manager/templates/test-toolkit  
https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/linter  
https://github.com/Azure/arm-ttk  
https://docs.microsoft.com/en-us/learn/modules/arm-template-test/2-test-toolkit  
https://docs.microsoft.com/en-us/azure/devops/pipelines/tasks/utility/manual-validation?view=azure-devops&tabs=yaml  
