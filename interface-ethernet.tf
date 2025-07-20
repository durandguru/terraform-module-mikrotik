resource "routeros_interface_ethernet" "interface" {
  for_each = {
    for k, v in var.device_network_settings.ports : k => v
  }

  factory_name = each.key
  name         = each.key

  comment = (
    each.value.type == "admit-only-untagged-and-priority-tagged" ?
    (
      length(trimspace(try(each.value.comment, ""))) > 0 ?
      "VLAN ${each.value.vlan} - ${each.value.comment}" :
      "VLAN ${each.value.vlan}"
    ) :
    each.value.type == "admit-only-vlan-tagged" ?
    (
      length(trimspace(try(each.value.comment, ""))) > 0 ?
      "Trunk - ${each.value.comment}" :
      "Trunk"
    ) :
    each.value.type == "admit-all" ?
    (
      length(trimspace(try(each.value.comment, ""))) > 0 ?
      "Hybrid ${each.value.vlan} - ${each.value.comment}" :
      "Hybrid ${each.value.vlan}"
    ) :
    "none"
  )

  rx_flow_control = each.value.vlan == "1" ? "on" : "off"
  tx_flow_control = each.value.vlan == "1" ? "on" : "off"

  poe_out = (
    length(trimspace(try(each.value.poe, ""))) > 0 ?
    each.value.poe :
    null
  )
}
