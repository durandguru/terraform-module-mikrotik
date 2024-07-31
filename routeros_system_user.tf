resource "routeros_system_user" "mktxp" {
  name   = "mktxp"
  group = routeros_system_user_group.mktxp.name
  password = var.shared_settings.mktxp_password
}