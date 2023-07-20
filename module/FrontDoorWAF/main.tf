data "azurerm_resource_group" "myrg" {
  name = var.rgname
}

resource "azurerm_cdn_frontdoor_firewall_policy" "cdn_frontdoor_firewall_policy" {
  for_each            = var.firewall_policies
  name                = each.key
  resource_group_name = data.azurerm_resource_group.myrg.name
  # sku_name                          = "Classic_AzureFrontDoor"
  sku_name                          = "Premium_AzureFrontDoor"
  enabled                           = true
  mode                              = each.value.wafMode
  custom_block_response_status_code = 403
  custom_block_response_body        = "UmVxdWVzdCBibG9ja2VkIGJ5IFdBRg=="


  dynamic "custom_rule" {
    for_each = each.value.custom_rules
    content {
      name                           = custom_rule.value.ruleName
      enabled                        = custom_rule.value.ruleEnabledState
      priority                       = custom_rule.value.rulePriority
      rate_limit_duration_in_minutes = custom_rule.value.ruleRateLimitDurationinMinutes
      rate_limit_threshold           = custom_rule.value.ruleRateLimitThreshold
      type                           = custom_rule.value.ruleType
      action                         = custom_rule.value.ruleAction

      dynamic "match_condition" {
        for_each = custom_rule.value.ruleMatchConditions
        content {
          match_variable     = match_condition.value.matchVariable
          selector           = match_condition.value.selector
          operator           = match_condition.value.operator
          negation_condition = match_condition.value.negateCondition
          match_values       = match_condition.value.matchValue
          transforms         = match_condition.value.transforms
        }
      }
    }
  }

  dynamic "managed_rule" {
    for_each = each.value.managedrules
    content {
      type    = managed_rule.value.ruleSetType
      version = managed_rule.value.ruleSetVersion
      action  = "Log" //not provided
    }
  }

}

