resource "routeros_snmp" "snmp" {
  contact         = var.shared_settings.snmp_contact
  enabled         = true
  location        = var.shared_settings.snmp_location
  trap_community  = "public"
  trap_generators = "temp-exception"
  trap_version    = "1"
}