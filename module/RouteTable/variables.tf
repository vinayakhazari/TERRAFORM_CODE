variable "rgname" {
  description = "Name of Resource Group"
  type = string
}

variable "rtname" {
  description = "Name oF Route Table"
  type = string
}

variable "routes" {
  description = "Security rules for NSG"
  type = any
}