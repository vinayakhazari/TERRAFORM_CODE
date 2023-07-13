data "azurerm_resource_group" "myrg" {
  name = var.rgname
}

resource "azurerm_network_security_group" "nsg" {
  for_each = var.nsgs
  name                = each.key
  location            = data.azurerm_resource_group.myrg.location
  resource_group_name = data.azurerm_resource_group.myrg.name

  dynamic "security_rule" {
    for_each = each.value.security_rules
    content {
      name                         = security_rule.value.name
      description                  = security_rule.value.description
      protocol                     = security_rule.value.protocol
      access                       = security_rule.value.access
      priority                     = security_rule.value.priority
      direction                    = security_rule.value.direction
      source_port_range            = security_rule.value.source_port_range
      source_port_ranges           = security_rule.value.source_port_ranges
      destination_port_range       = security_rule.value.destination_port_range
      destination_port_ranges      = security_rule.value.destination_port_ranges
      source_address_prefix        = security_rule.value.source_address_prefix
      source_address_prefixes      = security_rule.value.source_address_prefixes
      destination_address_prefix   = security_rule.value.destination_address_prefix
      destination_address_prefixes = security_rule.value.destination_address_prefixes
    }
  }
  tags = {}
}
