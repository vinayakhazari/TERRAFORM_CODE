rgname = "myrg1254"
scopes = ["/subscriptions/97f95932-7b38-4660-b54b-d45699d1048f/resourceGroups/bby-pd-app-corp-network-rg-usc-01/providers/Microsoft.Network/frontdoors/bbysecmarkets"]

alertsarray = {

  #alertname
  AppGW-StaticMetrics-CAP = {
    description         = "Backend health percentage below 50%"
    enabled             = true
    severity            = 1
    evaluationFrequency = "PT1M"
    windowSize          = "PT1M"
    autoMitigate        = true
    actionGroupId       = "/subscriptions/13422346-eb93-429e-85d8-3039a19d52da/resourceGroups/Cloud-Platform-Monitoring/providers/microsoft.insights/actionGroups/Cloud Platforms Team - BBY-NP-APP-PaaS-Subscription"

    Criteria = {
      CapacityUnits = {
        metricNamespace = "Microsoft.Network/applicationGateways"
        metricName      = "CapacityUnits"
        timeAggregation = "Average"
        operator        = "GreaterThan"
        threshold       = 50
      }
      UnhealthyHostCount = {
        metricNamespace = "Microsoft.Network/applicationGateways"
        metricName      = "UnhealthyHostCount"
        timeAggregation = "Average"
        operator        = "GreaterThan"
        threshold       = 0
      }
    }

  }
}
