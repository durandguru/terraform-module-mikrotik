resource "routeros_tool_mac_server" "mac_server" {
  allowed_interface_list = routeros_interface_list.mgmt.name
}

resource "routeros_tool_mac_server_winbox" "mac_server_winbox" {
  allowed_interface_list = routeros_interface_list.mgmt.name
}