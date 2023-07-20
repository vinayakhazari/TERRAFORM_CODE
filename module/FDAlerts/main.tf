data "azurerm_resource_group" "myrg" {
  name = var.rgname
}

resource "azurerm_monitor_metric_alert" "FDalerts" {
  for_each            = var.alertsarray
  name                = each.key
  resource_group_name = data.azurerm_resource_group.myrg.name
  target_resource_location = "global"
  scopes              = each.value.scopes
  description         = each.value.description
  enabled             = each.value.enabled
  severity            = each.value.severity
  frequency           = each.value.evaluationFrequency
  window_size         = each.value.windowSize
  auto_mitigate       = each.value.autoMitigate

  dynamic "criteria" {
    for_each = each.value.Criteria
    content {
      metric_namespace = criteria.value.metricNamespace
      metric_name      = criteria.value.metricName
      aggregation      = criteria.value.timeAggregation
      operator         = criteria.value.operator
      threshold        = criteria.value.threshold


      dynamic "dimension" {
        for_each = criteria.value.dimensions
        content {
          name     = dimension.value.name
          operator = dimension.value.operator
          values   = dimension.value.values
        }
      }
    }
  }

  action {
    action_group_id = each.value.actionGroupId
  }
}
