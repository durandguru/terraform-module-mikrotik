variable "shared_settings" {
  type = object({
    dns_server         = string
    dns_forwarders     = string
    dns_domain         = string
    provider_version   = string
    default_gateway_v4 = string
    default_gateway_v6 = string
    bridge_name        = string
    snmp_location      = string
    snmp_contact       = string
  })
  default = {
    dns_server         = ""
    dns_forwarders     = ""
    dns_domain         = ""
    provider_version   = ""
    default_gateway_v4 = ""
    default_gateway_v6 = ""
    bridge_name        = ""
    snmp_location      = ""
    snmp_contact       = ""
  }
}

variable "device_settings" {
  type = object({
    identity        = string
    hosturl         = string
    username        = string
    device_type     = string
    vlan_mode       = string
    environment     = string
    bridge_priority = string
    ipv6_enabled    = bool
  })
  default = {
    identity        = ""
    hosturl         = ""
    username        = ""
    device_type     = ""
    vlan_mode       = ""
    environment     = ""
    bridge_priority = ""
    ipv6_enabled    = "false"
  }
}

variable "device_network_settings2" {
  default = {}
}

variable "device_network_settings" {
  type = map(object({
    ports = list(
      object({
        vlan   = string
        type   = string
        switch = string
        poe    = string
    })),
    vlans = list(
      object({
        vlan_id         = string
        vlan_if         = bool
        vlan_ipv6       = bool
        vlan_name       = string
        vlan_address_v4 = string
        vlan_mgmt       = bool
        dhcp_server     = bool
  })) }))
}

variable "environment_network_settings" {
  default = {}
}

variable "network_password" {
  default = ""
}