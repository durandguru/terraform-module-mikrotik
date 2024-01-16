resource "routeros_interface_ethernet_switch" "switch1" {
  count            = var.device_settings.vlan_mode == "switch" ? 1 : 0
  name             = "switch1"
  cpu_flow_control = true
}

resource "routeros_interface_ethernet_switch_port" "switchport" {
  for_each = {
    for k, v in var.device_network_settings.ports : k => v
  if v.switch == "yes" && var.device_settings.vlan_mode == "switch" }
  name            = each.key
  vlan_mode       = "secure"
  vlan_header     = "leave-as-is"
  default_vlan_id = each.value.vlan == "1" ? "auto" : each.value.vlan
}

resource "routeros_interface_ethernet_switch_vlan" "vlan" {
    for_each = {
    for k, v in var.device_network_settings.vlans : k => v
  if v.vlan_if && var.device_settings.vlan_mode == "switch" }
  switch  = routeros_interface_ethernet_switch.switch1.name
  ports   = ["ether1", "switch1-cpu"]
  vlan_id = 99
}