resource "azurerm_resource_group" "rg" {
  name     = var.rgname
  location = var.rglocation

  tags = {
    "BBY.ENV_Required"           = var.tagEnv
    "BBY.PCM_Required"           = var.tagPcm
    "BBY.DEPT_Required"          = var.tagDept
    "BBY.CC_Required"            = var.tagCc
    "BBY.Dataresidency_Required" = var.tagDataresidency
    "BBY.EA"                     = var.tagEa
    "BBY.MDR"                    = var.tagMdr
  }
}

resource "arm2tf_guid" "guid1" {
  input = var.guid1
}

resource "arm2tf_guid" "guid2" {
  input = var.guid2
}

resource "arm2tf_guid" "guid3" {
  input = var.guid3
}

resource "azurerm_role_assignment" "contributor" {
  name               = arm2tf_guid.guid1.id
  scope              = azurerm_resource_group.rg.id
  principal_id       = var.contributorprincipalId
  role_definition_id = var.contributorRoleDefinitionId
}

resource "azurerm_role_assignment" "reader" {
  name               = arm2tf_guid.guid2.id
  scope              = azurerm_resource_group.rg.id
  principal_id       = var.readerprincipalId
  role_definition_id = var.readerRoleDefinitionId
}

resource "azurerm_role_assignment" "svcPrn" {
  name               = arm2tf_guid.guid3.id
  scope              = azurerm_resource_group.rg.id
  principal_id       = var.svcPrnprincipalId
  role_definition_id = var.contributorRoleDefinitionId
}
