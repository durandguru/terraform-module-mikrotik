resource "routeros_interface_bridge" "bridge" {
  name              = var.shared_settings.bridge_name
  ingress_filtering = var.device_settings.vlan_mode == "bridge" ? true : false
  protocol_mode     = "none"
  priority          = var.device_settings.bridge_priority
  igmp_snooping     = true
  igmp_version      = "3"
  mld_version       = "2"
  multicast_router  = var.device_settings.device_type  == "router" ? "permnanent" : "temporary-query"
  multicast_querier = var.device_settings.device_type  == "router" ? true : false
  vlan_filtering    = var.device_settings.vlan_mode == "bridge" ? true : false
}