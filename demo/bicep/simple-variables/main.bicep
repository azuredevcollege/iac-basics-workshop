@minLength(3)
@maxLength(11)
param storageAccountPrefix string = 'dev'

// string interpolation instead of
// "[format('{0}{1}', parameters('storageAccountPrefix'), take(uniqueString(resourceGroup().id), 4))]"
var storageName = '${storageAccountPrefix}${take(uniqueString(resourceGroup().id), 4)}'
var location = resourceGroup().location

resource stg 'Microsoft.Storage/storageAccounts@2019-06-01' = {
  name: storageName
  location: location
  kind: 'StorageV2'
  sku: {
    tier: 'Standard'
    name: 'Standard_LRS'
  }
}

// instead of resourceId reference
// [resourceId('Microsoft.Storage/storageAccounts', variables('storageName'))]"
output storageId string = stg.id

