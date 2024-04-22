resource "routeros_ip_neighbor_discovery_settings" "nds" {
  discover_interface_list = routeros_interface_list.mgmt.name
  mode                    = "tx-and-rx"
  protocol                = ["cdp", "lldp", "mndp"]
}