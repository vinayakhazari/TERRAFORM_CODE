variable "rgname" {
  description = "Name of Resource Group"
  type = string
}

variable "rglocation" {
  description = "Location Of Resource Group"
  type = string
}

variable "tagEnv" {
  type = string
}
variable "tagPcm" {
  type = string
}
variable "tagDept" {
  type = string
}
variable "tagCc" {
  type = string
}
variable "tagDataresidency" {
  type = string
}
variable "tagEa" {
  type = string
}
variable "tagMdr" {
  type = string
}

variable "role_assignment" {
  description = "ROle assignment"
  type = any
}