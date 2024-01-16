resource "routeros_ipv6_route" "route-default" {
  count       = var.device_settings.device_type != "router" && var.device_settings.ipv6_enabled ? 1 : 0
  dst_address = "::/0"
  gateway     = var.shared_settings.default_gateway_v6
  comment     = "Default Route"
}