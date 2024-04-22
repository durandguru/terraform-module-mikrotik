resource "routeros_ip_ssh_server" "ssh_server" {
  forwarding_enabled = "no"
  strong_crypto      = true
}