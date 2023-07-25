 module "routeTable" {
source = "../../RouteTable"
providers = {
  azurerm.subscription-1 = azurerm.subscription-1
}
rgname = var.rgname
rtname = var.rtname
routes = var.routes
 }

#  module "routeTable1" {
# source = "../../RouteTable"
# # providers = {
# #   azurerm.subscription-1 = azurerm.subscription-1
# # }
# rgname = var.rgname
# rtname = var.rtname
# routes = var.routes
#  }