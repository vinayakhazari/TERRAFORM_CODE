variable "rgname" {
  description = "Name of Resource Group"
  type = string
}

variable "nsgs" {
    type = map(any)
}