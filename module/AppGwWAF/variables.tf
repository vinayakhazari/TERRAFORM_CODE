variable "rgname" {
  description = "Name of Resource Group"
  type = string
}

variable "AppGwWAF" {
  type = map(any)
}