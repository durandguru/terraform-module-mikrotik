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

  dynamic_ports = keys({
    for k, v in var.device_network_settings.dynamicports : k => v
  if v.type == "admit-all" && var.device_settings.device_type == "sector-ap" })

  ip = trimprefix(trimsuffix("${var.device_settings.hosturl}", ":443"), "https://")

  caname-1 = title(split(".", var.device_settings.identity)[1])

  caname-2 = (split(".", var.device_settings.identity)[2])
}