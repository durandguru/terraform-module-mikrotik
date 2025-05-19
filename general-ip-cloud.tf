resource "routeros_ip_cloud" "settings" {
  ddns_enabled = var.device_settings.device_type == "router" && var.device_settings.environment == "maarschalkerweerd" ? "yes" : "auto"
  update_time  = false
}