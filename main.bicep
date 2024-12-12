// This is the main entry point of the Bicep file. This file is used to define the resources that will be deployed to Azure.
targetScope = 'subscription'

module policyDef './policy/policyDefinition.bicep' = {
  name: 'simplePolicyDefinition'
}

module policyAssignment './assignments/policyAssignment.bicep' = {
  name: 'simplePolicyAssignment'
  params: {
    policyDefinitionId: policyDef.outputs.policyDefinitionId
  }
}
