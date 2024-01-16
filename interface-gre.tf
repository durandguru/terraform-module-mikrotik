resource "routeros_interface_gre" "gre" {
  for_each = {
    for k, v in var.environment_network_settings.gre : k => v
  if var.device_settings.device_type == "router" }
  name            = each.value.gre_name
  remote_address  = each.value.gre_remote_address
  local_address   = each.value.gre_local_address
  allow_fast_path = each.value.gre_allow_fast_path
  ipsec_secret    = each.value.gre_ipsec_secret
}

resource "routeros_ip_address" "gre" {
  for_each = {
    for k, v in var.environment_network_settings.gre : k => v
  if var.device_settings.device_type == "router" }
  interface = each.value.gre_name
  address   = each.value.ip_address

  depends_on = [routeros_interface_gre.gre]
}

resource "routeros_ip_route" "gre-route" {
  for_each = {
    for k, v in var.environment_network_settings.gre : k => v
  if var.device_settings.device_type == "router" }
  dst_address = each.value.rt_dst_address
  gateway     = each.value.rt_gateway
  comment     = each.value.rt_comment
  distance    = each.value.rt_distance
}