resource "routeros_bridge_port" "bridgeport" {
  for_each          = var.device_network_settings.ports
  bridge            = var.shared_settings.bridge_name
  interface         = each.key
  pvid              = each.value.vlan
  ingress_filtering = true
  frame_types       = each.value.type
  hw                = true
  fast_leave        = true
}