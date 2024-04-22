resource "routeros_system_ntp_client" "ntp_client" {
  enabled = true
  mode    = "unicast"
  servers = [var.shared_settings.ntp_servers]
}