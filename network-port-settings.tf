resource "routeros_bridge_port" "bridgeport" {
  for_each          = var.device_network_settings.ports
  bridge            = var.shared_settings.bridge_name
  interface         = each.key
  pvid              = each.value.vlan
  ingress_filtering = var.device_settings.vlan_mode == "bridge" ? true : false
  frame_types       = var.device_settings.vlan_mode == "bridge" ? each.value.type : "admit-all"
  hw                = true
  fast_leave        = var.device_settings.vlan_mode == "bridge" ? true : false
}