resource "routeros_interface_ethernet_switch" "switch1" {
  count            = var.device_settings.vlan_mode == "switch" ? 1 : 0
  name             = "switch1"
  cpu_flow_control = true
}

resource "routeros_interface_ethernet_switch_port" "switchport" {
  for_each        = var.device_network_settings.ports
  name            = each.key
  vlan_mode       = "secure"
  vlan_header     = "leave-as-is"
  default_vlan_id = each.value.vlan == "1" ? "auto" : each.value.vlan
}