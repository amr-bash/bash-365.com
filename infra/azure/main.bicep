@description('Azure region for the Static Web App. westus2 is SWA-supported and closest to Denver.')
param location string = 'westus2'

@description('Resource name for the Static Web App. Do not reuse proud-pond-06dc10c1e.')
param staticWebAppName string = 'swa-bash365-prod'

resource swa 'Microsoft.Web/staticSites@2023-12-01' = {
  name: staticWebAppName
  location: location
  sku: {
    name: 'Free'
    tier: 'Free'
  }
  properties: {
    provider: 'None'
    allowConfigFileUpdates: true
    stagingEnvironmentPolicy: 'Enabled'
  }
}

var defaultHostname = swa.properties.defaultHostname
var originPrefix = 'https://${split(defaultHostname, '.')[0]}'

resource appSettings 'Microsoft.Web/staticSites/config@2023-12-01' = {
  parent: swa
  name: 'appsettings'
  properties: {
    CHAT_MODEL: 'claude-opus-4-8'
    MAX_TOKENS_CAP: '2048'
    SWA_ORIGIN_PREFIX: originPrefix
  }
}

output staticWebAppName string = swa.name
output defaultHostname string = defaultHostname
output swaOriginPrefix string = originPrefix
output resourceId string = swa.id
