resource "routeros_interface_bridge" "bridge" {
  name              = var.shared_settings.bridge_name
  ingress_filtering = var.device_settings.vlan_mode == "bridge" ? true : false
  protocol_mode     = "none"
  priority          = var.device_settings.bridge_priority
  igmp_snooping     = false
  vlan_filtering    = var.device_settings.vlan_mode == "bridge" ? true : false
}