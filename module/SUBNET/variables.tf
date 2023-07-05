variable "rgname" {
  description = "Name of Resource Group"
  type = string
}

variable "subnetname" {
  description = "value"
  type = string
}

variable "subnetaddressprefix" {
   description = "value"
   type = list(string)
 }

variable "vnetname" {
  description = "Name of VNET"
  type = string
}

variable "NSGid" {
  description = "NSGID"
  type = string
}

variable "delegations" {
  description = "delegations"
  type = list(string)

}

variable "rtid" {
  description = "value"
  type = string
}
 
 variable "serviceEndpoints" {
   description = "value"
   type = list(string)
 }

 variable "privateEndpointNetworkPolicies" {
    description = "value"
   type = string
 }

 variable "privateLinkServiceNetworkPolicies" {
   description = "value"
   type = string
 }

