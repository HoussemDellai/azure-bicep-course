# Azure Bicep course

Deploying resources into Azure using Bicep.

There are many tools to deploy resources into Azure:

Azure portal
Azure CLI or Azure Powershell module
Azure ARM templates
Azure Bicep
Terraform
Ansible
Pulumi
Chef, Puppet, etc.
Azure REST API
Azure portal is the simplest option to get started as it provides guidance on the UI. But it is not helpful with automation.

Azure CLI is also easy to get started with. Through simple commands and scripts we can automate the deployment of dozens of resources. But, knowing the current system state is bit hard.

Infrastructure as Code tools like ARM templates, Bicep and Terraform are using configuration files to deploy resources. This makes configuration be manageable through source control systems like Git. So cloud team members can collaborate together to push changes, create and review pull requests and save the history of configuration.

In this course, we will focus on deploying Azure resources using Bicep.

Sample Bicep template:

```bicep
param webAppName string = uniqueString(resourceGroup().id) // Generate unique String for web app name
param sku string = 'B1' // The SKU of App Service Plan
param linuxFxVersion string = 'php|7.4' // The runtime stack of web app
param location string = resourceGroup().location // Location for all resources

var appServicePlanName = toLower('AppServicePlan-${webAppName}')
var webSiteName = toLower('wapp-${webAppName}')

resource appServicePlan 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: sku
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource appService 'Microsoft.Web/sites@2020-06-01' = {
  name: webSiteName
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlan.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
}
```

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
