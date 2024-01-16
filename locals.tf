locals {
  trunk_ports = keys({
    for k, v in var.device_network_settings.ports : k => v
  if v.type == "admit-only-vlan-tagged" })

  hybrid_ports_untagged = {
    for k, v in var.device_network_settings.ports : k => v
  if v.type == "admit-all" }

  vlan_interfaces = keys({
    for k, v in var.device_network_settings.vlans : k => v
  if v.vlan_if })
}