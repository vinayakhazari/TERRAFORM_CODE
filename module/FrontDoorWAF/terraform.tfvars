rgname = "myrg1254"
firewall_policies = {
  #policyname
  bbyteststandardwafpolicy = {
    wafMode = "Detection"
    custom_rules = {
      UserAgentlog4j = {
        ruleName                       = "UserAgentlog4j"
        ruleEnabledState               = true
        rulePriority                   = 20
        ruleType                       = "MatchRule"
        ruleRateLimitDurationinMinutes = 1
        ruleRateLimitThreshold         = 100
        ruleMatchConditions = {
          1 = {
            matchVariable   = "RequestHeader"
            selector        = "UserAgent"
            operator        = "Contains"
            negateCondition = false
            matchValue      = ["jndi:ldap"]
            transforms      = ["Lowercase"]
        } }
        ruleAction = "Block"
      }
      UserdashAgentlog4j = {
        ruleName                       = "UserdashAgentlog4j"
        ruleEnabledState               = true
        rulePriority                   = 30
        ruleType                       = "MatchRule"
        ruleRateLimitDurationinMinutes = 1
        ruleRateLimitThreshold         = 100
        ruleMatchConditions = {
          1 = {
            matchVariable   = "RequestHeader"
            selector        = "User-Agent"
            operator        = "Contains"
            negateCondition = false
            matchValue      = ["jndi:ldap"]
            transforms      = ["Lowercase"]
        } }
        ruleAction = "Block"
      }
      GeoFilterAllowNorthAmerica = {
        ruleName                       = "GeoFilterAllowNorthAmerica"
        ruleEnabledState               = true
        rulePriority                   = 10
        ruleType                       = "MatchRule"
        ruleRateLimitDurationinMinutes = 1
        ruleRateLimitThreshold         = 100
        ruleMatchConditions = {
          1 = {
            matchVariable   = "RemoteAddr"
            selector        = null
            operator        = "GeoMatch"
            negateCondition = true
            matchValue      = ["CA", "MX", "PR", "US"]
            transforms      = []
        } }
        ruleAction = "Block"
      }
    }
    managedrules = {
      1 = {
        ruleSetType    = "Microsoft_DefaultRuleSet"
        ruleSetVersion = "1.1"
    } }
} }
