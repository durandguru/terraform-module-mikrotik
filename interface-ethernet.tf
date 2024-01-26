# resource "routeros_interface_ethernet" "interface" {
#   for_each = {
#     for k, v in var.device_network_settings.ports : k => v
#   if v.poe }
#   factory_name = each.key
#   name         = each.key
#   poe_out      = each.value.vlan
# }

resource "routeros_interface_ethernet" "interface" {
  for_each = {
    for k, v in var.device_network_settings.ports : k => v
  if contains("poe", k)}
  factory_name = each.key
  name         = each.key
  poe_out      = each.value.vlan
}