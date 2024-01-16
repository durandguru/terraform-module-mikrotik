resource "routeros_interface_wireguard_peer" "rw-peer" {
  for_each = {
    for k, v in var.environment_network_settings.wireguard-rw-peers : k => v
  if var.device_settings.device_type == "router" }
  interface       = each.value.interface
  public_key      = each.value.public_key
  allowed_address = each.value.allowed_address
  comment         = each.value.comment
}