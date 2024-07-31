variable "shared_settings" {
  type = object({
    dns_server         = list(string)
    dns_forwarders     = list(string)
    dns_domain         = string
    provider_version   = string
    default_gateway_v4 = string
    default_gateway_v6 = string
    bridge_name        = string
    snmp_location      = string
    snmp_contact       = string
    ntp_servers        = string
    syslog_server      = string
    mktxp_password     = string
  })
  default = {
    dns_server         = [""]
    dns_forwarders     = [""]
    dns_domain         = ""
    provider_version   = ""
    default_gateway_v4 = ""
    default_gateway_v6 = ""
    bridge_name        = ""
    snmp_location      = ""
    snmp_contact       = ""
    ntp_servers        = ""
    syslog_server      = ""
    mktxp_password     = ""
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
    root_ca         = bool
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
    root_ca         = false
  }
}

variable "cert_settings" {
  type = object({
    country      = string
    state        = string
    locality     = string
    organization = string
    unit         = string
    key_size     = string
    scep_url     = string
  })
  default = {
    country      = "NL"
    state        = ""
    locality     = ""
    organization = "Durand Guru"
    unit         = ""
    key_size     = "4096"
    scep_url     = ""
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