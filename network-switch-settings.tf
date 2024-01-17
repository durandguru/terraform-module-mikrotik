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

# resource "routeros_interface_ethernet_switch_vlan" "vlan" {
#   for_each = {
#     for k, v in var.device_network_settings.vlans : k => v
#   if v.vlan_if && var.device_settings.vlan_mode == "switch" }
#   switch  = "switch1"
#   ports   = ["ether1", "switch1-cpu"]
#   vlan_id = each.value.vlan_id
# }

resource "routeros_interface_ethernet_switch_vlan" "vlan" {
  for_each = var.device_network_settings.vlans
  switch = "switch1"
  ports = compact(concat(
    split(",", replace(replace(contains(local.vlan_interfaces, each.value.vlan_id), "true", "switch1-cpu"), "false", "")),
    keys({ for k, v in local.trunk_ports : k => v if v.vswitch != "no" }),
    keys({ for k, v in local.untagged_ports : k => v if v.vlan != each.value.vlan_id })
  ))
  vlan_id = each.value.vlan_id
}