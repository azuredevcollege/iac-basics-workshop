# Challenge_03 Create and deploy your first ARM Template

In this challenge we want to deploy our first ARM template. To keep things as simple as possible an ARM Template which describes an Azure Storage Account is already prepared for you. 

Open a shell and navigate to the **iac-basics-workshop** folder on your local machine and open VS Code:

```shell
>code .
```

## Add a parameter and reference it

You can find the template under **challenges/templates/challenge_03/storage.json**. Open the file and have a look at it. 
The template is a static one, because no parameters can be passed during deployment time. 
We will now add a parameter that will allow us to set the name of the storage account at deployment time. 
If you have installed the ARM template extension correctly, it will help you to add and reference the parameter.

Add the parameter ...
```json
  "parameters": {
    "storageAccountName": {
      "type": "string",
      "metadata": {
        "description": "description"
      }
    }
  }
```

... and reference it.

```json
"name": "[parameters('storageAccountName')]",
```

## Deploy the ARM Template to Azure

To deploy the ARM Template we need to login to Azure first. Use the Azure CLI and the **login** command to authenticate:

```Shell
az login
```

After you have logged in, check if we use the right Azure subscription:

```Shell
az account show -o table
```

If you ar not connected to the right subscription use the **account set** command and specify the id of the desired Azure subscription:

```Shell
az account set -s <your subscription id>
```

Create a resource group with the **group create** command:

```Shell
az group create -n <RG name> -l <location>
```

Now we can deploy the ARM Template, but of course we want to see what changes the template would cause.
With the Azure CLI **deployment group create** comannd we can deploy the template to an Azure resource group and with the parameter **--confirm-with-what-if** we can first check what will happen if we deploy the template:

```Shell
az deployment group create -n demo01 -g <RG name>  --template-file ./storage.json --parameters storageAccountName=<your name> --confirm-with-what-if
```

This call will output the following:

```Shell
Resource and property changes are indicated with this symbol:
  + Create

The deployment will update the following scope:

Scope: /subscriptions/<id>/resourceGroups/<rg>

  + Microsoft.Storage/storageAccounts/anm4211 [2019-06-01]

      apiVersion: "2019-06-01"
      id:         "/subscriptions/<id>/resourceGroups/<rg>/providers/Microsoft.Storage/storageAccounts/<name>"
      kind:       "StorageV2"
      location:   "westeurope"
      name:       "<name>"
      sku.name:   "Standard_LRS"
      type:       "Microsoft.Storage/storageAccounts"

Resource changes: 1 to create.

Are you sure you want to execute the deployment? (y/n): n
```

If you are happy with the changes enter 'y' and start the deployment.

## Check the deployment

Now navigate to the Azure Portal, go to your Resource Group and you will see that the Storage Account is there.

## Housekeeping

Before we go on to the next challenge, delete your resource group using Azure CLI and the **group delete** command:

```Shell
az group delete -n <RG name>
```