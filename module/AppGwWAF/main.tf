data "azurerm_resource_group" "myrg" {
  name = var.rgname
}

resource "azurerm_web_application_firewall_policy" "WAF_policy" {
  for_each            = var.AppGwWAF
  name                = each.key
  resource_group_name = data.azurerm_resource_group.myrg.name
  location            = data.azurerm_resource_group.myrg.location

  dynamic "policy_settings" {
    for_each = each.value.policysettings
    content {
      max_request_body_size_in_kb = policy_settings.value.maxRequestBodySizeInKb
      file_upload_limit_in_mb     = policy_settings.value.fileUploadLimitInMb
      mode                        = policy_settings.value.wafMode
      request_body_check          = true
      enabled                     = true
    }
  }

  dynamic "custom_rules" {
    for_each = each.value.customrules
    content {
      name      = custom_rules.value.ruleName
      priority  = custom_rules.value.rulePriority
      rule_type = custom_rules.value.ruleType

      dynamic "match_conditions" {
        for_each = custom_rules.value.ruleMatchConditions
        content {

          dynamic "match_variables" {
            for_each = match_conditions.value.matchVariables
            content {
              variable_name = match_variables.value.variableName
              selector      = match_variables.value.selector
            }
          }

          operator           = match_conditions.value.operator
          negation_condition = match_conditions.value.negationConditon
          match_values       = match_conditions.value.matchValues
          transforms         = match_conditions.value.transforms
        }
      }

      action = custom_rules.value.ruleAction
    }
  }

  dynamic "managed_rules" {
    for_each = each.value.managedrules
    content {

      dynamic "managed_rule_set" {
        for_each = managed_rules.value.managedRuleSets
        content {
          type    = managed_rule_set.value.ruleSetType
          version = managed_rule_set.value.ruleSetVersion
        }
      }
    }
  }
}
