resource "routeros_ip_dns" "dns-server" {
  allow_remote_requests = var.device_settings.device_type == "router" ? true : false
  servers               = var.device_settings.device_type == "router" ? var.shared_settings.dns_forwarders : var.shared_settings.dns_server
}