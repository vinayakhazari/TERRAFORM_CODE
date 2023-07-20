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

variable "guid1" {
  type = set(string)
}

variable "guid2" {
  type = set(string)
}

variable "guid3" {
  type = set(string)
}

variable "contributorprincipalId" {
  type = string
}

variable "contributorRoleDefinitionId" {
  type = string
}

variable "readerprincipalId" {
  type = string
}

variable "readerRoleDefinitionId" {
  type = string
}

variable "svcPrnprincipalId" {
  type = string
}
