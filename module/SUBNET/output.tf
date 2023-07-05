output "subnetname" {
  description = "Subnet Name"
  value = azurerm_subnet.subnet.name
}

output "web_subnet_id" {
  description = "Subnet ID"
  value = azurerm_subnet.subnet.id
}
