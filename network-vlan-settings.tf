resource "routeros_bridge_vlan" "vlan" {
  for_each = {
    for k, v in var.device_network_settings.vlans : k => v
  if v.vlan_if && var.device_settings.vlan_mode == "bridge" }
  bridge = var.shared_settings.bridge_name
  tagged = compact(concat(
    split(",", replace(replace(contains(local.vlan_interfaces, each.value.vlan_id), "true", "bridge"), "false", "")),
    local.trunk_ports,
    keys({ for k, v in local.hybrid_ports_untagged : k => v if v.vlan != each.value.vlan_id })
  ))
  vlan_ids = each.value.vlan_id
}

resource "routeros_vlan" "vlan" {
  for_each = {
    for k, v in var.device_network_settings.vlans : k => v
  if v.vlan_if }
  interface = var.shared_settings.bridge_name
  name      = each.value.vlan_name
  vlan_id   = each.value.vlan_id
}

resource "routeros_ip_address" "vlan" {
  for_each = {
    for k, v in var.device_network_settings.vlans : k => v
  if v.vlan_if }
  interface = each.value.vlan_name
  address   = each.value.vlan_address_v4

  depends_on = [routeros_vlan.vlan]
}

resource "routeros_ipv6_address" "vlan" {
  for_each = {
    for k, v in var.device_network_settings.vlans : k => v
  if v.vlan_ipv6 }
  interface = each.value.vlan_name
  address   = each.value.vlan_address_v6
  advertise = var.device_settings.device_type == "router" ? true : false

  depends_on = [routeros_vlan.vlan]
}

resource "routeros_interface_list_member" "list-lan" {
  for_each = {
    for k, v in var.device_network_settings.vlans : k => v
  if v.vlan_if && var.device_settings.device_type == "router" }
  interface  = each.value.vlan_name
  list       = "LAN"
  depends_on = [routeros_vlan.vlan]
}

resource "routeros_interface_list_member" "list-mgmt" {
  for_each = {
    for k, v in var.device_network_settings.vlans : k => v
  if v.vlan_if && v.vlan_mgmt }
  interface  = each.value.vlan_name
  list       = "MGMT"
  depends_on = [routeros_vlan.vlan]
}

resource "routeros_ip_pool" "vlan-ip-pool" {
  for_each = {
    for k, v in var.device_network_settings.vlans : k => v
  if v.dhcp_server }
  name   = each.value.vlan_name
  ranges = each.value.dhcp_pool

  depends_on = [routeros_ip_address.vlan]
}

resource "routeros_dhcp_server_network" "vlan-dhcp-network" {
  for_each = {
    for k, v in var.device_network_settings.vlans : k => v
  if v.dhcp_server }
  address    = each.value.dhcp_network
  gateway    = each.value.dhcp_gw
  dns_server = each.value.dhcp_dns_server
  domain     = each.value.dhcp_domain

  depends_on = [routeros_ip_pool.vlan-ip-pool]
}

resource "routeros_dhcp_server" "vlan-dhcp-server" {
  for_each = {
    for k, v in var.device_network_settings.vlans : k => v
  if v.dhcp_server }
  interface     = each.value.vlan_name
  name          = each.value.vlan_name
  address_pool  = each.value.vlan_name
  bootp_support = "none"
  authoritative = "yes"
  lease_time    = each.value.dhcp_leasetime

  depends_on = [routeros_dhcp_server_network.vlan-dhcp-network]
}

resource "routeros_dns_record" "vlan-dns-rt-a-record" {
  for_each = {
    for k, v in var.device_network_settings.vlans : k => v
  if v.vlan_if && var.device_settings.device_type == "router" }
  type    = "A"
  address = cidrhost(each.value.vlan_address_v4, 1)
  name    = each.value.vlan_mgmt ? var.device_settings.identity : "rt-${each.value.vlan_id}.${var.shared_settings.dns_domain}"
}

resource "routeros_dns_record" "vlan-dns-rt-aaaa-record" {
  for_each = {
    for k, v in var.device_network_settings.vlans : k => v
  if v.vlan_if && v.vlan_ipv6 && var.device_settings.device_type == "router" }
  type    = "AAAA"
  address = cidrhost(each.value.vlan_address_v6, 1)
  name    = each.value.vlan_mgmt ? var.device_settings.identity : "rt-${each.value.vlan_id}.${var.shared_settings.dns_domain}"
}