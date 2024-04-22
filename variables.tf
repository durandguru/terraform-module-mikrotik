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
    ntp_servers        = string
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
    ntp_servers        = ""
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

variable "device_network_settings" {
  default = {}
}

variable "environment_network_settings" {
  default = {}
}

variable "network_password" {
  default = ""
}