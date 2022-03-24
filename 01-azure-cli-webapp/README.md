## Deploying resources into Azure using the command line

There are many tools to deploy resources into Azure:  

1) Azure portal
2) Azure CLI or Azure Powershell module
3) Azure ARM templates
4) Azure Bicep
5) Terraform
6) Ansible
7) Pulumi
8) Chef, Puppet, etc.
9) Azure REST API

Azure portal is the simplest option to get started as it provides guidance on the UI. But it is not helpful with automation.

Azure CLI is also easy to get started with. Through simple commands and scripts we can automate the deployment of dozens of resources. But, knowing the current system state is bit hard.

Infrastructure as Code tools like ARM templates, Bicep and Terraform are using configuration files to deploy resources. This makes configuration be manageable through source control systems like Git. So cloud team members can collaborate together to push changes, create and review pull requests and save the history of configuration. 

In this lab, we will deploy an Azure resource using the CLI.

```bash
# create a resource group
az group create -n rg-azure-cli-webapp -l westeurope
# create an app service plan
az appservice plan create --name azure-cli-plan \
   --resource-group rg-azure-cli-webapp \
   --is-linux \
   --sku B1
# create app service
az webapp create --name azure-cli-webapp-011 \
                 --resource-group rg-azure-cli-webapp \
                 --plan azure-cli-plan \
                 --runtime "JAVA:11-java11"
# view the created resources
az resource list --resource-group rg-azure-cli-webapp -o table
# show web app URL
az webapp show --name azure-cli-webapp-011 \
   --resource-group rg-azure-cli-webapp \
   --query hostNames[0]
```

```bash
# cleanup the resources
az group delete -n rg-azure-cli-webapp
```

More resources:  
https://docs.microsoft.com/en-us/cli/azure/webapp?view=azure-cli-latest#az-webapp-create  
