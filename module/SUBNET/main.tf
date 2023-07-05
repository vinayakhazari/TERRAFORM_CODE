data "azurerm_resource_group" "myrg" {
  name = var.rgname
}

data "azurerm_virtual_network" "myvnet" {
  name                = var.vnetname
  resource_group_name = data.azurerm_resource_group.myrg.name
}


resource "azurerm_subnet" "subnet" {
  name                 = var.subnetname
  resource_group_name  = data.azurerm_resource_group.myrg.name
  virtual_network_name = data.azurerm_virtual_network.myvnet.name
  address_prefixes     = var.subnetaddressprefix

  service_endpoints           = var.serviceEndpoints

  dynamic "delegation" {
    for_each = var.delegations
    content {
      name = delegation.key
      dynamic "service_delegation" {
        for_each = toset(delegation.value)
        content {
          name    = service_delegation.value.name
          actions = service_delegation.value.actions
        }
      }
    }
  }

  private_endpoint_network_policies_enabled     = var.privateEndpointNetworkPolicies
  private_link_service_network_policies_enabled = var.privateLinkServiceNetworkPolicies
}

# resource "azurerm_subnet_network_security_group_association" "subnet_association" {
#   subnet_id                 = azurerm_subnet.subnet.id
#   network_security_group_id = var.NSGid
# }

# resource "azurerm_subnet_route_table_association" "route_table_association" {
#   subnet_id      = azurerm_subnet.subnet.id
#   route_table_id = var.rtid
# }

data "azurerm_subscription" "current" {
}