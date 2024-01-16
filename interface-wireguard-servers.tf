resource "routeros_interface_wireguard" "wireguard" {
  for_each = {
    for k, v in var.environment_network_settings.wireguard-servers : k => v
  if var.device_settings.device_type == "router" }
  name        = each.value.name
  listen_port = each.value.listen_port
  private_key = each.value.private_key
}

resource "routeros_ip_address" "wireguard" {
  for_each = {
    for k, v in var.environment_network_settings.wireguard-servers : k => v
  if var.device_settings.device_type == "router" }
  interface = each.value.name
  address   = each.value.ip

  depends_on = [routeros_interface_wireguard.wireguard]
}

resource "routeros_interface_list_member" "list-wireguard-lan" {
  for_each = {
    for k, v in var.environment_network_settings.wireguard-servers : k => v
  if var.device_settings.device_type == "router" }
  interface  = each.value.name
  list       = "LAN"
  depends_on = [routeros_interface_wireguard.wireguard]
}