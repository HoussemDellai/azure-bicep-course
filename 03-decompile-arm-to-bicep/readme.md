## Decompiling ARM templates into Bicep

This tutorial shows how to decompile ARM templates into Bicep language.  
This is helpful for these two scenarios:  
1) Organisations who have invested in ARM templates and wants to migrate into Bicep.  
2) Organisations not using Infra as Code yet and wants to get started easily and quickly.  

### Decompile an ARM template into Bicep using Bicep Playground (web app)  
Use the Bicep Playground to convert files 
https://bicepdemo.z22.web.core.windows.net/ 


### Decompile an ARM template into Bicep using Bicep CLI  

```shell
# Install Bicep CLI
az bicep install
```

```shell
# Decompile an ARM template into Bicep using Bicep CLI
az bicep decompile --file webapp.json
```

```shell
# Convert Bicep into ARM template using Bicep CLI
az bicep build --file webapp.bicep --outfile built-bicep.json
```

```shell
# Export an ARM template from Azure resources and decompile it into Bicep
az group export --name "your_resource_group_name" > exported.json
az bicep decompile --file exported.json
```

More resources:  
https://bicepdemo.z22.web.core.windows.net/  
https://docs.microsoft.com/en-us/azure/azure-resource-manager/bicep/decompile?tabs=azure-cli  
