rgname = "myrg1254"
scopes = ["/subscriptions/13422346-eb93-429e-85d8-3039a19d52da/resourceGroups/BBY-NP-App-Managed-Network-RG-USC-01/providers/Microsoft.Network/applicationGateways/BBY-NP-CAP-AppGW-USC-01"]

alertsarray = {
  #1
  #alertname
  AppGW-Dynamic4xxResponse-CAP = {
    description         = "Response Status of 4xx greater than dynamic medium"
    enabled             = true
    severity            = 3
    evaluationFrequency = "PT5M"
    windowSize          = "PT5M"
    autoMitigate        = true
    actionGroupId       = "/subscriptions/13422346-eb93-429e-85d8-3039a19d52da/resourceGroups/Cloud-Platform-Monitoring/providers/microsoft.insights/actionGroups/Cloud Platforms Team - BBY-NP-APP-PaaS-Subscription"

    Criteria = {
      #metricName
      ResponseStatus = {
        alertSensitivity          = "Medium"
        numberOfEvaluationPeriods = 4
        minFailingPeriodsToAlert  = 4
        metricNamespace           = "Microsoft.Network/applicationGateways"
        metricName                = "ResponseStatus"
        timeAggregation           = "Total"
        operator                  = "GreaterThan"
        dimensions = {
          HttpStatusGroup = {
            name     = "HttpStatusGroup"
            operator = "Include"
            values   = ["4xx"]
  } } } } }
  #2
  AppGW-Dynamic5xxResponse-CAP = {
    description         = "Response Status of 5xx greater than dynamic medium"
    enabled             = true
    severity            = 3
    evaluationFrequency = "PT5M"
    windowSize          = "PT5M"
    autoMitigate        = true
    actionGroupId       = "/subscriptions/13422346-eb93-429e-85d8-3039a19d52da/resourceGroups/Cloud-Platform-Monitoring/providers/microsoft.insights/actionGroups/Cloud Platforms Team - BBY-NP-APP-PaaS-Subscription"

    Criteria = {
      #metricName
      ResponseStatus = {
        alertSensitivity          = "Medium"
        numberOfEvaluationPeriods = 4
        minFailingPeriodsToAlert  = 4
        metricNamespace           = "Microsoft.Network/applicationGateways"
        metricName                = "ResponseStatus"
        timeAggregation           = "Total"
        operator                  = "GreaterThan"
        dimensions = {
          HttpStatusGroup = {
            name     = "HttpStatusGroup"
            operator = "Include"
            values   = ["5xx"]
  } } } } }

  #3
  AppGW-DynamicBackendLastByteResponseTime-CAP = {
    description         = "Backend Last Byte Response Time greater than dynamic medium"
    enabled             = true
    severity            = 3
    evaluationFrequency = "PT5M"
    windowSize          = "PT5M"
    autoMitigate        = true
    actionGroupId       = "/subscriptions/13422346-eb93-429e-85d8-3039a19d52da/resourceGroups/Cloud-Platform-Monitoring/providers/microsoft.insights/actionGroups/Cloud Platforms Team - BBY-NP-APP-PaaS-Subscription"

    Criteria = {
      #metricName
      BackendLastByteResponseTime = {
        alertSensitivity          = "Medium"
        numberOfEvaluationPeriods = 4
        minFailingPeriodsToAlert  = 4
        metricNamespace           = "Microsoft.Network/applicationGateways"
        metricName                = "BackendLastByteResponseTime"
        timeAggregation           = "Average"
        operator                  = "GreaterThan" 
  } } }
  #4
  AppGW-DynamicFailedRequests-CAP = {
    description         = "Failed Requests greater than dynamic medium"
    enabled             = true
    severity            = 3
    evaluationFrequency = "PT5M"
    windowSize          = "PT5M"
    autoMitigate        = true
    actionGroupId       = "/subscriptions/13422346-eb93-429e-85d8-3039a19d52da/resourceGroups/Cloud-Platform-Monitoring/providers/microsoft.insights/actionGroups/Cloud Platforms Team - BBY-NP-APP-PaaS-Subscription"

    Criteria = {
      #metricName
      FailedRequests = {
        alertSensitivity          = "Medium"
        numberOfEvaluationPeriods = 4
        minFailingPeriodsToAlert  = 4
        metricNamespace           = "Microsoft.Network/applicationGateways"
        metricName                = "FailedRequests"
        timeAggregation           = "Total"
        operator                  = "GreaterThan"
  } } }
  #5
  AppGW-DynamicTotalTime-CAP = {
    description         = "Total Time greater than dynamic medium"
    enabled             = true
    severity            = 3
    evaluationFrequency = "PT5M"
    windowSize          = "PT5M"
    autoMitigate        = true
    actionGroupId       = "/subscriptions/13422346-eb93-429e-85d8-3039a19d52da/resourceGroups/Cloud-Platform-Monitoring/providers/microsoft.insights/actionGroups/Cloud Platforms Team - BBY-NP-APP-PaaS-Subscription"

    Criteria = {
      #metricName
      ApplicationGatewayTotalTime = {
        alertSensitivity          = "Medium"
        numberOfEvaluationPeriods = 4
        minFailingPeriodsToAlert  = 4
        metricNamespace           = "Microsoft.Network/applicationGateways"
        metricName                = "ApplicationGatewayTotalTime"
        timeAggregation           = "Average"
        operator                  = "GreaterThan"
   } } }
}
