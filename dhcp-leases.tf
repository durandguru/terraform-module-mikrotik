resource "routeros_ip_dhcp_server_lease" "dhcp-lease" {
  for_each = {
    for k, v in var.environment_network_settings.dhcp-leases : k => v
  if var.device_settings.device_type == "router" }
  address     = each.value.ip_address
  mac_address = each.value.mac_address
  server      = each.value.dhcp_server
  comment     = each.value.comment

  depends_on = [routeros_ip_dhcp_server.vlan-dhcp-server]
}

resource "routeros_ip_dns_record" "dhcp-dns-record" {
  for_each = {
    for k, v in var.environment_network_settings.dhcp-leases : k => v
  if v.dns && var.device_settings.device_type == "router" }
  type    = "A"
  address = each.value.ip_address
  name    = each.value.dns_name

  depends_on = [routeros_ip_dhcp_server_lease.dhcp-lease]
}