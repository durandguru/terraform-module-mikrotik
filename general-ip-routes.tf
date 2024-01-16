resource "routeros_ip_route" "route-default" {
  count         = var.device_settings.device_type != "router" ? 1 : 0
  dst_address   = "0.0.0.0/0"
  gateway       = var.shared_settings.default_gateway_v4
  comment       = "Default Route"
  check_gateway = var.device_settings.environment == "event" ? "ping" : null
  distance      = "1"
}

resource "routeros_ip_route" "route-omnisport" {
  count         = var.device_settings.device_type != "router" && var.device_settings.environment == "event" ? 1 : 0
  dst_address   = "0.0.0.0/0"
  gateway       = "172.22.10.2"
  comment       = "Default Route to Internet via NL-OMNISPORT"
  check_gateway = "ping"
  distance      = "2"
}

resource "routeros_ip_route" "route-fw4011" {
  count         = var.device_settings.device_type != "router" && var.device_settings.environment == "event" ? 1 : 0
  dst_address   = "0.0.0.0/0"
  gateway       = "172.22.10.3"
  comment       = "Default Route to Internet via NL-EVENT-4011"
  check_gateway = "ping"
  distance      = "3"
}