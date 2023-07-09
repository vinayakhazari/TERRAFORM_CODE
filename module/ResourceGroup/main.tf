resource "random_string" "myrandom" {
  length = 6
  upper = false 
  special = false
  numeric = false   
}
resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.rglocation

  tags = {
     "BBY.ENV_Required" = var.tagEnv
     "BBY.PCM_Required" = var.tagPcm
     "BBY.DEPT_Required" = var.tagDept
     "BBY.CC_Required" = var.tagCc
     "BBY.Dataresidency_Required" = var.tagDataresidency
     "BBY.EA" = var.tagEa
     "BBY.MDR" = var.tagMdr
  }
}

resource "azurerm_role_assignment" "role_assignment" {
  for_each = var.role_assignment
  name               = "${each.value.name}-${random_string.myrandom.id}"
  scope              = resource.azurerm_resource_group.rg.id
  principal_id       = each.value.principalId
}

# resource "azurerm_role_assignment" "role_assignment" {
#   name               = "contributorRoleNameGuid"
#   scope              = data.azurerm_subscription.primary.id
#   principal_id       = var.svcPrnPrincipalId
# }

# resource "azurerm_role_assignment" "role_assignment" {
#   name               = "contributorRoleNameGuid"
#   scope              = data.azurerm_subscription.primary.id
#   principal_id       = var.svcPrnPrincipalId
# }