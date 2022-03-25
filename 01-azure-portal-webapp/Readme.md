## Deploying resources into Azure using the portal

This lab will guide you through deploying a web app into Azure using the portal. You will need to have an Azure subscription with Contributor role.

Go to the Azure portal: https://portal.azure.com  
Select Create a resource.  

<img src="images\01-create-resource.png">

Choose Web App. 

<img src="images\02-choose-webapp.png">

Fill the template with the following parameters:  
1) Web app resource group  
2) Web app name (should be usinque across all Azure instances)  
3) Choose the application runtime, Java 11 for example.  
4) Choose the App Service Plan name.  

<img src="images\03-basics-webapp-p1.png">
<img src="images\03-basics-webapp-p2.png">

Then continue with the default configuration to create the resources. Click the Create button.  
In a few seconds, the resources should be created with a link to view them.  

<img src="images\04-created-resources.png">

