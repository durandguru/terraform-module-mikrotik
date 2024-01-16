resource "routeros_interface_wireguard_peer" "s2s-peer" {
  for_each = {
    for k, v in var.environment_network_settings.wireguard-s2s-peers-in : k => v
  if var.device_settings.device_type == "router" }
  interface       = each.value.wg_interface
  public_key      = each.value.wg_public_key
  allowed_address = each.value.wg_allowed_address
  comment         = each.value.wg_comment
}

resource "routeros_ip_route" "s2s-route" {
  for_each = {
    for k, v in var.environment_network_settings.wireguard-s2s-peers-in : k => v
  if var.device_settings.device_type == "router" }
  dst_address = each.value.rt_dst_address
  gateway     = each.value.rt_gateway
  comment     = each.value.rt_comment
  distance    = each.value.rt_distance
}