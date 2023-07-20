variable "rgname" {
  description = "Name of Resource Group"
  type        = string
}

# CDN FrontDoor Firewall Policies
variable "firewall_policies" {
  description = "CDN Frontdoor Firewall Policies configurations."
  type = map(any)
}