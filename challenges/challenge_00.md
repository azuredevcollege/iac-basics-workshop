# Challenge_00 Setup your system

To be able to follow all the challenges provided in this workshop, you need a few prerequisites on your machine. This challenge is for setting up your system.

## Azure CLI

We will also be using the Azure command line interface to create and interact with reosurces running in Azure. To install it, go to <https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest> and choose your platform.

When finished, login to your Azure account from the command line:

```shell
$ az login
You have logged in. Now let us find all the subscriptions to which you have access...
```

A browser window will open, login to Azure and go back to the command prompt. Your active subscription will be shown as JSON, e.g.:

```json
{
  "cloudName": "AzureCloud",
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "isDefault": false,
  "name": "Your Subscription Name",
  "state": "Enabled",
  "tenantId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "user": {
    "name": "xxx@example.com",
    "type": "user"
  }
}
```

If you have multiple subscriptions, make sure your are working with the correct one!

```shell
$ az account show
{
  "cloudName": "AzureCloud",
  "id": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "isDefault": false,
  "name": "Your Subscription Name",
  "state": "Enabled",
  "tenantId": "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx",
  "user": {
    "name": "xxx@example.com",
    "type": "user"
  }
}
```

If that is not the correct one, follow the steps below:

```shell
$ az account list -o table
[the list of available subscriptions is printed]

$ az account set -s <SUBSCRIPTIONID_YOU_WANT_TO_USE>
```

## Visual Studio Code

To work with all the smaples provided in this workshop, you will need an IDE. To target a wide range of developers/architects, we will be using Visual Stduio Code as it runs cross-platform.

Therefore, go to <https://code.visualstudio.com/docs/setup/setup-overview> and install it on your machine.

### Useful Extensions

After the setup is complete. Open Visual Studio an open the "Extensions" sidebar:

![Visual Studio Extensions](./images/vscode_extensions.png "VS Code Extensions")

Search and install the following extensions:

- Azure Resources <https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-azureresourcegroups>
- Azure Resource Manager (ARM) Tools <https://marketplace.visualstudio.com/items?itemName=msazurermtools.azurerm-vscode-tools>

## git Version Control

The repository is located at github, so - obviously - we'll need a local git client to interact with the repo. Download and install the appropriate version of git for you here: <https://git-scm.com/download>

![git](./images/logo@2x.png)