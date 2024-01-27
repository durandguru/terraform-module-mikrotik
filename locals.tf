locals {
  trunk_ports = keys({
    for k, v in var.device_network_settings.ports : k => v
  if v.type == "admit-only-vlan-tagged" })

  trunk_ports_switch = keys({
    for k, v in var.device_network_settings.ports : k => v
  if v.type == "admit-only-vlan-tagged" && can(v.vlan_mode) })

  hybrid_ports_untagged = {
    for k, v in var.device_network_settings.ports : k => v
  if v.type == "admit-all" }

  untagged_ports = {
    for k, v in var.device_network_settings.ports : k => v
  if v.type == "admit-only-untagged-and-priority-tagged" }

  vlan_interfaces = keys({
    for k, v in var.device_network_settings.vlans : k => v
  if v.vlan_if })
}