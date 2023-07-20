rgname = "myrg1254"

alertsarray = {
  #alertname
  FD-BackendHealthPercentage-bbysecmarkets = {
    scopes              = ["/subscriptions/97f95932-7b38-4660-b54b-d45699d1048f/resourceGroups/bby-pd-app-corp-network-rg-usc-01/providers/Microsoft.Network/frontdoors/bbysecmarkets"]
    description         = "Backend health percentage below 50%"
    enabled             = true
    severity            = 1
    evaluationFrequency = "PT15M"
    windowSize          = "PT15M"
    autoMitigate        = true
    actionGroupId       = "/subscriptions/97f95932-7b38-4660-b54b-d45699d1048f/resourceGroups/Cloud-Platform-Monitoring/providers/microsoft.insights/actionGroups/Cloud Platforms Team - BBY-PD-APP-PaaS-Subscription"

    Criteria = {
      1 = {
        metricNamespace = "Microsoft.Network/frontdoors"
        metricName      = "BackendHealthPercentage"
        timeAggregation = "Average"
        operator        = "LessThanOrEqual"
        threshold       = 50
        dimensions = {
          a = {
            name     = "BackendPool"
            operator = "Include"
            values   = ["*"]
      } } }
    }
  }
}
