resource "routeros_interface_ethernet" "interface" {
  for_each = {
    for k, v in var.device_network_settings.ports : k => v
  if key != "sfp1" && v.poe != null }
  factory_name = each.key
  name         = each.key
  poe_out      = each.value.poe
}