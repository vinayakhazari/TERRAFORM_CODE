data "azurerm_resource_group" "myrg" {
  name = var.rgname
}

resource "azurerm_monitor_metric_alert" "AppGWAlerts" {
  for_each                 = var.alertsarray
  name                     = each.key
  resource_group_name      = data.azurerm_resource_group.myrg.name
  target_resource_location = "global"
  scopes                   = var.scopes
  description              = each.value.description
  enabled                  = each.value.enabled
  severity                 = each.value.severity
  frequency                = each.value.evaluationFrequency
  window_size              = each.value.windowSize
  auto_mitigate            = each.value.autoMitigate

  dynamic "dynamic_criteria" {
    for_each = each.value.Criteria
    content {
      alert_sensitivity        = dynamic_criteria.value.alertSensitivity
      evaluation_total_count   = dynamic_criteria.value.numberOfEvaluationPeriods
      evaluation_failure_count = dynamic_criteria.value.minFailingPeriodsToAlert
      metric_namespace         = dynamic_criteria.value.metricNamespace
      metric_name              = dynamic_criteria.value.metricName
      aggregation              = dynamic_criteria.value.timeAggregation
      operator                 = dynamic_criteria.value.operator


      dynamic "dimension" {
        for_each = try(dynamic_criteria.value.dimensions, {})
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
