rgname = "myrg1254"
AppGwWAF = {
  #wafPolicyName
  bbynpstandardappgwwafpolicy = {
    policysettings = {
      1 = {
        maxRequestBodySizeInKb = 128
        fileUploadLimitInMb    = 100
        wafMode                = "Detection"
    } }
    customrules = {
      UserAgentlog4j = {
        ruleName     = "UserAgentlog4j"
        rulePriority = 20
        ruleType     = "MatchRule"
        ruleAction   = "Block"
        ruleMatchConditions = {
          1 = {
            matchVariables = {
              a = {
                variableName = "RequestHeaders"
                selector     = "UserAgent"
            } }
            operator         = "Contains"
            negationConditon = false
            matchValues      = ["jndi:ldap"]
            transforms       = ["Lowercase"]
      } } }
      UserdashAgentlog4j = {
        ruleName     = "UserdashAgentlog4j"
        rulePriority = 30
        ruleType     = "MatchRule"
        ruleAction   = "Block"
        ruleMatchConditions = {
          1 = {
            matchVariables = {
              a = {
                variableName = "RequestHeaders"
                selector     = "User-Agent"
            } }
            operator         = "Contains"
            negationConditon = false
            matchValues      = ["jndi:ldap"]
            transforms       = ["Lowercase"]
      } } }
      GeoFilterAllowNorthAmerica = {
        ruleName     = "GeoFilterAllowNorthAmerica"
        rulePriority = 10
        ruleType     = "MatchRule"
        ruleAction   = "Block"
        ruleMatchConditions = {
          1 = {
            matchVariables = {
              a = {
                variableName = "RemoteAddr"
                selector     = null
            } }
            operator         = "GeoMatch"
            negationConditon = true
            matchValues      = ["CA", "MX", "PR", "US"]
            transforms       = null
      } } }
    }

    managedrules = {
      1 = {
        managedRuleSets = {
          a = {
            ruleSetType    = "OWASP"
            ruleSetVersion = "3.1"
      } } }
    }
  }
}
