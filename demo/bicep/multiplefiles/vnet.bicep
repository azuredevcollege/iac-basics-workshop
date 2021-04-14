
param prefix string = 'dev'
param location string = resourceGroup().location

var vnetname = '${prefix}${take(uniqueString(resourceGroup().id), 4)}'

resource vnet 'Microsoft.Network/virtualNetworks@2020-06-01' = {
  name: vnetname
  location: location
  properties:{
    addressSpace:{
      addressPrefixes:[
        '12.0.0.0/16'
      ]
    }
    subnets: [
      {
        name: 'subnet1'
        properties:{
          addressPrefix: '12.0.0.0/24'  
        }
      }
      {
        name: 'subnet2'
        properties: {
          addressPrefix: '12.0.1.0/24'
        }
      }
    ]
  }
}

output vnetId string = vnet.id
