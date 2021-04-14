@minLength(5)
@maxLength(22)
param storageName string
param location string = resourceGroup().location

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageName
  location: location
  kind: 'Storage'
  sku: {
    tier: 'Standard'
    name: 'Standard_LRS'
  }
}

output storageId string = stg.id // like resourceId(...)

// az deployment group create --name demo01 --resource-group BICEP-RG --template-file ./main.json --parameters storageName=anm2341
