resource "routeros_interface_wireless" "wlan-2" {
  for_each = {
    for k, v in var.device_network_settings.wireless : k => v
    if v.wireless_type == "2"
  }
  name               = each.value.wireless_if
  band               = each.value.wireless_band
  basic_rates_ag     = ["12Mbps"]
  channel_width      = "20mhz"
  country            = "etsi"
  frequency          = each.value.wireless_freq
  frequency_mode     = "regulatory-domain"
  guard_interval     = "long"
  hw_protection_mode = "rts-cts"
  installation       = each.value.wireless_loc
  mode               = "ap-bridge"
  scan_list          = "2412,2437,2462"
  ssid               = each.value.wireless_name
  supported_rates_ag = "12Mbps,18Mbps,24Mbps,36Mbps,48Mbps,54Mbps"
  wireless_protocol  = "802.11"
  wps_mode           = "disabled"
  security_profile   = each.value.wireless_name
}

resource "routeros_interface_wireless" "wlan-5" {
  for_each = {
    for k, v in var.device_network_settings.wireless : k => v
    if v.wireless_type == "5"
  }
  name               = each.value.wireless_if
  band               = each.value.wireless_band
  channel_width      = "20mhz"
  country            = "etsi"
  frequency          = each.value.wireless_freq
  frequency_mode     = "regulatory-domain"
  guard_interval     = "long"
  hw_protection_mode = "rts-cts"
  installation       = each.value.wireless_loc
  mode               = "ap-bridge"
  ssid               = each.value.wireless_name
  wireless_protocol  = "802.11"
  wps_mode           = "disabled"
  security_profile   = each.value.wireless_name
}