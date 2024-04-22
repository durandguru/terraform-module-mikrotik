resource "routeros_ip_ssh_server" "ssh_server" {
  allow_none_crypto  = false
  forwarding_enabled = "no"
  strong_crypto      = true
}