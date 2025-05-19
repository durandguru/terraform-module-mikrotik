resource "routeros_system_logging_action" "syslog" {
  name   = "remote"
  target = "remote"
  remote          = var.shared_settings.syslog_server
  remote_port     = "514"
  src_address     = var.device_settings.ip
  syslog_facility = "daemon"
}