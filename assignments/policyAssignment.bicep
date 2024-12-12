targetScope = 'subscription'

@description('The ID of the policy definition to assign')
param policyDefinitionId string

resource policyAssignment 'Microsoft.Authorization/policyAssignments@2021-06-01' = {
  name: 'simplePolicyAssignment'
  properties: {
    displayName: 'Simple Policy Assignment'
    policyDefinitionId: policyDefinitionId
  }
}
