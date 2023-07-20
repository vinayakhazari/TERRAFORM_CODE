variable "rgname" {
  description = "Name of Resource Group"
  type        = string
}

variable "scopes" {
  type = set(string)
}

variable "alertsarray" {
  description = "Scopes"
  type = any
}