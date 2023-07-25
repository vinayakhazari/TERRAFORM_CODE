rgname = "myrg1254"
rtname = "myrt1254"
routes = {
  1 = {
    "name" : "EgressViaFirewall"
    "addressPrefix" : "0.0.0.0/0"
    "nextHopType" : "VirtualAppliance"
    "nextHopIpAddress" : "172.18.176.196"
  }
  2 = {
    "name" : "BBYPublicOverlay01"
    "addressPrefix" : "168.94.230.0/24"
    "nextHopType" : "VirtualAppliance"
    "nextHopIpAddress" : "172.18.176.94"
  }
  3 = {
    "name" : "AzurePrivateRange-USC-01"
    "addressPrefix" : "172.18.176.0/20"
    "nextHopType" : "VirtualAppliance"
    "nextHopIpAddress" : "172.18.176.94"
  }
  4 = {
    "name" : "AzurePrivateRange-USC-02"
    "addressPrefix" : "172.18.224.0/20"
    "nextHopType" : "VirtualAppliance"
    "nextHopIpAddress" : "172.18.176.94"
  }
  5 = {
    "name" : "AzurePrivateRange-USC-03"
    "addressPrefix" : "172.16.32.0/23"
    "nextHopType" : "VirtualAppliance"
    "nextHopIpAddress" : "172.18.176.94"
  }
  6 = {
    "name" : "AzureDMZ-USC-01"
    "addressPrefix" : "172.18.188.0/23"
    "nextHopType" : "VirtualAppliance"
    "nextHopIpAddress" : "172.18.177.38"
  }
}
