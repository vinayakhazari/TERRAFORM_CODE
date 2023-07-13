rgname  = "myrg1254"

nsgs = { #Duplicate the NSG block for each NSG that you require
    # The NSG name you choose is a map key and should be provided with no quotes or brackets, i.e.:  myNSGName
    mynsg1254 = {
        security_rules = {
1=  {
    name                         = "SSH"
    description                  = "Allow SSH"
    protocol                     = "Tcp"
    access                       = "Allow"
    priority                     = 100
    direction                    = "Inbound"
    source_port_range            = "*"
    destination_port_range       = "22"
    source_address_prefix        = "VirtualNetwork"
    destination_address_prefix   = "*"
    source_port_ranges           = null
    destination_port_ranges      = null
    source_address_prefixes      = null
    destination_address_prefixes = null
  }
 2= {
    name                         = "DNS"
    description                  = "Allow DNS"
    protocol                     = "Udp"
    access                       = "Allow"
    priority                     = 101
    direction                    = "Inbound"
    source_port_range            = "*"
    destination_port_range       = "53"
    source_address_prefix        = "VirtualNetwork"
    destination_address_prefix   = "*"
    source_port_ranges           = null
    destination_port_ranges      = null
    source_address_prefixes      = null
    destination_address_prefixes = null
  }
 3= {
    name                         = "HTTPS"
    description                  = "Allow HTTPS"
    protocol                     = "Tcp"
    access                       = "Allow"
    priority                     = 102
    direction                    = "Inbound"
    source_port_range            = "*"
    destination_port_range       = "443"
    source_address_prefix        = "VirtualNetwork"
    destination_address_prefix   = "*"
    source_port_ranges           = null
    destination_port_ranges      = null
    source_address_prefixes      = null
    destination_address_prefixes = null
  }
 4= {
    name                         = "Grid_traffic_UDP_1194_in"
    description                  = "Allow vNIOS Grid traffic 1194 Inbound"
    protocol                     = "Udp"
    access                       = "Allow"
    priority                     = 103
    direction                    = "Inbound"
    source_port_range            = "*"
    destination_port_range       = "1194"
    source_address_prefix        = "VirtualNetwork"
    destination_address_prefix   = "*"
    source_port_ranges           = null
    destination_port_ranges      = null
    source_address_prefixes      = null
    destination_address_prefixes = null
  }
 5= {
    name                         = "Grid_traffic_UDP_2114_in"
    description                  = "Allow vNIOS Grid traffic 2114 Inbound"
    protocol                     = "Udp"
    access                       = "Allow"
    priority                     = 104
    direction                    = "Inbound"
    source_port_range            = "*"
    destination_port_range       = "2114"
    source_address_prefix        = "VirtualNetwork"
    destination_address_prefix   = "*"
    source_port_ranges           = null
    destination_port_ranges      = null
    source_address_prefixes      = null
    destination_address_prefixes = null
  }
 6= {
    name                         = "DefaultDenyLocalVNET"
    description                  = "DefaultDenyLocalVNET"
    protocol                     = "*"
    access                       = "Deny"
    priority                     = 4096
    direction                    = "Inbound"
    source_address_prefix        = null
    destination_address_prefix   = null
    source_port_range            = "*"
    destination_port_range       = "*"
    source_port_ranges           = null
    destination_port_ranges      = null
    source_address_prefixes      = ["172.18.224.0/22", "172.18.228.0/23"]
    destination_address_prefixes = ["172.18.224.0/22", "172.18.228.0/23"]
   }
  }
 }
}