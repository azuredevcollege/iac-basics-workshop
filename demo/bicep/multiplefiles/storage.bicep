@minLength(3)
@maxLength(11)
param prefix string = 'dev'
param location string = resourceGroup().location

// string interpolation instead of
// [format('data{0}', parameters('suffix'))]
var storageName = '${prefix}${take(uniqueString(resourceGroup().id), 4)}'

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    tier: 'Standard'
    name: 'Standard_LRS'
  }
}

output storageId string = stg.id

