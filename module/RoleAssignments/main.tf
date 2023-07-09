data "azurerm_resource_group" "myrg" {
  name = var.rgname
}

data "azurerm_role_definition" "role_definition" {
  for_each = var.role_assignment
  role_definition_id = each.value.RoleDefinitionId
}

resource "azurerm_role_assignment" "role_assignment" {
  for_each           = var.role_assignment
  scope              = data.azurerm_resource_group.myrg.id
  name               = each.value.GUIDname
  description        = each.value.description
  role_definition_id = data.azurerm_role_definition.role_definition[each.key].id
  principal_id       = each.value.ObjectId
}
