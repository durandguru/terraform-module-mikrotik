resource "routeros_interface_wireless_security_profiles" "security_profiles" {
  for_each = {
    for k, v in var.device_network_settings.wireless : k => v
  }
  name                 = each.value.wireless_name
  authentication_types = ["wpa2-psk"]
  disable_pmkid        = true
  group_key_update     = "1h"
  mode                 = "dynamic-keys"
  wpa2_pre_shared_key  = each.value.wireless_key
}