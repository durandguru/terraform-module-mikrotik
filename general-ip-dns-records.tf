resource "routeros_ip_dns_record" "dns-record-a" {
  for_each = {
    for k, v in var.environment_network_settings.dns-records : k => v
  if var.device_settings.device_type == "router" && v.dns_type == "A"}
  type    = each.value.dns_type
  address = each.value.dns_address
  name    = each.value.dns_name
}

resource "routeros_ip_dns_record" "dns-record-cname" {
  for_each = {
    for k, v in var.environment_network_settings.dns-records : k => v
  if var.device_settings.device_type == "router" && v.dns_type == "CNAME" }
  type    = each.value.dns_type
  cname   = each.value.dns_address
  name    = each.value.dns_name
}