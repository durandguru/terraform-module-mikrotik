resource "routeros_interface_list" "mgmt" {
  name = "MGMT"
}

resource "routeros_interface_list" "lan" {
  count = var.device_settings.device_type == "router" ? 1 : 0
  name  = "LAN"
}

resource "routeros_interface_list" "wan" {
  count = var.device_settings.device_type == "router" ? 1 : 0
  name  = "WAN"
}