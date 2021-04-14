
@minLength(3)
@maxLength(6)
param prefix string = 'dev'

var location = resourceGroup().location

module storage './storage.bicep' = {
  name: 'storageDeploy'
  params: {
    location: location
    prefix: prefix
  }
}

module vnet './vnet.bicep' = {
  name: 'vnetDeploy'
  params: {
    location: location
    prefix: prefix
  }
}

output storageId string = storage.outputs.storageId
output vnetId string = vnet.outputs.vnetId

// az deployment group create --name demo01 --resource-group BICEP-RG --template-file ./main.json --parameters suffix=anmdev
