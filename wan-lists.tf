resource "routeros_interface_list_member" "list-wan" {
  for_each = {
    for k, v in var.environment_network_settings.internet : k => v
  if var.device_settings.device_type == "router" }
  interface = each.value.interface
  list      = "WAN"
}