data "azurerm_resource_group" "myrg" {
  name = var.rgname
}


resource "azurerm_route_table" "route_table" {
  name                          = var.rtname
  location                      = data.azurerm_resource_group.myrg.location
  resource_group_name           = data.azurerm_resource_group.myrg.name
  disable_bgp_route_propagation = false

  tags = {}
}

resource "azurerm_route" "route" {
  for_each = var.routes
  name                = each.value.name
  resource_group_name = data.azurerm_resource_group.myrg.name
  route_table_name    = azurerm_route_table.route_table.name
  address_prefix      = each.value.addressPrefix
  next_hop_type       = each.value.nextHopType
  next_hop_in_ip_address = each.value.nextHopIpAddress
}