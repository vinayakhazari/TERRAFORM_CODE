data "azurerm_resource_group" "myrg" {
  name = var.rgname
}

resource "azurerm_public_ip" "pip" {
  for_each            = var.public_ip
  name                = each.value.pipName
  resource_group_name = data.azurerm_resource_group.myrg.name
  location            = data.azurerm_resource_group.myrg.location
  sku                 = "Standard"
  sku_tier            = "Regional"
  domain_name_label   = each.value.domainNameLabel

  ip_version        = "IPv4"
  allocation_method = "Static"
}
