targetScope = 'subscription'

resource policyDefinition 'Microsoft.Authorization/policyDefinitions@2023-04-01' = {
  name: 'simplePolicyDefinition'
  properties: {
    policyType: 'Custom'
    mode: 'All'
    displayName: 'Simple Policy Definition'
    description: 'This is a simple policy definition.'
    policyRule: {
      if: {
        field: 'location'
        equals: 'eastus'
      }
      then: {
        effect: 'deny'
      }
    }
  }
}

output policyDefinitionId string = policyDefinition.id
