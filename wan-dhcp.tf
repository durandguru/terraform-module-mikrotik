resource "routeros_ip_dhcp_client" "wan-dhcp" {
  for_each = {
    for k, v in var.environment_network_settings.internet : k => v
  if v.type == "dhcp" }
  interface              = each.value.interface
  comment                = each.value.comment
  use_peer_dns           = false
  use_peer_ntp           = false
  default_route_distance = each.value.route_distance
}