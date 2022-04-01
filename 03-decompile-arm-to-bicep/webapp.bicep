param webAppName string = uniqueString(resourceGroup().id)
param sku string = 'S1'
param linuxFxVersion string = 'php|7.4'
param location string = resourceGroup().location

var appServicePlanName_var = toLower('AppServicePlan-${webAppName}')
var webSiteName_var = toLower('wapp-${webAppName}')

resource appServicePlanName 'Microsoft.Web/serverfarms@2020-06-01' = {
  name: appServicePlanName_var
  location: location
  sku: {
    name: sku
  }
  kind: 'linux'
  properties: {
    reserved: true
  }
}

resource webSiteName 'Microsoft.Web/sites@2020-06-01' = {
  name: webSiteName_var
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlanName.id
    siteConfig: {
      linuxFxVersion: linuxFxVersion
    }
  }
}