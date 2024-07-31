resource "routeros_system_logging" "crticial" {
  action = routeros_system_logging_action.syslog.name
  prefix = ":Critical"
  topics = ["critical"]

  depends_on = [routeros_system_logging_action.syslog]
}

resource "routeros_system_logging" "error" {
  action = routeros_system_logging_action.syslog.name
  prefix = ":Error"
  topics = ["error"]

  depends_on = [routeros_system_logging_action.syslog]
}

resource "routeros_system_logging" "warning" {
  action = routeros_system_logging_action.syslog.name
  prefix = ":Warning"
  topics = ["warning"]

  depends_on = [routeros_system_logging_action.syslog]
}

resource "routeros_system_logging" "info" {
  action = routeros_system_logging_action.syslog.name
  prefix = ":Info"
  topics = ["info"]

  depends_on = [routeros_system_logging_action.syslog]
}