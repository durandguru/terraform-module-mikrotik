resource "routeros_ip_dns_record" "dns-record" {
  for_each = {
    for k, v in var.environment_network_settings.dns-records : k => v
  if var.device_settings.device_type == "router" }
  type    = each.value.dns_type
  address = each.value.dns_address
  name    = each.value.dns_name
}