resource "routeros_system_logging" "crticial" {
  action = routeros_system_logging_action.syslog.name
  topics = ["critical"]

  depends_on = [routeros_system_logging_action.syslog]
}

resource "routeros_system_logging" "error" {
  action = routeros_system_logging_action.syslog.name
  topics = ["error"]

  depends_on = [routeros_system_logging_action.syslog]
}

resource "routeros_system_logging" "warning" {
  action = routeros_system_logging_action.syslog.name
  topics = ["warning"]

  depends_on = [routeros_system_logging_action.syslog]
}

resource "routeros_system_logging" "info" {
  action = routeros_system_logging_action.syslog.name
  topics = ["info", "!wireguard"]

  depends_on = [routeros_system_logging_action.syslog]
}