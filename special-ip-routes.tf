resource "routeros_ip_route" "route-special" {
  for_each = {
    for k, v in var.environment_network_settings.special_routes : k => v
  if var.device_settings.device_type == "router" }
  dst_address = each.value.rt_dst_address
  gateway     = each.value.rt_gateway
  comment     = each.value.rt_comment
  distance    = each.value.rt_distance
  disabled    = each.value.rt_disabled
}