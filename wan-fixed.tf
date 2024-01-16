resource "routeros_ip_address" "wan-fixed" {
  for_each = {
    for k, v in var.environment_network_settings.internet : k => v
  if v.type == "fixed" }
  interface = each.value.interface
  address   = each.value.ipv4_addres
  comment   = each.value.comment
}

resource "routeros_ip_route" "wan-fixed" {
  for_each = {
    for k, v in var.environment_network_settings.internet : k => v
  if v.type == "fixed" }
  dst_address = "0.0.0.0/0"
  gateway     = each.value.ipv4_gw
  comment     = each.value.ipv4_comment
  distance    = each.value.route_distance
}

resource "routeros_ipv6_address" "wan-fixed" {
  for_each = {
    for k, v in var.environment_network_settings.internet : k => v
  if v.type == "fixed" }
  interface = each.value.interface
  address   = each.value.ipv6_addres
  advertise = false
  comment   = each.value.comment
}

resource "routeros_ipv6_route" "wan-fixed" {
  for_each = {
    for k, v in var.environment_network_settings.internet : k => v
  if v.type == "fixed" && var.device_settings.ipv6_enabled }
  dst_address = "::/0"
  gateway     = each.value.ipv6_gw
  comment     = each.value.ipv6_comment
  distance    = each.value.route_distance
}